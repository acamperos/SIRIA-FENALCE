<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page import="java.lang.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.aepscolombia.platform.util.JavascriptHelper"%>            
<% String tableRes = "display:none;";%>
<% String labelRes = "";%>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users userRes  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrResDao = new UsersDao(); %>
<% Integer entTypeResId = new EntitiesDao().getEntityTypeId(userRes.getIdUsr()); %>

<s:if test="listResMan.size() > 0">
    <% tableRes = "";%>
    <% labelRes = "display:none;";%> 
</s:if>            
<% String classCostResInfo = "hideInfo"; %>
               <s:set name="costRes" value="costCrop"/>
               <s:if test="%{#costRes==1}">
                   <% classCostResInfo = "";  %>
               </s:if>   
<div class="msgWin" id="divMessListRes"></div>
<div id="divRes" class="table-responsive w-box">
    <fieldset>
        <legend><s:property value="getText('title.residuallist.residual')" /></legend>
        <% if (usrResDao.getPrivilegeUser(userRes.getIdUsr(), "crop/create")) { %>
            <% if (entTypeResId!=3) { %>
                <button type="button" class="btn btn-initial btn-space" onclick="viewForm('/crop/showResidual.action?action=create', 'idCrop', '${idCrop}', '<s:property value="getText('title.addresidual.residual')" />', 1050, 550);">
                    <i class="icon-plus"></i> <s:property value="getText('button.addresidual.residual')" />
                </button>
            <% } %>
        <% } %>
        <table class="table table-bordered table-condensed table-hover" style="<%= tableRes %>" id='tblRes'>
            <thead>
                <tr>
                    <th><s:property value="getText('td.residualdate.residual')" /></th>
                    <th><s:property value="getText('td.residualmanage.residual')" /></th>
                    <th><s:property value="getText('td.otherresidual.residual')" /></th>
                    <th class="<%= classCostResInfo %>"><s:property value="getText('td.costresidual.residual')" /></th>
                    <% if (usrResDao.getPrivilegeUser(userRes.getIdUsr(), "crop/modify") || (usrResDao.getPrivilegeUser(userRes.getIdUsr(), "crop/delete"))) { %>
                        <th><s:property value="getText('td.action.residual')" /></th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="listResMan" var="res">
                    <tr id="trRes${idRes}">
                        <%@ include file="row-residuals.jsp" %>                                
                    </tr>
                </s:iterator>
            </tbody>
        </table>
        <br />
        <label style="<%= labelRes%>"><s:property value="getText('label.nofounddata.residual')" /></label>
        <div class="hideInfo">
            <div id="confirm_dialog_res" class="cbox_content">
                <div class="sepH_c"><strong><s:property value="getText('label.deleteresidual.residual')" />?</strong></div>
                <div>
                    <a href="#" class="btn btn-small btn-initial confirm_yes"><s:property value="getText('link.optyes')" /></a>
                    <a href="#" class="btn btn-default btn-small confirm_no"><s:property value="getText('link.optno')" /></a>
                </div>
            </div>
        </div>
    </fieldset>
</div>
