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
        <%--<s:property value="prod.controlsTypes.idConTyp" />--%>
        <s:set name="conType" value="%{#attr.controlsTypes.idConTyp}"/>
        <s:set name="objType" value="%{#attr.targetsTypes.idTarTyp}"/>
        <s:set name="conTypeProd" value="prod.controlsTypes.idConTyp"/>
        <s:set name="objTypeProd" value="prod.targetsTypes.idTarTyp"/>
        
        <s:set name="pestOther" value="%{#attr.pests.idPes}"/>
        <s:set name="prodPestOther" value="prod.pests.idPes"/>
        
        <s:set name="weedOther" value="%{#attr.weeds.idWee}"/>
        <s:set name="prodWeedOther" value="prod.weeds.idWee"/>
        
        <s:set name="diseaseOther" value="%{#attr.diseases.idDis}"/>
        <s:set name="prodDiseaseOther" value="prod.diseases.idDis"/>        
        
        <s:set name="chemicalOther" value="%{#attr.chemicalsControls.idCheCon}"/>
        <s:set name="prodChemicalOther" value="prod.chemicalsControls.idCheCon"/>
        
        <s:set name="orgOther" value="%{#attr.organicControls.idOrgCon}"/>
        <s:set name="prodOrgOther" value="prod.organicControls.idOrgCon"/>
        <s:hidden name="holaVes" value="%{#chemicalOther}"/>
        
        <%--<s:set name="statusCon" value="%{#attr.status}"/>--%>
        <s:text name="%{#attr.formDoc}.targetsTypes.nameTarTyp" />        
    </td>
    <td style="padding: 3px 0.5em;">
        <s:if test="%{#objType==1 || #objTypeProd==1}">
            <s:if test="%{#pestOther==1000000 || #prodPestOther==1000000}">
                <s:text name="%{#attr.formDoc}.otherPestProCon" />
            </s:if>
            <s:else>
                <s:text name="%{#attr.formDoc}.pests.namePes" />
            </s:else>            
        </s:if>
        <s:elseif test="%{#objType==2 || #objTypeProd==2}">
            <s:if test="%{#weedOther==1000000 || #prodWeedOther==1000000}">
                <s:text name="%{#attr.formDoc}.otroWeedProCon" />
            </s:if>
            <s:else>
                <s:text name="%{#attr.formDoc}.weeds.nameWee" />
            </s:else>   
        </s:elseif>
        <s:elseif test="%{#objType==3 || #objTypeProd==3}">
            <s:if test="%{#diseaseOther==1000000 || #prodDiseaseOther==1000000}">
                <s:text name="%{#attr.formDoc}.otherDiseaseProCon" />
            </s:if>
            <s:else>
                <s:text name="%{#attr.formDoc}.diseases.nameDis" />
            </s:else>   
        </s:elseif>
    </td>  
    <td style="padding: 3px 0.5em;">
        <s:if test="%{#conType==1 || #conTypeProd==1}">
            <s:if test="%{#orgOther==1000000 || #prodOrgOther==1000000}">
                <s:text name="%{#attr.formDoc}.otherOrganicProductProCon" /><br />(<s:property value="getText('td.biologic.control')" />)                
            </s:if>
            <s:else>
                <s:text name="%{#attr.formDoc}.organicControls.nameOrgCon" /><br />(<s:property value="getText('td.biologic.control')" />)
            </s:else>      
        </s:if>
        <s:elseif test="%{#conType==2 || #conType==6 || #conTypeProd==2 || #conTypeProd==6}">
            <s:if test="%{#chemicalOther==1000000 || #prodChemicalOther==1000000}">
                <s:text name="%{#attr.formDoc}.otherChemicalProductProCon" /><br />(<s:property value="getText('td.chemical.control')" />)                 
            </s:if>
            <s:else>
                <s:text name="%{#attr.formDoc}.chemicalsControls.nameCheCon" /><br />(<s:property value="getText('td.chemical.control')" />) 
            </s:else>      
        </s:elseif>
        <s:elseif test="%{#conType==3 || #conType==7 || #conTypeProd==3 || #conTypeProd==7}">
            (<s:property value="getText('td.machine.control')" />)
        </s:elseif>        
        <s:elseif test="%{#conType==4 || #conType==8 || #conTypeProd==4 || #conTypeProd==8}">
            (<s:property value="getText('td.machined.control')" />)
        </s:elseif>
        <s:elseif test="%{#conType==5 || #conType==9 || #conTypeProd==5 || #conTypeProd==9}">
            (<s:property value="getText('td.manual.control')" />) 
        </s:elseif>
    </td>
    <td style="padding: 3px 0.5em;">
        <s:text name="%{#attr.formDoc}.dosisProCon" />(<s:text name="%{#attr.formDoc}.doseUnits.nameDosUni" />)
    </td>  
    <td style="vertical-align: bottom ! important; padding: 0 3em;">
        <div style="margin-bottom:1.2em">
            <a class="btn btn-small btn-default btn-edit" title="<s:property value="getText('link.controledit.control')" />" onclick="showFormAdditionalControl('/crop/showRowAdditionalControl.action?idCrop=${idCrop}&action=temp&position=<%= numRows %>', 'divProductsAdd', 'tableProduct', 'divConForm', 'divListConForm');"><i class="icon-pencil"></i></a>
            <a class="btn btn-small btn-default delete_rows_dt btn-delete" title="<s:property value="getText('link.remove.soil')" />" onclick="removeRowProduct('RowAddit_<%= numRows %>', 'tbControl', 'tableProduct');"><i class="icon-trash"></i></a>
        </div>
    </td>
</tr>