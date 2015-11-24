<%@ taglib prefix="s" uri="/struts-tags" %>
<s:form id="formProCon" action="addProductCon" cssClass="form-horizontal">
    <s:hidden name="prodCon"/>
    <s:hidden name="prod.idProCon"/>
    <div class="row">
        <div class="span5">
            <div class="control-group">
                <div class="controls radioSelect">
                    <s:radio
                        name="prod.targetsTypes.idTarTyp"
                        list="type_tar_typ" 
                        listKey="idTarTyp" 
                        listValue="nameTarTyp"            
                        headerKey="-1" 
                        headerValue="---"                                                                                
                        onclick="chargeValuesObjective('prod.targetsTypes.idTarTyp', 'divListPest', 'divListWee', 'divListDis');
                                  chargeValuesControls('/crop/comboControls.action?typeCrop=%{typeCrop}', 'idTarget', 'prod.targetsTypes.idTarTyp', 'typeCon', 'formCropCon_prod_controlsTypes_idConTyp', 'formCropCon_prod_chemicalsControls_idCheCon', 'formCropCon_prod_organicControls_idOrgCon', 'divMessage');
                                  hideInformationControls('divNewObjControlPes', 'divNewObjControlWee', 'divNewObjControlDis', 'divNewProCheCon', 'divNewProOrgCon');"
                    />
                </div>                         
            </div>                          
        </div>   
    </div>
    <% String classTarPet="hide"; %>
    <% String classTarDis="hide"; %>
    <% String classTarWee="hide"; %>
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
        <div class="span5">
            <div class="control-group">
                <label for="formCropCon_prod_pests_idPes" class="control-label req">
                    <s:property value="getText('select.targetpest.crop')" />:
                </label>
                <div class="controls">
                    <s:select
                        name="prod.pests.idPes"
                        list="type_pest_con" 
                        listKey="idPes" 
                        listValue="namePes"            
                        headerKey="-1" 
                        headerValue="---"
                        onchange="showOtherElement(this.value, 'divNewObjControlPes')"
                    />
                </div>                         
            </div>                          
        </div>   
        <% String classNewObjConPes="hide"; %>
        <s:set name="objConPes" value="prod.pests.idPes"/>
        <s:if test="%{#objConPes==1000000}">
            <% classNewObjConPes = "";%>
        </s:if> 
        <div class="<%= classNewObjConPes %>" id="divNewObjControlPes">
            <div class="span4" style="padding-left: 28px">
                <div class="control-group">
                    <label for="formCropCon_prod_otherPestProCon" class="control-label req">
                        <s:property value="getText('text.newtargetpest.crop')" />:
                    </label>
                    <div class="controls">
                        <s:textfield name="prod.otherPestProCon"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="<%= classTarWee %> row" id="divListWee">
        <div class="span5">
            <div class="control-group">
                <label for="formCropCon_prod_weeds_idWee" class="control-label req">
                    <s:property value="getText('select.targetweed.crop')" />:
                </label>
                <div class="controls">
                    <s:select
                        name="prod.weeds.idWee"
                        list="type_weeds_con" 
                        listKey="idWee" 
                        listValue="nameWee"            
                        headerKey="-1" 
                        headerValue="---"
                        onchange="showOtherElement(this.value, 'divNewObjControlWee')"
                    />
                </div>                         
            </div>                          
        </div>  
        <% String classNewObjConWee="hide"; %>
        <s:set name="objConWee" value="prod.weeds.idWee"/>
        <s:if test="%{#objConWee==1000000}">
            <% classNewObjConWee = "";%>
        </s:if> 
        <div class="<%= classNewObjConWee %>" id="divNewObjControlWee">
            <div class="span4" style="padding-left: 28px">
                <div class="control-group">
                    <label for="formCropCon_prod_otroWeedProCon" class="control-label req">
                        <s:property value="getText('text.newtargetweed.crop')" />:
                    </label>
                    <div class="controls">
                        <s:textfield name="prod.otroWeedProCon"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="<%= classTarDis %> row" id="divListDis">
        <div class="span5">
            <div class="control-group">
                <label for="formCropCon_prod_diseases_idDis" class="control-label req">
                    <s:property value="getText('select.targetdiseases.crop')" />:
                </label>
                <div class="controls">
                    <s:select
                        name="prod.diseases.idDis"
                        list="type_dis_con" 
                        listKey="idDis" 
                        listValue="nameDis"            
                        headerKey="-1" 
                        headerValue="---"
                        onchange="showOtherElement(this.value, 'divNewObjControlDis')"
                    />
                </div>                         
            </div>                          
        </div> 
        <% String classNewObjConDis="hide"; %>
        <s:set name="objConDis" value="prod.diseases.idDis"/>
        <s:if test="%{#objConDis==1000000}">
            <% classNewObjConDis = "";%>
        </s:if> 
        <div class="<%= classNewObjConDis %>" id="divNewObjControlDis">
            <div class="span4" style="padding-left: 28px">
                <div class="control-group">
                    <label for="formCropCon_prod_otherDiseaseProCon" class="control-label req">
                        <s:property value="getText('text.newtargetdiseases.crop')" />:
                    </label>
                    <div class="controls">
                        <s:textfield name="prod.otherDiseaseProCon"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span5">
            <div class="control-group">
                <label for="formCropCon_prod_controlsTypes_idConTyp" class="control-label req">
                    <s:property value="getText('select.controltype.crop')" />:
                </label>
                <div class="controls">
                    <s:select
                        name="prod.controlsTypes.idConTyp"
                        list="type_prod_typ" 
                        listKey="idConTyp" 
                        listValue="nameConType"            
                        headerKey="-1" 
                        headerValue="---"       
                        onchange="showTypeFertilizerControl('formCropCon_prod_controlsTypes_idConTyp', 'divOrganicCon', 'divChemicalCon', 'divMechanicCon', 'divMechanizedCon', 'divManualCon');
                                  chargeValuesControls('/crop/comboControls.action?typeCrop=%{typeCrop}', 'idTarget', 'prod.targetsTypes.idTarTyp', 'typeCon', 'formCropCon_prod_controlsTypes_idConTyp', 'formCropCon_prod_chemicalsControls_idCheCon', 'formCropCon_prod_organicControls_idOrgCon', 'divMessage');
                                  hideInformationControls('divNewObjControlPes', 'divNewObjControlWee', 'divNewObjControlDis', 'divNewProCheCon', 'divNewProOrgCon');"
                    />
                </div>                         
            </div>                          
        </div>   
    </div>                        
    <div id="divChemicalCon" class="hide">
        <div class="row">
            <div class="span5">
                <div class="control-group">
                    <label for="formCropCon_prod_chemicalsControls_idCheCon" class="control-label req">
                        <s:property value="getText('select.chemicalcontrol.crop')" />:
                    </label>
                    <div class="controls">
                        <s:select
                            name="prod.chemicalsControls.idCheCon"
                            list="type_prod_che_con" 
                            listKey="idCheCon" 
                            listValue="nameCheCon"            
                            headerKey="-1" 
                            headerValue="---"
                            onchange="showOtherElement(this.value, 'divNewProCheCon')"
                        />
                    </div>                         
                </div>                          
            </div> 
            <% String classNewProCheCon="hide"; %>
            <s:set name="chemCon" value="prod.chemicalsControls.idCheCon"/>
            <s:if test="%{#chemCon==1000000}">
                <% classNewProCheCon = "";%>
            </s:if> 
            <div class="<%= classNewProCheCon %>" id="divNewProCheCon">
                <div class="span4" style="padding-left: 28px">
                    <div class="control-group">
                        <label for="formCropCon_prod_otherChemicalProductProCon" class="control-label req">
                            <s:property value="getText('text.newchemicalcontrol.crop')" />:
                        </label>
                        <div class="controls">
                            <s:textfield name="prod.otherChemicalProductProCon"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>                                                    
    </div>                           
    <div id="divOrganicCon" class="hide">
        <div class="row">
            <div class="span5">
                <div class="control-group">
                    <label for="formCropCon_prod_organicControls_idOrgCon" class="control-label req">
                        <s:property value="getText('select.organiccontrol.crop')" />:
                    </label>
                    <div class="controls">
                        <s:select
                            name="prod.organicControls.idOrgCon"
                            list="type_prod_org_con" 
                            listKey="idOrgCon" 
                            listValue="nameOrgCon"            
                            headerKey="-1" 
                            headerValue="---"
                            onchange="showOtherElement(this.value, 'divNewProOrgCon')"
                        />
                    </div>                         
                </div>                          
            </div> 
            <% String classNewProOrgCon="hide"; %>
            <s:set name="orgCon" value="prod.organicControls.idOrgCon"/>
            <s:if test="%{#orgCon==1000000}">
                <% classNewProOrgCon = "";%>
            </s:if> 
            <div class="<%= classNewProOrgCon %>" id="divNewProOrgCon">
                <div class="span4" style="padding-left: 28px">
                    <div class="control-group">
                        <label for="formCropCon_prod_otherOrganicProductProCon" class="control-label req">
                            <s:property value="getText('text.neworganiccontrol.crop')" />:
                        </label>
                        <div class="controls">
                            <s:textfield name="prod.otherOrganicProductProCon"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="divMechanicCon" class="hide">                        
    </div>                
    <div id="divMechanizedCon" class="hide">
    </div>
    <div id="divManualCon" class="hide">
    </div>
    <div class="row">
        <div class="span5">
            <div class="control-group">
                <label for="formCropCon_prod_dosisProCon" class="control-label">
                    <s:property value="getText('text.dosechemicalcontrol.crop')" />:
                </label>
                <div class="controls">
                    <s:textfield name="prod.dosisProCon"/>
                </div>                         
            </div>                          
        </div> 
        <div class="span4" style="padding-left: 6px">
            <div class="control-group">
                <label for="formCropCon_prod_doseUnits" class="control-label">
                    <s:property value="getText('select.doseunitchecontrol.crop')" />:
                </label>
                <div class="controls">
                    <s:select
                        name="prod.doseUnits"
                        list="type_dose_units" 
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