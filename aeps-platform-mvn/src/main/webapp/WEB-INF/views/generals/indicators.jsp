<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/ico" href="img/favicon.ico">
    </head>
    <body>
        <%@ include file="../generals/googleAnalytics.jsp" %>
        <%@page import="org.aepscolombia.platform.models.entity.Users"%>
        <%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
        <%@page import="org.aepscolombia.platform.util.APConstants"%>
        <%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
        <% Users user = (Users) session.getAttribute(APConstants.SESSION_USER); %>
        <% UsersDao usrDao = new UsersDao(); %>
        <% Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
        <div class="container">
            <ul id="breadcrumbs">
                <s:set id="contextPath"  value="#request.get('javax.servlet.forward.context_path')" />
                <li><s:a href="dashboard.action" targets="divBodyLayout"><s:property value="getText('link.homeprivate')" /></s:a></li>
                <li><span><s:property value="getText('label.statisticalindicators')" /></span></li>
            </ul>
        </div>
        <div class="container">		
            <div class="row">             
                <% if (usrDao.getPrivilegeUser(user.getIdUsr(), "crop/view")) { %>
                    <div class="span6 thumbnail custom-thumb">
                        <s:a href="%{contextPath}/viewClimate.action" role="button" targets="divBodyLayout"><img class="img-responsive hidden-xs" src="img/generacion_indicadores.jpg" alt=""></s:a>
                        <div class="caption">
                            <h3><s:property value="getText('title.climateindicators.indicators')" /></h3>
                            <p><s:property value="getText('label.climateindicators.indicators')" /></p>                        
                            <p>
                                <s:a cssClass="btn btn-initial" href="%{contextPath}/viewClimate.action" role="button" targets="divBodyLayout"><s:property value="getText('link.climateindicators.indicators')" /> <i class="icon-double-angle-right"></i></s:a>
                            </p>
                        </div>
                    </div> 
                 <% } %> 
            </div>  
        </div>
    </body>
</html>
