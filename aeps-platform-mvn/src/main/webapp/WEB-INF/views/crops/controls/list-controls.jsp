<%@ taglib prefix="s" uri="/struts-tags" %>
<% String actionOpt = String.valueOf(request.getAttribute("actExe"));%>
<% String table = "display:none;"; %>
<s:if test="prodCon.size() > 0">
    <% table = ""; %>
</s:if>
<div class="w-box">    
    <%@page import="java.lang.*"%>
    <%@page import="java.util.List"%>
    <%@page import="java.util.ArrayList"%>                            
    <table class="table table-bordered table-hover" id="tbControl" style="width: 80%; <%= table %>">
        <thead>
            <tr>
                <th colspan="1" rowspan="1" style="width:10%;padding-left:0;text-align: center;"><s:property value="getText('td.objectivetype.control')" /></th>
                <th colspan="1" rowspan="1" style="width:20%;padding-left:0;text-align: center;"><s:property value="getText('td.objtivecontrol.control')" /></th>
                <th colspan="1" rowspan="1" style="width:20%;padding-left:0;text-align: center;"><s:property value="getText('td.controltype.control')" /></th>
                <th colspan="1" rowspan="1" style="width:20%;padding-left:0;text-align: center;"><s:property value="getText('td.dosecontrol.control')" /></th>
                <th colspan="1" rowspan="1" style="width:20%;padding-left:0;text-align: center;"><s:property value="getText('td.action.control')" /></th>
            </tr>
        </thead>
        <tbody id="tableProduct">
            <s:if test="prodCon.size()>0">
                <s:iterator value="prodCon" var="product" status="estatus">
                    <s:include value="row-product.jsp">
                        <s:param name="numRows" value="#estatus.index+1" />
                        <s:param name="actionOpt" value="{request.actExe}" />
                        <s:param name="prod" value="product" />
                    </s:include>
                </s:iterator>
            </s:if>
            <s:else>
                <tr value="0">
                </tr>   
            </s:else>
        </tbody>
    </table>      
</div>