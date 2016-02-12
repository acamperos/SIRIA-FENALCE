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
        <div id="divIrrForm">
            <s:form id="formCropIrr" action="saveIrr" cssClass="form-horizontal">
                <fieldset>
                    <legend><s:property value="getText('title.formirrigation.irrigation')" /></legend>
                    <div id="divInfoRiego">                        
                        <% String classLamina = "hideInfo"; %>
                        <% String classWet    = "hideInfo"; %>
                        <% if (coCode.equals("NI")) { %>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropIrr_irr_whatDoYouUseIrr_idUseIrr" class="col-md-6 req">
                                            <s:property value="getText('radio.irrwhatdoyouuse.irrigation')" />:
                                        </label>
                                        <div class="col-md-6 radioSelect">
                                            <s:radio list="type_uses_irr" listKey="idUseIrr" listValue="nameUseIrr" onclick="showSelectionIrrigation(this.value, 'divLamina', 'divWet')" name="irr.whatDoYouUseIrr.idUseIrr" />
                                        </div>
                                    </div>
                                </div> 
                            </div> 
                        <% } else if (coCode.equals("CO")) { %>
                            <% classLamina = ""; %>
                        <% } %>
                        <s:set name="whatUse" value="irr.whatDoYouUseIrr.idUseIrr"/>
                        <s:if test="%{#whatUse==1}">
                            <% classLamina = ""; %>
                            <% classWet    = "hideInfo"; %>
                        </s:if>      
                        <s:elseif test="%{#whatUse==2}">
                            <% classLamina = "hideInfo"; %>
                            <% classWet    = ""; %>
                        </s:elseif>
                        <div class="<%= classLamina %>" id="divLamina">
                            <div class="row">
                                <div class="col-md-6">
                                    <s:hidden name="idCrop"/>
                                    <s:hidden name="typeCrop"/>
                                    <%--<s:hidden name="lanSel"/>--%>
                                    <s:hidden name="actExe"/>
                                    <s:hidden name="irr.idIrr"/>
                                    <div class="form-group">
                                        <label for="formCropIrr_irr_dateIrr" class="col-md-6 req">
                                            <s:property value="getText('text.irrdate.irrigation')" />:
                                        </label>
                                        <div class="date col-md-6 controls">
                                            <s:date name="irr.dateIrr" format="MM/dd/yyyy" var="dateTransformIrr"/>
                                            <s:textfield name="irr.dateIrr" cssClass="form-control" value="%{#dateTransformIrr}" readonly="true"/>
                                            <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                                            <span class="add-on"><i class="icon-calendar"></i></span>
                                        </div>                          
                                    </div>                          
                                </div>   
                                            <% if (coCode.equals("CO")) { %>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="formCropIrr_irr_irrigationsTypes_idIrrTyp" class="col-md-6 req">
                                                        <s:property value="getText('select.irrtypes.irrigation')" />:
                                                    </label>
                                                    <div class="controls col-md-6">
                                                        <s:select
                                                            name="irr.irrigationsTypes.idIrrTyp"
                                                            list="type_irr_typ" 
                                                            cssClass="form-control"
                                                            listKey="idIrrTyp" 
                                                            listValue="nameIrrTyp"            
                                                            headerKey="-1" 
                                                            headerValue="---"
                                                            onchange="showTypeIrrigations('formCropIrr_irr_irrigationsTypes_idIrrTyp', 'divcostsprinkling', 'divcostgravity', 'divMechanicCon', 'divMechanizedCon', 'divManualCon','divIrrRented');
                                                  
                                                  hideInformationIrrigation('divNewObjControlPes', 'divNewObjControlWee', 'divNewObjControlDis', 'divNewProCheCon', 'divNewProOrgCon');"
                                                            />
                                                    </div>                         
                                                </div>                          
                                            </div>   
                                            <% } %>
                            
                                
                                            
                            </div>  
                            <% if (coCode.equals("NI")) { %>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="formCropIrr_irr_thicknessSheetIrr" class="col-md-6">
                                                <s:property value="getText('text.thicknessheetirr.irrigation')" /> <button type="button" class="btn btn-initial"><b>(cm)</b></button>:
                                            </label>
                                            <div class="controls col-md-6">
                                                <s:textfield name="irr.thicknessSheetIrr" type="number" cssClass="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                        <div class="<%= classWet %>" id="divWet">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropIrr_irr_dateWetIrr" class="col-md-6 req">
                                            <s:property value="getText('text.irrdatewet.irrigation')" />:
                                        </label>
                                        <div class="date controls col-md-6">
                                            <s:date name="irr.dateWetIrr" format="MM/dd/yyyy" var="dateTransformWetIrr"/>
                                            <s:textfield name="irr.dateWetIrr" cssClass="form-control" value="%{#dateTransformWetIrr}" readonly="true"/>
                                            <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                                            <span class="add-on"><i class="icon-calendar"></i></span>
                                        </div>                          
                                    </div>                          
                                </div>       
                            </div>  
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropIrr_irr_durationIrr" class="col-md-6">
                                            <s:property value="getText('text.durationirr.irrigation')" /> <button type="button" class="btn btn-initial"><b>(horas)</b></button>:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="irr.durationIrr" type="number" cssClass="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <% if (coCode.equals("CO")) { %>
                           <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropIrr_irr_amountIrr" class="col-md-6">
                                            <s:property value="getText('text.amountirr.irrigation')" /> <button type="button" class="btn btn-initial"><b>(metros cúbicos)</b></button>:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="irr.amountIrr" type="number" cssClass="form-control"/>
                                        </div>
                                    </div>
                                </div>                           
                                        
                            </div>
                        <% } %>
                        
               <% String classCostIrr = "hideInfo"; %>
               <s:set name="costIrr" value="costCrop"/>
               <s:if test="%{#costIrr==1}">
                   <% classCostIrr = "";  %>
               </s:if>   
                        <div class="<%= classCostIrr %>" id="costirrigation" >
                        <fieldset>
                             <legend><s:property value="getText('title.formirrigationcost.irrigation')" /></legend>
                         <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropIrr_irr_costWaterIrr" class="col-md-6">
                                            <s:property value="getText('text.costwaterirr.irrigation')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="irr.costWaterIrr" type="number" cssClass="form-control" maxlength="14"/>
                                        </div>
                                        
                                        
                                        
                                    </div>
                                </div>  
                                        
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropIrr_irr_costWorkforceIrr" class="col-md-6">
                                            <s:property value="getText('text.costworkforceirr.irrigation')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="irr.costWorkforceIrr" type="number" cssClass="form-control" maxlength="14"/>
                                        </div>
                                    </div>
                                </div>  
                                        
                        </div>
                                                    
                       <div id="divcostgravity" class="row">
                                <div  class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropIrr_irr_costDitchesIrr" class="col-md-6">
                                            <s:property value="getText('text.costditchesirr.irrigation')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="irr.costDitchesIrr" type="number" cssClass="form-control" maxlength="14"/>
                                        </div>
                                    </div>
                                </div>  
                                        
                                 <div  class="col-md-6">
                                      <div class="form-group">
                                          <label for="formCropIrr_irr_costDrainageIrr" class="col-md-6">
                                              <s:property value="getText('text.costdrainageirr.irrigation')" />
                                              <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                                            </label>
                                            <div class="controls col-md-6">
                                                <s:textfield name="irr.costDrainageIrr" type="number" cssClass="form-control" maxlength="14"/>
                                            </div>
                                      </div>
                                </div>  
                                        
                        </div>
                                                    
                        <div id="divcostsprinkling" class="row">
                                <div  class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropIrr_irr_costFuelIrr" class="col-md-6">
                                            <s:property value="getText('text.costfuelirr.irrigation')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="irr.costFuelIrr" type="number" cssClass="form-control" maxlength="14"/>
                                        </div>
                                    </div>
                                </div>  
                                        
                                 <div class="col-md-6">
                                      <div class="form-group">
                                        <label for="formCropIrr_irr_costElectricpowerIrr" class="col-md-6">
                                            <s:property value="getText('text.costelectricpowerirr.irrigation')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="irr.costElectricpowerIrr" type="number" cssClass="form-control" maxlength="14"/>
                                        </div>
                                      </div>
                                </div>  
                                        
                        </div>

                                              <div id="divIrrRented" class="row" >
                                                  <div  class="col-md-6">
                                                      <div class="form-group">
                                                          <label for="formCropIrr_rentedquestionIrr" class="col-md-6">
                                                              <s:property value="getText('radio.rentedquestionirr.irrigation')" />:
                                                          </label>
                                                          <div class="controls col-md-6 radioSelect">
                                                              <s:radio
                                                                       name="irr.costRentedquestionIrr"
                                                                       list="#{'true':'Alquilado', 'false':'Propio'}" 
                                                                       onclick="showRentedquestionIrrigations('irr.costRentedquestionIrr', 'divcostown', 'divcostrented');"
                                                                       />
                                                          </div>
                                                      </div>
                                                  </div>
                                                          
                                                              <div id="divcostown" class="col-md-6">
                                                                  <div class="form-group">
                                                                      <label for="formCropIrr_irr_costDepreciationIrr" class="col-md-6">
                                                                          <s:property value="getText('text.costdepreciationirr.irrigation')" />
                                                                          <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                                                                      </label>
                                                                      <div class="controls col-md-6">
                                                                          <s:textfield name="irr.costDepreciationIrr" type="number" cssClass="form-control" maxlength="14"/>
                                                                      </div>
                                                                  </div>
                                                              </div>  
                                                              
                                                              <div id="divcostrented" class="col-md-6">
                                                                  <div class="form-group">
                                                                      <label for="formCropIrr_irr_costRentedIrr" class="col-md-6">
                                                                          <s:property value="getText('text.costrentedirr.irrigation')" />
                                                                          <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                                                                      </label>
                                                                      <div class="controls col-md-6">
                                                                          <s:textfield name="irr.costRentedIrr" type="number" cssClass="form-control" maxlength="14"/>
                                                                      </div>
                                                                  </div>
                                                              </div>  

                                                          
                                              </div>
                        </fieldset>                  
                      </div>
                <fieldset>
                <legend><s:property value="getText('title.formirrigationcomment.irrigations')" /></legend>                   
                <div class="row">
                   <div class="col-md-6">
                        <div  class="form-group">

                                    <div class="controls col-md-12">                                      
                                        <s:textarea rows="5" cssClass="form-control" name="irr.commentIrr"></s:textarea>
                                    </div>

                                </div>        
               </div>                     
               </div>    
                </fieldset>   
                    </div>	
                    <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                    <script>
                        $("#formCropIrr_irr_dateIrr").datepicker({dateFormat: 'mm/dd/yy', showOn: "focus"});
                        $("#formCropIrr_irr_dateIrr").mask("99/99/9999", {placeholder: " "});
                        $("#formCropIrr_irr_amountIrr").numeric({negative: false});
                        $("#formCropIrr_irr_thicknessSheetIrr").numeric({negative: false});
                        $("#formCropIrr_irr_durationIrr").numeric({negative: false});
                        $("#formCropIrr_irr_amountIrr").val(parsePointSeparated($("#formCropIrr_irr_amountIrr").val())); 
                        $("#formCropIrr_irr_thicknessSheetIrr").val(parsePointSeparated($("#formCropIrr_irr_thicknessSheetIrr").val())); 
                        $("#formCropIrr_irr_durationIrr").val(parsePointSeparated($("#formCropIrr_irr_durationIrr").val())); 
                        $("#formCropIrr_irr_dateWetIrr").datepicker({dateFormat: 'mm/dd/yy', showOn: "focus"});
                        $("#formCropIrr_irr_dateWetIrr").mask("99/99/9999", {placeholder: " "});
                         
                        $("#formCropIrr_irr_costWaterIrr").maskMoney({prefix: ' $'});
                        $("#formCropIrr_irr_costWorkforceIrr").maskMoney({prefix: ' $'});
                        $("#formCropIrr_irr_costDitchesIrr").maskMoney({prefix: ' $'});
                        $("#formCropIrr_irr_costDrainageIrr").maskMoney({prefix: ' $'});
                        $("#formCropIrr_irr_costFuelIrr").maskMoney({prefix: ' $'});
                        $("#formCropIrr_irr_costElectricpowerIrr").maskMoney({prefix: ' $'});
                        $("#formCropIrr_irr_costDepreciationIrr").maskMoney({prefix: ' $'});
                        $("#formCropIrr_irr_costRentedIrr").maskMoney({prefix: ' $'});
                        
                        showTypeIrrigations('formCropIrr_irr_irrigationsTypes_idIrrTyp', 'divcostsprinkling', 'divcostgravity', 'divMechanicCon', 'divMechanizedCon', 'divManualCon','divIrrRented');
                        showRentedquestionIrrigations('irr.costRentedquestionIrr', 'divcostown', 'divcostrented');
                    </script>
                    <div id="divBtIrr">
                        <% String actExe   = String.valueOf(request.getAttribute("actExe")); %>
                        <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
                            <sj:submit type="button" cssClass="btn btn-initial btn-lg" onclick="removeMaskIrr();searchDecimalNumber('formCropIrr'); addMessageProcess()" targets="divMessage" onCompleteTopics="completeIrr" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.saveirr.irrigation')" /></sj:submit>
                        <% } %>
                        <button class="btn btn-default btn-lg" onclick="resetForm('formCropIrr'); closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                    </div>
                </fieldset>
            </s:form>	
            <script>        
                $.ui.dialog.prototype._focusTabbable = function(){};
                $.subscribe('completeIrr', function(event, data) { 
                    if(event.handled !== true){
                        completeFormGetting('dialog-form', 'formCropIrr', 'divIrr', event.originalEvent.request.responseText);
                        setTimeout(function() {
                            showInfo("/crop/searchIrr.action?idCrop="+$("#formCropIrr_idCrop").val(), "divListIrr");
                            showTimeline("/crop/viewInfoTime.action?idCrop="+$("#formCropIrr_idCrop").val(), "divInfoTimeline", "timeline");
                        }, 2000);
                        event.handled = true;
                    }   
                });
               
     function removeMaskIrr() {       
           $("#formCropIrr_irr_costWaterIrr").maskMoney({thousands:"", decimal:'.'});
           $("#formCropIrr_irr_costWaterIrr").maskMoney('mask');
           
           $("#formCropIrr_irr_costWorkforceIrr").maskMoney({thousands:"", decimal:'.'});
           $("#formCropIrr_irr_costWorkforceIrr").maskMoney('mask');
           
           $("#formCropIrr_irr_costDitchesIrr").maskMoney({thousands:"", decimal:'.'});
           $("#formCropIrr_irr_costDitchesIrr").maskMoney('mask');
           
           $("#formCropIrr_irr_costDrainageIrr").maskMoney({thousands:"", decimal:'.'});
           $("#formCropIrr_irr_costDrainageIrr").maskMoney('mask');
           
           $("#formCropIrr_irr_costFuelIrr").maskMoney({thousands:"", decimal:'.'});
           $("#formCropIrr_irr_costFuelIrr").maskMoney('mask');
           
           $("#formCropIrr_irr_costElectricpowerIrr").maskMoney({thousands:"", decimal:'.'});
           $("#formCropIrr_irr_costElectricpowerIrr").maskMoney('mask');
           
           $("#formCropIrr_irr_costDepreciationIrr").maskMoney({thousands:"", decimal:'.'});
           $("#formCropIrr_irr_costDepreciationIrr").maskMoney('mask');
           
           $("#formCropIrr_irr_costRentedIrr").maskMoney({thousands:"", decimal:'.'});
           $("#formCropIrr_irr_costRentedIrr").maskMoney('mask');           
           
    };
            </script>
        </div>
        <div class="row" id="divListIrrForm"></div>
    </body>
</html>
