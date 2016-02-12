<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<% Integer entTypePhyId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
<div id="divMessPhy"></div>
<div class="panel-body">
    <s:form id="formCropMon" action="savePhys" cssClass="form-horizontal">
        <fieldset>
            <legend><s:property value="getText('title.formphysiology.monitoring')" /></legend>
            <div class="form-group">
                <s:hidden name="idCrop"/>
                <s:hidden name="typeCrop"/>
                <s:hidden name="actExe"/>
                <%--<s:hidden name="lanSel"/>--%>
                <s:hidden name="valueIng" value="phys"/>
                <s:hidden name="phys.idPhyMon"/>
                <label for="formCropMon_phys_emergencePhyMon" class="col-md-3">
                    <s:property value="getText('text.emergencydate.monitoring')" />:
                </label>
                <div class="date col-md-3 controls">
                    <s:date name="phys.emergencePhyMon" format="MM/dd/yyyy" var="dateTransformPhy"/>
                    <s:textfield name="phys.emergencePhyMon" cssClass="form-control" value="%{#dateTransformPhy}" readonly="true"/>
                    <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                    <span class="add-on"><i class="icon-calendar"></i></span>
                </div>                          
            </div>
            <div class="form-group">
                <label for="formCropMon_phys_daysPopulationMonFis" class="col-md-3">
                    <s:property value="getText('text.dayspopulation.monitoring')" /> 
                    <% if (coCode.equals("CO")) { %>
                        <button type="button" class="btn btn-initial"><b>(plantas/ha)</b></button>:
                    <% } %>
                </label>
                <div class="controls col-md-3">
                    <s:textfield name="phys.daysPopulationMonFis" type="number" cssClass="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label for="formCropMon_phys_floweringDatePhyMon" class="col-md-3">
                    <s:property value="getText('text.floweringdate.monitoring')" />:
                </label>
                <div class="date col-md-3 controls">
                    <s:date name="phys.floweringDatePhyMon" format="MM/dd/yyyy" var="dateTransformFlow"/>
                    <s:textfield name="phys.floweringDatePhyMon" cssClass="form-control" value="%{#dateTransformFlow}" readonly="true"/>
                    <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                    <span class="add-on"><i class="icon-calendar"></i></span>
                </div>                          
            </div>
            <% if (coCode.equals("NI")) { %>
                <div class="form-group">
                    <label for="formCropMon_phys_iniPrimorPhyMon" class="col-md-3">
                        <s:property value="getText('text.primordate.monitoring')" />:
                    </label>
                    <div class="date col-md-3 controls">
                        <s:date name="phys.iniPrimorPhyMon" format="MM/dd/yyyy" var="dateTransformPri"/>
                        <s:textfield name="phys.iniPrimorPhyMon" cssClass="form-control" value="%{#dateTransformPri}" readonly="true"/>
                        <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>                          
                </div>
            <% } %>
            <div class="form-group">
                <label for="formCropMon_phys_percentageReseedingPhyMon" class="col-md-3">
                    <s:property value="getText('text.percentagereseeding.monitoring')" /> <button type="button" class="btn btn-initial"><b>(%)</b></button>:
                </label>
                <div class="controls col-md-3">
                    <s:textfield name="phys.percentageReseedingPhyMon" type="number" cssClass="form-control" />
                </div>                          
            </div>
            <fieldset>
            <legend>Observaciones</legend>                   
                <div class="row">
                    <div class="col-md-6">
                        <div  class="form-group">
                            <div class="controls col-md-12">                                      
                                <s:textarea rows="5" cssClass="form-control"  name="phys.commentPhyMon"></s:textarea>
                            </div>
                        </div>        
                    </div>                     
                </div>    
            </fieldset> 
            <% if (entTypePhyId!=3) { %>
                <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
            <% } %>
            <script>
                $("#formCropMon_phys_percentageReseedingPhyMon").numeric({negative: false});
                $("#formCropMon_phys_emergencePhyMon").datepicker({dateFormat: 'mm/dd/yy'});
                $("#formCropMon_phys_emergencePhyMon").mask("99/99/9999", {placeholder: " "});
                $("#formCropMon_phys_floweringDatePhyMon").datepicker({dateFormat: 'mm/dd/yy'});
                $("#formCropMon_phys_floweringDatePhyMon").mask("99/99/9999", {placeholder: " "});
                $("#formCropMon_phys_iniPrimorPhyMon").datepicker({dateFormat: 'mm/dd/yy'});
                $("#formCropMon_phys_iniPrimorPhyMon").mask("99/99/9999", {placeholder: " "});
                $("#formCropMon_phys_daysPopulationMonFis").numeric({ decimal: false, negative: false });
            </script>
        </fieldset>
    </s:form>	
    <div style="margin-bottom: 15px" id="divBtMonitoring">
        <% String actExeMon   = String.valueOf(request.getAttribute("actExe")); %>
        <% if ((actExeMon=="create" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExeMon=="modify" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
            <% if (entTypePhyId!=3) { %>
                <sj:submit type="button" formIds="formCropMon" cssClass="btn btn-initial btn-lg" onclick="searchDecimalNumber('formCropMon'); addMessageProcess()" targets="divMessage" onCompleteTopics="completePhyMon" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.savephysiology.monitoring')" /></sj:submit>
            <% } %>
        <% } %>
    </div>
</div>
<script>
    $.subscribe('completePhyMon', function(event, data) {
        if(event.handled !== true){
            completeFormCrop('', 'formCropMon', 'divMessPhy', event.originalEvent.request.responseText);
            showTimeline("/crop/viewInfoTime.action?idCrop="+$("#formCropMon_idCrop").val(), "divInfoTimeline", "timeline");
            event.handled = true;
        }    
    });
</script>