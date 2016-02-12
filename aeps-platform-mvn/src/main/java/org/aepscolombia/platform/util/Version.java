/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.aepscolombia.platform.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.ResourceBundle;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 *
 * @author acamperos
 */
public class Version {
    
        public static final String	VERSION	= ("$Date: 2016/02/02 18:26:27 $").replaceAll("[\\p{Punct}\\s$Date]", "");
	private static Log			log		= LogFactory.getLog(Version.class.getName() + "." + VERSION);

	private static final String APPVERSION	= "version";
	private static final String VFORMAT		= " %-20s %s ";
	private static final String VLINE		= " -------------------- --------------------";



	private String				version	= "";
	private String				productName	= "";

	private ArrayList<Version>	products = null;

	public Version(boolean bprint) {
		products = new ArrayList<Version>();
		Version appver = new Version(APPVERSION,bprint);
		products.add(appver);
		this.setProductName(appver.getProductName());
		this.setVersion(appver.getVersion());
		if (bprint) printProducts();

	}

	public Version(String name,boolean bprint) {
		loadVersionInfo(name,true);
	}


	public void printVersion(Log llog) {
		//llog.info("Product Name [" + getProductName() + "] Global Version -->" + getVersion());
		llog.info(String.format(VFORMAT, getProductName(), getVersion()));
	}

	/**
	 * load version information for BUNDLE_NAME product 
	 * @param BUNDLE_NAME
	 * @return true on success load
	 */
	private boolean loadVersionInfo(String BUNDLE_NAME,boolean bprint) {
		boolean b = false;

		setVersion("Not Availbale");
		try {
			ResourceBundle RESOURCE_BUNDLE = ResourceBundle.getBundle(BUNDLE_NAME);

			setVersion(RESOURCE_BUNDLE.getString("version"));
			setProductName(RESOURCE_BUNDLE.getString("productnane"));
			b = true;
		}
		catch (Exception e) {
			//log.warn("File [" + BUNDLE_NAME + ".properties] not available [" + e.getMessage() + "]");
			setProductName(BUNDLE_NAME.replace("version-", ""));
			setVersion("N/A - File [" + BUNDLE_NAME + ".properties] not available ["+e.getClass().getName()+"][" + e.getMessage() + "]");

		}
		if (bprint) {
			printVersion(log);
		}

		return b;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public void printProductsLines() {
		Calendar c = Calendar.getInstance();
		log.info("2016 - "+c.get(Calendar.YEAR)+" CIAT - Fenalce ");
		log.info(String.format(VFORMAT, "ProductName", "Version"));
		log.info(VLINE);
		if (products!=null) {
			for (int i=0;i<products.size();i++) {
				products.get(i).printVersion(log);
			}

		}
		log.info(VLINE);

	}
	
	public void printProducts() {
		String sLine = "";
		sLine += "Libraries:";
		if (products!=null) {
			for (int i=0;i<products.size();i++) {
				sLine += " "+products.get(i).getProductName()+"("+products.get(i).getVersion()+")";
			}
		}
		Calendar c = Calendar.getInstance();
		sLine += " | ProductName(Version) | 2016 - "+c.get(Calendar.YEAR)+" CIAT - Fenalce. ";
		log.info(sLine);
	}


}
