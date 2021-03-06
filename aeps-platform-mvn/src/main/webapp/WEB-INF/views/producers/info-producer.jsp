<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>     

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.aepscolombia.platform.util.JavascriptHelper"%>
<%@page import="com.opensymphony.xwork2.ActionContext" %>
<%@page import="com.opensymphony.xwork2.util.ValueStack" %>
<% String table = "display:none;";%>
<% String label = "";%>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users userPro  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrProDao   = new UsersDao(); %>
<% Integer entTypeProId = new EntitiesDao().getEntityTypeId(userPro.getIdUsr()); %>

<s:if test="listProducers.size() > 0">
    <% table = "";%>
    <% label = "display:none;";%> 
</s:if>
<%-- <% int pos = request.getParameter("additionals").indexOf("selected"); %> --%>
<% int pageNow    = (request.getParameter("page") != null) ? Integer.parseInt(String.valueOf(request.getParameter("page"))) : 1;%>
<% //int pageNow     = Integer.parseInt(String.valueOf(request.getParameter("page")));  %>
<% int countTotal = Integer.parseInt(String.valueOf(request.getAttribute("countTotal")));%>
<% int maxResults = Integer.parseInt(String.valueOf(request.getAttribute("maxResults")));%>
<% HashMap add    = (HashMap) request.getAttribute("additionals");%>
<% String value   = (String) (add.get("selected"));%>
<% String valId   = (String) (request.getAttribute("valId"));%>
<% String valName = (String) (request.getAttribute("valName"));%>
<% String divShow = "";%>
<% String divHide = "";%>
<% if (value.equals("property")) {
        divShow = "divFarmsForm";
        divHide = "divListFarmsForm";
    } else if (value.equals("lot")) {
        divShow = "divFieldsForm";
        divHide = "divListFieldsForm";
    } else {
        divHide = "divConListProducers";
    }            
%>            
<div id="divProducers" class="w-box">
    <%--<s:actionerror theme="bootstrap"/>--%>
    <%--<s:actionmessage theme="bootstrap"/>--%>   
    <% if (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "producer/create")) { %>
        <% if (entTypeProId!=3) { %>    
            <% if (value.equals("producer")) {%>
                <div class="btn btn-group btn-space" onclick="clickSelAll('chkSelectAll', 'chkNumber', 'btnDelPro');">
                    <input type="checkbox" class="chkSelectAll textFloat" />
                    <label class="textFloat" style="padding-left: 7px; margin-bottom: 0;">Todos</label>
                </div>
                <button type="button" id="btnDelPro" disabled="disabled" class="btn btn-initial btn-space btnGetAll disabled" onclick="showDialogDeleteAll(this, 'chkNumber', 'confirm_dialog_producer', 'deleteAllProducer.action', 'searchProducer.action?page=<%=pageNow%>', 'divProducers', '<%=divHide%>');">
                    <i class="icon-trash"></i> Borrar selecci�n
                </button>
                <button type="button" class="btn btn-initial btn-space" onclick="viewForm('/showProducer.action?action=create&viewInfo=${viewInfo}', 'idPro', '', 'Crear Productor', 1050, 550)">
                    <i class="icon-plus"></i> Agregar productor
                </button>
            <% }%>
        <% }%>
    <% } %>
    <table class="table table-bordered table-hover" style="<%= table%>" id='tblProducers'>
        <thead>
            <tr class="success">
                <% if (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "producer/modify") || (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "producer/delete"))) { %>                
                    <% if (value.equals("producer") || value == "producer") {%>    
                        <th></th>
                    <% } %>
                <% } %>
                <% if (value != "producer") {%>   
                    <% if (value.equals("property") || value.equals("lot") || value.equals("crop")) {%>
                        <th></th>
                    <% }%>
                <% }%>
                <!-- <th>#</th> -->
                <% if (entTypeProId==3) { %>    
                    <th>Agronomo</th>
                <% } %>
                <th>Nombre</th>
                <th>Municipio</th>
                <th>Telefono</th>
                <th>Celular</th>
                <th>Correo</th>                                
                <th>Fecha de creaci�n</th>                                
                <% if (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "producer/modify") || (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "producer/delete"))) { %>                
                    <% if (value.equals("producer") || value == "producer") {%>    
                        <th>Accion</th>
                    <% } %>
                <% } %>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="listProducers" var="producer" status="proPos">
                <!--                <tr>
                                    <td>
                <%--<s:property value="#producer.tipo_cedula"/>--%>
            </td>
        </tr>-->                        
                <% String action = "";%> 
                <% if (!value.equals("producer") || value != "producer") {
                        if (value.equals("property") || value == "property") {
                            action = "selectItem('formFarm_name_producer', 'formFarm_idProducer', '" + request.getAttribute("name") + "', '" + request.getAttribute("id_producer") + "', '" + divShow + "', '" + divHide + "')";
//                                        action = "selectItem('" + valName + "', '" + valId + "', '" + request.getAttribute("name") + "', '" + request.getAttribute("id_producer") + "', '" + divShow + "', '" + divHide + "')";
                        } else if (value.equals("lot") || value == "lot") {
                            action = "selectItem('formField_name_producer_lot', 'formField_idProducer', '" + request.getAttribute("name") + "', '" + request.getAttribute("id_producer") + "', '" + divShow + "', '" + divHide + "')";
//                                        action = "viewInfo('/searchProducer.action?action=modify&idProducer=" + request.getAttribute("id_producer") + "&selected=" + add.get("selected") + "', 'Listado de Fincas', 'divProducers', 'divProperties')";
                    }
                }%>     
                <tr id="trProducer<s:property value='id_producer' />" class="selectVal" onclick="<%=action%>">
                    <%@ include file="row-producer.jsp" %>
                </tr>
            </s:iterator>
        </tbody>
    </table>    
    <label style="<%= label%>"><%= "No se encuentra registrado ningun productor"%></label>
    <div class="hide">
        <div id="confirm_dialog_producer" class="cbox_content">
            <div class="sepH_c"><strong>Desea borrar este(os) productor(es), <br>
                    al momento de confirmar todas las dependencias tambi�n van a desaparecer?</strong></div>
            <div>
                <%--<sj:a cssClass="btn btn-small btn-primary confirm_yes" href="deleteProducer.action?idPro=<s:property value ='id_producer' />" role="button" targets="divBodyLayout">Si</sj:a>--%>
                <%--<sj:a href="home.action" onclick="activeOption('ulOptionsMenu')" targets="divBodyLayout">Inicio</sj:a>--%>
                <a href="#" class="btn btn-small btn-initial confirm_yes">Si</a>
                <a href="#" class="btn btn-small confirm_no">No</a>
            </div>
        </div>
    </div>
</div>
<div>
    <% if (!value.equals("producer")) {%>
        <button class="btn btn_per" onclick="toggleAndClean('<%=divShow%>', '<%=divHide%>')"><i class="icon-arrow-left"></i> Atras</button>
    <% }%>
</div>
<div style="text-align:center; <%= table %>">
    <% String result = JavascriptHelper.pager_params_ajax(pageNow, countTotal, maxResults, "/searchProducer.action?selected="+value, divHide, "", "", "formProducerSearch");%>    
    <%= result%>
</div>
<s:div id="divProperties" />