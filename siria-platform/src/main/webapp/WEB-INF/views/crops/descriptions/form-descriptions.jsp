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
        <div class="row" id="divDesForm">
            <s:form id="formCropDes" action="saveDescrip" cssClass="form-horizontal">
                <fieldset>
                    <legend><s:property value="getText('title.observationsurvey.crop')" /></legend>
                    <div class="row">
                        <div class="col-md-6">
                            <s:hidden name="idCrop"/>
                            <s:hidden name="typeCrop"/>
                            <%--<s:hidden name="lanSel"/>--%>
                            <s:hidden name="actExe"/>
                            <s:hidden name="desPro.idDesPro"/>                          
                            <div class="form-group">
                                <label for="formCropDes_desPro_dateDesPro" class="col-md-6 req">
                                    <s:property value="getText('text.dateobs.crop')" />:
                                </label>
                                <div class="date col-md-6 controls">
                                    <s:date name="desPro.dateDesPro" format="MM/dd/yyyy" var="dateTransformDesPro"/>
                                    <s:textfield name="desPro.dateDesPro" cssClass="form-control" value="%{#dateTransformDesPro}" readonly="true"/>
                                    <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                </div>                          
                            </div>                          
                        </div>       
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="formCropDes_desPro_obsDesPro" class="col-md-6 req">
                                    <s:property value="getText('text.descobs.crop')" />: 
                                </label>
                                <div class="controls col-md-12">
                                    <s:textarea rows="5" cssClass="form-control" name="desPro.obsDesPro"></s:textarea>
                                </div> 
                            </div>                          
                        </div>     
                    </div>
                    <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                    <script>
                        $("#formCropDes_desPro_dateDesPro").datepicker({dateFormat: 'mm/dd/yy'});
                        $("#formCropDes_desPro_dateDesPro").mask("99/99/9999", {placeholder: " "});
                    </script>
                    <div id="divBtDes">
                        <% String actExe   = String.valueOf(request.getAttribute("actExe")); %>
                        <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
                            <sj:submit type="button" cssClass="btn btn-initial btn-lg" onclick="addMessageProcess()" targets="divMessage" onCompleteTopics="completeDes" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.saveobs.crop')" /></sj:submit>
                        <% } %>
                        <button class="btn btn-default btn-lg" onclick="resetForm('formCropDes'); closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                    </div>
                </fieldset>
            </s:form>
            <script>    
                $.ui.dialog.prototype._focusTabbable = function(){};
                $.subscribe('completeDes', function(event, data) {    
                    if(event.handled !== true){
                        completeFormGetting('dialog-form', 'formCropDes', 'divDes', event.originalEvent.request.responseText);
                        setTimeout(function() {
                            showInfo("/crop/searchDescrip.action?idCrop="+$("#formCropDes_idCrop").val(), "divListDes");
                        }, 2000);
                        event.handled = true;
                    }    
                });
            </script>
        </div>
        <div class="row" id="divListDesForm"></div>
    </body>
</html>
