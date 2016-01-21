<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<html>
    <head></head>
    <body>
        <%@page import="org.aepscolombia.platform.util.APConstants"%>
        <%@page import="org.aepscolombia.platform.models.entity.Users"%>
        <%@page import="org.aepscolombia.platform.models.entity.IdiomCountry"%>
        <%@page import="org.aepscolombia.platform.models.dao.IdiomCountryDao"%>
        <% Users user = (Users) session.getAttribute(APConstants.SESSION_USER);%>
        <% String coCode = (String) session.getAttribute(APConstants.COUNTRY_CODE); %>
        <% IdiomCountry idiom = new IdiomCountryDao().objectById(coCode); %>
        <% String nameCountry = ""; %>
        <% if (idiom != null) { %>
            <% nameCountry = idiom.getCountryIdCo(); %>
        <% } %>
        
        <div class="container">
            <div class="row">
                <div class="col-md-3">	
                    <img src="img/logoAEPS.png">
                </div>  
                <div class="col-md-5 visible-md-block visible-lg-block">	
                    <label class="titlePrin">
                        <s:property value="getText('title.aepsmeans.header')" />
                    </label>
                    <label class="titleSec"><%=nameCountry %></label>
                </div>
                <div class="col-md-4 visible-md-block visible-lg-block">
                    <img src="img/header.png">
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
                    <s:set id="contextPath"  value="#request.get('javax.servlet.forward.context_path')" />
                    <s:a class="navbar-brand homeCls" href="locale.action" onclick="activeOption('ulOptionsMenu')"><i class="icon-home"></i><s:property value="getText('button.home.platform')" /></s:a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav" id="ulOptionsMenu">
                        <li class="aboutCls">
                            <s:a href="about.action" onclick="activeOption('ulOptionsMenu')"><s:property value="getText('button.howis.platform')" /></s:a>
                        </li>
                        <li class="contactCls">
                            <s:a href="contact.action" onclick="activeOption('ulOptionsMenu')"><s:property value="getText('button.contact.platform')" /></s:a>
                        </li>
                    </ul>
                    <div class="formIngress">
                        <% if (user != null) {%>
                            <p style="margin-bottom:0px"><s:property value="getText('label.youareconnect.header')" /></p>
                            <a style="float: right" href="signin.action" class="btn btn-initial"><s:property value="getText('link.ingress.header')" /></a>
                        <% } else {%>
                        <s:url id="ingress" namespace="/" action="signin" >
                            <%--<s:param name="request_locale" ><%= request.getParameter("lang") %></s:param>--%>                                    
                        </s:url>
                        <s:url id="register" namespace="/" action="signin" >
                            <s:param name="logSel" >new</s:param>                                    
                            <%--<s:param name="request_locale" ><%= request.getParameter("lang") %></s:param>--%>                                    
                        </s:url>
                        <s:a href="%{ingress}" cssClass="btn btn-initial btn-lg"><s:property value="getText('button.ingress.platform')" /></s:a>
                        <s:a href="%{register}" cssClass="btn btn-default btn-lg"><s:property value="getText('button.register.platform')" /></s:a>			
                        <% }%>
                    </div>
                    <!--                                <div class="formIngress">
                    <%--<s:url id="localeEN" namespace="/" action="locale" >--%>
                    <%--<s:param name="lang">en</s:param>--%>
                    <%--</s:url>--%>
                    <%--<s:url id="localeES" namespace="/" action="locale" >--%>
                    <%--<s:param name="lang">espe</s:param>--%>
                    <%--</s:url>--%>
                    <ul class="nav">
                        <li>
                            <a><%--<s:property value="getText('select.language.header')" />--%></a>
                        </li>
                        <li>                                    
                            <div class="btn-group">
                                <a class="btn" href="#"><%--<s:property value="getText('link.languagespa.header')" />--%></a>
                                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a onclick="sendCountry('initial.action?lang=en')"><img src="img/languages/kingdom-flat.png" class="img-rounded" /> <s:property value="getText('link.optenglish.header')" /></a></li>
                                    <li><a onclick="sendCountry('initial.action?lang=es')"><img src="img/languages/spain-flat.png" class="img-rounded" /> <s:property value="getText('link.optspanish.header')" /></a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>                                    -->
                </div>
            </div>
        </div>
        <% if (user != null) {%>
            <script>
                $('.homeCls').removeClass("hideInfo");
                $('.dashCls').addClass("hideInfo");
            </script>
        <% }%>
    </body>
</html>
