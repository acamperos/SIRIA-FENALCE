<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<%@page import="java.util.HashMap"%>
<% Users user  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
<% HashMap addPro    = (HashMap) request.getAttribute("additionals");%>
<% String valuePro   = (String) (addPro.get("selected"));%>
<s:form id="formProducerSearch" action="searchProducer.action?selected=%{selected}" cssClass="formClassProducer" label="%{getText('title.searchproducer.producer')}">
    <s:hidden name="searchFromProducer" value="1"/>
    <% if (entTypeId==3) { %>
        <div class="row">
            <div class="col-md-5 form-group">
                <s:select        
                    label="%{getText('select.agronolist.producer')}:"
                    multiple="multiple"
                    name="name_agronomist" 
                    list="list_agronomist" 
                    listKey="idEnt" 
                    style="width: 100%"
                    listValue="%{nameEnt==null ? emailEnt : nameEnt}" 
                />
            </div> 
            <div>
                <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListProducers" onCompleteTopics="completeProducer"><i class="icon-search"></i></sj:submit>
                <% if (valuePro.equals("producer")) {%>
                    <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('getReportProducer.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.producer')" /></s:submit>
                        <%--<s:url id="fileDownload" action="getReportProducer.action" includeParams="all" ></s:url>--%>
                        <%--<s:a type="button" href="%{fileDownload}" onclick="getReportCsv('getReportProducer.action', 'formProducerSearch', 'divMessage')" cssClass="btn btn-default"><i class="icon-file-text"></i> Exportar Datos</s:a>--%>
                <% } %>
            </div>
        </div>        
        <script>
            var lanVal = $('#lanSel').val();
            var str   = lanVal;
            var valEs = str.search("es");
            var valEn = str.search("en");            
            var allSelProducer = "";
            var numSelProducer = "";
            var notFoundProducer = "";
            if(valEs!=-1) { 
                    allSelProducer = "Todos";
                    numSelProducer = "# de % seleccionados";
                    notFoundProducer = "No. coincidencias encontradas";
            }

            if(valEn!=-1) {
                    allSelProducer = "All";
                    numSelProducer = "# of % selected";
                    notFoundProducer = "Number of results";
            }				
				
            $("#formProducerSearch_name_agronomist").multipleSelect({
                placeholder: "---",
                selectAllText: allSelProducer,
                allSelected: allSelProducer,
                countSelected: numSelProducer,
                noMatchesFound: notFoundProducer
            });
            $("#formProducerSearch_name_agronomist").multipleSelect('checkAll');
        </script>
    <% } %>
    <div class="form-group" id="searchBasicProducer">
        <s:textfield name="search_producer" placeholder="%{getText('text.searchproducer.producer')}" theme="simple" />
        <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListProducers" onCompleteTopics="completeProducer"><i class="icon-search"></i></sj:submit>
        <a onclick="showSearchAdvance('searchBasicProducer', 'searchAdvanceProducer', 'formProducerSearch_searchFromProducer', 2)" class="radioSelect"><s:property value="getText('link.advancesearch.producer')" /> </a><i class="icon-chevron-down"></i>
        <s:set name="valSel" value="selected"/> 
        <s:if test="%{#valSel.equals('producer')}">
            <s:a cssClass="btn btn-initial" href="listProducer.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.producer')" /></s:a>
        </s:if>
        <% if (entTypeId!=3) { %>
            <% if (valuePro.equals("producer")) {%>
                <s:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess(); getReportXls('getReportProducer.action', 'selectAllname_agronomist', 'selectItemname_agronomist')"><i class="icon-file-text"></i> <s:property value="getText('button.dataexport.producer')" /></s:submit>
            <% } %>
        <% } %>
    </div>   
    <div id="searchAdvanceProducer" class="hideInfo">
        <div class="form-group">
            <a onclick="showSearchAdvance('searchBasicProducer', 'searchAdvanceProducer', 'formProducerSearch_searchFromProducer', 1); clearForm('formProducerSearch');" class="radioSelect"><s:property value="getText('link.simplesearch.producer')" /> </a><i class="icon-chevron-up"></i>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formProducerSearch_typeIdent" cssClass="control-label" value="%{getText('select.searchdocumenttype.producer')}:"></s:label>
                    <div class="controls">
                        <s:select            
                            name="typeIdent" 
                            list="type_ident_producer" 
                            listKey="acronymDocTyp" 
                            listValue="nameDocTyp" 
                            headerKey="-1" 
                            headerValue="---"
                            onchange="selConf(this.value, 'formProducerSearch_num_ident_producer', '%{#attr.country_code}');
                                      showOtherTypeDocument(this.value, 'divSearchInfoCompany', 'divSearchInfoPerson');"
                        />
                    </div>                          
                </div>                
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formProducerSearch_num_ident_producer" cssClass="control-label" value="%{getText('text.searchdocumentnumber.producer')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="num_ident_producer" />
                    </div>                          
                </div>
            </div>  
        </div>  
        <div class="hideInfo" id="divSearchInfoCompany">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <s:label for="formProducerSearch_nameCompany" cssClass="control-label" value="%{getText('text.searchcompanyname.producer')}:"></s:label>
                        <div class="controls">
                            <s:textfield name="nameCompany" />
                        </div>                          
                    </div>
                </div>  
                <div class="col-md-3">
                    <div class="form-group">
                        <s:label for="formProducerSearch_firstNameRep" cssClass="control-label" value="%{getText('text.searchnamerep.producer')}:"></s:label>
                            <div class="controls">
                            <s:textfield name="firstNameRep" />
                        </div>                          
                    </div> 
                </div>
            </div> 
        </div>   
        <div class="hideInfo" id="divSearchInfoPerson">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <s:label for="formProducerSearch_names_producer_1" cssClass="control-label" value="%{getText('text.searchnamepro.producer')}:"></s:label>
                        <div class="controls">
                            <s:textfield name="names_producer_1" />
                        </div>                          
                    </div>
                </div>  
                <div class="col-md-3">
                    <div class="form-group">
                        <s:label for="formProducerSearch_last_names_producer_1" cssClass="control-label" value="%{getText('text.searchlastnamepro.producer')}:"></s:label>
                        <div class="controls">
                            <s:textfield name="last_names_producer_1" />
                        </div>                          
                    </div>
                </div>
            </div> 
        </div> 
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formProducerSearch_depPro" cssClass="control-label" value="%{getText('text.searchdep.producer')}:"></s:label>
                    <div class="controls">
                        <s:select
                            name="depPro" 
                            list="department_producer" 
                            listKey="idDep" 
                            listValue="nameDep"          
                            headerKey=" " 
                            headerValue="---"
                            onchange="chargeValues('/comboMunicipalities.action', 'depId', this.value, 'formProducerSearch_cityPro', 'formProducerSearch')"
                        />
                    </div>                          
                </div>                
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formProducerSearch_cityPro" cssClass="control-label" value="%{getText('text.searchmun.producer')}:"></s:label>
                    <div class="controls">
                        <s:select
                            list="city_producer" 
                            listKey="idMun" 
                            listValue="nameMun" 
                            headerKey=" " 
                            headerValue="---"
                            name="cityPro" />
                    </div>                          
                </div>
            </div>      
        </div>   
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formProducerSearch_direction_producer" cssClass="control-label" value="%{getText('text.searchdir.producer')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="direction_producer" />
                    </div>                          
                </div>
            </div>  
            <div class="col-md-3">
                <div class="form-group">
                    <s:label for="formProducerSearch_email_producer" cssClass="control-label" value="%{getText('text.searchemail.producer')}:"></s:label>
                    <div class="controls">
                        <s:textfield name="email_producer" />
                    </div>                          
                </div>
            </div>
        </div> 
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <s:label for="formProducerSearch_date_ini" cssClass="control-label" value="%{getText('text.searchrank.crop')}"></s:label>
                    <div class="date controls">
                        <s:textfield name="date_ini" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div>  
            <div class="col-md-10">
                <div class="form-group">
                    <label for="formProducerSearch_date_end" class="control-label">&nbsp;</label>
                    <div class="date controls">
                        <s:textfield name="date_end" readonly="true"/>
                        <br /><span class="prefix sec">[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>                          
            </div> 
        </div>
        <div>   
            <sj:submit type="button" cssClass="btn btn-default" onclick="addMessageProcess()" targets="divConListProducers" onCompleteTopics="completeProducer"><s:property value="getText('button.searchproducer.producer')" /> <i class="icon-search"></i></sj:submit>
            <s:if test="%{#valSel.equals('producer')}">
                <s:a cssClass="btn btn-initial" href="listProducer.action" role="button" targets="divBodyLayout"><i class="icon-rotate-left"></i> <s:property value="getText('link.returnlist.producer')" /></s:a>
            </s:if>
        </div>
    </div>
</s:form>
<script>
    $.mask.definitions['h'] = "[3]";
    $("#formProducerSearch_dig_ver_producer").mask("9",{placeholder:""});
    $("#formProducerSearch_telephone_producer").mask("9999999",{placeholder:""});
    $("#formProducerSearch_celphone_producer").mask("h999999999",{placeholder:""});
    $("#formProducerSearch_date_ini").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formProducerSearch_date_ini").mask("99/99/9999", {placeholder: ""});
    $("#formProducerSearch_date_end").datepicker({dateFormat: 'mm/dd/yy'});
    $("#formProducerSearch_date_end").mask("99/99/9999", {placeholder: ""});
    $.subscribe('completeProducer', function(event, data) {
        $.unblockUI();
    });
</script>
