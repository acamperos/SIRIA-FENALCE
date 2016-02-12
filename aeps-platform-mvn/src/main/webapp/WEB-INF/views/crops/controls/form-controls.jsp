<%@page import="java.util.HashMap"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users user = (Users) session.getAttribute(APConstants.SESSION_USER); %>
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
                        <div class="col-md-6">
                            <s:hidden name="idCrop"/>
                            <s:hidden name="typeCrop"/>
                            <s:hidden name="actExe"/>                            
                            <%--<s:hidden name="lanSel"/>--%>
                            <s:hidden name="con.idCon"/>
                            <div class="form-group">
                                <label for="formCropCon_con_dateCon" class="col-md-6 req">
                                    <s:property value="getText('text.controldate.crop')" />:
                                </label>
                                <div class="date col-md-6 controls">
                                    <s:date name="con.dateCon" format="MM/dd/yyyy" var="dateTransformCont"/>
                                    <s:textfield name="con.dateCon" cssClass="form-control" value="%{#dateTransformCont}" readonly="true"/>
                                    <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                </div>                          
                            </div>                          
                        </div>
                    </div>
                    <fieldset>         
                        <legend><s:property value="getText('title.objective.control')" /></legend>
                        <button type="button" class="btn btn-initial btn-lg" onclick="showFormAdditionalControl('../crop/showRowAdditionalControl?idCrop=<s:property value="idCrop" />', 'divProductsAdd', 'tableProduct', 'divConForm', 'divListConForm')"><i class="icon-plus"></i> <s:property value="getText('button.addhorizon.soil')" /></button>

                        <div id="divProductsAdd">
                            <div class="controls">
                                <s:include value="list-controls.jsp"></s:include>                          
                            </div> 
                        </div> 
                    </fieldset>
                </fieldset>
                <% String classCostCon = "hideInfo"; %>
                <s:set name="costCon" value="costCrop"/>
                <s:if test="%{#costCon==1}">
                    <% classCostCon = "";%>
                </s:if>                   
                <fieldset  class="<%= classCostCon%>">
                    <legend><s:property value="getText('title.controlcostform.crop')" /></legend>  
                    <div class="row">
                        <div class="col-md-6" >
                            <div class="form-group">

                                <label for="formCropCon_con_costInputCon" class="col-md-6">
                                    <s:property value="getText('text.controlcost.crop')" />
                                    <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                </label>
                                <div class="controls col-md-6">
                                    <s:textfield name="con.costInputCon" type="number" cssClass="form-control" maxlength="14"/>
                                </div>                         
                            </div>                          
                        </div> 

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="formCropCon_con_costAppCon" class="col-md-6">
                                    <s:property value="getText('text.controlcostapp.crop')" />
                                    <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                </label>
                                <div class="controls col-md-6">
                                    <s:textfield name="con.costAppCon" type="number" maxlength="14" cssClass="form-control"/>                                       
                                </div>                         
                            </div>                          
                        </div> 

                    </div>
                    <div class="row">
                        <div class="col-md-6" >
                            <div class="form-group">
                                <s:label for="formControl_costapptype" cssClass="col-md-6" value="%{getText('select.chemfertilizer.formapp')}:"></s:label>
                                <div class="controls col-md-6">
                                    <s:select
                                        id="con__costFormAppCon"
                                        name="con.costFormAppCon"
                                        value="con.costFormAppCon"             
                                        list="#{'0':'---','1':'Manual', '2':'Mecánica','3':'Aérea'}"            
                                        headerKey="-1" 
                                        cssClass="form-control"
                                        />
                                </div> 
                            </div> 
                        </div> 
                    </div>       
                </fieldset>
                <fieldset>
                    <legend><s:property value="getText('title.formcontrolcomment.control')" /></legend>                   
                    <div class="row">
                        <div class="col-md-6">
                            <div  class="form-group">
                                <div class="controls col-md-12">                                      
                                    <s:textarea rows="5" cssClass="form-control" name="con.commentCon"></s:textarea>
                                </div>

                            </div>        
                        </div>                     
                    </div>    
                </fieldset>    
                <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                <script>
                    $("#formCropCon_con_dateCon").datepicker({dateFormat: 'mm/dd/yy'});
                    $("#formCropCon_con_dateCon").mask("99/99/9999", {placeholder: " "});

                    $("#formCropCon_con_costInputCon").maskMoney({prefix: ' $'});
                    $("#formCropCon_con_costAppCon").maskMoney({prefix: ' $'});

                </script>
                <div id="divBtCon">
                    <% String actExe = String.valueOf(request.getAttribute("actExe")); %>
                    <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
                    <sj:submit type="button" cssClass="btn btn-initial btn-lg" onclick="removeMaskControls();searchDecimalNumber('formCropCon'); addMessageProcess()" targets="divMessage" onCompleteTopics="completeCon" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.controlsave.crop')" /></sj:submit>
                    <% }%>
                    <button class="btn btn-default btn-lg" onclick="resetForm('formCropCon'); closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                </div>             
            </s:form>  
            <script>
                $.ui.dialog.prototype._focusTabbable = function() {};
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
        <div id="divListConForm"></div>
    </body>
</html>
