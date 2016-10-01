<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="icon" type="image/ico" href="img/logoAEPS.ico">
        <title>SIRIA</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 	
        <meta http-equiv="Cache-control: max-age=86400" content="public">
        <link rel="stylesheet" href="scripts/css/generals/beoro.min.css">           
        <sj:head jqueryui="true" loadAtOnce="true"/>
        <sb:head includeScripts="true" includeScriptsValidation="true"/>        
        <link rel="stylesheet" href="scripts/css/generals/main.min.css">
        <link rel="stylesheet" href="scripts/css/font-awesome/css/font-awesome.min.css">   
        <link href='http://fonts.googleapis.com/css?family=Istok+Web:500,700' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <!--<div class="container">-->
            <s:hidden name="lanSel"/>
            <div id="divMessage"></div>
            <div id="dialog-form"></div>
            <div class="header container-fluid">
                <%@ include file="WEB-INF/views/generals/header.jsp" %>
            </div>
            <div class="body container-fluid" id="divBodyLayout">
                <%--<%@ include file="WEB-INF/views/generals/home.jsp" %>--%>
            </div>
            <div class="footer container-fluid">
                <%@ include file="WEB-INF/views/generals/footer.jsp" %>            
            </div>
        <!--</div>-->
        <script type="text/javascript" src="scripts/js/jquery/jquery.maskedinput.js"></script>
        <script type="text/javascript" src="scripts/js/jquery/jquery.maskMoney.js"></script>
        <script type="text/javascript" src="scripts/js/jquery/jquery.numeric.js"></script>
        <script type="text/javascript" src="scripts/js/jquery/jquery.blockUI.js"></script>        
        <script type="text/javascript" src="scripts/js/generals/functions.js"></script>	   
        <script>            
            var actionName = '<%= session.getAttribute("action") %>';
            function doAction() {
//            alert(countryCode)                
                if (actionName!='null' && actionName!='' && actionName!='dashboard' && actionName!='initial' && actionName!='principal' && actionName!='login') {
                    showInfoPagePublic(''+actionName+'.action?countryCode='+countryCode, 'divBodyLayout');                 
                } else if(actionName=='null' || actionName=='') {
                    document.location = '<%= request.getContextPath() %>/initial.action?countryCode='+countryCode;
                } else if(actionName=='initial') {
                    showInfoPageCountry('home.action', countryCode, 'divBodyLayout');
                }
                if (actionName=='null' || actionName=='' || actionName=='dashboard' || actionName=='initial' || actionName=='principal') {
                    actionName = 'home';                  
                }
                activeOption('ulOptionsMenu', actionName+'Cls');
            }
//            getCountry();
//            doAction();      
            if(actionName=='initial' || actionName=='null' || actionName=='') {
                $.when(getCountry()).then(doAction);
            } else {
                doAction();
            }
            $(document).ready(function() {
                beoro_scrollToTop.init();
            })
        </script>
    </body>
</html>
