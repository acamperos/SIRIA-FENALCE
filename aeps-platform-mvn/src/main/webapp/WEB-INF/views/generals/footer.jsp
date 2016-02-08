<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<% String coCodeF  = (String) session.getAttribute(APConstants.COUNTRY_CODE); %>
<div id="clients">
    <div class="container">
        <div class="section_header">
            <h3><s:property value="getText('title.partners.footer')" /></h3>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 client">
                <a href="http://ciat.cgiar.org/"><div class="img client1 col-xs-10"></div></a>
            </div>
            <% if (coCodeF!=null && coCodeF.equals("CO")) { %>
                <div class="col-xs-6 col-sm-3 col-md-2 client">
                    <a href="https://www.minagricultura.gov.co/"><div class="img client2 col-xs-10"></div></a>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 client">
                    <a href="http://www.agronet.gov.co/"><div class="img client3 col-xs-10"></div></a>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 client">
                    <a href="http://fenalce.org/nueva/index.php"><div class="img client4 col-xs-10"></div></a>
                </div>
            <% } else if (coCodeF!=null && coCodeF.equals("NI")) { %>
                <div class="col-xs-6 col-sm-3 col-md-2 client">
                    <a href="http://ccafs.cgiar.org/"><div class="img client5 col-xs-10"></div></a>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 bigclient">
                    <a href="http://flar.org/"><div class="img client6 col-xs-10"></div></a>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 bigclient">
                    <a href="http://www.anar.com.ni/"><div class="img client7 col-xs-10"></div></a>
                </div>
            <% } %>
        </div>
    </div>
</div>
<footer id="footer">
    <div class="container">
        
        <table>
            <tr>
                <td>
                    <s:text name="%{getText('area.madeinformation.footer')}"/>.
                </td>
               <td>
                     <% org.aepscolombia.platform.util.Version v = new org.aepscolombia.platform.util.Version(true); %>
                    <span class="col-md-9 col-md-offset-9">Versi&oacute;n:<%=v.getVersion()%></span>
                </td>
            </tr>
            
                   
        </table>
        
        
        <hr>
        
        <div class="row credits">
            <div class="copyright"> <s:property value="getText('label.rights.footer')" />.</div>
        </div>
    </div>
</footer>