<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<s:if test="entReg!=null">
    <button class="close" data-dismiss="alert" type="button">×</button>
    <div class="control-group">
        <s:set name="idOldEntity" value="entReg.idEnt"/>
        <s:hidden name="idOldEntity"/>
        <p>El productor con tipo y numero de documento <s:property value="entReg.documentsTypes.acronymDocTyp" />:<s:property value="entReg.documentNumberEnt" /></p>
        <p>ya se encuentra registrado bajo el nombre de <s:property value="entReg.nameEnt" /></p>
        <p>Desea vincularlo a sus registros ?</p>
        <div class="controls" style="margin-left: 0px">
            <s:select list="#{'0':'No', '1':'Si'}" name="linkProducer" />
        </div>
    </div>
    <script>
        $('#divInfoProducerOld').addClass("alert");
        $("#divInfoProducerOld").attr("style", "width: 50%;");
    </script>
</s:if>