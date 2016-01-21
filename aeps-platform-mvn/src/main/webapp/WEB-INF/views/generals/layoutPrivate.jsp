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
        <title>AEPS</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Cache-control: max-age=86400" content="public">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/scripts/css/generals/beoro.min.css">       		
        <sj:head jqueryui="true" loadAtOnce="true"/>
        <sb:head includeScripts="true" includeScriptsValidation="true"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/scripts/css/colorbox/colorbox.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/scripts/css/generals/main.min.css">        
        <link rel="stylesheet" href="<%= request.getContextPath() %>/scripts/css/font-awesome/css/font-awesome.min.css">               
        <link href='http://fonts.googleapis.com/css?family=Istok+Web:500,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/scripts/css/geoxml/gmap.css"/>
        <link href="<%= request.getContextPath() %>/scripts/css/generals/vis.min.css" rel="stylesheet" type="text/css" />
        <!--<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>-->
        <!--<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css"/>-->
    </head>
    <body>
        <s:hidden name="lanSel"/>
        <div id="divMessage"></div>
        <div id="dialog-form"></div>
        <div class="header container-fluid">
            <%@ include file="header-private.jsp" %>
        </div>
        <div class="body container-fluid" id="divBodyLayout">
            <%--<%@ include file="dashboard.jsp" %>--%>
        </div>
        <div class="footer container-fluid">
            <%@ include file="footer.jsp" %>
        </div>        
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/jquery/jquery.maskedinput.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/jquery/jquery.maskMoney.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/jquery/jquery.base64.min.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/jquery/jquery.numeric.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/jquery/jquery.blockUI.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/jquery/jquery-ui/ui/jquery-ui.js"></script>	
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/jquery/jquery-ui/ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/colorbox/jquery.colorbox.min.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/jquery/pwdMeter/jquery.pwdMeter.js"></script>        
        <script type="text/javascript" src="http://maps.google.com/maps/api/js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/geoxml/geoxml3.js"></script>  
        <!--<script type="text/javascript" src="/scripts/js/bootbox/bootbox.min.js"></script>-->
        <script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/generals/functions.min.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/scripts/js/generals/vis.min.js"></script>
        <script>
            var actionName   = '<%= session.getAttribute("action") %>';
            var actionUrl    = '<%= session.getAttribute("actionUrl") %>';      
            function doAction() {                  
                if (actionName!='' && actionName!='dashboard') {
                    showInfoPage(''+actionUrl, 'divBodyLayout');                       
                } else if(actionName=='dashboard' || actionName=='') {
    //                showInfoPage('homePrivate.action', 'divBodyLayout');
                    showInfoPageCountry('homePrivate.action', countryCode, 'divBodyLayout');
                }
                activeOption('ulOptionsMenu', actionName+'Cls');
            }
            if (actionName=='dashboard' || actionName=='') {
//                bootbox.alert("Se ha cambiado el sistema AEPS, para tener una mejor experiencia, si le llegase a presentar algún fallo, por favor escribanos en la sección de reportar problema!", function() {
//                    console.log("Alert Callback");
//                });
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
