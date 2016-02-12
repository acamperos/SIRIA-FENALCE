<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<%@page import="java.util.HashMap"%>
<% Users user  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
<% HashMap addField    = (HashMap) request.getAttribute("additionals");%>
<% String valueField   = (String) addField.get("selected");%>
<s:form id="formFieldSearch" action="searchField.action?selected=%{selected}" cssClass="formClassLot" label="%{getText('title.searchfield.field')}">
    <% if (entTypeId==3) { %>
        <div class="row">
            <div class="col-md-5 form-group">
                <s:select        
                    label="%{getText('select.agronomistlist.field')}:"
                    multiple="multiple"
                    name="name_agronomist" 
                    list="list_agronomist" 
                    listKey="idEnt" 
                    listValue="%{nameEnt==null ? emailEnt : nameEnt}" 
                />
            </div> 
            <div>
                <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListFields" onCompleteTopics="completeField"><i class="icon-search"></i></sj:submit>
                <% if (valueField.equals("lot")) {%>
                    <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('/getReportField.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.exportdata.field')" /></s:submit>
                <% } %>
            </div> 
        </div>
        <script>
            var lanVal = $('#lanSel').val();
            var str    = lanVal;
            var valEs  = str.search("es");
            var valEn  = str.search("en");
            var allSelField = "";
            var numSelField = "";
            var notFoundField = "";
            if(valEs!=-1) {
                    allSelField = "Todos";
                    numSelField = "# de % seleccionados";
                    notFoundField = "No. coincidencias encontradas";
            }

            if(valEn!=-1) {
                    allSelField = "All";
                    numSelField = "# of % selected";
                    notFoundField = "Number of results";
            }
						
				
            $("#formFieldSearch_name_agronomist").multipleSelect({
                placeholder: "---",
                selectAllText: ''+allSelField,
                allSelected: ''+allSelField,
                countSelected: ''+numSelField,
                noMatchesFound: ''+notFoundField
            });
            $("#formFieldSearch_name_agronomist").multipleSelect('checkAll');
        </script>
    <% } %>    
    <s:hidden name="searchFromField" value="1"/>    
    <div class="form-group" id="searchBasicField">
        <s:textfield name="search_field" placeholder="%{getText('text.searchfield.field')}" theme="simple" />
        <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListFields" onCompleteTopics="completeField"><i class="icon-search"></i></sj:submit>
        <a onclick="showSearchAdvance('searchBasicField', 'searchAdvanceField', 'formFieldSearch_searchFromField', 2)" class="radioSelect"><s:property value="getText('link.advancesearch.field')" /> </a><i class="icon-chevron-down"></i>
        <s:set name="valSel" value="selected"/> 
        <s:if test="%{#valSel.equals('lot')}">
            <s:a cssClass="btn btn-initial" href="/listField.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.field')" /></s:a>
        </s:if>
        <% if (entTypeId!=3) { %>
            <% if (valueField.equals("lot")) {%>
                <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('/getReportField.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.field')" /></s:submit>
            <% } %>
        <% } %>
    </div>   
    <div id="searchAdvanceField" class="hideInfo">
        <div class="form-group">
            <a onclick="showSearchAdvance('searchBasicField', 'searchAdvanceField', 'formFieldSearch_searchFromField', 1); clearForm('formFieldSearch');" class="radioSelect"><s:property value="getText('link.simplesearch.field')" /> </a><i class="icon-chevron-up"></i>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFieldSearch_name_producer_lot" cssClass="control-label" value="%{getText('text.searchproducer.field')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="name_producer_lot" />
                    </div>                          
                </div>
            </div>                          
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFieldSearch_name_property_lot" cssClass="control-label" value="%{getText('text.searchnamefarm.field')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="name_property_lot" />
                    </div>                          
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFieldSearch_typeLot" cssClass="control-label" value="%{getText('select.searchtypefield.field')}:"></s:label>
                    <div class="controls">
                        <s:select
                            name="typeLot"
                            list="type_property_lot" 
                            listKey="idFieTyp" 
                            listValue="nameFieTyp"              
                            headerKey="-1" 
                            headerValue="---"
                        />
                    </div>                          
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFieldSearch_name_lot" cssClass="control-label" value="%{getText('text.searchnamefield.field')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="name_lot" />
                    </div>                          
                </div>
            </div>    
        </div>    
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFieldSearch_latitude_lot" cssClass="control-label" value="%{getText('text.searchlatitude.field')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="latitude_lot" type="number" />
                    </div>                          
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFieldSearch_length_lot" cssClass="control-label" value="%{getText('text.searchlongitude.field')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="length_lot" type="number" />
                    </div>                          
                </div>
            </div>  
        </div>  
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFieldSearch_altitude_lot" cssClass="control-label" value="%{getText('text.searchaltitude.field')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="altitude_lot" type="number" />
                    </div>                          
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formFieldSearch_area_lot" cssClass="control-label" value="%{getText('text.searcharea.field')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="area_lot" type="number" />
                    </div>                          
                </div>
            </div>         
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <s:label for="formFieldSearch_date_ini" cssClass="control-label" value="%{getText('text.searchrank.crop')}"></s:label>
                    <div class="date controls">
                        <s:textfield name="date_ini" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div>  
            <div class="col-md-10">
                <div class="form-group">
                    <label for="formFieldSearch_date_end" class="control-label">&nbsp;</label>
                    <div class="date controls">
                        <s:textfield name="date_end" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div> 
        </div>
        <div> 
            <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListFields" onCompleteTopics="completeField"><s:property value="getText('button.searchfield.field')" /> <i class="icon-search"></i></sj:submit>
            <s:if test="%{#valSel.equals('lot')}">
                <s:a cssClass="btn btn-initial" href="/listField.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.field')" /></s:a>
            </s:if>
        </div>    
    </div>    
</s:form>        
<script>
    $.mask.definitions['i'] = "[-0-9]";
    $.mask.definitions['f'] = "[-.0-9]";
    $("#formFieldSearch_latitude_lot").numeric();
    $("#formFieldSearch_length_lot").numeric();
    $("#formFieldSearch_altitude_lot").numeric({decimal: false, negative: false});
    $("#formFieldSearch_area_lot").numeric();
    $("#formFieldSearch_length_degrees_lot").numeric({decimal: false});
    $("#formFieldSearch_length_minutes_lot").numeric({decimal: false});
    $("#formFieldSearch_length_seconds_lot").numeric();
    $("#formFieldSearch_latitude_degrees_lot").numeric({decimal: false});
    $("#formFieldSearch_latitude_minutes_lot").numeric({decimal: false});
    $("#formFieldSearch_latitude_seconds_lot").numeric();
    $("#formFieldSearch_date_ini").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formFieldSearch_date_ini").mask("99/99/9999", {placeholder: ""});
    $("#formFieldSearch_date_end").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formFieldSearch_date_end").mask("99/99/9999", {placeholder: ""});
    $.subscribe('completeField', function(event, data) {
       $.unblockUI();
    });
</script>
