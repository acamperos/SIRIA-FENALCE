<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<% Integer entTypeHarId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
<div id="divMessHarvest"></div>
<div class="panel-body">
    <s:form id="formCropHar" action="saveHarvest" cssClass="form-horizontal">
        <fieldset>
            <legend><s:property value="getText('title.formharvest.harvest')" /></legend>
            <div class="row">
                <div class="col-md-6">
                    <s:hidden name="idCrop"/>
                    <s:hidden name="typeCrop"/>
                    <%--<s:hidden name="lanSel"/>--%>
                    <s:hidden name="actExe"/>
                    <s:hidden name="harv.idHar"/>
                    <div class="form-group">
                        <label for="formCropHar_harv_dateHar" class="col-md-6 req">
                            <s:property value="getText('text.harvestdate.harvest')" />:
                        </label>
                        <div class="date controls col-md-6">
                            <s:date name="harv.dateHar" format="MM/dd/yyyy" var="dateTransform"/>
                            <s:textfield name="harv.dateHar" value="%{#dateTransform}" cssClass="form-control" readonly="true"/>
                            <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                            <span class="add-on"><i class="icon-calendar"></i></span>
                        </div>                          
                    </div>                          
                </div>       
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropHar_harv_harvestMethods_idHarMet" class="col-md-6 req">
                            <s:property value="getText('select.harvestmethods.harvest')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="harv.harvestMethods.idHarMet"
                                list="type_harv_meth" 
                                listKey="idHarMet" 
                                listValue="nameHarMet" 
                                cssClass="form-control"
                                headerKey="-1" 
                                headerValue="---" 
                                onclick="showCostMethodsHarvest('formCropHar_harv_harvestMethods_idHarMet', 'divcostmechanized', 'divcostmanual', 'divcostmanual3');"
                                />
                        </div> 
                    </div>                                        
                </div>          
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropHar_harv_resultingProducts_idResPro" class="col-md-6 req">
                             <s:property value="getText('select.resultingproducts.harvest')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="harv.resultingProducts.idResPro"
                                list="type_res_pro" 
                                listKey="idResPro" 
                                listValue="nameResPro" 
                                cssClass="form-control"
                                headerKey="-1" 
                                headerValue="---"
                                onchange="
                                changeOptionsHarvest('formCropHar_harv_resultingProducts_idResPro', 'divYield', 'divHumidity', 'divNumberSacks', 'harvNumberSacks', 'harvNumberBags', 'harvWeightAvg', 'harvWeightAvgBags');
                                "
                            />
                        </div>
                    </div>
                </div>            
            </div>
            <div class="row hideInfo" id="divYield">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropHar_harv_yieldHar" class="col-md-6 req">
                            <s:property value="getText('text.yieldhar.harvest')" /> 
                            <% if (coCode.equals("CO")) { %>
                                <button type="button" class="btn btn-initial"><b>(kg/ha)</b></button>:
                            <% } else if (coCode.equals("NI")) { %>
                                <button type="button" class="btn btn-initial"><b>(q/mz)</b></button>:
                            <% } %>
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="harv.yieldHar" maxlength="14" cssClass="form-control" />
                        </div>
                    </div>                                      
                </div>                          
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropHar_harv_productionHar" class="col-md-6">
                            <s:property value="getText('text.productionhar.harvest')" /> 
                            <% if (coCode.equals("CO")) { %>
                                <button type="button" class="btn btn-initial"><b>(Kg)</b></button>:
                            <% } else if (coCode.equals("NI")) { %>
                                <button type="button" class="btn btn-initial"><b>(Q)</b></button>:
                            <% } %>
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="harv.productionHar" maxlength="14" cssClass="form-control" />
                        </div>                          
                    </div>    
                </div>
            </div>
            <div class="row hideInfo" id="divHumidity">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropHar_harv_humidityPercentageHar" class="col-md-6 req">
                             <button type="button" class="btn btn-initial"><b>(%)</b></button> <s:property value="getText('text.humiditypercentage.harvest')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="harv.humidityPercentageHar" maxlength="14" cssClass="form-control" />
                        </div>                          
                    </div>                                          
                </div>       
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropHar_harv_storageHar" class="col-md-6">
                            <s:property value="getText('radio.storagehar.harvest')" />:
                        </label>
                        <div class="controls col-md-6 radioSelect">
                            <s:radio 
                                list="#{'true':'Si', 'false':'No'}" 
                                name="harv.storageHar"
                                onclick="showStorageHar('harv.storageHar', 'divCostStorage', 'divcostrented');"
                                />
                        </div>                         
                    </div>
                </div>
            </div>
            <div class="row hideInfo" id="divNumberSacks">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropHar_harv_numberSacksSow" id="harvNumberSacks" class="col-md-6 req">
                            <s:property value="getText('text.numbersacks.harvest')" /> <button type="button" class="btn btn-initial"><b>(ha)</b></button>:
                        </label>
                        <label for="formCropHar_harv_numberSacksSow" id="harvNumberBags" class="col-md-6 req">
                            <s:property value="getText('text.numberbags.harvest')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="harv.numberSacksSow" maxlength="14" cssClass="form-control" />
                        </div>                          
                    </div>                                          
                </div>       
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropHar_harv_weightAvgSacksSow" id="harvWeightAvg" class="col-md-6">
                            <s:property value="getText('text.weightavgsacks.harvest')" /> <button type="button" class="btn btn-initial"><b>(kg/bulto)</b></button>:
                        </label>
                        <label for="formCropHar_harv_weightAvgSacksSow" id="harvWeightAvgBags" class="col-md-6">
                            <s:property value="getText('text.weightavgbags.harvest')" />:
                        </label>
                        <div class="controls col-md-6 radioSelect">
                            <s:textfield name="harv.weightAvgSacksSow" maxlength="14" cssClass="form-control" />
                        </div>                         
                    </div>
                </div>
            </div>
            <s:if test="%{typeCrop==2}">
                <div class="form-group">
                    <label for="formCropHar_harv_loadHectareSow" class="col-md-3">
                        <s:property value="getText('text.loadhectare.harvest')" />: 
                    </label>
                    <div class="controls col-md-3">
                        <s:textfield name="harv.loadHectareSow" maxlength="14" cssClass="form-control" />
                    </div>					 
                </div>
            </s:if>



            <div class="form-group">
                <label for="formCropHar_harv_commentHar" class="col-md-3">
                    <s:property value="getText('text.commentofyield.harvest')" />: 
                </label>
                <div class="controls col-md-6">
                    <s:textarea rows="5" cssClass="col-md-6" name="harv.commentHar" class="form-control" ></s:textarea>
                </div>					 
            </div>	
                 <% String classCostHar = "hideInfo"; %>
                   <s:set name="costHar" value="costCrop"/>
                   <s:if test="%{#costHar==1}">
                       <% classCostHar = "";  %>
                   </s:if>  
           <div class="<%= classCostHar %>" >     
            <div id ="divcosthar" class="row"> 
                                                <div class="col-md-6" >
                                                    <div class="form-group">

                                                        <label for="formCropHar_harv_costSalepriceHar" class="col-md-6">
                                                            <s:property value="getText('text.hervestpvp.harvest')"  /> <button type="button" class="btn btn-initial"><b>(Tn/Ha)</b></button>:
                                                        </label>
                                                        <div class="controls col-md-6">
                                                            <s:textfield name="harv.costSalepriceHar" maxlength="14" cssClass="form-control" />
                                                        </div>                         
                                                    </div>                          
                                                </div> 
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="formCropHar_harv_costNamebuyerHar" class="col-md-6">
                                                            <s:property value="getText('text.hervestnamecliente.harvest')" />:
                                                        </label>
                                                        <div class="controls col-md-6">
                                                            <s:textfield name="harv.costNamebuyerHar" maxlength="80" cssClass="form-control" />
                                                        </div>                         
                                                    </div>        

                                                </div>

             </div>
             </div>     
            <script>
                changeOptionsHarvest('formCropHar_harv_resultingProducts_idResPro', 'divYield', 'divHumidity', 'divNumberSacks', 'harvNumberSacks', 'Numero de bulto (ha):', 'Numero de bolsas:', 'harvWeightAvg', 'Peso promedio de un bulto (kg/bulto):', 'Peso promedio de la bolsa:');
                $("#formCropHar_harv_dateHar").datepicker({dateFormat: 'mm/dd/yy'});
                $("#formCropHar_harv_dateHar").mask("99/99/9999", {placeholder: " "});
                $("#formCropHar_harv_productionHar").numeric({decimal: false, negative: false});            
                $("#formCropHar_harv_yieldHar").numeric({negative: false});
                $("#formCropHar_harv_humidityPercentageHar").numeric({negative: false});
                $("#formCropHar_harv_numberSacksSow").numeric({decimal: false, negative: false});
                $("#formCropHar_harv_weightAvgSacksSow").numeric({negative: false});
                $("#formCropHar_harv_loadHectareSow").numeric({negative: false});
                $("#formCropHar_harv_yieldHar").val(parsePointSeparated($("#formCropHar_harv_yieldHar").val())); 
                $("#formCropHar_harv_humidityPercentageHar").val(parsePointSeparated($("#formCropHar_harv_humidityPercentageHar").val())); 
    //            $("#formCropHar_harv_weightAvgSacksSow").val(parsePointSeparated($("#formCropHar_harv_weightAvgSacksSow").val())); 
    //            $("#formCropHar_harv_loadHectareSow").val(parsePointSeparated($("#formCropHar_harv_loadHectareSow").val())); 
                showCostMethodsHarvest('formCropHar_harv_harvestMethods_idHarMet', 'divcostmechanized', 'divcostmanual');
            </script>
        </fieldset>

       <fieldset class="<%= classCostHar %>">
            <legend><s:property value="getText('title.formharvestcost.harvest')" /></legend>
            <div class="row"> 
                 <div class="col-md-6" >
                                    <div class="form-group">
                                        <label for="formCropHar_harv_costPackingHar"  class="col-md-6">
                                            <s:property value="getText('text.hervestcostpacking.harvest')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="harv.costPackingHar" cssClass="form-control" maxlength="14"/>
                                        </div>                         
                                    </div>                          
               </div> 

                    <div class="col-md-6">
                        <div class="form-group">
                            <s:label for="formCropHar_harv_costTypeHar_idHarTyp" cssClass="col-md-6" value="%{getText('select.harvesttype.harvest')}:"></s:label>
                            <div class="controls col-md-6">
                                <s:select
                                    id="formCropHar_harv_costTypeHar_idHarTyp"
                                    name="harv.costTypeHar" 
                                    cssClass="form-control"
                                    value="harv.costTypeHar" 
                                    list="#{'0':'---','1':'Granel', '2':'Bulto'}" 
                                    onclick="showCostTypeHarvest('formCropHar_harv_costTypeHar_idHarTyp', 'divcostgranel', 'divcostbulto','divcostmanual3');"
                                />
                            </div>
                        </div> 
                    </div> 

            </div>           

                                            <div id ="divcostgranel" class="row"> 
                                                <div class="col-md-6" >
                                                    <div class="form-group">
                                                        <label for="formCropHar_harv_costTractorHar" class="col-md-6">
                                                            <s:property value="getText('text.hervestcosttractor.harvest')" />
                                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                                        </label>
                                                        <div class="controls col-md-6">
                                                            <s:textfield name="harv.costTractorHar" cssClass="form-control" maxlength="14"/>
                                                        </div>                         
                                                    </div>                          
                                                </div> 
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="formCropHar_harv_costGranaleroTrailerHar" class="col-md-6">
                                                            <s:property value="getText('text.hervestcosttrailer.harvest')" />
                                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                                        </label>
                                                        <div class="controls col-md-6">
                                                            <s:textfield name="harv.costGranaleroTrailerHar" cssClass="form-control" maxlength="14"/>
                                                        </div>                         
                                                    </div>        

                                                </div>

                                            </div>                

                                          <div id ="divcostbulto" class="row"> 
                                                <div class="col-md-6" >
                                                    <div class="form-group">
                                                        <label for="formCropHar_harv_costZorreoHar" class="col-md-6">
                                                            <s:property value="getText('text.hervestcostzorreo.harvest')" />
                                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                                        </label>
                                                        <div class="controls col-md-6">
                                                            <s:textfield name="harv.costZorreoHar" cssClass="form-control" maxlength="14"/>
                                                        </div>                         
                                                    </div>                          
                                                </div> 


                                            </div> 

                <div id ="divcostmechanized" class="row" >
                                          <div class="col-md-6" >
                                                <div class="form-group">
                                                    <label  for="formCropHar_harv_costCombineHar"  class="col-md-6">
                                                        <s:property value="getText('text.hervestcost.harvest')" />
                                                        <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                                    </label>
                                                    <div class="controls col-md-6">
                                                        <s:textfield name="harv.costCombineHar" cssClass="form-control" maxlength="14"/>
                                                    </div>                         
                                            </div>  
                                          </div>


                </div> 

                  <div id="divCostStorage" class="row" >      
                                                            <div class="col-md-6" >
                                                                <div class="form-group">
                                                                    <label for="formCropHar_harv_costStorageHar" class="col-md-6">
                                                                        <s:property value="getText('text.hervestcoststorage.harvest')" />
                                                                        <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                                                    </label>
                                                                    <div class="controls col-md-6">
                                                                        <s:textfield name="harv.costStorageHar" cssClass="form-control" maxlength="14"/>
                                                                    </div>                         
                                                                </div>        

                                                            </div>
                  </div>                                  


              <div id ="divcostmanual" >                                        
              <div id ="divcostmanual0" class="row"> 
                 <div class="col-md-6" >
                                    <div class="form-group">
                                        <label for="formCropHar_harv_costWorkforceHar" class="col-md-6">
                                            <s:property value="getText('text.hervestcostworkforce.harvest')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="harv.costWorkforceHar" cssClass="form-control" maxlength="14"/>
                                        </div>                         
                                    </div>                          
               </div> 
                 <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropHar_harv_costTransportWorkforceHar" class="col-md-6">
                                            <s:property value="getText('text.hervestcosttrasportsd.harvest')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="harv.costTransportWorkforceHar" cssClass="form-control" maxlength="14"/>
                                        </div>                         
                                    </div>        

                </div> 
            </div>
            <div id ="divcostmanual1" class="row"> 
                 <div class="col-md-6" >
                                    <div class="form-group">
                                        <label for="formCropHar_harv_costShellerHar" class="col-md-6">
                                            <s:property value="getText('text.hervestcostdesgranadora.harvest')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="harv.costShellerHar" cssClass="form-control" maxlength="14"/>
                                        </div>                         
                                    </div>                          
               </div> 
                 <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropHar_harv_costWorkforceShellerHar" class="col-md-6">
                                            <s:property value="getText('text.hervestcostdesgranadoraworkforce.harvest')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="harv.costWorkforceShellerHar" cssClass="form-control" maxlength="14"/>
                                        </div>                         
                                    </div>        

                </div> 
            </div>


           </div>        

               <div id ="divcostmanual3" class="row"> 
                 <div class="col-md-6" >
                                    <div class="form-group">
                                        <label for="formCropHar_harv_costCabuyaHar" class="col-md-6">
                                            <s:property value="getText('text.hervestcostcabuya.harvest')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="harv.costCabuyaHar" cssClass="form-control" maxlength="14"/>
                                        </div>                         
                                    </div>                          
               </div> 
                 <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formCropHar_harv_costTransportCollectioncenterHar" class="col-md-6">
                                            <s:property value="getText('text.hervestcosttransport.harvest')" />
                                            <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield name="harv.costTransportCollectioncenterHar" cssClass="form-control" maxlength="14"/>
                                        </div>                         
                                    </div>        

                </div> 
            </div>   
         </fieldset>                                    
            <% if (entTypeHarId!=3) { %>    
                <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
            <% } %>                              

       <script>       

           $("#formCropHar_harv_costSalepriceHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costPackingHar").maskMoney({prefix: ' $'});       
           $("#formCropHar_harv_costTractorHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costGranaleroTrailerHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costZorreoHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costWorkforceHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costTransportWorkforceHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costShellerHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costWorkforceShellerHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costCabuyaHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costTransportCollectioncenterHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costStorageHar").maskMoney({prefix: ' $'});
           $("#formCropHar_harv_costCombineHar").maskMoney({prefix: ' $'});           

       </script>

        <div style="margin-bottom: 15px" id="divBtHarvest">
            <% String actExeHar   = String.valueOf(request.getAttribute("actExe")); %>
            <% if ((actExeHar=="create" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExeHar=="modify" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
                <% if (entTypeHarId!=3) { %>
                    <sj:submit type="button" cssClass="btn btn-initial btn-lg" onclick="removeMaskHar();searchDecimalNumber('formCropHar'); addMessageProcess()" targets="divMessage" onCompleteTopics="completeHarvest" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.saveharvest.harvest')" /></sj:submit>
                <% } %>
            <% } %>
        </div>
    </s:form>	
</div>
<script>
    $.subscribe('completeHarvest', function(event, data) {      
        $("#formCropHar_harv_costSalepriceHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costPackingHar").maskMoney({prefix: ' $'});       
        $("#formCropHar_harv_costTractorHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costGranaleroTrailerHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costZorreoHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costWorkforceHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costTransportWorkforceHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costShellerHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costWorkforceShellerHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costCabuyaHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costTransportCollectioncenterHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costStorageHar").maskMoney({prefix: ' $'});
        $("#formCropHar_harv_costCombineHar").maskMoney({prefix: ' $'});    
        if(event.handled !== true){                
            completeFormCrop('', 'formCropHar', 'divMessHarvest', event.originalEvent.request.responseText);
            showTimeline("/crop/viewInfoTime.action?idCrop="+$("#formCropHar_idCrop").val(), "divInfoTimeline", "timeline");
            event.handled = true;
        }    
    });
    showCostTypeHarvest('formCropHar_harv_costTypeHar_idHarTyp', 'divcostgranel', 'divcostbulto','divcostmanual3');
    showCostMethodsHarvest('formCropHar_harv_harvestMethods_idHarMet', 'divcostmechanized', 'divcostmanual','divcostmanual3');
    showStorageHar('harv.storageHar', 'divCostStorage', 'divcostrented');

    function removeMaskHar() {       
                    $("#formCropHar_harv_costSalepriceHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costSalepriceHar").maskMoney('mask');

                    $("#formCropHar_harv_costPackingHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costPackingHar").maskMoney('mask');
                    
                    $("#formCropHar_harv_costTractorHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costTractorHar").maskMoney('mask');

                    $("#formCropHar_harv_costGranaleroTrailerHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costGranaleroTrailerHar").maskMoney('mask');
                    
                    $("#formCropHar_harv_costZorreoHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costZorreoHar").maskMoney('mask');

                    $("#formCropHar_harv_costWorkforceHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costWorkforceHar").maskMoney('mask');
                    
                    $("#formCropHar_harv_costTransportWorkforceHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costTransportWorkforceHar").maskMoney('mask');

                    $("#formCropHar_harv_costShellerHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costShellerHar").maskMoney('mask');
                    
                    $("#formCropHar_harv_costWorkforceShellerHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costWorkforceShellerHar").maskMoney('mask');
                    
                    $("#formCropHar_harv_costCabuyaHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costCabuyaHar").maskMoney('mask');
                    
                    $("#formCropHar_harv_costTransportCollectioncenterHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costTransportCollectioncenterHar").maskMoney('mask');
                    
                    $("#formCropHar_harv_costStorageHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costStorageHar").maskMoney('mask');
                    
                    $("#formCropHar_harv_costCombineHar").maskMoney({thousands:"", decimal:'.'});
                    $("#formCropHar_harv_costCombineHar").maskMoney('mask');

                }
</script>
