<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users user  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
<s:form id="formSoilSearch" action="searchSoilChemical.action?selected=%{selected}" cssClass="formClassSoil" label="%{getText('title.searchsoil.soilanalysis')}">
    <% if (entTypeId==3) { %>
        <div class="row">
            <div class="col-md-5">
                <div class="form-group">
                    <s:label for="formSoilSearch_name_agronomist" value="%{getText('select.agronolist.soilanalysis')}:"></s:label>
                    <s:select        
                        multiple="multiple"
                        name="name_agronomist" 
                        list="list_agronomist" 
                        style="width: 63%"
                        listKey="idEnt" 
                        listValue="%{nameEnt==null ? emailEnt : nameEnt}" 
                    />
                </div> 
            </div> 
            <div>
                <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListSoil" onCompleteTopics="completeSearchSoil"><i class="icon-search"></i></sj:submit>
                <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('/soilchemical/getReportSoilChemical.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.soilanalysis')" /></s:submit>
            </div>   
        </div>
        <script>
            var lanVal = $('#lanSel').val();
            var str   = lanVal;
            var valEs = str.search("es");
            var valEn = str.search("en");
            var allSelSoil = "";
            var numSelSoil = "";
            var notFoundSoil = "";
            if(valEs!=-1) {
                    allSelSoil = "Todos";
                    numSelSoil = "# de % seleccionados";
                    notFoundSoil = "No. coincidencias encontradas";
            }

            if(valEn!=-1) {
                    allSelSoil = "All";
                    numSelSoil = "# of % selected";
                    notFoundSoil = "Number of results";
            }
            
            $("#formSoilSearch_name_agronomist").multipleSelect({
                placeholder: "---",
                selectAllText: ''+allSelSoil,
                allSelected: ''+allSelSoil,
                countSelected: ''+numSelSoil,
                noMatchesFound: ''+notFoundSoil
            });
            $("#formSoilSearch_name_agronomist").multipleSelect('checkAll');
        </script>
    <% } %>
    <s:hidden name="searchFromSoil" value="1"/>    
    <div class="form-group" id="searchBasicSoil">
        <s:textfield cssClass="form-control searchGen" name="search_soil" placeholder="%{getText('text.searchsoil.soil')}" />
        <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListSoil" onCompleteTopics="completeSearchSoil"><i class="icon-search"></i></sj:submit>
        <a onclick="showSearchAdvance('searchBasicSoil', 'searchAdvanceSoil', 'formSoilSearch_searchFromSoil', 2)" class="radioSelect"><s:property value="getText('link.advancesearch.soilanalysis')" /> </a><i class="icon-chevron-down"></i>
        <s:a cssClass="btn btn-initial" href="/soilchemical/listSoilChemical.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.soilanalysis')" /></s:a>
        <% if (entTypeId!=3) { %>
            <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('/soilchemical/getReportSoilChemical.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.soilanalysis')" /></s:submit>
        <% } %>
    </div> 
    <div id="searchAdvanceSoil" class="hideInfo">
        <div class="form-group">
            <a onclick="showSearchAdvance('searchBasicSoil', 'searchAdvanceSoil', 'formSoilSearch_searchFromSoil', 1); clearForm('formSoilSearch');" class="radioSelect"><s:property value="getText('link.simplesearch.soilanalysis')" /> </a><i class="icon-chevron-up"></i>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formSoilSearch_sample_number" cssClass="control-label" value="%{getText('text.searchnumsoil.soilanalysis')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="sample_number" />
                    </div>                          
                </div>                          
            </div>                          
            <div class="col-md-4">
                <div class="form-group">
                    <s:label for="formSoilSearch_date_sampling" cssClass="control-label" value="%{getText('text.searchdatesoil.soilanalysis')}:"></s:label>
                    <div class="date controls">
                        <s:textfield name="date_sampling" readonly="true" />
                        <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formSoilSearch_id_crop_type" cssClass="control-label" value="%{getText('select.searchcroptype.soilanalysis')}:"></s:label>
                    <div class="controls">
                        <s:select
                            name="id_crop_type"
                            list="#{'1':'Maiz', '2':'Frijol', '3':'Yuca', '4':'Arroz', '5':'Algodón', '6':'Soya', '7':'Pastos'}"           
                            headerKey="-1" 
                            headerValue="---" />
                    </div>                          
                </div>                          
            </div>                          
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formSoilSearch_name_field" cssClass="control-label" value="%{getText('text.searchnamefield.soilanalysis')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="name_field" />
                    </div>
                </div>
            </div>
        </div> 
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formSoilSearch_name_dep" cssClass="control-label" value="%{getText('select.searchnamedep.soilanalysis')}:"></s:label>
                    <div class="controls">
                        <s:select
                            name="name_dep" 
                            list="department_producer" 
                            listKey="idDep" 
                            listValue="nameDep"          
                            headerKey=" " 
                            headerValue="---"
                            onchange="chargeValues('/comboMunicipalities.action', 'depId', this.value, 'formSoilSearch_name_mun', 'formSoilSearch')"
                            />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formSoilSearch_name_mun" cssClass="control-label" value="%{getText('select.searchnamemun.soilanalysis')}:"></s:label>
                    <div class="controls">
                        <s:select
                            list="city_producer" 
                            listKey="idMun" 
                            listValue="nameMun" 
                            headerKey=" " 
                            headerValue="---"
                            name="name_mun" />   
                    </div>      
                </div>      
            </div>      
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <s:label for="formSoilSearch_date_ini" cssClass="control-label" value="%{getText('text.searchrank.crop')}"></s:label>
                    <div class="date controls">
                        <s:textfield name="date_ini" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div>  
            <div class="col-md-10">
                <div class="form-group">
                    <label for="formSoilSearch_date_end" class="control-label">&nbsp;</label>
                    <div class="date controls">
                        <s:textfield name="date_end" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div> 
        </div>
        <div> 
            <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListSoil" onCompleteTopics="completeSearchSoil"><s:property value="getText('button.searchsoil.soilanalysis')" /> <i class="icon-search"></i></sj:submit>
            <s:a cssClass="btn btn-initial" href="/soilchemical/listSoilChemical.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.soilanalysis')" /></s:a>
        </div>
    </div>       
</s:form>
<script>
    $.mask.definitions['i'] = "[-0-9]";
    $.mask.definitions['f'] = "[-.0-9]";
    $("#formSoilSearch_date_sampling").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formSoilSearch_date_sampling").mask("99/99/9999", {placeholder: ""});
    $("#formSoilSearch_sample_number").numeric({decimal: false, negative: false});
    $("#formSoilSearch_date_ini").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formSoilSearch_date_ini").mask("99/99/9999", {placeholder: ""});
    $("#formSoilSearch_date_end").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formSoilSearch_date_end").mask("99/99/9999", {placeholder: ""});
    $.subscribe('completeSearchSoil', function(event, data) {
       $.unblockUI();
    });
</script>
