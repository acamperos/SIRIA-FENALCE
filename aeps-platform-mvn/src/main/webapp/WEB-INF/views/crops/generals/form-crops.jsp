<%@page import="java.util.HashMap"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users user  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrDao = new UsersDao(); %>
<% String coCode   = (String) session.getAttribute(APConstants.COUNTRY_CODE); %>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <s:actionerror theme="bootstrap"/>
        <s:actionmessage theme="bootstrap"/>
        <s:fielderror theme="bootstrap"/>
        <div id="divCropForm">
            <s:form id="formCrop" action="saveCrop" cssClass="form-horizontal">
                <fieldset>         
                    <legend><s:property value="getText('title.cropbasicinfo.crop')" /></legend>
                    <s:hidden name="idCrop"/>                           
                    <%--<s:hidden name="lanSel"/>--%>
                    <div class="form-group">
                        <s:label for="formCrop_nameField" cssClass="col-md-3 req" value="%{getText('text.selectfield.crop')}:"></s:label>
                        <div class="controls col-md-6 input-group">
                            <s:hidden name="idField"/>
                            <s:textfield name="nameField" readonly="true" cssClass="form-control" onclick="listInfo('/viewField.action?selected=crop', 'formCrop_nameField', 'formCrop_idField', 'divListCropForm', 'divCropForm')" />
                            <a class="btn btn-default input-group-addon" onclick="listInfo('/viewField.action?selected=crop', 'formCrop_nameField', 'formCrop_idField', 'divListCropForm', 'divCropForm')"><i class="icon-search"></i></a>
                        </div>  
                    </div>  
                    <div class="form-group">
                        <s:label for="formCrop_typeCrop" cssClass="col-md-3 req" value="%{getText('select.croptype.crop')}:"></s:label>
                        <div class="controls col-md-6">
                            <% if (coCode.equals("NI")) { %>
                                <s:select
                                    name="typeCrop"
                                    list="#{'4':'Arroz'}"     
                                    cssClass="form-control"
                                    headerKey="-1" 
                                    headerValue="---" />
                            <% } else if (coCode.equals("CO")) { %>
                                <s:select
                                    name="typeCrop"
                                    list="#{'1':'Maiz', '2':'Frijol'}" 
                                    cssClass="form-control"
                                    headerKey="-1" 
                                    headerValue="---" />
                            <% }%>
                        </div>
                    </div>
                    <div class="form-group">
                        <s:label for="formCrop_totallyArea" cssClass="col-md-3 req" value="Se va a sembrar la totalidad del lote disponible:"></s:label>
                        <div class="controls col-md-6 radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="totallyArea" onclick="checkArea('totallyArea', 'divAreaField')" />
                        </div>
                    </div>
                    <% String classTotally="hideInfo"; %>
                    <s:if test="%{!totallyArea && totallyArea!=null}">
                        <% classTotally = "";%>
                    </s:if> 
                    <div class="<%= classTotally %>" style="padding-left: 28px" id="divAreaField">            
                        <div class="form-group">
                            <s:label for="formCrop_typeArea" cssClass="col-md-3 req" value="%{getText('text.areatype.crop')}:"></s:label>
                            <div class="controls col-md-6">
                                <s:select
                                    name="typeArea"
                                    list="#{'1':'Porcentaje', '2':'Hectarea'}"       
                                    cssClass="form-control"
                                    headerKey="-1" 
                                    headerValue="---" 
                                    onchange="selectArea('formCrop_typeArea', 'formCrop_areaCrop', 'formCrop_availableArea')" />
                            </div>
                        </div>
                        <div class="form-group">
                            <s:label for="formCrop_areaCrop" cssClass="col-md-3 req" value="%{getText('text.areacrop.crop')}:"></s:label>
                            <div class="controls col-md-6">
                                <%--<s:textfield name="areaCrop" onkeyup="selectArea('formCrop_typeArea', 'formCrop_areaCrop', 'formCrop_availableArea')" />--%>
                                <s:textfield name="areaCrop" cssClass="form-control" />
                                <s:hidden name="areaField" />
                                <s:hidden name="availableArea" />
                                <s:hidden name="areaCropHec" />
                                <div id="divAreaAva" class="hideInfo">
                                    <label style="float: left;">Area total: </label>&nbsp;
                                    <label style="float: left; " id="formCrop_totalArea"></label>
                                    <label style="float: left; position: absolute;">Area disponible: </label>
                                    <label id="formCrop_avaArea"></label>
                                </div>  
                            </div>  
                        </div>
                    </div>                             
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="formCrop_lastCrop" class="col-md-5 req">
                                    <s:property value="getText('select.lastcrop.crop')" />:
                                    <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('help.lastcropsave.crop')" />." data-title="<s:property value="getText('title.information')" />" data-placement="right" data-trigger="hover"></i>
                                </label>
                                <div class="controls col-md-7">
                                    <s:select
                                        name="lastCrop"                                    
                                        list="type_crops" 
                                        listKey="idCroTyp" 
                                        listValue="nameCroTyp" 
                                        cssClass="form-control"
                                        headerKey="-1" 
                                        headerValue="---" 
                                        onchange="showOtherElement(this.value, 'divNewCrop')"
                                    />
                                </div>
                            </div>
                        </div>
                        <% String classNewLast="hideInfo"; %>
                        <s:set name="idOtherCrop" value="%{#attr.lastCrop}"/>
                        <s:if test="%{#idOtherCrop==1000000}">
                            <% classNewLast = "";%>
                        </s:if> 
                        <div class="col-md-6 <%= classNewLast %>" id="divNewCrop">
                            <div class="form-group">
                                <label for="formCrop_otherCrop" class="col-md-3 req">
                                    <s:property value="getText('text.otherproduct.crop')" />:
                                </label>
                                <div class="controls col-md-6">
                                    <s:textfield name="otherCrop" cssClass="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>  
                    <% if (coCode.equals("CO")) { %>             
                        <div class="form-group">
                            <s:label for="formCrop_costCrop" cssClass="col-md-3" value="%{getText('select.cropcost.crop')}:"></s:label>
                            <div class="controls col-md-6">
                                <s:select
                                    name="costCrop"
                                    list="#{'true':'SI', 'false':'NO'}"  
                                    cssClass="form-control"
                                    headerKey="-1" 
                                    />
                            </div>
                        </div>  
                    <% } %>
                </fieldset>  
                <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                <div> 
                    <s:hidden name="page"/>
                    <s:hidden name="actExe"/>    
                    <s:hidden name="newRow" value="1"/>    
                    <% String actExe   = String.valueOf(request.getAttribute("actExe")); %>
                    <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
                        <sj:submit id="btnCrop" type="button" cssClass="btn btn-initial btn-lg" onclick="searchDecimalNumber('formCrop'); addMessageProcess()" targets="divMessage" onCompleteTopics="completeCrop" validate="true" validateFunction="validationForm"><i class="icon-save"></i> <s:property value="getText('button.prodeventsave.crop')" /></sj:submit>
                    <% } %>
                    <button class="btn btn-lg btn-default bt_cancel_crop" onclick="resetForm('formCrop'); closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                </div>    
            </s:form>        
            <script>                
                var action = $("#formCrop_actExe").val();                
                $("#formCrop_performObj").numeric();
                $("#formCrop_areaCrop").numeric({negative: false});
                $("#formCrop_performObj").val(parsePointSeparated($("#formCrop_performObj").val()));        
                $.subscribe('completeCrop', function(event, data) {
                    var actExeCrop = $("#formCrop_actExe").val();
                    if (actExeCrop=='create') {
                        $('#btnCrop').on('click', function() {
                            ga('send', 'event', 'Crops', 'click', 'Create');
                        });
                    } else if (actExeCrop=='modify') {
                        $('#btnCrop').on('click', function() {
                            ga('send', 'event', 'Crops', 'click', 'Update');
                        });                
                    }
                    completeFormGetting('dialog-form', 'formCrop', 'divCrops', event.originalEvent.request.responseText);
                    var json = jQuery.parseJSON(event.originalEvent.request.responseText);
                    setTimeout(function() {
                        document.location = "/crop/dataCrop.action?idCrop="+json.idCrop;     
//                        document.location = "/aeps/crop/dataCrop.action?idCrop="+json.idCrop;     
                    }, 2000);
                });
                if($('.pop-over').length) {
                    $('.pop-over').popover();
                }
                showInfoArea('formCrop_idCrop', 'formCrop_areaField', 'formCrop_availableArea', 'formCrop_areaCrop', 'formCrop_areaCropHec', 'formCrop_totalArea', 'formCrop_avaArea', 'formCrop_typeArea', 'divAreaAva');
            </script>
        </div>
        <div id="divListCropForm"></div>
    </body>
</html>
