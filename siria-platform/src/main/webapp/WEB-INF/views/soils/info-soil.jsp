<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page import="java.lang.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.aepscolombia.platform.util.JavascriptHelper"%>            
<% String table = "display:none;";%>
<% String label = "";%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<% Users userSoil  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrSoilDao = new UsersDao(); %>
<% Integer entTypeSoilId = new EntitiesDao().getEntityTypeId(userSoil.getIdUsr()); %>

<s:if test="listSoils.size() > 0">
    <% table = "";%>
    <% label = "display:none;";%> 
</s:if>            
<% int pageNow = (request.getParameter("page") != null) ? Integer.parseInt(String.valueOf(request.getParameter("page"))) : 1;%>
<% //int pageNow     = Integer.parseInt(String.valueOf(request.getParameter("page")));  %>
<% int countTotal = Integer.parseInt(String.valueOf(request.getAttribute("countTotal")));%>
<% int maxResults = Integer.parseInt(String.valueOf(request.getAttribute("maxResults")));%>
<% int idProducer = Integer.parseInt(String.valueOf(request.getAttribute("idProducer")));%>
<% String valId   = String.valueOf(request.getAttribute("valId"));%>
<% String valName = String.valueOf(request.getAttribute("valName"));%>
<% String typeEnt = String.valueOf(request.getAttribute("typeEnt"));%>
<% HashMap add    = (HashMap) request.getAttribute("additionals");%>
<% String value   = (String) add.get("selected");%>
<% String divShow = "";%>
<% String divHide = "";%>
<% divHide = "divConListRasta"; %>    

<div class="msgWin" id="messageWin"></div>
<div id="divRasta" class="table-responsive w-box">
    <% if (usrSoilDao.getPrivilegeUser(userSoil.getIdUsr(), "soil/create")) { %>
        <% if (entTypeSoilId!=3) { %>
            <button type="button" class="btn btn-lg btn-register btn-space" onclick="viewForm('/soil/showSoil.action?action=create', 'idRasta', '', '<s:property value="getText('title.createsoil.soil')" />', 1050, 700)">
                <i class="icon-plus"></i> <s:property value="getText('button.addsoil.soil')" />
            </button><br />
            <div class="btn-group btn-space" onclick="clickSelAll('chkSelectAll', 'chkNumber', 'btnDelSoil');">
                <button class="btn btn-default" type="button"><input type="checkbox" class="chkSelectAll textFloat" />&nbsp;<s:property value="getText('label.selectall.soil')" /></button>
            </div>
            <button type="button" id="btnDelSoil" disabled="disabled" class="btn btn-initial btn-space btnGetAll disabled" onclick="showDialogDeleteAll(this, 'chkNumber', 'confirm_dialog_lot', '/soil/deleteAllSoil.action', '/soil/searchSoil.action?page=<%=pageNow%>', 'divRasta', '<%=divHide%>');">
                <i class="icon-trash"></i> <s:property value="getText('button.deletesel.soil')" />
            </button>            
        <% } %>
    <% } %>
    <table class="table table-bordered table-hover table-condensed" style="<%= table %>" id='tblRasta'>
        <thead>
            <tr>
                <% if (usrSoilDao.getPrivilegeUser(userSoil.getIdUsr(), "soil/modify") || (usrSoilDao.getPrivilegeUser(userSoil.getIdUsr(), "soil/delete"))) { %>                
                    <% if (value == "rasta" || value.equals("rasta")) {%>
                        <th></th>
                    <% } %>
                <% } %>
                <% if (entTypeSoilId==3) { %>    
                    <th><s:property value="getText('td.agronomist.soil')" /></th>
                <% } %>
                <th><s:property value="getText('td.infosoil.soil')" /></th>
                <th><s:property value="getText('td.daterasta.soil')" /></th>
                <th><s:property value="getText('td.pendant.soil')" /></th>
                <th><s:property value="getText('td.location.soil')" /></th>
                <th><s:property value="getText('td.ground.soil')" /></th>
                <th><s:property value="getText('td.position.soil')" /></th>
                <th><s:property value="getText('td.numlayers.soil')" /></th>
                <th><s:property value="getText('td.phvalue.soil')" /></th>
                <th>
                    <s:property value="getText('td.datecreated.soil')" />
                    <span>[mm/dd/yyyy]</span>
                </th>
                <% if (usrSoilDao.getPrivilegeUser(userSoil.getIdUsr(), "soil/modify") || (usrSoilDao.getPrivilegeUser(userSoil.getIdUsr(), "soil/delete"))) { %>                
                    <% if (value == "rasta" || value.equals("rasta")) {%>
                        <th><s:property value="getText('td.action.soil')" /></th>
                    <% } %>
                <% } %>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="listSoils" var="lot">
                <% String action = "";%>
                <% if (value != "lot") { %>
                    <% action = "selectItem('" + valName + "', '" + valId + "', '" + request.getAttribute("name_lot") + "', '" + request.getAttribute("id_ras") + "');";%>
                <% } %>
                <s:if test="value.equals('crop')">
                </s:if>
                <tr onclick="<%= action%>" id="trLot${id_ras}">
                    <%@ include file="row-soil.jsp" %>                                
                </tr>
            </s:iterator>
        </tbody>
    </table>
    <br />
    <label style="<%= label%>"><s:property value="getText('label.nofounddata.soil')" /></label>
    <div class="hideInfo">
        <div id="confirm_dialog_lot" class="cbox_content">
            <div class="sepH_c"><strong><s:property value="getText('label.deleterasta.soil')" />?</strong></div>
            <div>
                <a href="#" class="btn btn-small btn-initial confirm_yes"><s:property value="getText('link.optyes')" /></a>
                <a href="#" class="btn btn-default btn-small confirm_no"><s:property value="getText('link.optno')" /></a>
            </div>
        </div>
    </div>
</div>
<div class="text-center" style="<%= table %>">
    <% String result = JavascriptHelper.pager_params_ajax(pageNow, countTotal, maxResults, "/soil/searchSoil.action?selected="+value, divHide, "", "", "formRastaSearch");%>    
    <%= result%>
</div>
<s:if test="listSoils.size() > 2">
    <!--<script> $("#divSearchSoil").show(); </script>-->
</s:if> 
<s:else>
    <!--<script> $("#divSearchSoil").hide(); </script>-->
</s:else>
