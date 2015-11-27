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
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <s:actionerror theme="bootstrap"/>
        <s:actionmessage theme="bootstrap"/>
        <s:fielderror theme="bootstrap"/>
        <div id="divConForm">
            <s:form id="formCropCon" action="saveCon" cssClass="form-horizontal">
                <fieldset>
                    <legend><s:property value="getText('title.controlform.crop')" /></legend>  
                    <div class="row">
                        <div class="span5">
                            <s:hidden name="idCrop"/>
                            <s:hidden name="typeCrop"/>
                            <s:hidden name="actExe"/>
                            <%--<s:hidden name="lanSel"/>--%>
                            <s:hidden name="con.idCon"/>
                            <div class="control-group">
                                <label for="formCropCon_con_dateCon" class="control-label req">
                                    <s:property value="getText('text.controldate.crop')" />:
                                </label>
                                <div class="date controls">
                                    <s:date name="con.dateCon" format="MM/dd/yyyy" var="dateTransformCont"/>
                                    <s:textfield name="con.dateCon" value="%{#dateTransformCont}" readonly="true"/>
                                    <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                </div>                          
                            </div>                          
                        </div>
                    </div>
                    <button type="button" class="btn btn-initial btn-large" onclick="showFormAdditionalControl('../crop/showRowAdditionalControl?idCrop=<s:property value="idCrop" />', 'divProductsAdd', 'tableProduct', 'divConForm', 'divListConForm')"><i class="icon-plus"></i> <s:property value="getText('button.addhorizon.soil')" /></button>

                    <div class="control-group" id="divProductsAdd">
                        <div class="controls" style="margin-left:0px">
                            <s:include value="list-controls.jsp"></s:include>                          
                        </div> 
                    </div> 


                    </fieldset>
                    <fieldset>
                        <legend><s:property value="getText('title.controlcostform.crop')" /></legend>  
                        <div class="row">
                            <div class="span5" >
                                <div class="control-group">

                                    <label for="formCropCon_con_costInputCon" class="control-label">
                                        <s:property value="getText('text.controlcost.crop')" />:
                                    </label>
                                    <div class="controls">
                                        <s:textfield name="con.costInputCon" maxlength="14"/>
                                    </div>                         
                                </div>                          
                            </div> 

                            <div class="span5" style="padding-left: 28px">
                                <div class="control-group">
                                    <label for="formCropCon_con_costAppCon" class="control-label">
                                        <s:property value="getText('text.controlcostapp.crop')" />:
                                    </label>
                                    <div class="controls">
                                        <s:textfield 
                                            name="con.costAppCon" maxlength="14"/>                                       


                                    </div>                         
                                </div>                          
                            </div> 

                        </div>
                        <div class="row">
                            <div class="span5" >
                                <div class="control-group">
                                    <s:label for="formControl_costapptype" cssClass="control-label " value="%{getText('select.chemfertilizer.formapp')}:"></s:label>
                                        <div class="controls">

                                        <s:select
                                            id="con__costFormAppCon"
                                            name="con.costFormAppCon"
                                            value="con.costFormAppCon"             
                                            list="#{'0':'---','1':'Manual', '2':'Mecánica','3':'Aérea'}"            
                                            headerKey="-1" 

                                            />

                                    </div>

                                </div> 
                            </div> 
                        </div> 
                    </fieldset>
                    <fieldset>
                        <legend>Observaciones</legend>                   
                        <div class="row">
                            <div class="span5">
                                <div  class="control-group">
                                    <div class="controls">                                      
                                        <s:textarea rows="5" cssClass="span6" name="con.commentCon"></s:textarea>
                                    </div>
                                </div>        
                            </div>                     
                        </div>    
                    </fieldset>    
                    <p class="warnField reqBef"><s:property value="getText('label.requirefields')" /></p>
                    <script>
                        $("#formCropCon_con_dateCon").datepicker({dateFormat: 'mm/dd/yy'});
                        $("#formCropCon_con_dateCon").mask("99/99/9999", {placeholder: " "});
                        $("#formCropCon_dosisConOrg").numeric({negative: false});
                        $("#formCropCon_dosisConOrg").val(parsePointSeparated($("#formCropCon_dosisConOrg").val()));
                        $("#formCropCon_dosisConChe").numeric({negative: false});
                        $("#formCropCon_dosisConChe").val(parsePointSeparated($("#formCropCon_dosisConChe").val()));
                        showTypeFertilizerControl('formCropCon_con_controlsTypes_idConTyp', 'divOrganicCon', 'divChemicalCon', 'divMechanicCon', 'divMechanizedCon', 'divManualCon');

                        $("#formCropCon_con_costInputCon").maskMoney({suffix: ' $'});
                        $("#formCropCon_con_costAppCon").maskMoney({suffix: ' $'});

                    </script>
                    <div id="divBtCon">
                        <% String actExe   = String.valueOf(request.getAttribute("actExe")); %>
                        <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
                            <sj:submit type="button" cssClass="btn btn-initial btn-large" onclick="removeMaskControls();searchDecimalNumber('formCropCon'); addMessageProcess()" targets="divMessage" onCompleteTopics="completeCon" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.controlsave.crop')" /></sj:submit>
                        <% } %>
                        <button class="btn btn_default btn-large" onclick="resetForm('formCropCon'); closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                    </div>             
            </s:form>  
            <script>
                $.ui.dialog.prototype._focusTabbable = function() {
                };
                $.subscribe('completeCon', function(event, data) {
                    if (event.handled !== true) {
                        completeFormGetting('dialog-form', 'formCropCon', 'divPro', event.originalEvent.request.responseText);
                        setTimeout(function() {
                            showInfo("/crop/searchCon.action?idCrop=" + $("#formCropCon_idCrop").val(), "divListPro");
                            showTimeline("/crop/viewInfoTime.action?idCrop=" + $("#formCropCon_idCrop").val(), "divInfoTimeline", "timeline");
                        }, 2000);
                        event.handled = true;
                    }
                });

                function removeMaskControls() {
                    $("#formCropCon_con_costInputCon").maskMoney({thousands: "", decimal: '.'});
                    $("#formCropCon_con_costInputCon").maskMoney('mask');

                    $("#formCropCon_con_costAppCon").maskMoney({thousands: "", decimal: '.'});
                    $("#formCropCon_con_costAppCon").maskMoney('mask');
                }

            </script>
        </div>
        <div class="row-fluid" id="divListConForm"></div>
    </body>
</html>
