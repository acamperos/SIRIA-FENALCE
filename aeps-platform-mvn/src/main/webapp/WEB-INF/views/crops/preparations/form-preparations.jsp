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
        <div  id="divPrepForm">
            <s:form id="formCropPrep" action="savePrep" cssClass="form-horizontal">
                <fieldset>
                    <legend><s:property value="getText('title.formpreparation.preparation')" /></legend>
                    <div class="row">
                        <div class="col-md-6">
                            <s:hidden name="idCrop"/>
                            <s:hidden name="typeCrop"/>
                            <%--<s:hidden name="lanSel"/>--%>
                            <s:hidden name="actExe"/>
                            <s:hidden name="prep.idPrep"/>
                            <div class="form-group">
                                <label for="formCropPrep_prep_preparationsTypes_idPreTyp" class="col-md-6 req">
                                    <s:property value="getText('select.preparationtype.preparation')" />:
                                </label>
                                <div class="controls col-md-6">
                                    <s:select
                                        name="prep.preparationsTypes.idPreTyp"
                                        list="type_prep_typ" 
                                        cssClass="form-control"
                                        listKey="idPreTyp" 
                                        listValue="namePreTyp"            
                                        headerKey="-1" 
                                        headerValue="---"
                                        onchange="showOtherElementPrep(this.value, 'divNewPasses', 'divNewTypePrep', 'lblDepthPrep')"
                                        />
                                </div>                          
                            </div>                          
                        </div>
                        <div class="col-md-6">                            
                            <div class="form-group">
                                <label for="formCropPrep_prep_datePrep" class="col-md-6 req">
                                    <s:property value="getText('text.datepreparation.preparation')" />:
                                </label>
                                <div class="col-md-6 controls">
                                    <s:date name="prep.datePrep" format="MM/dd/yyyy" var="dateTransformPrep"/>
                                    <s:textfield name="prep.datePrep" cssClass="form-control" value="%{#dateTransformPrep}" readonly="true"/>
                                    <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                </div>                          
                            </div>                          
                        </div>     
                    </div>

                    <div class="row hideInfo" id="divNewPasses">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="formCropPrep_prep_depthPrep" id="lblDepthPrep" class="col-md-6 req">
                                    <s:property value="getText('text.depthpreparation.preparation')" /> <button type="button" class="btn btn-initial"><b>(cm)</b></button>: 
                                </label>
                                <div class="controls col-md-6">
                                    <s:number name="prep.depthPrep" type="integer" var="depthPreparation" />
                                    <s:textfield name="prep.depthPrep" type="number" cssClass="form-control" value="%{#depthPreparation}"/>
                                </div> 
                            </div>                          
                        </div>     
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="formCropPrep_prep_passingsNumberPrep" id="lblPassingsNumberPrep" class="col-md-6">
                                    <s:property value="getText('text.passingnumber.preparation')" />:
                                </label>
                                <div class="controls col-md-6">
                                    <s:textfield name="prep.passingsNumberPrep" type="number" cssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hideInfo" id="divNewTypePrep">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="formCropPrep_prep_otherPreparationTypePrep" class="col-md-6 req">
                                        <s:property value="getText('text.otherpreparationtype.preparation')" />:
                                    </label>
                                    <div class="controls col-md-6">
                                        <s:textfield name="prep.otherPreparationTypePrep" cssClass="form-control"/>
                                    </div>                         
                                </div>                         
                            </div>
                        </div>
                    </div>
                    <% String classCostPre = "hideInfo"; %>
                    <s:set name="costPre" value="costCrop"/>
                    <s:if test="%{#costPre==1}">
                        <% classCostPre = "";%>
                    </s:if>   
                    <div class="<%= classCostPre%>">
                        <div id="costpreparations" class="row">
                            <div class="col-md-6">     
                                <div class="form-group">
                                    <label for="formCropPrep_prep_costPrep" class="col-md-6">
                                        <s:property value="getText('text.costpreparation.preparation')" />
                                        <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                                    </label>
                                    <div class="controls col-md-6">
                                        <s:textfield name="prep.costPrep" type="number" cssClass="form-control" maxlength="14"/>
                                    </div>
                                </div>
                            </div>                        
                        </div> 
                    </div>
                    <fieldset>
                        <legend><s:property value="getText('title.formpreparationcomment.preparation')" /></legend>                   
                        <div class="row">
                            <div class="col-md-6">
                                <div  class="form-group">

                                    <div class="controls col-md-12">                                      
                                        <s:textarea rows="5" cssClass="form-control" name="prep.commentPrep"></s:textarea>
                                        </div>

                                    </div>        
                                </div>                     
                            </div>    
                        </fieldset>

                        <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                    <script>
                        showOtherElementPrep($("#formCropPrep_prep_preparationsTypes_idPreTyp").val(), 'divNewPasses', 'divNewTypePrep');
                        $("#formCropPrep_prep_datePrep").datepicker({dateFormat: 'mm/dd/yy'});
                        $("#formCropPrep_prep_datePrep").mask("99/99/9999", {placeholder: " "});
                        $("#formCropPrep_prep_depthPrep").numeric({decimal: false, negative: false});
                        $("#formCropPrep_prep_passingsNumberPrep").numeric({decimal: false, negative: false});
                        $("#formCropPrep_prep_depthPrep").val(parsePointSeparated($("#formCropPrep_prep_depthPrep").val()));
                        $("#formCropPrep_prep_costPrep").maskMoney({prefix: ' $'});
                    </script>
                    <div id="divBtPrep">
                        <% String actExe = String.valueOf(request.getAttribute("actExe")); %>
                        <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
                            <sj:submit type="button" cssClass="btn btn-initial btn-lg" onclick="removeMaskPre();searchDecimalNumber('formCropPrep'); addMessageProcess()" targets="divMessage" onCompleteTopics="completePrep" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.savepreparation.preparation')" /></sj:submit>
                        <% }%>
                        <button class="btn btn-default btn-lg" onclick="resetForm('formCropPrep');
                                closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                    </div>
                </fieldset>
            </s:form>	
            <script>
                $.ui.dialog.prototype._focusTabbable = function() {
                };
                $.subscribe('completePrep', function(event, data) {
                    if (event.handled !== true) {
                        completeFormGetting('dialog-form', 'formCropPrep', 'divPrep', event.originalEvent.request.responseText);
                        setTimeout(function() {
                            showInfo("/crop/searchPrep.action?idCrop=" + $("#formCropPrep_idCrop").val(), "divListPrep");
                            showTimeline("/crop/viewInfoTime.action?idCrop=" + $("#formCropPrep_idCrop").val(), "divInfoTimeline", "timeline");
                        }, 2000);
                        event.handled = true;
                    }
                });

                function removeMaskPre() {
                    $("#formCropPrep_prep_costPrep").maskMoney({thousands: "", decimal: '.'});
                    $("#formCropPrep_prep_costPrep").maskMoney('mask');

                }
            </script>
        </div>
        <div class="row" id="divListPrepForm"></div>
    </body>
</html>
