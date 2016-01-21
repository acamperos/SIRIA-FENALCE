<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<s:form id="formProCon" action="addControlAdditional" cssClass="form-horizontal">
    <%--<s:hidden name="prodCon"/>--%>
    <s:hidden name="idCrop"/>
    <s:hidden name="prod.controls.idCon"/>
    <s:hidden name="numRows"/>
    <s:hidden name="actExe"/>
    <s:hidden name="position"/>
    <s:hidden name="prod.idProCon"/>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="formProCon_prod_targetsTypes_idTarTyp" class="col-md-6 req">
                    <s:property value="getText('radio.targettype.control')" />:
                </label>
                <div class="controls col-md-6 radioSelect">
                    <s:radio
                        name="prod.targetsTypes.idTarTyp"
                        list="type_tar_typ" 
                        listKey="idTarTyp" 
                        listValue="nameTarTyp"            
                        headerKey="-1" 
                        cssClass="radio"
                        headerValue="---"                                                                                
                        onclick="chargeValuesObjective('prod.targetsTypes.idTarTyp', 'divListPest', 'divListWee', 'divListDis');
                                  chargeValuesControls('/crop/comboControls.action?typeCrop=%{typeCrop}', 'idTarget', 'prod.targetsTypes.idTarTyp', 'typeCon', 'formProCon_prod_controlsTypes_idConTyp', 'formProCon_prod_chemicalsControls_idCheCon', 'formProCon_prod_organicControls_idOrgCon', 'divMessage');
                                  hideInformationControls('divNewObjControlPes', 'divNewObjControlWee', 'divNewObjControlDis', 'divNewProCheCon', 'divNewProOrgCon');"
                    />
                </div>                         
            </div>                          
        </div>   
    </div>
    <% String classTarPet="hideInfo"; %>
    <% String classTarDis="hideInfo"; %>
    <% String classTarWee="hideInfo"; %>
    <s:set name="idTarget" value="prod.targetsTypes.idTarTyp"/>
    <s:if test="%{#idTarget==1}">
        <% classTarPet = "";%>
    </s:if>
    <s:elseif test="%{#idTarget==2}">
        <% classTarWee = "";%>
    </s:elseif>
    <s:elseif test="%{#idTarget==3}">
        <% classTarDis = "";%>
    </s:elseif>

    <div class="<%= classTarPet %> row" id="divListPest">
        <div class="col-md-12">
            <div class="form-group">
                <label for="formProCon_prod_pests_idPes" class="col-md-3 req">
                    <s:property value="getText('select.targetpest.crop')" />:
                </label>
                <div class="controls col-md-9">
                    <s:select
                        name="prod.pests.idPes"
                        list="type_pest_con" 
                        cssClass="form-control"
                        listKey="idPes" 
                        listValue="namePes"            
                        headerKey="-1" 
                        headerValue="---"
                        onchange="showOtherElement(this.value, 'divNewObjControlPes')"
                    />
                </div>                         
            </div>                          
        </div>   
        <% String classNewObjConPes="hideInfo"; %>
        <s:set name="objConPes" value="prod.pests.idPes"/>
        <s:if test="%{#objConPes==1000000}">
            <% classNewObjConPes = "";%>
        </s:if> 
        <div class="<%= classNewObjConPes %>" id="divNewObjControlPes">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="formProCon_prod_otherPestProCon" class="col-md-6 req">
                        <s:property value="getText('text.newtargetpest.crop')" />:
                    </label>
                    <div class="controls col-md-6">
                        <s:textfield name="prod.otherPestProCon" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="<%= classTarWee %> row" id="divListWee">
        <div class="col-md-6">
            <div class="form-group">
                <label for="formProCon_prod_weeds_idWee" class="col-md-6 req">
                    <s:property value="getText('select.targetweed.crop')" />:
                </label>
                <div class="controls col-md-6">
                    <s:select
                        name="prod.weeds.idWee"
                        list="type_weeds_con" 
                        cssClass="form-control"
                        listKey="idWee" 
                        listValue="nameWee"            
                        headerKey="-1" 
                        headerValue="---"
                        onchange="showOtherElement(this.value, 'divNewObjControlWee')"
                    />
                </div>                         
            </div>                          
        </div>  
        <% String classNewObjConWee="hideInfo"; %>
        <s:set name="objConWee" value="prod.weeds.idWee"/>
        <s:if test="%{#objConWee==1000000}">
            <% classNewObjConWee = "";%>
        </s:if> 
        <div class="<%= classNewObjConWee %>" id="divNewObjControlWee">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="formProCon_prod_otroWeedProCon" class="col-md-6 req">
                        <s:property value="getText('text.newtargetweed.crop')" />:
                    </label>
                    <div class="controls col-md-6">
                        <s:textfield name="prod.otroWeedProCon" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="<%= classTarDis %> row" id="divListDis">
        <div class="col-md-6">
            <div class="form-group">
                <label for="formProCon_prod_diseases_idDis" class="col-md-6 req">
                    <s:property value="getText('select.targetdiseases.crop')" />:
                </label>
                <div class="controls col-md-6">
                    <s:select
                        name="prod.diseases.idDis"
                        list="type_dis_con" 
                        cssClass="form-control"
                        listKey="idDis" 
                        listValue="nameDis"            
                        headerKey="-1" 
                        headerValue="---"
                        onchange="showOtherElement(this.value, 'divNewObjControlDis')"
                    />
                </div>                         
            </div>                          
        </div> 
        <% String classNewObjConDis="hideInfo"; %>
        <s:set name="objConDis" value="prod.diseases.idDis"/>
        <s:if test="%{#objConDis==1000000}">
            <% classNewObjConDis = "";%>
        </s:if> 
        <div class="<%= classNewObjConDis %>" id="divNewObjControlDis">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="formProCon_prod_otherDiseaseProCon" class="col-md-6 req">
                        <s:property value="getText('text.newtargetdiseases.crop')" />:
                    </label>
                    <div class="controls col-md-6">
                        <s:textfield name="prod.otherDiseaseProCon" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="formProCon_prod_controlsTypes_idConTyp" class="col-md-6 req">
                    <s:property value="getText('select.controltype.crop')" />:
                </label>
                <div class="controls col-md-6">
                    <s:select
                        name="prod.controlsTypes.idConTyp"
                        list="type_con_typ" 
                        cssClass="form-control"
                        listKey="idConTyp" 
                        listValue="nameConType"            
                        headerKey="-1" 
                        headerValue="---"       
                        onchange="showTypeFertilizerControl('formProCon_prod_controlsTypes_idConTyp', 'divOrganicCon', 'divChemicalCon', 'divMechanicCon', 'divMechanizedCon', 'divManualCon');
                                  chargeValuesControls('/crop/comboControls.action?typeCrop=%{typeCrop}', 'idTarget', 'prod.targetsTypes.idTarTyp', 'typeCon', 'formProCon_prod_controlsTypes_idConTyp', 'formProCon_prod_chemicalsControls_idCheCon', 'formProCon_prod_organicControls_idOrgCon', 'divMessage');
                                  hideInformationControls('divNewObjControlPes', 'divNewObjControlWee', 'divNewObjControlDis', 'divNewProCheCon', 'divNewProOrgCon');"
                    />
                </div>                         
            </div>                          
        </div>   
    </div>                        
    <div id="divChemicalCon" class="hideInfo">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="formProCon_prod_chemicalsControls_idCheCon" class="col-md-6 req">
                        <s:property value="getText('select.chemicalcontrol.crop')" />:
                    </label>
                    <div class="controls col-md-6">
                        <s:select
                            name="prod.chemicalsControls.idCheCon"
                            list="type_prod_che_con" 
                            cssClass="form-control"
                            listKey="idCheCon" 
                            listValue="nameCheCon"            
                            headerKey="-1" 
                            headerValue="---"
                            onchange="showOtherElement(this.value, 'divNewProCheCon')"
                        />
                    </div>                         
                </div>                          
            </div> 
            <% String classNewProCheCon="hideInfo"; %>
            <s:set name="chemCon" value="prod.chemicalsControls.idCheCon"/>
            <s:if test="%{#chemCon==1000000}">
                <% classNewProCheCon = "";%>
            </s:if> 
            <div class="<%= classNewProCheCon %>" id="divNewProCheCon">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formProCon_prod_otherChemicalProductProCon" class="col-md-6req">
                            <s:property value="getText('text.newchemicalcontrol.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="prod.otherChemicalProductProCon" cssClass="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>                                                    
    </div>                           
    <div id="divOrganicCon" class="hideInfo">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="formProCon_prod_organicControls_idOrgCon" class="col-md-6 req">
                        <s:property value="getText('select.organiccontrol.crop')" />:
                    </label>
                    <div class="controls col-md-6">
                        <s:select
                            name="prod.organicControls.idOrgCon"
                            list="type_prod_org_con" 
                            cssClass="form-control"
                            listKey="idOrgCon" 
                            listValue="nameOrgCon"            
                            headerKey="-1" 
                            headerValue="---"
                            onchange="showOtherElement(this.value, 'divNewProOrgCon')"
                        />
                    </div>                         
                </div>                          
            </div> 
            <% String classNewProOrgCon="hideInfo"; %>
            <s:set name="orgCon" value="prod.organicControls.idOrgCon"/>
            <s:if test="%{#orgCon==1000000}">
                <% classNewProOrgCon = "";%>
            </s:if> 
            <div class="<%= classNewProOrgCon %>" id="divNewProOrgCon">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formProCon_prod_otherOrganicProductProCon" class="col-md-6 req">
                            <s:property value="getText('text.neworganiccontrol.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="prod.otherOrganicProductProCon" cssClass="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="divMechanicCon" class="hideInfo">                        
    </div>                
    <div id="divMechanizedCon" class="hideInfo">
    </div>
    <div id="divManualCon" class="hideInfo">
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="formProCon_prod_dosisProCon" class="col-md-6 req">
                    <s:property value="getText('text.dosechemicalcontrol.crop')" />:
                </label>
                <div class="controls col-md-6">
                    <s:textfield name="prod.dosisProCon" cssClass="form-control"/>
                </div>                         
            </div>                          
        </div> 
        <div class="col-md-6">
            <div class="form-group">
                <label for="formProCon_prod_doseUnits_idDosUni" class="col-md-6 req">
                    <s:property value="getText('select.doseunitchecontrol.crop')" />:
                </label>
                <div class="controls col-md-6">
                    <s:select
                        name="prod.doseUnits.idDosUni"
                        list="type_dose_units" 
                        cssClass="form-control"
                        listKey="idDosUni" 
                        listValue="nameDosUni"            
                        headerKey="-1" 
                        headerValue="---"
                    />
                </div>
            </div>
        </div>
    </div>    
