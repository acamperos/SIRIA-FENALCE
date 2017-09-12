<s:date name="dateFer" format="MM/dd/yyyy" var="dateTransformRowFer"/>
<td><s:property value="%{infoFert.get('ferTyp')}" /></td>
<td><s:property value="%{infoFert.get('amountUsed')}" /></td>
<s:set name="useFerTyp" value="%{infoFert.get('idFerApp')}"/>
<s:set name="appTyp" value="%{infoFert.get('appTyp')}"/>
<s:if test="%{#useFerTyp!=1000000 && #appTyp!=2}">
    <td><s:property value="%{infoFert.get('nameFerTyp')}" /></td>
</s:if> 
<s:elseif test="%{#useFerTyp==1000000 || #appTyp==2}">
    <td><s:property value="%{infoFert.get('otherProduct')}" /></td>
</s:elseif>               
