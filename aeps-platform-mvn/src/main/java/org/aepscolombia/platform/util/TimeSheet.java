/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.aepscolombia.platform.util;

import static com.google.gwt.dom.client.FrameSetElement.as;
import static java.lang.Math.min;
import static java.lang.ProcessBuilder.Redirect.to;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static javassist.CtMethod.ConstParameter.integer;
import static javax.management.Query.and;
import static javax.management.Query.div;
import static javax.swing.Spring.width;
import static org.apache.camel.util.ObjectHelper.after;

/**
* Create a visual time sheet in php like "timesheet.js" (http://semu.github.io/timesheet.js/)
*
* Create a visual time sheet with two units (alpha, omega), many segment for a key (level), 
*     the possibility to add a line for represent a time of interest like today or other.
*     The visual representation is responsive. For small resolution, it's appear a simple table.
*     The visual is a css fork of "TimeSheet.js" (http://semu.github.io/timesheet.js/).
*
*
* Licence
* This file is part of TimeSheet.php.
*
*    TimeSheet.php is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    TimeSheet.php is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with TimeSheet.php.  If not, see <http://www.gnu.org/licenses/>.
*
*
* @package    timesheet
* @author     Madvic <madvic@gmail.com>
* @copyright  2015 Madvic
* @license    http://www.gnu.org/licenses/  GPLV3
* @version    0.8
* @link       https://github.com/madvik/timesheet.php
*/
public class TimeSheet {
   
	/**
	* css ID for the timesheet
	*/
	public int id;
	/**
	* By default, it's dark, without we can replace by 'white'
	*/
	public String theme;
	/**
	* A string array of title for alpha section
	*/
	public String[] alpha;
	/**
	* If alpha is a number and this number is not 0, we can substract this value
	*/
	public int alpha_first;
	/**
	* The width of one Alpha section
	*/
	public Double oneAlpha;
	
	/**
	* If omega value of the alpha not become to 1
	*/
	public int omega_first;
	/**
	* The width of one Omega section
	*/
	public Double oneOmega;
	
	/**
	* original data
	*/
	public List<HashMap> data;
	
	/**
	* Calculate datas for timesheet
	*/
	private HashMap ddata;
	/**
	* Calculate datas for mobile 
	*/
	private HashMap mdata;
	/**
	* The value {alpha}-{omega}] of the line
	*/
	public String line;
	/**
	* The text value of the line
	*/
	public String line_text;
	/**
	*
	*/
	public HashMap format;
	/**
	* Default css parameter for colors
	*/
	public String[] colors = {"default", "lorem", "ipsum", "dolor", "sit"};
	/**
	* HTML code to display
	*/
	private String html;
        
        
	public TimeSheet(String[] alpha, HashMap args, List<HashMap> data){
                HashMap default_args = new HashMap();
                default_args.put("id", "timesheet");
                default_args.put("theme", null);
                default_args.put("alpha_first", 1);
                default_args.put("omega_base", 10);
                default_args.put("omega_first", 1);
                default_args.put("line", null);
                default_args.put("line_text", null);
                
                HashMap format = new HashMap();
                format.put("segment_des", "%s to %s");
                format.put("timesheet_format", null);
                format.put("date_format", null);
                
                default_args.put("format", format);
                
                HashMap argsTemp = new HashMap();
                argsTemp.putAll(default_args);
                argsTemp.putAll(args);
                
                String all_segment = "";
                this.alpha = alpha;
                this.data  = data;
                
                
		this.id = Integer.parseInt(String.valueOf(argsTemp.get("id")));
		this.theme 		= String.valueOf(argsTemp.get("theme"));
		this.alpha_first 	= Integer.parseInt(String.valueOf(argsTemp.get("alpha_first")));
		int omega_base          = Integer.parseInt(String.valueOf(argsTemp.get("omega_base")));
		this.omega_first	= Integer.parseInt(String.valueOf(argsTemp.get("omega_first")));
		this.line 		= String.valueOf(argsTemp.get("line"));
		this.line_text          = String.valueOf(argsTemp.get("line_text"));
		this.format 		= (HashMap) argsTemp.get("format");
		this.oneAlpha = (100 / (double) alpha.length);
		this.oneOmega = this.oneAlpha / (double) omega_base;
//		this.create_all_segments();
	}
        
