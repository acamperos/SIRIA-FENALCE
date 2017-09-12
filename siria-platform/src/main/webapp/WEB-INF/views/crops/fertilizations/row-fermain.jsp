<s:date name="dateFer" format="MM/dd/yyyy" var="dateTransformRowFer"/>
<td rowspan="${contFert}"><s:property value="%{#dateTransformRowFer}" /></td>
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
<td rowspan="${contFert}">
    <% if (usrFerDao.getPrivilegeUser(userFer.getIdUsr(), "crop/modify") || (usrFerDao.getPrivilegeUser(userFer.getIdUsr(), "crop/delete"))) { %>
        <% if (entTypeFerId!=3) { %>
            <div class="btn-group">
                <% if (usrFerDao.getPrivilegeUser(userFer.getIdUsr(), "crop/modify")) { %>
                    <a class="btn btn-small btn-default btn-edit" title="<s:property value="getText('link.fertedit.fertilization')" />" onclick="viewFormFer('/crop/showFer.action?action=modify&idCrop=${idCrop}', 'idFer', ${idFer},'typeCrop', '${typeCrop}', '<s:property value="getText('title.fertedit.fertilization')" />', 1050, 550);"><i class="icon-pencil"></i></a>
                <% } %>
                <% if (usrFerDao.getPrivilegeUser(userFer.getIdUsr(), "crop/delete")) { %>
                    <a class="btn btn-small btn-default delete_rows_dt btn-delete" title="<s:property value="getText('link.fertdelete.fertilization')" />" onclick="showDialogDelete(this, 'confirm_dialog_fergen', '/crop/deleteFer.action?idFer=${idFer}', '/crop/searchFer.action?idCrop=${idCrop}', 'divFerGen', 'divListFer'); $('.confirm_yes').click(function(){setTimeout(function() {showTimeline('/crop/viewInfoTime.action?idCrop=${idCrop}', 'divInfoTimeline', 'timeline')}, 2000);});"><i class="icon-trash"></i></a>
                <% } %>
            </div>
        <% } %>
    <% } %>
</td>
