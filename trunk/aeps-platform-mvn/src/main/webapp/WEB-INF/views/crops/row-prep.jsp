<s:date name="datePrep" format="dd/MM/yyyy" var="dateTransformRowPrep"/>
<td><s:property value="%{#dateTransformRowPrep}" /></td>
<td><s:property value="depthPrep" /></td>
<td><s:property value="namePrep" /></td>
<td><s:property value="otherNamePrep" /></td>
<td><s:property value="residualsPrep" /></td>
<td><s:property value="otherResidualsPrep" /></td>
<td>
    <% if (usrPrpDao.getPrivilegeUser(userPrp.getIdUsr(), "crop/modify") || (usrPrpDao.getPrivilegeUser(userPrp.getIdUsr(), "crop/delete"))) { %>
        <div class="btn-group">
            <% if (usrPrpDao.getPrivilegeUser(userPrp.getIdUsr(), "crop/modify")) { %>
                <a class="btn btn-small" title="Editar Preparaci�n" onclick="viewForm('/aeps-plataforma-mvn/crop/showPrep.action?action=modify&idCrop=${idCrop}', 'idPrep', ${idPrep}, 'Editar Preparaci�n', 1050, 550);"><i class="icon-pencil"></i></a>
            <% } %>
            <% if (usrPrpDao.getPrivilegeUser(userPrp.getIdUsr(), "crop/delete")) { %>
                <a class="btn btn-small delete_rows_dt" title="Borrar Preparaci�n" onclick="showDialogDelete(this, 'confirm_dialog_prep', 'deletePrep.action?idPrep=<s:property value="idPrep" />', 'searchPrep.action?idCrop=${idCrop}', 'divPrep', 'divListPrep');"><i class="icon-trash"></i></a>
            <% } %>
        </div>
    <% } %>
</td>