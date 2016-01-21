<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%@ include file="googleAnalytics.jsp" %>
        <%@page import="org.aepscolombia.platform.util.APConstants"%>
        <%@page import="org.aepscolombia.platform.models.entity.Users"%>
        <%@page import="org.aepscolombia.platform.models.entity.Entities"%>
        <%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
        <% Users user = (Users) session.getAttribute(APConstants.SESSION_USER); %>
        <% String entType = new EntitiesDao().getEntityType(user.getIdUsr()); %>
        <div class="container">
            <nav>
                <ul id="menu" class="nav">
                    <li id="nav1" class="col-sm-6 col-md-2 space-group"><s:a href="getting" cssClass="btn" targets="divBodyLayout"><s:property value="getText('link.recollect.general')" /></s:a></li>
                    <li id="nav2" class="col-sm-6 col-md-2 space-group"><s:a href="reports" cssClass="btn" targets="divBodyLayout"><s:property value="getText('link.reports.general')" /></s:a></li>
                    <li id="nav4" class="col-sm-6 col-md-2 space-group"><s:a href="viewIndicators" cssClass="btn" targets="divBodyLayout"><s:property value="getText('link.applications.general')" /></s:a></li>
                    <li id="nav3" class="col-sm-6 col-md-2 space-group"><s:a href="viewIssue" cssClass="btn" targets="divBodyLayout"><s:property value="getText('link.sendissue.general')" /></s:a></li>
                </ul>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3><s:property value="getText('title.summary.general')" /></h3>
                </div>
            </div>
            <div class="panel">
                <div class="panel-body">
                    <%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
                    <%@page import="org.aepscolombia.platform.models.dao.LogEntitiesDao"%>
                    <%@page import="java.util.Date"%>
                    <% Integer idEnt = new UsersDao().getEntitySystem(user.getIdUsr()); %>
                    <% Date dateIngress = new LogEntitiesDao().getDateIngress(idEnt, user.getIdUsr()); %>
                    
                    <% request.setAttribute("dateLast", user.getLastInUsr()); %>
                    <% request.setAttribute("dateIngress", dateIngress); %>
                    <s:date name="%{#attr.dateLast}" format="MM/dd/yyyy" var="dateTransformLastlogin"/>
                    <s:date name="%{#attr.dateIngress}" format="MM/dd/yyyy" var="dateTransformIngress"/>
                    <h4><s:property value="getText('title.lastdate.general')" />: <s:property value="%{#dateTransformLastlogin}" /></h4>
                    <h4><s:property value="getText('title.registerdate.general')" />: <s:property value="%{#dateTransformIngress}" /></h4>
                </div>
            </div>				     
        </div>        
    </body>
    <script>
        var valUser = <s:property value="dataUser" />;
        if (valUser == '0') {
            bootbox.dialog("Este usuario no cuenta con un nombre diligenciado por favor ingresarlo",
            {
                "label" : "Ir",
                "class" : "btn btn-initial",
                "callback": function() {
                    document.location = "/configuration.action";
                }                                
//                "Ir": function() {                    
//                    document.location = "/configuration.action";
//                }
            });
        }
    </script>
</html>
