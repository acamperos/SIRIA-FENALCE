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
        <sb:head includeScripts="true" includeScriptsValidation="true"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/scripts/css/generals/main.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/scripts/css/font-awesome/css/font-awesome.min.css">
        <link href = 'http://fonts.googleapis.com/css?family=Istok+Web:400700400cursiva,700italicysubconjunto=latin,latin-ext' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <%@ taglib prefix="s" uri="/struts-tags" %>
        <%@page import="org.aepscolombia.platform.models.entity.Users"%>
        <%@page import="org.aepscolombia.platform.util.APConstants"%>
        <% Users user = (Users) session.getAttribute(APConstants.SESSION_USER); %>
        <% String country  = (String) session.getAttribute(APConstants.COUNTRY_CODE); %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <h1><s:property value="getText('title.permission404.errors')" /> <small><font color="red"><s:property value="getText('text.permission404.errors')" /></font></small></h1>
                        <br />
                        <p class="lead"><s:property value="getText('area.permission404.errors')" />. </p>
                        <% if (user != null) { %>
                            <a href="<%= request.getContextPath() %>/dashboard.action" class="btn btn-lg btn-initial"><i class="icon-home icon-white"></i> <s:property value="getText('link.permission.errors')" /></a>
                        <% } else { %>
                            <a href="<%= request.getContextPath() %>/initial.action?countryCode=<%=country%>" class="btn btn-lg btn-initial"><i class="icon-home icon-white"></i> <s:property value="getText('link.permission.errors')" /></a>
                        <% } %>                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
