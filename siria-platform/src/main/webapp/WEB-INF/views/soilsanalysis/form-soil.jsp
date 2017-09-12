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
        <div id="divSoilForm">
            <div>	
                <s:form id="formSoil" action="saveSoilChemical" cssClass="form-horizontal">
                    <fieldset>         
                        <legend><s:property value="getText('title.generateanalysis.soilanalysis')" /></legend>
                        <s:hidden name="soil.idSoAna"/>    
                        <div class="form-group">
                            <label for="formSoil_nameCrop" class="col-md-3 req">
                                <s:property value="getText('text.selectcrop.soilanalysis')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.selectcrop.soilanalysis')" />." data-title="<s:property value="getText('help.selectcrop.soilanalysis')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls col-md-6 input-group">
                                <s:hidden name="idCrop"/>
                                <s:textfield
                                    name="nameCrop"         
                                    readonly="true"
                                    cssClass="form-control"
                                    onclick="listInfo('/crop/viewCrop.action?selected=soil', 'formSoil_nameCrop', 'formSoil_idCrop', 'divListSoilForm', 'divSoilForm')"
                                />
                                <a class="btn btn-default input-group-addon" onclick="listInfo('/crop/viewCrop.action?selected=soil', 'formSoil_nameCrop', 'formSoil_idCrop', 'divListSoilForm', 'divSoilForm')"><i class="icon-search"></i></a>
                            </div>  
                        </div>  
                        <div class="form-group">
                            <s:label for="formSoil_soil_dateSamplingSoAna" cssClass="col-md-3 req" value="%{getText('text.datesoil.soilanalysis')}:"></s:label>
                            <div class="date controls col-md-6">
                                <s:date name="soil.dateSamplingSoAna" format="MM/dd/yyyy" var="dateTransform"/>
                                <s:textfield cssClass="form-control" name="soil.dateSamplingSoAna" value="%{#dateTransform}" readonly="true"/>
                                <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                                <span class="add-on"><i class="icon-calendar"></i></span>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="formSoil_soil_sampleNumberSoAna" class="col-md-3 req">
                                <s:property value="getText('text.samplenumber.soilanalysis')" />:
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield cssClass="form-control" id="formSoil_soil_sampleNumberSoAna" name="soil.sampleNumberSoAna" tooltip="%{getText('desc.samplenumber.soilanalysis')}"/>
                            </div>
                        </div>
                        <fieldset>
                            <%--<s:number name="prep.depthPrep" type="integer" var="depthPreparation" />--%>
                            <legend><s:property value="getText('title.properties.soilanalysis')" /></legend> 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formSoil_soil_sandSoAna" class="col-md-3">
                                            <s:property value="getText('text.sandsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_sandSoAna" name="soil.sandSoAna" onkeyup="getTexture('formSoil_typeTexture', 'formSoil_soil_sandSoAna', 'formSoil_soil_lemonSoAna', 'formSoil_soil_claySoAna')" /> %
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_lemonSoAna" class="col-md-3">
                                            <s:property value="getText('text.lemonsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_lemonSoAna" name="soil.lemonSoAna" onkeyup="getTexture('formSoil_typeTexture', 'formSoil_soil_sandSoAna', 'formSoil_soil_lemonSoAna', 'formSoil_soil_claySoAna')" /> %
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_claySoAna" class="col-md-3">
                                            <s:property value="getText('text.claysoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_claySoAna" name="soil.claySoAna" onkeyup="getTexture('formSoil_typeTexture', 'formSoil_soil_sandSoAna', 'formSoil_soil_lemonSoAna', 'formSoil_soil_claySoAna')" /> %
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_typeTexture" class="col-md-3">
                                            <s:property value="getText('select.texturesoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:select
                                                name="typeTexture"
                                                listKey="idTex" 
                                                listValue="nameTex" 
                                                cssClass="form-control"
                                                list="type_textures"           
                                                headerKey="-1" 
                                                headerValue="---" 
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="formSoil_soil_organicMaterialSoAna" class="col-md-3">
                                            <s:property value="getText('text.mosoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_organicMaterialSoAna" name="soil.organicMaterialSoAna" /> %
                                        </div>
                                    </div>  
                                    <div class="form-group">
                                        <label for="formSoil_soil_dapaSoAna" class="col-md-3">
                                            <s:property value="getText('text.dapasoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_dapaSoAna" name="soil.dapaSoAna" /> gr/cc
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_phSoAna" class="col-md-3">
                                            <s:property value="getText('text.phsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_phSoAna" name="soil.phSoAna" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_elecConductivitySoAna" class="col-md-3">
                                            <s:property value="getText('text.eleconductsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_elecConductivitySoAna" name="soil.elecConductivitySoAna" /> us/cm
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_cationInterchangeabilitySoAna" class="col-md-3">
                                            <s:property value="getText('text.cationinterchangesoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_cationInterchangeabilitySoAna" name="soil.cationInterchangeabilitySoAna" /> cmol/kg
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_coSoAna" class="col-md-3">
                                            <s:property value="getText('text.cosoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_coSoAna" name="soil.coSoAna" /> %
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend><s:property value="getText('title.elements.soilanalysis')" /></legend> 
                            <div class="row">
                                <div class="col-md-6">
                                    <h5 class="text-center"><s:property value="getText('title.major.soilanalysis')" /></h5>
                                    <hr />
                                    <div class="form-group">
                                        <label for="formSoil_soil_nitrogenSoAna" class="col-md-3">
                                            <s:property value="getText('text.nitrogensoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_nitrogenSoAna" name="soil.nitrogenSoAna" /> %
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_phosphorusSoAna" class="col-md-3">
                                            <s:property value="getText('text.phosphorusoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_phosphorusSoAna" name="soil.phosphorusSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.phosphorusUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'cmol/kg', '2':'mg/L'}"           
                                                headerKey="1"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_potassiumSoAna" class="col-md-3">
                                            <s:property value="getText('text.potassiumsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_potassiumSoAna" name="soil.potassiumSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.potassiumUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'cmol/kg', '2':'meq/100g'}"           
                                                headerKey="1"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_calciumSoAna" class="col-md-3">
                                            <s:property value="getText('text.calciumsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_calciumSoAna" name="soil.calciumSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.calciumUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'cmol/kg', '2':'meq/100g'}"           
                                                headerKey="1"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_magnesiumSoAna" class="col-md-3">
                                            <s:property value="getText('text.magnesiumsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_magnesiumSoAna" name="soil.magnesiumSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.magnesiumUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'cmol/kg', '2':'meq/100g'}"           
                                                headerKey="1"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_sulfurSoAna" class="col-md-3">
                                            <s:property value="getText('text.sulfursoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_sulfurSoAna" name="soil.sulfurSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.sulfurUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'mg/kg', '2':'mg/L'}"           
                                                headerKey="1"
                                            />  
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h5 class="text-center"><s:property value="getText('title.minor.soilanalysis')" /></h5>
                                    <hr />
                                    <div class="form-group">
                                        <label for="formSoil_soil_boronSoAna" class="col-md-3">
                                            <s:property value="getText('text.boronsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_boronSoAna" name="soil.boronSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.boronUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'mg/kg', '2':'mg/L'}"           
                                                headerKey="1"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_zincSoAna" class="col-md-3">
                                            <s:property value="getText('text.zincsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_zincSoAna" name="soil.zincSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.zincUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'mg/kg', '2':'mg/L'}"           
                                                headerKey="1"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_ironSoAna" class="col-md-3">
                                            <s:property value="getText('text.ironsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_ironSoAna" name="soil.ironSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.ironUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'mg/kg', '2':'mg/L'}"           
                                                headerKey="1"
                                            />                                    
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_sodiumSoAna" class="col-md-3">
                                            <s:property value="getText('text.sodiumsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_sodiumSoAna" name="soil.sodiumSoAna" /> cmol/kg
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_manganeseSoAna" class="col-md-3">
                                            <s:property value="getText('text.manganesesoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_manganeseSoAna" name="soil.manganeseSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.manganeseUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'mg/kg', '2':'mg/L'}"           
                                                headerKey="1"
                                            />  
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_copperSoAna" class="col-md-3">
                                            <s:property value="getText('text.coppersoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_copperSoAna" name="soil.copperSoAna" /> 
                                            <s:select
                                                cssStyle="width: auto;"
                                                name="soil.copperUnitSoAna"
                                                cssClass="form-control"
                                                list="#{'1':'mg/kg', '2':'mg/L'}"           
                                                headerKey="1"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_siliconSoAna" class="col-md-3">
                                            <s:property value="getText('text.siliconsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_siliconSoAna" name="soil.siliconSoAna" /> meg/100gr
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_exchangeableAcidityHSoAna" class="col-md-3">
                                            <s:property value="getText('text.exchangeablehsoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_exchangeableAcidityHSoAna" name="soil.exchangeableAcidityHSoAna" /> cmol/kg
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="formSoil_soil_exchangeableAcidityThreeSoAna" class="col-md-3">
                                            <s:property value="getText('text.exchangeablethreesoil.soilanalysis')" />:
                                        </label>
                                        <div class="controls col-md-6">
                                            <s:textfield cssClass="form-control" id="formSoil_soil_exchangeableAcidityThreeSoAna" name="soil.exchangeableAcidityThreeSoAna" /> cmol/kg
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </fieldset>
                    <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                    <div> 
                        <s:hidden name="page"/>
                        <s:hidden name="actExe"/>    
                        <s:hidden name="rowNew"/>    
                        <% String actExe   = String.valueOf(request.getAttribute("actExe")); %>
                        <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "soil/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "soil/modify"))) { %>                
                            <sj:submit id="btnSoil" type="button" cssClass="btn btn-initial btn-lg" onclick="searchDecimalNumber('formSoil'); addMessageProcess()" targets="divMessage" onCompleteTopics="completeSoil" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.savesoil.soilanalysis')" /></sj:submit>
                        <% } %>
                        <button class="btn btn-lg btn-default bt_cancel_producer" onclick="resetForm('formSoil'); closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                    </div>    
                </s:form> 
            </div>
            <script>
                var page = $("#formSoil_page").val();

                $.mask.definitions['i'] = "[-0-9]";
                $.mask.definitions['f'] = "[-.0-9]";
                