	/**
	* Calculate the start value of a segment
	* @param int $alpha  The alpha value
	* @param int $omega The omega value
	* @return int Return start value of a segment
	*/
	private int start_segment(int alpha, int omega){
		int start_segment = ((((alpha - this.alpha_first + 1) - 1) * this.oneAlpha.intValue() ) + ((omega - this.omega_first) * this.oneOmega.intValue()));
		if(start_segment < 0){
                    start_segment = 0;
		}
		return start_segment;
	}
	/**
	* Calculate the end value of a segment
	* @param int $alpha  The alpha value
	* @param int $omega The omega value
	* @return int Return end value of a segment
	*/
	private int end_segment(int alpha, int omega){
		int end_segment = ( ( ( (alpha - this.alpha_first + 1) - 1) * this.oneAlpha.intValue() ) + ( ( omega - this.omega_first)  * this.oneOmega.intValue()) );
		if(end_segment > 100){
                    end_segment = 100;
		}
		return end_segment;
	}
	/**
	* Return the start value of the line
	* @return int Return the start value of the line
	*/
	private int get_line_data(){
		String[] line = this.line.split("-");
                int val1 = Integer.parseInt(line[0]);
                int val2 = Integer.parseInt(line[1]);
		return this.start_segment(val1, val2);
	}
        
	/**
	* Display the Alpha section title
	*/
	private String section_title(){
            String info = "";
            for(int i=0; i < this.alpha.length; i++){
                info += "<section><div>"+this.alpha[i]+"</div></section>";
            }
            return info;
	}
        
        /**
	* Initialize the calculation of all data before displaying (standard or mobile)
	*/
	/*private void create_all_segments(){
		int i = 0;
		for(HashMap<SomeInnerKeyType, String> h : this.data){
                    Map.Entry<String, String> entry = level_key.entrySet();
			i++;
			String color = this.colors[i % 5];
			HashMap segments  = new HashMap();
			HashMap m_periods = new HashMap();
			HashMap m_period  = new HashMap();
			foreach($periods as $period){
				// Simple array for mobile display
				$m_period = array( 
					'title'=> $level_key,
					'color' => $color,
					'start' => explode( "-", $period['start']),
					'end' =>  explode( "-", $period['end']),
					);
				// Add period to an array
				array_push( $m_periods , $m_period);
				$tab = $this->calcul_timesheet($level_key, $m_period);
				foreach ($tab as $key => $value) {
					$segments[] = $value;
				}
			}
			$this->ddata[$level_key] = $segments ;
			$this->mdata[$level_key] = $m_periods ;
		}
	}*/
        
        
	/**
	* Calculate and create all segment and return an array of the data
	* @param string $level_key The id of a level (have 1 or more segment)
	* @param array $segment An array for a duration data for create one or more segment
	* @return string $return Return an array of segment(s) for a period / level
	*/	
//	/*private String calcul_timesheet(String level_key, HashMap segment){
            
//		$start_segment = $this->start_segment($segment['start'][0], $segment['start'][1] );
//		$end_segment = $this->end_segment($segment['end'][0], $segment['end'][1] );
//		$return = array();
		/*
		* If curl and end < start then we create 2 segments
		* Else Just one
		*/
//		if($segment['end'][0] < $segment['start'][0]
//				|| ($segment['end'][0] == $segment['start'][0] && $segment['end'][1] < $segment['start'][1] )
//		){
//			$segment['head_segment'] = true;
//			$segment['marginleft'] = 0;
//			$segment['width'] = $end_segment ;
//			array_push( $return , $segment );
//			$segment['head_segment'] = false;
//			$segment['marginleft'] = $start_segment;
//			$segment['width'] = 100 - $start_segment ;
//		}
//		else{
//			$segment['head_segment'] = true;
//			$segment['marginleft'] = $start_segment;
//			$segment['width'] = $end_segment - $start_segment ;
//		}
//		array_push( $return , $segment );
//		return $return;
//	}*/
	
