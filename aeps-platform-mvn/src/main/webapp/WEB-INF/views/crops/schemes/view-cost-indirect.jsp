<script type="text/javascript" src="/scripts/js/jquery/jquery.maskMoney.js"></script>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<% Integer entTypeCostId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
<div id="divMessCost"></div>
<s:form id="formCropCos" action="saveCost" cssClass="form-horizontal">
   
        
   <fieldset>
        <legend><s:property value="getText('title.formcostinirect.costindirect')" /> </legend>
        <div class="row"> 
             <div class="span5" >
                <s:hidden name="idCrop"/>
                <s:hidden name="typeCrop"/>
                <s:hidden name="actExe"/>
                <s:hidden name="costo.idCostIndPro"/>
                                <div class="control-group">
                                    <label id="formCropCost_costo_costVigilantPro" for="formCropCost_cost_costVigilantPro"  class="control-label">
                                       <s:property value="getText('title.formcostinirectvigilante.costindirect')" />
                                       <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                    </label>
                                    <div class="controls">
                                        <s:textfield name="costo.costVigilantPro" maxlength="14"/>
                                    </div>                         
                                </div>                          
           </div> 
                                    
                <div class="span5" style="padding-left: 28px">
                                    <label for="formCropCost_costo_costRentPro" class="control-label">
                                       <s:property value="getText('title.formcostinirectarr.costindirect')" />
                                       <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                    </label>
                                    <div class="controls">
                                       <s:textfield name="costo.costRentPro" maxlength="14"/>
                                    </div>  
                                     
                    </div> 
             
        </div>              
                                        <div id ="divcostgranel" class="row"> 
                                            <div class="span5" >
                                                <div class="control-group">
                                                    <label for="formCropCost_costo_costTechnicalAssistancePro" class="control-label">
                                                       <s:property value="getText('title.formcostinirectasistec.costindirect')" />
                                                       <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                                    </label>
                                                    <div class="controls">
                                                        <s:textfield name="costo.costTechnicalAssistancePro" maxlength="14"/>
                                                    </div>                         
                                                </div>                          
                                            </div> 
                                            <div class="span5" style="padding-left: 28px">
                                                <div class="control-group">
                                                    <label for="formCropCost_costo_costImpuestoPro" class="control-label">
                                                       <s:property value="getText('title.formcostinidirectcostimp.costindirect')" />
                                                       <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                                    </label>
                                                    <div class="controls">
                                                        <s:textfield name="costo.costImpuestoPro" maxlength="14"/>
                                                    </div>                         
                                                </div>        

                                            </div>

                                        </div>                
                                   
                                                    
                                        
            <div id ="divcostmechanized" class="row" >
                                      <div class="span5" >
                                            <div class="control-group">
                                                <label for="formCropCost_costo_costAdministrationPro"class="control-label">
                                                   <s:property value="getText('title.formcostinidirectcostadmin.costindirect')" />
                                                   <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                                </label>
                                                <div class="controls">
                                                   <s:textfield name="costo.costAdministrationPro" maxlength="14"/>
                                                </div>                         
                                        </div>  
                                      </div>
                                                    <div id="divCostStorage" >      
                                                        <div class="span5" style="padding-left: 28px">
                                                            <div class="control-group">
                                                                <label for="formCropCost_costo_costOthersPro" class="control-label">
                                                                  <s:property value="getText('title.formcostinidirectothercost.costindirect')" />
                                                                  <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                                                </label>
                                                                <div class="controls">
                                                                    <s:textfield name="costo.costOthersPro" maxlength="14"/>
                                                                </div>                         
                                                            </div>        

                                                        </div>
                                                    </div>

            </div> 
          <div id ="divcostmanual" >                                        
          <div id ="divcostmanual0" class="row"> 
             <div class="span5" >
                                <div class="control-group">
                                    <label for="formCropCost_costo_costInterestsPro"  class="control-label">
                                       <s:property value="getText('title.formcostinidirectintereses.costindirect')" />
                                       <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                    </label>
                                    <div class="controls">
                                        <s:textfield name="costo.costInterestsPro" maxlength="14"/>
                                    </div>                         
                                </div>                          
            </div> 
            
            </div>
                                   
        </div>        
                                                               
         
                                  
   
            <p class="warnField reqBef"><s:property value="getText('label.requirefields')" /></p>
            <script>
                                   
               $("#formCropCos_costo_costVigilantPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costRentPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costTechnicalAssistancePro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costImpuestoPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costAdministrationPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costOthersPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costInterestsPro").maskMoney({prefix: '$'});
               
            </script>                 
   </fieldset>      
        
     <div style="margin-bottom: 15px" id="divBtHarvest">
        <% String actExeHar   = String.valueOf(request.getAttribute("actExe")); %>
        <% if ((actExeHar=="create" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExeHar=="modify" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
            <% if (entTypeCostId!=3) { %>
                <sj:submit type="button" cssClass="btn btn-initial btn-large" onclick="removeMaskCost();searchDecimalNumber('formCropCos'); addMessageProcess()" targets="divMessage" onCompleteTopics="completeCos" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.savecost.costindirect')" /></sj:submit>
            <% } %>
        <% } %>
    </div>
   
</s:form>	
<script>
    $.subscribe('completeCos', function(event, data) {
        
               $("#formCropCos_costo_costVigilantPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costRentPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costTechnicalAssistancePro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costImpuestoPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costAdministrationPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costOthersPro").maskMoney({prefix: '$'});
               $("#formCropCos_costo_costInterestsPro").maskMoney({prefix: '$'});
        completeFormCrop('', 'formCropCos', 'divMessCost', event.originalEvent.request.responseText);
    });
    //showCostTypeHarvest('formCropHar_harv_harvestType_idHarTyp', 'divcostgranel', 'divcostbulto','divcostmanual3');
    //showCostMethodsHarvest('formCropHar_harv_harvestMethods_idHarMet', 'divcostmechanized', 'divcostmanual','divcostmanual3');
    //showStorageHar('harv.storageHar', 'divCostStorage', 'divcostrented');
$(function(){ $("#formCropCost_costo_costVigilantPro").maskMoney({prefix: '$'});
});

    function removeMaskCost() {       
                    $("#formCropCos_costo_costVigilantPro").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropCos_costo_costVigilantPro").maskMoney('mask');

                    $("#formCropCos_costo_costRentPro").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropCos_costo_costRentPro").maskMoney('mask');
                    
                    $("#formCropCos_costo_costTechnicalAssistancePro").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropCos_costo_costTechnicalAssistancePro").maskMoney('mask');

                    $("#formCropCos_costo_costImpuestoPro").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropCos_costo_costImpuestoPro").maskMoney('mask');
                    
                    $("#formCropCos_costo_costOthersPro").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropCos_costo_costOthersPro").maskMoney('mask');

                    $("#formCropCos_costo_costInterestsPro").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropCos_costo_costInterestsPro").maskMoney('mask');
                    
                    $("#formCropCos_costo_costAdministrationPro").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropCos_costo_costAdministrationPro").maskMoney('mask');
                    
    }
   
</script>