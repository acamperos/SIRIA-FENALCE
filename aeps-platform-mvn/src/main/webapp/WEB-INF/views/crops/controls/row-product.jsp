<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String val  = String.valueOf(request.getAttribute("numRows")); %>
<% int numRows = Integer.parseInt(val); %>
<% Integer valControl = 0; %>
<% if(numRows==0) { %>
    <% numRows = Integer.parseInt(String.valueOf(request.getParameter("numRows"))); %>
<% } %>
<% if(numRows==0) { %>
    <% valControl = numRows+1; %>
<% } else { %>
    <% valControl = numRows; %>
<% } %>
<% request.setAttribute("formDoc", "prodCon["+(numRows-1)+"]"); %>
<% request.setAttribute("formDocId", "prodCon_"+(numRows-1)); %>
<% //int newRow = Integer.parseInt(String.valueOf(request.getAttribute("newRow"))); %>
<tr value="<%= numRows %>" id="RowAddit_<%= numRows %>">
    <td style="padding: 3px 0.5em 0px 30px;">
        <!--TODO COLOCAR LA RELACION EN LA CONSULTA DE PRODUCTSCONTROLS CON TODAS LAS TABLAS QUE VA A OBTENER INFORMACION-->
        <s:hidden name="%{#attr.formDoc}.idProCon"/>
        <s:hidden name="%{#attr.formDoc}.controls.idCon"/>
        <s:hidden name="%{#attr.formDoc}.targetsTypes.idTarTyp"/>
        <s:hidden name="%{#attr.formDoc}.controlsTypes.idConTyp"/>
        <s:hidden name="%{#attr.formDoc}.chemicalsControls.idCheCon"/>
        <s:hidden name="%{#attr.formDoc}.controlsTypes.nameConType"/>
        <s:hidden name="%{#attr.formDoc}.organicControls.idOrgCon"/>
        <s:hidden name="%{#attr.formDoc}.doseUnits.idDosUni"/>
        <s:hidden name="%{#attr.formDoc}.pests.idPes"/>
        <s:hidden name="%{#attr.formDoc}.diseases.idDis"/>
        <s:hidden name="%{#attr.formDoc}.weeds.idWee"/>
        <s:hidden name="%{#attr.formDoc}.dosisProCon"/>       
        <s:hidden name="%{#attr.formDoc}.otherPestProCon"/>
        <s:hidden name="%{#attr.formDoc}.otherDiseaseProCon"/>
        <s:hidden name="%{#attr.formDoc}.otroWeedProCon"/>
        <s:hidden name="%{#attr.formDoc}.otherChemicalProductProCon"/>
        <s:hidden name="%{#attr.formDoc}.otherOrganicProductProCon"/>
        <s:hidden name="%{#attr.formDoc}.status"/>
        <s:set name="conType" value="prod.controlsTypes.idConTyp"/>
        <s:set name="objType" value="prod.targetsTypes.idTarTyp"/>
        <s:set name="statusCon" value="prod.status"/>
        <s:text name="%{#attr.formDoc}.targetsTypes.nameTarTyp" />        
    </td>
    <td style="padding: 3px 0.5em;">
        <s:if test="%{#objType==1}">
            <s:text name="%{#attr.formDoc}.pests.namePes" />
        </s:if>
        <s:elseif test="%{#objType==2}">
            <s:text name="%{#attr.formDoc}.weeds.nameWee" /> 
        </s:elseif>
        <s:elseif test="%{#objType==3}">
            <s:text name="%{#attr.formDoc}.diseases.nameDis" />
        </s:elseif>
    </td>  
    <td style="padding: 3px 0.5em;">
        <s:if test="%{#conType==1}">
            <s:text name="%{#attr.formDoc}.organicControls.nameOrgCon" /><br />(<s:property value="getText('td.biologic.control')" />)
        </s:if>
        <s:elseif test="%{#conType==2 || #conType==6}">
            <s:text name="%{#attr.formDoc}.chemicalsControls.nameCheCon" /><br />(<s:property value="getText('td.chemical.control')" />) 
        </s:elseif>
        <s:elseif test="%{#conType==4 || #conType==8}">
            (<s:property value="getText('td.machined.control')" />
        </s:elseif>
        <s:elseif test="%{#conType==5 || #conType==9}">
            (<s:property value="getText('td.manual.control')" />) 
        </s:elseif>
    </td>
    <td style="padding: 3px 0.5em;">
        <s:text name="%{#attr.formDoc}.dosisProCon" />(<s:text name="%{#attr.formDoc}.doseUnits.nameDosUni" />)
    </td>  
    <td style="vertical-align: bottom ! important; padding: 0 0.5em;">
        <a class="btn btn-small btn-edit" title="<s:property value="getText('link.controledit.control')" />" onclick="showFormAdditionalControl('/crop/showRowAdditionalControl.action?idCrop=${idCrop}&position=<%= numRows %>', 'divProductsAdd', 'tableProduct', 'divConForm', 'divListConForm');"><i class="icon-pencil"></i></a>
        <a class="btn btn-small delete_rows_dt" title="<s:property value="getText('link.remove.soil')" />" style="margin-bottom:1.2em" onclick="removeRowHorizon('RowAddit_<%= numRows %>', 'tableAdit');"><i class="icon-trash"></i></a>
    </td>
</tr>