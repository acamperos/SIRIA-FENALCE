<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<html>
    <body>
        <%@page import="org.aepscolombia.platform.util.APConstants"%>
        <%@page import="org.aepscolombia.platform.models.entity.Users"%>
        <%@page import="org.aepscolombia.platform.models.entity.Entities"%>
        <%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
        <%@page import="org.aepscolombia.platform.models.entity.IdiomCountry"%>
        <%@page import="org.aepscolombia.platform.models.dao.IdiomCountryDao"%>
        <% Users user = (Users) session.getAttribute(APConstants.SESSION_USER); %>
        <% String entType = new EntitiesDao().getEntityType(user.getIdUsr()); %>
        <% String entNameUser = new EntitiesDao().getEntityName(user.getIdUsr()); %>
        <% String coCode = (String) session.getAttribute(APConstants.COUNTRY_CODE); %>
        <% IdiomCountry idiom = new IdiomCountryDao().objectById(coCode); %>
        <% String nameCountry = ""; %>
        <% if (idiom != null) {%>
            <% nameCountry = idiom.getCountryIdCo(); %>
        <% }%>
        <% //request.setAttribute("entType", entType); %>
        <div class="container">
            <div class="row">
                <div class="col-md-3">	
                    <img src="<%= request.getContextPath() %>/img/logoAEPS.png">
                </div>
                <div class="col-md-5 visible-md-block visible-lg-block">	
                    <label class="titlePrin">
                        <s:property value="getText('title.aepsmeans.header')" />                        
                    </label>                        
                    <label class="titleSec"><%=nameCountry %></label>
                </div>
                <div class="col-md-4 visible-md-block visible-lg-block">
                    <img src="<%= request.getContextPath() %>/img/header.png">
                </div>                    
            </div>	
        </div>
        <div class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <% if (user != null) { %>
                        <s:set id="contextPath"  value="#request.get('javax.servlet.forward.context_path')" /> 
                        <s:a class="navbar-brand dashboardCls" href="%{contextPath}/dashboard.action" onclick="activeOption('ulOptionsMenu')" targets="divBodyLayout"><i class="icon-home"></i><s:property value="getText('button.home.platform')" /></s:a>
                    <% } %>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <div class="formIngress">
                        <% if (user != null) { %>
                            <div class="user-box">
                                <div class="user-box-inner">
                                    <img src="<%= request.getContextPath() %>/img/user_ingress.png" alt="" class="user-avatar img-avatar">
                                    <div class="user-info">
                                        <s:property value="getText('title.welcome.header')" />, <strong><%= entNameUser %></strong> (<%= entType %>)
                                        <ul class="unstyled">
                                            <li><s:a href="%{contextPath}/configuration.action"><i class="icon-wrench"></i> <s:property value="getText('link.setting.header')" /></s:a></li>
                                            <li>-</li>
                                            <li><a href="<%= request.getContextPath() %>/logout.action" onclick="ga('send', 'event', 'Register', 'click', 'LogOut');"><i class="icon-signout"></i> <s:property value="getText('link.exit.header')" /></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        <% } else { %>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <% if (user != null) { %>
            <script>
                $('.homeCls').removeClass("active");
                $('.dashCls').addClass("active");
            </script>
        <% } %>
    </body>
</html>
