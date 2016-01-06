<s:date name="dateCon" format="MM/dd/yyyy" var="dateTransformRowCon"/>
<td rowspan="${contControls}"><s:property value="%{#dateTransformRowCon}" /></td>
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
<s:elseif test="%{#conType==4 || #conType==8}">
    <td>(<s:property value="getText('td.machined.control')" />)</td>  
    <td><s:property value="%{infoControl.get('doseCon')}" /></td>    
</s:elseif>
<s:elseif test="%{#conType==5 || #conType==9}">
    <td>(<s:property value="getText('td.manual.control')" />)</td>
    <td><s:property value="%{infoControl.get('doseCon')}" /></td>    
</s:elseif>
<td rowspan="${contControls}">
    <% if (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "crop/modify") || (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "crop/delete"))) { %>
        <% if (entTypeProId!=3) { %>
            <div class="btn-group">
                <% if (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "crop/modify")) { %>
                    <a class="btn btn-small btn-edit" title="<s:property value="getText('link.controledit.control')" />" onclick="viewForm('/crop/showCon.action?action=modify&idCrop=${idCrop}', 'idCon', ${idCon}, '<s:property value="getText('title.controledit.control')" />', 1050, 550);"><i class="icon-pencil"></i></a>
                <% } %>
                <% if (usrProDao.getPrivilegeUser(userPro.getIdUsr(), "crop/delete")) { %>
                    <a class="btn btn-small delete_rows_dt btn-delete" title="<s:property value="getText('link.controldelete.control')" />" onclick="showDialogDelete(this, 'confirm_dialog_con', '/crop/deleteCon.action?idCon=${idCon}', '/crop/searchCon.action?idCrop=${idCrop}', 'divPro', 'divListPro'); $('.confirm_yes').click(function(){setTimeout(function() {showTimeline('/crop/viewInfoTime.action?idCrop=${idCrop}', 'divInfoTimeline', 'timeline')}, 2000);});"><i class="icon-trash"></i></a>
                <% } %>
            </div>
        <% } %>
    <% } %>
</td>
