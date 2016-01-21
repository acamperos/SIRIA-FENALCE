<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page import="java.lang.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.aepscolombia.platform.util.JavascriptHelper"%>            
<% String tableCon = "display:none;";%>
<% String labelCon = "";%>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users userPro  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrProDao = new UsersDao(); %>
<% Integer entTypeProId = new EntitiesDao().getEntityTypeId(userPro.getIdUsr()); %>

<s:if test="listCont.size() > 0">
    <% tableCon = "";%>
    <% labelCon = "display:none;";%> 
</s:if>            

<div class="msgWin" id="divMessListCon"></div>
<div id="divPro" class="table-responsive w-box">
    <fieldset>
        <legend><s:property value="getText('title.controllist.control')" /></legend>
        <% if (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "crop/create")) { %>
            <% if (entTypeProId!=3) { %>
                <button type="button" class="btn btn-initial btn-space" onclick="viewForm('/crop/showCon.action?action=create', 'idCrop', '${idCrop}', '<s:property value="getText('title.addcontrol.control')" />', 1050, 550);">
                    <i class="icon-plus"></i> <s:property value="getText('button.addcontrol.control')" />
                </button>
            <% } %>
        <% } %>
        <table class="table table-bordered table-condensed table-hover" style="<%= tableCon %>" id='tblCon'>
            <thead>
                <tr>
                    <th><s:property value="getText('td.datecontrol.control')" /></th>
                    <th><s:property value="getText('td.objectivetype.control')" /></th>
                    <th><s:property value="getText('td.objtivecontrol.control')" /></th>
                    <th><s:property value="getText('td.controltype.control')" /></th>
                    <th><s:property value="getText('td.dosecontrol.control')" /></th>
                    <% if (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "crop/modify") || (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "crop/delete"))) { %>
                        <th><s:property value="getText('td.action.control')" /></th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <s:set name="valIdCon" value="0"/>                
                <s:iterator value="listCont" var="conGen" status="estatus">
                    <tr id="trProCon${idProCon}">
                        <s:if test="%{#valIdCon!=#attr.idCon}">   
                            <%@ include file="row-conmain.jsp" %>
                        </s:if>                                
                        <s:else>
                            <%@ include file="row-congen.jsp" %>
                        </s:else>                                                               
                    </tr>
                    <s:set name="valIdCon" value="%{#attr.idCon}"/>
                </s:iterator>


                <!--<tr id="trCon">-->
                    <%--<%@ include file="row-controls.jsp" %>--%>                                
                <!--</tr>-->
            </tbody>
        </table>
        <br />
        <label style="<%= labelCon %>"><s:property value="getText('label.nofounddata.control')" /></label>
        <div class="hideInfo">
            <div id="confirm_dialog_con" class="cbox_content">
                <div class="sepH_c"><strong><s:property value="getText('label.deletecontrol.control')" />?</strong></div>
                <div>
                    <a href="#" class="btn btn-small btn-initial confirm_yes"><s:property value="getText('link.optyes')" /></a>
                    <a href="#" class="btn btn-default btn-small confirm_no"><s:property value="getText('link.optno')" /></a>
                </div>
            </div>
        </div>
    </fieldset>
</div>
