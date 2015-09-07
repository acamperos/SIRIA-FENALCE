<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<div id="divMessPhy"></div>
<s:form id="formCropMon" action="savePhys" cssClass="form-horizontal">
    <fieldset>
        <legend>Formulario de Fisiología</legend>
        <div class="control-group">
            <s:hidden name="idCrop"/>
            <s:hidden name="typeCrop"/>
            <s:hidden name="actExe"/>
            <s:hidden name="lanSel"/>
            <s:hidden name="valueIng" value="phys"/>
            <s:hidden name="phys.idPhyMon"/>
            <label for="formCropMon_phys_emergencePhyMon" class="control-label">
                Fecha de emergencia:
            </label>
            <div class="date controls">
                <s:date name="phys.emergencePhyMon" format="dd/MM/yyyy" var="dateTransformPhy"/>
                <s:textfield name="phys.emergencePhyMon" value="%{#dateTransformPhy}" readonly="true"/>
                <span class="prefix sec">&nbsp;[dd/mm/yyyy]</span>
                <span class="add-on"><i class="icon-calendar"></i></span>
            </div>                          
        </div>
        <div class="control-group">
            <label for="formCropMon_phys_daysPopulationMonFis" class="control-label">
                Poblacion a los 20 días <button type="button" class="btn btn-initial"><b>(plantas/ha)</b></button>:
            </label>
            <div class="controls">
                <s:textfield name="phys.daysPopulationMonFis"/>
            </div>
        </div>
        <div class="control-group">
            <label for="formCropMon_phys_floweringDatePhyMon" class="control-label">
                Fecha de floración:
            </label>
            <div class="date controls">
                <s:date name="phys.floweringDatePhyMon" format="dd/MM/yyyy" var="dateTransformFlow"/>
                <s:textfield name="phys.floweringDatePhyMon" value="%{#dateTransformFlow}" readonly="true"/>
                <span class="prefix sec">&nbsp;[dd/mm/yyyy]</span>
                <span class="add-on"><i class="icon-calendar"></i></span>
            </div>                          
        </div>
        <div class="control-group">
            <label for="formCropMon_phys_percentageReseedingPhyMon" class="control-label">
                Porcentaje de resiembra <button type="button" class="btn btn-initial"><b>(%)</b></button>:
            </label>
            <div class="controls">
                <s:textfield name="phys.percentageReseedingPhyMon" />
            </div>                          
        </div>
        <p class="warnField reqBef">Campos Requeridos</p>
        <script>
            $("#formCropMon_phys_percentageReseedingPhyMon").numeric({negative: false});
            $("#formCropMon_phys_emergencePhyMon").datepicker({dateFormat: 'dd/mm/yy'});
            $("#formCropMon_phys_emergencePhyMon").mask("99/99/9999", {placeholder: " "});
            $("#formCropMon_phys_floweringDatePhyMon").datepicker({dateFormat: 'dd/mm/yy'});
            $("#formCropMon_phys_floweringDatePhyMon").mask("99/99/9999", {placeholder: " "});
            $("#formCropMon_phys_daysPopulationMonFis").numeric({ decimal: false, negative: false });
        </script>
    </fieldset>
</s:form>	
<div style="margin-bottom: 15px" id="divBtMonitoring">
    <% String actExeMon   = String.valueOf(request.getAttribute("actExe")); %>
    <% if ((actExeMon=="create" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExeMon=="modify" && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
        <sj:submit type="button" formIds="formCropMon" cssClass="btn btn-initial btn-large" onclick="searchDecimalNumber('formCropMon'); addMessageProcess()" targets="divMessage" onCompleteTopics="completePhyMon" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  Guardar Fisiología</sj:submit>
    <% } %>
</div>
<script>
    $.subscribe('completePhyMon', function(event, data) {
        completeFormCrop('', 'formCropMon', 'divMessPhy', event.originalEvent.request.responseText);
        showTimeline("/crop/getInfoTime.action?idCrop="+$("#formCropMon_idCrop").val(), "divInfoTimeline", "timeline");
    });
</script>