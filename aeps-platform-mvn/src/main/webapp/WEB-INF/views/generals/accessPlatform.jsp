<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="refresh" content="10; url=signin.action">
        <link rel="icon" type="image/ico" href="img/logoAEPS.ico">
        <title>SIRIA</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">       
        <sj:head jqueryui="true"/>
        <sb:head includeScripts="true" includeScriptsValidation="true"/>
        <link rel="stylesheet" href="scripts/css/generals/login.css">			        
    </head>
    <body>
        <div id="login-wrapper" class="container">                 
            <div style="font-size: 18px; margin-top: 10px;" class="panel">
                <p><img src="img/logoAEPS.png"/></p>
                <p><s:property value="getText('area.correctvalidation.login')" />. <br />
                    <s:property value="getText('area.access.login')" />.</p> 
                <a href="/signin.action" class="btn btn-initial btn-lg"><i class="icon-arrow-right icon-white"></i>  <s:property value="getText('link.signdirect.login')" /></a>
            </div>
        </div>
        <script type="text/javascript" src="scripts/js/generals/functions.js"></script>	
    </body>
</html>
