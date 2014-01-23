<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="icon" type="image/ico" href="favicon.ico">
        <title>AEPS</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width"> 							
        <link rel="stylesheet" href="scripts/css/bootstrap/bootstrap-responsive.min.css">
        <link rel="stylesheet" href="scripts/css/generals/justified-nav.css">
        <!-- <link rel="stylesheet" href="scripts/css/bootstrap-theme.min.css"> -->
        <link rel="stylesheet" href="scripts/css/generals/main.css">
        <link rel="stylesheet" href="scripts/css/generals/style.css">
        <link rel="stylesheet" href="scripts/css/generals/responsive.css">
        <link rel="stylesheet" href="scripts/css/generals/responsiveslides.css" />	
        <link rel="stylesheet" href="scripts/js/jquery/jquery-ui/themes/base/jquery.ui.all.css" />
        <link rel="stylesheet" href="scripts/js/jquery/jquery-ui/themes/base/jquery-ui.css" />
        <link rel="stylesheet" href="scripts/css/generals/beoro.css">
        <script type="text/javascript" src="scripts/js/generals/functions.js"></script>		
        <script type="text/javascript" src="scripts/js/generals/validations.js"></script>
        <sj:head jqueryui="false"/>
        <sb:head includeScripts="true" includeScriptsValidation="true"/>
        <script type="text/javascript" src="scripts/js/jquery/jquery.maskedinput.js"></script>
        <script type="text/javascript" src="scripts/js/jquery/jquery.numeric.js"></script>
        <script type="text/javascript" src="scripts/js/jquery/jquery-ui/ui/jquery-ui.js"></script>	
        <script type="text/javascript" src="scripts/js/jquery/jquery-ui/ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="scripts/js/colorbox/jquery.colorbox.min.js"></script>
        <link rel="stylesheet" href="scripts/css/colorbox/colorbox.css"/>
        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
        </style>				
        <!--<script src="scripts/js/generals/modernizr-2.6.2-respond-1.1.0.min.js"></script>-->
        <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script> -->
        <!--<script src="scripts/js/jquery/jquery-1.9.1.js"></script>-->
        <!-- <script>window.jQuery || document.write('<script src="scripts/js/vendor/jquery-1.10.1.min.js"><\/script>')</script> -->
        <!--<script src="scripts/js/bootstrap/bootstrap.min.js"></script>-->
        <script src="scripts/js/generals/main.js"></script>				
        <script src="scripts/js/generals/responsiveslides.js"></script>
    </head>
    <body>
        <div class="header">
            <%@ include file="views/header.jsp" %>
        </div>
        <div class="body" id="divBodyLayout">
            <%@ include file="views/home.jsp" %>
        </div>
        <div class="footer">
            <%@ include file="views/footer.jsp" %>            
        </div>
    </body>
</html>
