<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<%@page import="java.util.HashMap"%>
<% Users user  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
<% HashMap addFarm    = (HashMap) request.getAttribute("additionals");%>
<% String valueFarm   = (String) (addFarm.get("selected"));%>
<s:form id="formFarmSearch" action="searchFarm.action?selected=%{selected}" cssClass="formClassProperty" label="%{getText('title.searchfarm.farm')}">
    <% if (entTypeId==3) { %>
        <div class="row">
            <div class="col-md-5 form-group">
                <s:select        
                    label="%{getText('select.agronolist.farm')}:"
                    multiple="multiple"
                    name="name_agronomist" 
                    list="list_agronomist"
                    listKey="idEnt" 
                    style="width: 100%"
                    listValue="%{nameEnt==null ? emailEnt : nameEnt}" 
                />
            </div> 
            <div>
                <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListFarms" onCompleteTopics="completeFarm"><i class="icon-search"></i></sj:submit>
                <% if (valueFarm.equals("property")) {%>
                    <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('/getReportFarm.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.farm')" /></s:submit>
                <% } %>
            </div> 
        </div>
        <script>
            var lanVal = $('#lanSel').val();
            var str    = lanVal;
            var valEs  = str.search("es");
            var valEn  = str.search("en");
            var allSelFarm = "";
            var numSelFarm = "";
            var notFoundFarm = "";
            if(valEs!=-1) {
                    allSelFarm = "Todos";
                    numSelFarm = "# de % seleccionados";
                    notFoundFarm = "No. coincidencias encontradas";
            }

            if(valEn!=-1) {
                    allSelFarm = "All";
                    numSelFarm = "# of % selected";
                    notFoundFarm = "Number of results";
            }
						
            $("#formFarmSearch_name_agronomist").multipleSelect({
                placeholder: "---",
                selectAllText: ''+allSelFarm,
                allSelected: ''+allSelFarm,
                countSelected: ''+numSelFarm,
                noMatchesFound: ''+notFoundFarm
            });
            $("#formFarmSearch_name_agronomist").multipleSelect('checkAll');
        </script>
    <% } %>
    <s:hidden name="searchFromFarm" value="1"/>    
    <div class="form-group" id="searchBasicFarm">
        <s:textfield name="search_farm" placeholder="%{getText('text.searchfarm.farm')}" />
        <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListFarms" onCompleteTopics="completeFarm"><i class="icon-search"></i></sj:submit>
        <a onclick="showSearchAdvance('searchBasicFarm', 'searchAdvanceFarm', 'formFarmSearch_searchFromFarm', 2)" class="radioSelect"><s:property value="getText('link.advancesearch.farm')" /> </a><i class="icon-chevron-down"></i>
        <s:set name="valSel" value="selected"/> 
        <s:if test="%{#valSel.equals('property')}">
            <s:a cssClass="btn btn-initial" href="/listFarm.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.farm')" /></s:a>
        </s:if>     
        <% if (entTypeId!=3) { %>
            <% if (valueFarm.equals("property")) {%>
                <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('/getReportFarm.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.farm')" /></s:submit>
            <% } %>
        <% } %>
    </div>   
    <div id="searchAdvanceFarm" class="hideInfo">
        <div class="form-group">
            <a onclick="showSearchAdvance('searchBasicFarm', 'searchAdvanceFarm', 'formFarmSearch_searchFromFarm', 1); clearForm('formFarmSearch');" class="radioSelect"><s:property value="getText('link.simplesearch.farm')" /> </a><i class="icon-chevron-up"></i>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFarmSearch_name_producer" cssClass="control-label" value="%{getText('text.searchproducer.farm')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="name_producer" />
                    </div>                          
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFarmSearch_name_property" cssClass="control-label" value="%{getText('text.searchnamefarm.farm')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="name_property" />
                    </div>                          
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFarmSearch_latitude_property" cssClass="control-label" value="%{getText('text.searchlatitude.farm')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="latitude_property" type="number" />
                    </div>                          
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFarmSearch_length_property" cssClass="control-label" value="%{getText('text.searchlongitude.farm')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="length_property" type="number" />
                    </div>                          
                </div>
            </div>  
        </div>  
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFarmSearch_altitude_property" cssClass="control-label" value="%{getText('text.searchaltitude.farm')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="altitude_property" type="number" />
                    </div>                          
                </div>
            </div>             
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFarmSearch_depFar" cssClass="control-label" value="%{getText('select.searchdep.farm')}:"></s:label>
                    <div class="controls">
                        <s:select
                            name="depFar" 
                            list="department_property" 
                            listKey="idDep" 
                            listValue="nameDep"  
                            cssClass="selectData"
                            headerKey=" " 
                            headerValue="---"
                            onchange="chargeValues('/comboMunicipalities.action', 'depId', this.value, 'formFarmSearch_cityFar', 'formFarmSearch')"
                        />
                    </div>                          
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFarmSearch_cityFar" cssClass="control-label" value="%{getText('select.searchmun.farm')}:"></s:label>
                    <div class="controls">
                        <s:select
                            list="city_property" 
                            listKey="idMun" 
                            listValue="nameMun" 
                            cssClass="selectData"
                            headerKey=" " 
                            headerValue="---"
                            name="cityFar" 
                        />
                    </div>                          
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFarmSearch_lane_property" cssClass="control-label" value="%{getText('text.searchcom.farm')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="lane_property" />
                    </div>                          
                </div>
            </div>          
        </div>   
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <s:label for="formFarmSearch_date_ini" cssClass="control-label" value="%{getText('text.searchrank.crop')}"></s:label>
                    <div class="date controls">
                        <s:textfield name="date_ini" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div>  
            <div class="col-md-10">
                <div class="form-group">
                    <label for="formFarmSearch_date_end" class="control-label">&nbsp;</label>
                    <div class="date controls">
                        <s:textfield name="date_end" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div> 
        </div>
        <div> 
            <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListFarms" onCompleteTopics="completeFarm"><s:property value="getText('button.searchfarm.farm')" /> <i class="icon-search"></i></sj:submit>
            <s:if test="%{#valSel.equals('property')}">
                <s:a cssClass="btn btn-initial" href="/listFarm.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.farm')" /></s:a>
            </s:if>
        </div>    
    </div>    
</s:form>        
<script>
    var page   = $("#formFarmSearch_page").val();
    // $.mask.definitions['i'] = "[-0-9]";
    $.mask.definitions['f'] = "[-.0-9]";
    $("#formFarmSearch_latitude_property").numeric();
    $("#formFarmSearch_length_property").numeric();
    $("#formFarmSearch_altitude_property").numeric({decimal: false, negative: false});
    $("#formFarmSearch_length_degrees_property").numeric({decimal: false});
    $("#formFarmSearch_length_minutes_property").numeric({decimal: false});
    $("#formFarmSearch_length_seconds_property").numeric();
    $("#formFarmSearch_latitude_degrees_property").numeric({decimal: false});
    $("#formFarmSearch_latitude_minutes_property").numeric({decimal: false});
    $("#formFarmSearch_latitude_seconds_property").numeric();
    $("#formFarmSearch_date_ini").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formFarmSearch_date_ini").mask("99/99/9999", {placeholder: ""});
    $("#formFarmSearch_date_end").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formFarmSearch_date_end").mask("99/99/9999", {placeholder: ""});
    $.subscribe('completeFarm', function(event, data) {
        $.unblockUI();
//        completeFormGetting('dialog-form', 'formFarmSearch', 'divFarms', event.originalEvent.request.responseText);
//        setTimeout( function() {
//            showInfo("searchFarm.action?page="+page, "divBodyLayout");
//        }, 2000);
    });
</script>