</s:form>
<div id="divBtCon">
    <s:if test="%{actExe=='temp'}">
        <button class="btn btn-initial btn-lg" onclick="removeMaskControls();  searchDecimalNumber('formProCon'); changeAdditionalControl('../crop/addControlAdditional.action', 'formProCon', 'RowAddit_${position}', 'tbControl', 'divConForm', 'divListConForm');"><i class="icon-save"></i>  <s:property value="getText('button.controlsave.crop')" /></button>
    </s:if>
    <s:else>
        <button class="btn btn-initial btn-lg" onclick="removeMaskControls();  searchDecimalNumber('formProCon'); addAdditionalControl('../crop/addControlAdditional.action', 'formProCon', 'tableProduct', 'tbControl', 'divConForm', 'divListConForm');"><i class="icon-save"></i>  <s:property value="getText('button.controlsave.crop')" /></button>
    </s:else>
    <button class="btn btn-default btn-lg" onclick="resetForm('formProCon'); toggleAndClean('divConForm', 'divListConForm')"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
</div>
<%--<sj:submit type="button" cssClass="btn btn-initial btn-lg" onclick="removeMaskControls();searchDecimalNumber('formProCon');" targets="tableProduct" onCompleteTopics="completeConAdd" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.controlsave.crop')" /></sj:submit>--%>
<script>
    $("#formProCon_prod_dosisProCon").numeric({negative: false });
    $("#formProCon_prod_dosisProCon").val(parsePointSeparated($("#formProCon_prod_dosisProCon").val()));
    showTypeFertilizerControl('formProCon_prod_controlsTypes_idConTyp', 'divOrganicCon', 'divChemicalCon', 'divMechanicCon', 'divMechanizedCon', 'divManualCon');
    
    $.subscribe('completeConAdd', function(event, data) {
        toggleAndClean('divConForm', 'divListConForm');
//        if (event.handled !== true) {
//            setTimeout(function() {
//                toggleAndClean('divConForm', 'divListConForm');
//            }, 2000);
//            event.handled = true;
//        }
    });     
</script>