//                Date.prototype.format = function(format)
//                {
//                  var o = {
//                    "M+" : this.getMonth()+1, //month
//                    "d+" : this.getDate(),    //day
//                    "h+" : this.getHours(),   //hour
//                    "m+" : this.getMinutes(), //minute
//                    "s+" : this.getSeconds(), //second
//                    "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
//                    "S" : this.getMilliseconds() //millisecond
//                  }
//
//                  if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
//                    (this.getFullYear()+"").substr(4 - RegExp.$1.length));
//                  for(var k in o)if(new RegExp("("+ k +")").test(format))
//                    format = format.replace(RegExp.$1,
//                      RegExp.$1.length==1 ? o[k] :
//                        ("00"+ o[k]).substr((""+ o[k]).length));
//                  return format;
//                }
//                
//                if ($("#formSoil_rasta_fechaRas").val()) {
//                    $("#formSoil_rasta_fechaRas").val(new Date($("#formSoil_rasta_fechaRas").val()).parse($("#formSoil_rasta_fechaRas").val()));
//                }

//                if ($("#formSoil_rasta_fechaRas").val()) {
//                    function dateToDMY(date) {
//                        var d = date.getDate();
//                        var m = date.getMonth() + 1;
//                        var y = date.getFullYear();
//    //                    return '' + y + '-' + (m<=9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);
//                        return '' + (d <= 9 ? '0' + d : d) + '/' + (m<=9 ? '0' + m : m) + '/' + y;
//                    }
//                    
//                    var str = $("#formSoil_rasta_fechaRas").val();
////                    str = str.split(" ");
////                    alert(str[0])
//                    alert($("#formSoil_rasta_fechaRas").val())
//                    alert(Date.parse($("#formSoil_rasta_fechaRas").val()))
//                    $("#formSoil_rasta_fechaRas").val(dateToDMY(new Date(Date.parse($("#formSoil_rasta_fechaRas").val()))));
//                    alert($("#formSoil_rasta_fechaRas").val())
//                }
                getTexture('formSoil_typeTexture', 'formSoil_soil_sandSoAna', 'formSoil_soil_lemonSoAna', 'formSoil_soil_claySoAna');
                $("#formSoil_soil_dateSamplingSoAna").datepicker({dateFormat: 'mm/dd/yy'});
                $("#formSoil_soil_dateSamplingSoAna").mask("99/99/9999", {placeholder: ""});
                $("#formSoil_soil_sampleNumberSoAna").numeric({decimal: false, negative: false});
                
                $("#formSoil_soil_sandSoAna").numeric({negative: false});
                $("#formSoil_soil_sandSoAna").val(parsePointSeparated($("#formSoil_soil_sandSoAna").val()));
                
                $("#formSoil_soil_lemonSoAna").numeric({negative: false});
                $("#formSoil_soil_lemonSoAna").val(parsePointSeparated($("#formSoil_soil_lemonSoAna").val()));
                
                $("#formSoil_soil_claySoAna").numeric({negative: false});
                $("#formSoil_soil_claySoAna").val(parsePointSeparated($("#formSoil_soil_claySoAna").val()));
                
                $("#formSoil_soil_organicMaterialSoAna").numeric({negative: false});
                $("#formSoil_soil_organicMaterialSoAna").val(parsePointSeparated($("#formSoil_soil_organicMaterialSoAna").val()));
                
                $("#formSoil_soil_dapaSoAna").numeric({negative: false});
                $("#formSoil_soil_dapaSoAna").val(parsePointSeparated($("#formSoil_soil_dapaSoAna").val()));
                
                $("#formSoil_soil_phSoAna").numeric({negative: false});
                $("#formSoil_soil_phSoAna").val(parsePointSeparated($("#formSoil_soil_phSoAna").val()));
                
                $("#formSoil_soil_elecConductivitySoAna").numeric({negative: false});
                $("#formSoil_soil_elecConductivitySoAna").val(parsePointSeparated($("#formSoil_soil_elecConductivitySoAna").val()));
                
                $("#formSoil_soil_cationInterchangeabilitySoAna").numeric({negative: false});
                $("#formSoil_soil_cationInterchangeabilitySoAna").val(parsePointSeparated($("#formSoil_soil_cationInterchangeabilitySoAna").val()));
                
                $("#formSoil_soil_coSoAna").numeric({negative: false});
                $("#formSoil_soil_coSoAna").val(parsePointSeparated($("#formSoil_soil_coSoAna").val()));
                
                $("#formSoil_soil_nitrogenSoAna").numeric({negative: false});
                $("#formSoil_soil_nitrogenSoAna").val(parsePointSeparated($("#formSoil_soil_nitrogenSoAna").val()));
                
                $("#formSoil_soil_phosphorusSoAna").numeric({negative: false});
                $("#formSoil_soil_phosphorusSoAna").val(parsePointSeparated($("#formSoil_soil_phosphorusSoAna").val()));
                
                $("#formSoil_soil_potassiumSoAna").numeric({negative: false});
                $("#formSoil_soil_potassiumSoAna").val(parsePointSeparated($("#formSoil_soil_potassiumSoAna").val()));
                
                $("#formSoil_soil_calciumSoAna").numeric({negative: false});
                $("#formSoil_soil_calciumSoAna").val(parsePointSeparated($("#formSoil_soil_calciumSoAna").val()));
                
                $("#formSoil_soil_magnesiumSoAna").numeric({negative: false});
                $("#formSoil_soil_magnesiumSoAna").val(parsePointSeparated($("#formSoil_soil_magnesiumSoAna").val()));
                
                $("#formSoil_soil_sulfurSoAna").numeric({negative: false});
                $("#formSoil_soil_sulfurSoAna").val(parsePointSeparated($("#formSoil_soil_sulfurSoAna").val()));
                
                $("#formSoil_soil_boronSoAna").numeric({negative: false});
                $("#formSoil_soil_boronSoAna").val(parsePointSeparated($("#formSoil_soil_boronSoAna").val()));
                
                $("#formSoil_soil_zincSoAna").numeric({negative: false});
                $("#formSoil_soil_zincSoAna").val(parsePointSeparated($("#formSoil_soil_zincSoAna").val()));
                
                $("#formSoil_soil_ironSoAna").numeric({negative: false});
                $("#formSoil_soil_ironSoAna").val(parsePointSeparated($("#formSoil_soil_ironSoAna").val()));
                
                $("#formSoil_soil_sodiumSoAna").numeric({negative: false});
                $("#formSoil_soil_sodiumSoAna").val(parsePointSeparated($("#formSoil_soil_sodiumSoAna").val()));
                
                $("#formSoil_soil_manganeseSoAna").numeric({negative: false});
                $("#formSoil_soil_manganeseSoAna").val(parsePointSeparated($("#formSoil_soil_manganeseSoAna").val()));
                
                $("#formSoil_soil_copperSoAna").numeric({negative: false});
                $("#formSoil_soil_copperSoAna").val(parsePointSeparated($("#formSoil_soil_copperSoAna").val()));
                
                $("#formSoil_soil_siliconSoAna").numeric({negative: false});
                $("#formSoil_soil_siliconSoAna").val(parsePointSeparated($("#formSoil_soil_siliconSoAna").val()));
                
                $("#formSoil_soil_exchangeableAcidityHSoAna").numeric({negative: false});
                $("#formSoil_soil_exchangeableAcidityHSoAna").val(parsePointSeparated($("#formSoil_soil_exchangeableAcidityHSoAna").val()));
                
                $("#formSoil_soil_exchangeableAcidityThreeSoAna").numeric({negative: false});
                $("#formSoil_soil_exchangeableAcidityThreeSoAna").val(parsePointSeparated($("#formSoil_soil_exchangeableAcidityThreeSoAna").val()));
                
                $.subscribe('completeSoil', function(event, data) {
                    if(event.handled !== true){
                        var actExeSoil = $("#formSoil_actExe").val();
                        if (actExeSoil=='create') {
                            $('#btnSoil').on('click', function() {
                                ga('send', 'event', 'SoilsChemical', 'click', 'Create');
                            });
                        } else if (actExeSoil=='modify') {
                            $('#btnSoil').on('click', function() {
                                ga('send', 'event', 'SoilsChemical', 'click', 'Update');
                            });                
                        }
                        completeFormGetting('dialog-form', 'formSoil', 'divSoil', event.originalEvent.request.responseText);
                        setTimeout(function() {
                            showInfo("/soilchemical/searchSoilChemical.action?page=" + page, "divConListSoil");
                        }, 2000);
                        event.handled = true;
                    }   
                });
                if($('.pop-over').length) {
                    $('.pop-over').popover();
                }
            </script>
        </div>
        <div class="row" id="divListSoilForm"></div>
    </body>
</html>
