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
<% HashMap addCrop    = (HashMap) request.getAttribute("additionals");%>
<% String valueCrop   = (String) addCrop.get("selected");%>
<s:form id="formCropSearch" action="searchCrop.action?selected=%{selected}" cssClass="formClassLot" label="%{getText('title.searchcrop.crop')}">
    <% if (entTypeId==3) { %>
        <div class="row">
            <div class="col-md-5">
                <div class="form-group">
                    <s:label for="formCropSearch_name_agronomist" value="%{getText('select.agronolist.crop')}:"></s:label>
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
                <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListCrop" onCompleteTopics="completeSearchCrop"><i class="icon-search"></i></sj:submit>
                <% if (valueCrop.equals("crop")) {%>
                    <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('getReportCrop.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.crop')" /></s:submit>
                <% } %>
            </div>
        </div>
        <script>          
            
            var lanVal = $('#lanSel').val();
            var str   = lanVal;
            var valEs = str.search("es");
            var valEn = str.search("en");            
            var allSelCrop = "";
            var numSelCrop = "";
            var notFoundCrop = "";
            if(valEs!=-1) {
                allSelCrop = "Todos";
                numSelCrop = "# de % seleccionados";
                notFoundCrop = "No. coincidencias encontradas";
            }

            if(valEn!=-1) {
                allSelCrop = "All";
                numSelCrop = "# of % selected";
                notFoundCrop = "Number of results";
            }
            
            $("#formCropSearch_name_agronomist").multipleSelect({
                placeholder: "---",
                selectAllText: ''+allSelCrop,
                allSelected: ''+allSelCrop,
                countSelected: ''+numSelCrop,
                noMatchesFound: ''+notFoundCrop
            });
            $("#formCropSearch_name_agronomist").multipleSelect('checkAll');
        </script>
    <% } %>
    <s:hidden name="searchFromCrop" value="1"/>    
    <div class="form-group" id="searchBasicCrop">
        <s:textfield cssClass="form-control searchGen" name="search_crop" placeholder="%{getText('text.searchcrop.crop')}" />
        <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListCrop" onCompleteTopics="completeSearchCrop"><i class="icon-search"></i></sj:submit>
        <a onclick="showSearchAdvance('searchBasicCrop', 'searchAdvanceCrop', 'formCropSearch_searchFromCrop', 2)" class="radioSelect"><s:property value="getText('link.advancesearch.crop')" /> </a><i class="icon-chevron-down"></i>
        <s:set name="valSel" value="selected"/> 
        <s:if test="%{#valSel.equals('crop')}">
            <s:a cssClass="btn btn-initial" href="listCrop.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.crop')" /></s:a>
        </s:if>
        <% if (entTypeId!=3) { %>
            <% if (valueCrop.equals("crop")) {%>
                <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('getReportCrop.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.crop')" /></s:submit>
                <%--<s:submit type="button" formIds="formCropSearch" action="getReportCrop.action" cssClass="btn btn-default" onclick="addMessageProcess();"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.crop')" /></s:submit>--%>
                <!--<a href="/crop/getReportCrop.action" style="float: left;text-align: center;">Export To Excel</a>-->
            <% } %>
        <% } %>
    </div> 
    <div id="searchAdvanceCrop" class="hideInfo">
        <div class="form-group">
            <a onclick="showSearchAdvance('searchBasicCrop', 'searchAdvanceCrop', 'formCropSearch_searchFromCrop', 1); clearForm('formCropSearch');" class="radioSelect"><s:property value="getText('link.simplesearch.crop')" /> </a><i class="icon-chevron-up"></i>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formCropSearch_name_producer" cssClass="control-label" value="%{getText('text.searchnamepro.crop')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="name_producer" />
                    </div>                          
                </div>                          
            </div>                          
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formCropSearch_idCrop" cssClass="control-label" value="%{getText('text.searchnumcrop.crop')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="idCrop" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formCropSearch_type_doc" cssClass="control-label" value="%{getText('select.searchdocumenttype.crop')}:"></s:label>
                    <div class="controls">
                       <s:select
                        name="type_doc"
                        list="type_ident_producer" 
                        listKey="acronymDocTyp" 
                        listValue="nameDocTyp" 
                        onchange="selConf(this.value, 'formCropSearch_num_doc', '%{#attr.country_code}');"
                        headerKey="-1" 
                        headerValue="---" />
                    </div>                          
                </div>                          
            </div>                          
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formCropSearch_num_doc" cssClass="control-label" value="%{getText('text.searchdocumentnumber.crop')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="num_doc" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formCropSearch_num_farm" cssClass="control-label" value="%{getText('text.searchnumfarm.crop')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="num_farm" />
                    </div>                          
                </div>                          
            </div>                          
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formCropSearch_name_field" cssClass="control-label" value="%{getText('text.searchnamefarm.crop')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="name_farm" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formCropSearch_num_field" cssClass="control-label" value="%{getText('text.searchnumfield.crop')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="num_field" />
                    </div>                          
                </div>                          
            </div>                          
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formCropSearch_name_field" cssClass="control-label" value="%{getText('text.searchnamefield.crop')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="name_field" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formCropSearch_date_sowing" cssClass="control-label" value="%{getText('text.searchdatesow.crop')}"></s:label>
                    <div class="date controls">
                        <s:textfield name="date_sowing" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div>     
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <s:label for="formCropSearch_date_ini" cssClass="control-label" value="%{getText('text.searchrank.crop')}"></s:label>
                    <div class="date controls">
                        <s:textfield name="date_ini" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div>  
            <div class="col-md-10">
                <div class="form-group">
                    <label for="formCropSearch_date_end" class="control-label">&nbsp;</label>
                    <div class="date controls">
                        <s:textfield name="date_end" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div> 
        </div>
        <div> 
            <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListCrop" onCompleteTopics="completeSearchCrop"><s:property value="getText('button.searchcrop.crop')" /> <i class="icon-search"></i></sj:submit>
            <s:if test="%{#valSel.equals('crop')}">
                <s:a cssClass="btn btn-initial" href="listCrop.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.crop')" /></s:a>
            </s:if>
        </div>
    </div>       
</s:form>        
<script>
    $.mask.definitions['i'] = "[-0-9]";
    $.mask.definitions['f'] = "[-.0-9]";    
    $("#formCropSearch_date_sowing").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formCropSearch_date_sowing").mask("99/99/9999", {placeholder: ""});
    $("#formCropSearch_date_ini").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formCropSearch_date_ini").mask("99/99/9999", {placeholder: ""});
    $("#formCropSearch_date_end").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formCropSearch_date_end").mask("99/99/9999", {placeholder: ""});
    $("#formCropSearch_idCrop").numeric({decimal: false, negative: false});
    $("#formCropSearch_num_farm").numeric({decimal: false, negative: false});
    $("#formCropSearch_num_field").numeric({decimal: false, negative: false});
    $.subscribe('completeSearchCrop', function(event, data) {
       $.unblockUI();
    });
</script>
