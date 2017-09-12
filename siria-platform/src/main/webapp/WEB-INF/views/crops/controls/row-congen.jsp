<s:date name="dateCon" format="MM/dd/yyyy" var="dateTransformRowCon"/>
<td><s:property value="%{infoControl.get('nameTarTyp')}" /></td>
<td><s:property value="%{infoControl.get('nameConTyp')}" /></td>
<s:set name="conType" value="%{infoControl.get('conType')}"/>

<s:if test="%{#conType==1}">
    <td><s:property value="%{infoControl.get('orgCon')}" /><br />(<s:property value="getText('td.biologic.control')" />)</td>  
    <td><s:property value="%{infoControl.get('doseCon')}" /></td>
</s:if>
<s:elseif test="%{#conType==2 || #conType==6}">
    <td><s:property value="%{infoControl.get('chemCon')}" /><br />(<s:property value="getText('td.chemical.control')" />)</td>  
    <td><s:property value="%{infoControl.get('doseCon')}" /></td>
</s:elseif>
<s:elseif test="%{#conType==3 || #conType==7}">
    <td>(<s:property value="getText('td.machine.control')" />)</td>  
    <td><s:property value="%{infoControl.get('doseCon')}" /></td>    
</s:elseif>
<s:elseif test="%{#conType==4 || #conType==8}">
    <td>(<s:property value="getText('td.machined.control')" />)</td>  
    <td><s:property value="%{infoControl.get('doseCon')}" /></td>    
</s:elseif>
<s:elseif test="%{#conType==5 || #conType==9}">
    <td>(<s:property value="getText('td.manual.control')" />)</td>
    <td><s:property value="%{infoControl.get('doseCon')}" /></td>    
</s:elseif>