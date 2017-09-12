<s:date name="dateDesPro" format="MM/dd/yyyy" var="dateTransformRowDes"/>
<td><s:property value="%{#dateTransformRowDes}" /></td>
<td><s:property value="observationDesPro" /></td>
<td>
    <% if (usrDesDao.getPrivilegeUser(userDes.getIdUsr(), "crop/modify") || (usrDesDao.getPrivilegeUser(userDes.getIdUsr(), "crop/delete"))) { %>
        <% if (entTypeDesId!=3) { %>
            <div class="btn-group">
                <% if (usrDesDao.getPrivilegeUser(userDes.getIdUsr(), "crop/modify")) { %>
                    <a class="btn btn-small btn-default btn-edit" title="<s:property value="getText('link.obsedit.observation')" />" onclick="viewForm('/crop/showDescrip.action?action=modify&idCrop=${idCrop}', 'idDesPro', ${idDesPro}, '<s:property value="getText('title.obsedit.observation')" />', 1050, 550);"><i class="icon-pencil"></i></a>
                <% } %>
                <% if (usrDesDao.getPrivilegeUser(userDes.getIdUsr(), "crop/delete")) { %>
                    <a class="btn btn-small btn-default delete_rows_dt btn-delete" title="<s:property value="getText('link.obsdelete.observation')" />" onclick="showDialogDelete(this, 'confirm_dialog_des', '/crop/deleteDescrip.action?idDesPro=${idDesPro}', '/crop/searchDescrip.action?idCrop=${idCrop}', 'divDes', 'divListDes'); $('.confirm_yes').click(function(){setTimeout(function() {showTimeline('/crop/viewInfoTime.action?idCrop=${idCrop}', 'divInfoTimeline', 'timeline')}, 2000);});"><i class="icon-trash"></i></a>
                <% } %>
            </div>
        <% } %>
    <% } %>
</td>
