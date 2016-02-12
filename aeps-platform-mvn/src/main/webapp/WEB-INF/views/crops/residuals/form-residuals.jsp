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
        <div id="divResForm">
            <s:form id="formCropRes" action="saveResidual" cssClass="form-horizontal">
                <fieldset>
                    <legend><s:property value="getText('title.formresidual.residual')" /></legend>
                    <div class="row">
                        <div class="col-md-6">
                            <s:hidden name="idCrop"/>
                            <s:hidden name="typeCrop"/>
                            <s:hidden name="costCrop"/>
                            <%--<s:hidden name="lanSel"/>--%>
                            <s:hidden name="actExe"/>
                            <s:hidden name="resMan.idResMan"/>     
                            <div class="form-group">
                                <label for="formCropRes_resMan_dateResMan" class="col-md-6 req">
                                    <s:property value="getText('text.dateresidual.residual')" />:
                                </label>
                                <div class="date col-md-6 controls">
                                    <s:date name="resMan.dateResMan" format="MM/dd/yyyy" var="dateTransformRes"/>
                                    <s:textfield name="resMan.dateResMan" cssClass="form-control" value="%{#dateTransformRes}" readonly="true"/>
                                    <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                </div>                          
                            </div>                          
                        </div>    
                         <div class="col-md-6">
                            <div class="form-group">
                                <label for="formCropRes_resMan_residualsClasification_idResCla" class="col-md-6 req">
                                    <s:property value="getText('select.residualclasification.residual')" />:
                                </label>
                                <div class="controls col-md-6">
                                    <s:select
                                        name="resMan.residualsClasification.idResCla"
                                        list="type_res_clas" 
                                        listKey="idResCla" 
                                        listValue="nameResCla"     
                                        cssClass="form-control"
                                        headerKey="-1" 
                                        headerValue="---"
                                        onchange="showOtherElement(this.value, 'divNewManageStub');"
                                    />
                                </div>                         
                            </div>                          
                        </div>   
                    </div>
              <% String classCostRes = "hideInfo"; %>
               <s:set name="costRes" value="costCrop"/>
               <s:if test="%{#costRes==1}">
                   <% classCostRes = "";  %>
               </s:if>   
               <div class="row">
                   <div class="<%= classCostRes%>" >    
                       <div class="col-md-6">
                           <div id="costresiduals" class="form-group">
                               <label for="formCropRes_resMan_costResMan" class="col-md-6">
                                   <s:property value="getText('text.cost.residual')"  />
                                   <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                               </label>
                               <div class="controls col-md-6">
                                   <s:textfield name="resMan.costResMan" type="number" cssClass="form-control" maxlength="14"/>
                               </div>

                           </div>        
                       </div>      
                   </div>                     
                       <% String classNewRes="hideInfo"; %>
                        <s:set name="idResidual" value="resMan.residualsClasification.idResCla"/>
                        <s:if test="%{#idResidual==1000000}">
                            <% classNewRes = "";%>
                        </s:if>  
                        <div class="col-md-6 <%= classNewRes %>" id="divNewManageStub">
                            <div class="form-group">
                                <label for="formCropRes_resMan_otherResidualsManagementResMan" class="col-md-6 req">
                                     <s:property value="getText('text.otherresidualmanage.residual')" />:
                                </label>
                                <div class="controls col-md-6">
                                    <s:textfield name="resMan.otherResidualsManagementResMan" cssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                       
               </div>  
                <fieldset>
                <legend><s:property value="getText('title.formresidualcomment.residual')" /></legend>                   
                <div class="row">
                   <div class="col-md-6">
                        <div  class="form-group">

                                    <div class="controls col-md-12">                                      
                                        <s:textarea rows="5" cssClass="form-control" name="resMan.commentResMan" ></s:textarea>
                                    </div>

                        </div>        
               </div>                     
               </div>    
                </fieldset>
                    <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                    <script>
                        $("#formCropRes_resMan_dateResMan").datepicker({dateFormat: 'mm/dd/yy'});
                        $("#formCropRes_resMan_dateResMan").mask("99/99/9999", {placeholder: " "});
                        $("#formCropRes_resMan_costResMan").maskMoney({prefix: ' $'});
                    </script>
                    <div id="divBtRes">
                        <% String actExe   = String.valueOf(request.getAttribute("actExe")); %>
                        <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
                            <sj:submit type="button" id="btResidual" cssClass="btn btn-initial btn-lg" onclick="removeMaskRes(); addMessageProcess()" targets="divMessage" onCompleteTopics="completeRes" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.saveresidual.residual')" /></sj:submit>
                        <% } %>
                        <button class="btn btn-default btn-lg" onclick="resetForm('formCropRes'); closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                    </div>
                </fieldset>
            </s:form>	
            <script>    
                $.ui.dialog.prototype._focusTabbable = function(){};
                $.subscribe('completeRes', function(event, data) {      
                    if(event.handled !== true){
                        completeFormGetting('dialog-form', 'formCropRes', 'divRes', event.originalEvent.request.responseText);
                        setTimeout(function() {
                            showInfo("/crop/searchResidual.action?idCrop="+$("#formCropRes_idCrop").val(), "divListRes");
                            showTimeline("/crop/viewInfoTime.action?idCrop="+$("#formCropRes_idCrop").val(), "divInfoTimeline", "timeline");
                        }, 2000); 
                        event.handled = true;
                    }                                       
                });
                
      function removeMaskRes() {       
            $("#formCropRes_resMan_costResMan").maskMoney({thousands:"", decimal:'.'});
            $("#formCropRes_resMan_costResMan").maskMoney('mask');            
    };
            </script>
        </div>
        <div class="row" id="divListResForm"></div>
    </body>
</html>
