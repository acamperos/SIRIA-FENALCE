<% String classCostResRow = "hideInfo"; %>
               <s:set name="costRes" value="costCrop"/>
               <s:if test="%{#costRes==1}">
                   <% classCostResRow = "";  %>
               </s:if>   

<s:date name="dateResMan" format="MM/dd/yyyy" var="dateTransformRowRes"/>
<td><s:property value="%{#dateTransformRowRes}" /></td>
<td><s:property value="residualsResMan" /></td>
<td><s:property value="otherResidualsResMan"/></td>
<td class="<%= classCostResRow %>"> <s:property value="costResMan"/></td>
<td>
    <% if (usrResDao.getPrivilegeUser(userRes.getIdUsr(), "crop/modify") || (usrResDao.getPrivilegeUser(userRes.getIdUsr(), "crop/delete"))) { %>
        <% if (entTypeResId!=3) { %>
            <div class="btn-group">
                <% if (usrResDao.getPrivilegeUser(userRes.getIdUsr(), "crop/modify")) { %>
                    <a class="btn btn-small btn-default btn-edit" title="<s:property value="getText('link.residualedit.residual')" />" onclick="viewForm('/crop/showResidual.action?action=modify&idCrop=${idCrop}', 'idResMan', ${idResMan}, '<s:property value="getText('title.residualedit.residual')" />', 1050, 550);"><i class="icon-pencil"></i></a>
                <% } %>
                <% if (usrResDao.getPrivilegeUser(userRes.getIdUsr(), "crop/delete")) { %>
                    <a class="btn btn-small btn-default delete_rows_dt btn-delete" title="<s:property value="getText('link.residualdelete.residual')" />" onclick="showDialogDeleteRes(this, 'confirm_dialog_res', '/crop/deleteResidual.action?idResMan=${idResMan}', '/crop/searchResidual.action?idCrop=${idCrop}', 'divRes', 'divListRes'); $('.confirm_si_res').click(function(){setTimeout(function() {showTimeline('/crop/viewInfoTime.action?idCrop=${idCrop}', 'divInfoTimeline', 'timeline')}, 2000);});"><i class="icon-trash"></i></a>
                <% } %>
            </div>
        <% } %>
    <% } %>
</td>
<script>
    //$("#formCropRes_resMan_costResMan").maskMoney({suffix: ' $'});
</script>