	/**
	* Display a segment
	* @param string $key The id of a level
	* @param array $segment An array of segment's data
	* @param bool $head_level Can identify if the segment is at the beginning of the level
	* @return string $html The HTML code for a segment
	*/
//	private function get_segment($key, $segment, $head_level){
//		ob_start();
//		$displayDate = $this->get_format( $segment );
//		?>
//		<div class="segment">
//			<div style="margin-left: <?php echo $segment['marginleft']; ?>%;">
//				<?php if( $head_level ) : ?><span class="label" ><?php echo $segment['title']; ?></span><?php endif; ?>
//				<?php if( $segment['head_segment'] ) : ?><span class="date"><?php echo $displayDate ; ?></span><?php endif; ?>&nbsp;
//			</div>
//			<div style="margin-left: <?php echo $segment['marginleft']; ?>%; width: <?php echo $segment['width']; ?>%;position:relative;" class="bubble bubble-<?php echo $segment['color']; ?>" data-duration="6"></div>
//		</div>
//		<?php
//		$html = ob_get_contents();
//		ob_end_clean();
//		return $html;
//	}
	/**
	* Call for every level, every segment
	* @return string $html Return the HTML code for the timesheet
	*/
//	function get_display_data(){
//		$html = '';
//		foreach($this->ddata as $key => $level){
//			$head_level = true;
//			$html .= '<li>';
//			foreach($level as $segment){
//					$html .= $this->get_segment($key, $segment, $head_level);
//					$head_level = false;
//			}
//			$html .= '</li>';
//		}
//		return $html;
//	}
	/**
	* Return the format information
	* @param array $segment Data of a segment
	* @param bool $mobile (default = false) If the information to displayed is for mobile or not
	* @return string $displayDate Return the String to display
	*/
//	function get_format( $segment, $mobile = false){
//		$displayDate = '';
//		if( !empty($this->format) 
//			&& !empty( $this->format['timesheet_format'] ) 
//			&& !empty( $this->format['date_format']) 
//			){
//			$startdate = date($this->format['date_format'], strtotime( $segment['start'][0] .'-'. $segment['start'][1] ) );
//			$enddate = date($this->format['date_format'], strtotime( $segment['end'][0]	.'-'. $segment['end'][1] ) );
//			$displayDate = sprintf( $this->format['segment_des'] , $startdate, $enddate);
//		}
//		else{
//			$startA = $this->get_alpha_title( $segment['start'][0] );
//			$endA = $this->get_alpha_title( $segment['end'][0] );
//			// If data is is the same alpha, we don't repeat the information
//			if( !$mobile && $segment['start'][0] == $segment['end'][0] ){
//				$displayDate = $startA." ".$segment['start'][1].' to '. $segment['end'][1];
//			}
//			else{
//				$displayDate = $startA  .'-'. $segment['start'][1]
//					.' to '. $endA  .'-'. $segment['end'][1];
//			}
//		}
//		return $displayDate;
//	}
//	/**
//	* Return the alpha title
//	* @param integer $alphaN The alpha number
//	* @return string $alpha Return the alpha title of a number, unless return the number
//	*/
//	function get_alpha_title($alphaN){
//		if( array_key_exists( (integer) $alphaN - $this->alpha_first, $this->alpha) ){
//			return $this->alpha[ (integer) $alphaN - $this->alpha_first ] ;
//		}
//		else{
//			return $alphaN;
//		}
//	}
//	/**
//	* Call for every level, every segment for mobile part
//	* @return string $html Return the HTML code for the timesheet
//	*/
//	function get_display_data_mobile(){
//		$html = '';
//		foreach($this->mdata as $key => $segments){
//			$html .= '<li>';
//			$html .= '<div class="label '.$segments[0]['color'].'" >'.$key.'</div><div class="dates '.$segments[0]['color'].'">';
//			foreach($segments as $segment){
//					$html .= '<div class="date">'.$this->get_format( $segment, true ).'</div>';
//			}
//			$html .= '</div></li>';
//		}
//		return $html;		
//	}
//	/**
//	* Display the HTML code of the timesheet
//	*/
//	public function display(){
//		$html = $this->get_display_data();
//		$html_mobile = $this->get_display_data_mobile();
//		?>
//		<style>
//		#<?php echo $this->id; ?> div.scale section{
//			width:<?php echo $this->oneAlpha; ?>%;
//		}
//	<?php if( !empty($this->line) ): ?>
//		@media screen and (min-width: 500px) {
//			#<?php echo $this->id; ?> .line{
//				display:block;
//			}
//			#<?php echo $this->id; ?> .line section{
//				left:<?php echo $this->get_line_data(); ?>%;
//			}
//			#<?php echo $this->id; ?> .line section:after{
//				content : "\25B2 <?php echo $this->line_text;?>";
//			}
//		}
//	<?php endif; ?>
//		</style>
//
//		<div class="timesheet color-scheme-default <?php echo $this->theme;?>" id="<?php echo $this->id; ?>">
//			<!-- A line -->
//			<div class="line">
//				<section><div></div></section>
//			</div>
//			<!-- Section -->
//			<div class="scale">
//				<?php echo $this->section_title(); ?>
//			</div>
//			<!-- end section -->
//
//			<!-- data is the default and appear for reolution more than 500px -->
//			<ul class="data">
//				<?php echo $html; ?>
//			</ul>
//			<!-- mdata is for mobile and appear for reolution less than 500px -->
//			<ul class="mdata">
//				<?php echo $html_mobile;  ?>
//			</ul>
//		</div>
//	}
    
}
