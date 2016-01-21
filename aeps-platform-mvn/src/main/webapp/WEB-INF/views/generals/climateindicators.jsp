<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/ico" href="img/logoAEPS.ico">
    </head>
    <body>     
        <%@ include file="googleAnalytics.jsp" %>
        <s:actionerror theme="bootstrap"/>
        <s:actionmessage theme="bootstrap"/>
        <s:fielderror theme="bootstrap"/>
        <div class="container">
            <ul id="breadcrumbs">
                <s:set id="contextPath"  value="#request.get('javax.servlet.forward.context_path')" />
                <li><s:a href="dashboard.action" targets="divBodyLayout"><i class="icon-home"></i><s:property value="getText('link.homeprivate')" /></s:a></li>
                <li><s:a href="viewIndicators" targets="divBodyLayout"><i class="icon-home"></i><s:property value="getText('link.statisticalindicators')" /></s:a></li>
                <li><span><s:property value="getText('label.climateindicators')" /></span></li>
            </ul>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <iframe src="http://www.open-aeps.org:3838/App-ClimateIndicators/" class="col-xs-12 col-sm-12 col-md-12" style="height: 600px;"></iframe>
                </div>
            </div>
        </div>
    </body>
</html>    