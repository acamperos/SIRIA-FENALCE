<%@ taglib prefix="s" uri="/struts-tags" %>
<% String actionOpt = String.valueOf(request.getAttribute("actExe"));%>
<% String rowNew    = String.valueOf(request.getAttribute("rowNew"));%>
<fieldset>         
    <legend><s:property value="getText('title.horizonts.soil')" />&nbsp;<button type="button" class="btn btn-initial btn-large" onclick="showRowAdditionalItem('../soil/showRowAdditional?action=<%=actionOpt%>&rowNew=<%=rowNew%>', 'tableAdit')"><i class="icon-plus"></i> <s:property value="getText('button.addhorizon.soil')" /></button></legend>
    <%@page import="java.lang.*"%>
    <%@page import="java.util.List"%>
    <%@page import="java.util.ArrayList"%>                            
    <table class="table table-condensed" style="width: auto;">
        <thead>
            <th></th>
            <th><s:property value="getText('td.objectivetype.control')" /></th>
            <th><s:property value="getText('td.objtivecontrol.control')" /></th>
            <th><s:property value="getText('td.controltype.control')" /></th>
            <th><s:property value="getText('td.dosecontrol.control')" /></th>
            <th><s:property value="getText('td.action.control')" /></th>
            
            <tr>
                <th colspan="1" rowspan="1" style="width:64px;padding-left:0;text-align: center;"><s:property value="getText('td.nolayer.soil')" /></th>
                <th colspan="1" rowspan="1" style="width:64px;padding-left:0;text-align: center;"><s:property value="getText('td.density.soil')" /></th>
                <th colspan="1" rowspan="1" style="width:60px;padding-left:0;text-align: center;"><s:property value="getText('td.drycolor.soil')" /></th>
                <th colspan="1" rowspan="1" style="width:60px;padding-left:0;text-align: center;"><s:property value="getText('td.wetcolor.soil')" /></th>
                <th colspan="1" rowspan="1" style="width:175px;padding-left:0;text-align: center;"><s:property value="getText('td.texture.soil')" /></th>
                <th colspan="1" rowspan="1" style="width:250px;padding-left:0;text-align: center;"><s:property value="getText('td.resistance.soil')" /></th>
            </tr>
        </thead>
        <tbody id="tableAdit">
            <s:if test="prodCon.size()>0">
                <s:iterator value="prodCon" var="product" status="estatus">
                    <s:include value="row-product.jsp">
                        <s:param name="numRows" value="#estatus.index+1" />
                        <s:param name="actionOpt" value="{request.actExe}" />
                    </s:include>
                </s:iterator>
            </s:if>
            <s:else>
                <tr value="0">
                </tr>   
            </s:else>
        </tbody>
    </table>                            
</fieldset>