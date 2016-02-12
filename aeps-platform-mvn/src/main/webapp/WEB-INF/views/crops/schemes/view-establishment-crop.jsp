<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<% Integer entTypeSowId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
<div id="divMessSowing"></div>
<div class="panel-body">
    <s:form id="formCropSow" action="saveSowing" cssClass="form-horizontal">
        <% if (coCode.equals("CO")) { %>
            <div id="divListRes">
                <%@ include file="../residuals/info-residuals.jsp" %>            
            </div>
        <% } %>
        <div id="divListPrep">
            <%@ include file="../preparations/info-preparations.jsp" %>            
        </div>
        <% String classCostSow = "hideInfo"; %>  
        <s:set name="costSow" value="costCrop"/>
        <s:if test="%{#costSow==1}">
            <% classCostSow = "";  %>
        </s:if> 
        <hr class="divider-inner-separator">
        <fieldset>
            <legend><s:property value="getText('title.formsowing.crop')" /></legend>    
            <div class="row">
                <div class="col-md-6">
                    <s:hidden name="idCrop"/>
                    <s:hidden name="typeCrop"/>
                    <s:hidden name="actExe"/>
                    <s:hidden name="sowing.idSow"/>
                    <%--<s:hidden name="lanSel"/>--%>
                    <div class="form-group">
                        <label for="formCropSow_sowing_dateSow" class="col-md-6 req">
                            <s:property value="getText('text.sowdate.crop')" />:
                        </label>
                        <div class="date controls col-md-6">
                            <s:date name="sowing.dateSow" format="MM/dd/yyyy" var="dateTransformDateSow"/>
                            <s:textfield name="sowing.dateSow" cssClass="form-control" value="%{#dateTransformDateSow}" readonly="true"/>
                            <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                            <span class="add-on"><i class="icon-calendar"></i></span>
                        </div>                          
                    </div>                          
                </div>                          
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_sowingTypes_idSowTyp" class="col-md-6 req">
                            <s:property value="getText('select.sowmethod.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="sowing.sowingTypes.idSowTyp"
                                list="type_sow_types" 
                                cssClass="form-control"
                                listKey="idSowTyp" 
                                listValue="nameSowTyp"            
                                headerKey="-1" 
                                headerValue="---" />
                        </div> 
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_event_expected_production_pro_eve" class="col-md-6">
                            <s:property value="getText('text.bestyield.crop')" /> 
                            <% if (coCode.equals("CO")) { %>
                            <button type="button" class="btn btn-initial"><b>(kg/ha)</b></button>:
                            <% } else if (coCode.equals("NI")) { %>
                            <button type="button" class="btn btn-initial"><b>(q/mz)</b></button>:
                            <% } %>
                            <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.bestyield.crop')" />." data-title="<s:property value="getText('help.bestyield.crop')" />" data-placement="right" data-trigger="hover"></i>
                        </label>
                        <div class="controls col-md-6">
                            <s:number name="event.expectedProductionProEve" maximumFractionDigits="9" type="number" var="performanceCrop" />
                            <s:textfield name="event.expectedProductionProEve" type="number" cssClass="form-control" value="%{#performanceCrop}"/>
                        </div>                  
                    </div>                          
                </div>                          
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_event_drainingProEve" class="col-md-6">
                            <s:property value="getText('radio.drainparcel.crop')" />:
                        </label>
                        <div class="controls col-md-6 radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="event.drainingProEve" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_seedsNumberSow" class="col-md-6 req">
                            <% if (typeCrop == 1) { %>
                            <s:property value="getText('text.kgseedha.crop')" />:
                            <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.kgseedha.crop')" />." data-title="<s:property value="getText('help.kgseedha.crop')" />" data-placement="right" data-trigger="hover"></i> 
                            <% } else if (typeCrop == 2) { %>
                            <s:property value="getText('text.seednumber.crop')" />:
                            <% } else if (typeCrop == 4) { %>
                            <s:property value="getText('text.seednumberrice.crop')" /><button type="button" class="btn btn-initial"><b>(q/mz)</b></button>:
                            <% }%>                        
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="sowing.seedsNumberSow" type="number" cssClass="form-control" />
                        </div>                          
                    </div>                          

                </div>   


                <div class="<%= classCostSow%>">       
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="formCropSow_sowing_costSeedSow" class="col-md-6">
                                <s:property value="getText('text.sowcost.crop')" />
                                <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> 
                                :
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield name="sowing.costSeedSow" type="number" cssClass="form-control" maxlength="14"/>
                            </div>                         
                        </div>                          
                    </div> 
                </div>           

            </div>


            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_treatedSeedsSow" class="col-md-6 req">
                            <s:property value="getText('radio.treatmentseed.crop')" />:
                        </label>
                        <div class="controls col-md-6 radioSelect">
                            <s:radio list="#{'true':'Si', 'false':'No'}" name="sowing.treatedSeedsSow" onclick="showProductUse(this.value, 'divNewProductUse');" />
                        </div>
                    </div>
                </div>
            </div>
            <% String classSowTre = "hideInfo"; %>
            <s:set name="treatedSeeds" value="sowing.treatedSeedsSow"/>
            <s:if test="%{#treatedSeeds==true}">
                <% classSowTre = "";%>
            </s:if>                     
            <div class="<%= classSowTre%>" id="divNewProductUse">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="formCropSow_sowing_chemicalsSowing_idCheSow" class="col-md-6">
                                <s:property value="getText('select.productused.crop')" />:
                            </label>
                            <div class="controls col-md-6">
                                <s:select
                                    name="sowing.chemicalsSowing.idCheSow"
                                    list="type_chem_sow" 
                                    listKey="idCheSow" 
                                    cssClass="form-control"
                                    listValue="nameCheSow"            
                                    headerKey="-1" 
                                    headerValue="---"
                                    />
                            </div>                         
                        </div>                          
                    </div>      
                    <% String classProSow = "hideInfo"; %>
                    <s:set name="chemicalSowing" value="sowing.chemicalsSowing.idCheSow"/>
                    <s:if test="%{#chemicalSowing==1000000}">
                        <% classProSow = "";%>
                    </s:if>
                    <div class="col-md-6 <%= classProSow%>" id="divNewProductSowing">
                        <div class="form-group">
                            <label for="formCropSow_sowing_otherChemicalUsedSow" class="col-md-6">
                                <s:property value="getText('text.newprodused.crop')" />:
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield name="sowing.otherChemicalUsedSow" cssClass="form-control" />
                            </div>
                        </div>
                    </div>

                </div>           
            </div>


            <% if (coCode.equals("CO")) { %>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_furrowsDistanceSow" class="col-md-6 req">
                            <s:property value="getText('text.furrowdistance.crop')" /> <button type="button" class="btn btn-initial"><b>(m)</b></button>:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="sowing.furrowsDistanceSow" type="number" cssClass="form-control"/>
                        </div>                         
                    </div>                          
                </div>                          
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_sitesDistanceSow" class="col-md-6 req">
                            <s:property value="getText('text.sitesdistance.crop')" /> <button type="button" class="btn btn-initial"><b>(m)</b></button>:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="sowing.sitesDistanceSow" type="number" cssClass="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
            <% if (typeCrop == 1) { %>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_maize_seedsNumberSiteMai" class="col-md-6 req">
                            <s:property value="getText('text.seednumbersite.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="maize.seedsNumberSiteMai" type="number" cssClass="form-control"/>
                        </div>                         
                    </div>                          
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_genotypesSowing_idGenSow" class="col-md-6 req">
                            <s:property value="getText('select.genotypesow.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="sowing.genotypesSowing.idGenSow"
                                list="type_genotypes_sow" 
                                cssClass="form-control"
                                listKey="idGenSow" 
                                listValue="nameGenSow"            
                                headerKey="-1" 
                                headerValue="---"
                                />
                        </div>                         
                    </div>                          
                </div>                          
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_maize_seedsColors_idSeeCol" class="col-md-6 req">
                            <s:property value="getText('select.seedcolor.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="maize.seedsColors.idSeeCol"
                                list="type_seed_color" 
                                listKey="idSeeCol" 
                                listValue="colorSeeCol"     
                                cssClass="form-control"
                                headerKey="-1" 
                                headerValue="---"
                                onchange="chargeValues('/crop/comboGetCol.action?typeCrop=%{typeCrop}', 'idColor', this.value, 'formCropSow_sowing_genotypes_idGen', 'divMessage')"
                                />
                        </div>
                    </div>
                </div>
            </div>            
            <% } else if (typeCrop == 2) { %>            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_beans_seedsNumberSiteBea" class="col-md-6 req">
                            <s:property value="getText('text.seednumbersite.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="beans.seedsNumberSiteBea" type="number" cssClass="form-control"/>
                        </div>                         
                    </div>                          
                </div>    
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_seedsOrigins_idSeeOri" class="col-md-6 req">
                            <s:property value="getText('select.seedorigin.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="sowing.seedsOrigins.idSeeOri"
                                list="type_seed_org" 
                                cssClass="form-control"
                                listKey="idSeeOri" 
                                listValue="nameSeeOri"            
                                headerKey="-1" 
                                headerValue="---"
                                />
                        </div>                         
                    </div>                          
                </div>             
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_beans_seedsInoculations_idSeeIno" class="col-md-6">
                            <s:property value="getText('select.seedinoculation.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="beans.seedsInoculations.idSeeIno"
                                list="type_seed_in" 
                                cssClass="form-control"
                                listKey="idSeeIno" 
                                listValue="nameSeeIno"            
                                headerKey="-1" 
                                headerValue="---"
                                />
                        </div>
                    </div>                         
                </div>        
                <% String classInoculation = "hideInfo"; %>
                <s:set name="seedInoculation" value="beans.seedsInoculations.idSeeIno"/>
                <s:if test="%{#seedInoculation==1000000}">
                    <% //onchange="showOtherElement(this.value, 'divNewInoculationSeed')" classInoculation = "";%>
                </s:if>
                <div class="col-md-6 <%= classInoculation%>" id="divNewInoculationSeed">
                    <div class="form-group">
                        <label for="formCropSow_beans_otroInoculationBea" class="col-md-6 req">
                            <s:property value="getText('text.newinoculation.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="beans.otroInoculationBea" cssClass="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_beans_growingEnvironment_idGroEnv" class="col-md-6 req">
                            <s:property value="getText('select.growenv.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="beans.growingEnvironment.idGroEnv"
                                list="type_grow_env" 
                                cssClass="form-control"
                                listKey="idGroEnv" 
                                listValue="nameGroEnv"            
                                headerKey="-1" 
                                headerValue="---"
                                onchange="chargeValues('/crop/comboGetGrow.action?typeCrop=%{typeCrop}', 'idGrow', this.value, 'formCropSow_sowing_genotypes_idGen', 'divMessage')"
                                />
                        </div>                         
                    </div>                          
                </div>             
            </div>        
            <% } else if (typeCrop == 4) { %>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_genotypesSowing_idGenSow" class="col-md-6 req">
                            <s:property value="getText('select.genotypesow.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="sowing.genotypesSowing.idGenSow"
                                list="type_genotypes_sow"
                                cssClass="form-control"
                                listKey="idGenSow" 
                                listValue="nameGenSow"            
                                headerKey="-1" 
                                headerValue="---"
                                />
                        </div>                         
                    </div>                          
                </div>                          
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_rice_riceSystem_idRieSys" class="col-md-6 req">
                            <s:property value="getText('select.ricesystem.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="rice.riceSystem.idRieSys"
                                list="type_rice_system" 
                                cssClass="form-control"
                                listKey="idRieSys" 
                                listValue="nameRieSys"            
                                headerKey="-1" 
                                headerValue="---"
                                />
                        </div>
                    </div>
                </div>
            </div>    
            <% } %>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_genotypes_idGen" class="col-md-6 req">
                            <s:property value="getText('select.genotypename.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="sowing.genotypes.idGen"
                                list="type_genotypes" 
                                cssClass="form-control"
                                listKey="idGen" 
                                listValue="nameGen"            
                                headerKey="-1" 
                                headerValue="---"
                                onchange="showOtherElement(this.value, 'divNewMatGenet')"
                                />
                        </div>                         
                    </div>                          
                </div>  
                <% String classNewMat = "hideInfo"; %>
                <s:set name="genotypesSel" value="sowing.genotypes.idGen"/>
                <s:if test="%{#genotypesSel==1000000}">
                    <% classNewMat = "";%>
                </s:if>
                <div class="col-md-6 <%= classNewMat%>" id="divNewMatGenet">
                    <div class="form-group">
                        <label for="formCropSow_sowing_otherGenotypeSow" class="col-md-6 req">
                            <s:property value="getText('text.newgenotypename.crop')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield name="sowing.otherGenotypeSow" cssClass="form-control"/>
                        </div>
                    </div>
                </div>

            </div>
            <div class="<%= classCostSow%>"> 
                <div id="costsowing" class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="formCropSow_sowing_costSow" class="col-md-6">
                                <s:property value="getText('text.costsowing.crop')" />
                                <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield name="sowing.costSow" type="number" maxlength="14" cssClass="form-control"/>
                            </div>
                        </div>
                    </div>   
                </div>     
            </div>

            <div  class="row ">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="formCropSow_sowing_commentSow" class="col-md-6">
                            <s:property value="getText('title.formsowingcomment.sowing')" /> 
                        </label>
                        <div class="controls col-md-6">
                            <s:textarea rows="5" name="sowing.commentSow" class="form-control"></s:textarea>
                            </div> 
                        </div>                          
                    </div>     
                </div>     

            <% if (entTypeSowId != 3) { %>
                <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
            <% } %>
            <script>
                $("#formCropSow_event_expectedProductionProEve").mask("9?99999", {placeholder: ""});
    //            $("#formCropSow_sowing_seedsNumberSow").mask("9?99999999",{placeholder:""});
                $("#formCropSow_maize_seedsNumberSiteMai").mask("9?99999999", {placeholder: ""});
                $("#formCropSow_sowing_dateSow").datepicker({dateFormat: 'mm/dd/yy'});
                $("#formCropSow_sowing_dateSow").mask("99/99/9999", {placeholder: " "});
                $("#formCropSow_sowing_costSeedSow").maskMoney({prefix: ' $'});
                $("#formCropSow_sowing_costSow").maskMoney({prefix: ' $'});
                $("#formCropSow_event_expected_production_pro_eve").numeric({negative: false});
                showReSowing('sow.resow', 'divNoReSow', 'divYesReSow');
                showTypeReSowing('sow.typeresow', 'divReSowPartial', 'divReSowTotal');

                $("#formCropSow_sowing_seedsNumberSow").numeric({negative: false});
                $("#formCropSow_sowing_furrowsDistanceSow").numeric({negative: false});
                $("#formCropSow_sowing_sitesDistanceSow").numeric({negative: false});
                $("#formCropSow_beans_seedsNumberSiteBea").numeric({decimal: false, negative: false});

    //            $("#formCropSow_sowing_seedsNumberSow").val(parsePointSeparated($("#formCropSow_sowing_seedsNumberSow").val())); 
                $("#formCropSow_sowing_furrowsDistanceSow").val(parsePointSeparated($("#formCropSow_sowing_furrowsDistanceSow").val()));
                $("#formCropSow_sowing_sitesDistanceSow").val(parsePointSeparated($("#formCropSow_sowing_sitesDistanceSow").val()));
                if ($('.pop-over').length) {
                    $('.pop-over').popover();
                }
            </script>
        </fieldset>
    </s:form>
    <% String actExeSow = String.valueOf(request.getAttribute("actExe")); %>
    <% if ((actExeSow == "create" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExeSow == "modify" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
        <% if (entTypeSowId != 3) { %>
            <div style="margin-bottom: 15px" id="divBtSowing">
                <sj:submit type="button" formIds="formCropSow" cssClass="btn btn-initial btn-lg" onclick="removerMask(); addMessageProcess()" targets="divMessage" onCompleteTopics="completeSowing" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.sowingsave.crop')" /></sj:submit>
            </div>
        <% } %>
    <% }%>
</div>
<script>
    var idCropSow = $("#formCropSow_idCrop").val();
    if (idCropSow != null && idCropSow != "" && idCropSow != "null") {
        showTimeline("/crop/viewInfoTime.action?idCrop=" + idCropSow, "divInfoTimeline", "timeline");
    }
    $.subscribe('completeSowing', function(event, data) {
        if (idCropSow != null && idCropSow != "" && idCropSow != "null") {
            completeFormCrop('', 'formCropSow', 'divMessSowing', event.originalEvent.request.responseText);
            showTimeline("/crop/viewInfoTime.action?idCrop=" + idCropSow, "divInfoTimeline", "timeline");
        } else {
            location.reload();
        }
        $("#formCropSow_sowing_costSeedSow").maskMoney({prefix: ' $'});
        $("#formCropSow_sowing_costSow").maskMoney({prefix: ' $'});
    });

    function removerMask() {

        $("#formCropSow_sowing_costSeedSow").maskMoney({thousands: "", decimal: '.'});
        $("#formCropSow_sowing_costSeedSow").maskMoney('mask');
        $("#formCropSow_sowing_costSow").maskMoney({thousands: "", decimal: '.'});
        $("#formCropSow_sowing_costSow").maskMoney('mask');
    }

</script>
