<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String valOrg = String.valueOf(request.getAttribute("numRows")); %>
<% int numRowsOrg = Integer.parseInt(valOrg); %>
<% if (numRowsOrg == 0) { %>
<% numRowsOrg = Integer.parseInt(String.valueOf(request.getParameter("numRows"))); %>
<% } %>
<% request.setAttribute("formOrg", "orgFert[" + (numRowsOrg - 1) + "]"); %>
<% request.setAttribute("formOrgId", "formCropFer_orgFert_" + (numRowsOrg - 1)); %>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% String coCodeOrg = (String) session.getAttribute(APConstants.COUNTRY_CODE);%>
<tr value="<%= numRowsOrg%>" id="RowAdditOrg_<%= numRowsOrg%>">
    <td>
        <div id="divOrganicoFer_<%= numRowsOrg%>" value="<%= numRowsOrg%>">
            <div class="row">
                <div class="col-md-6">
                    <s:hidden name="%{#attr.formOrg}.idOrgFer"/>
                    <div class="form-group">
                        <label for="${formOrgId}__organicFertilizers_idOrgFer" class="col-md-6 req">
                            <s:property value="getText('select.orgfertilizer.fertilization')" />:
                        </label>
                        <div class="controls col-md-6">
                            <s:select
                                name="%{#attr.formOrg}.organicFertilizers.idOrgFer"
                                value="%{#attr.organicFertilizers.idOrgFer}"
                                cssClass="form-control"
                                list="type_prod_org" 
                                listKey="idOrgFer" 
                                listValue="nameOrgFer"            
                                headerKey="-1" 
                                headerValue="---"
                                onchange="showOtherElement(this.value, 'divNewProOrg')"
                                />
                        </div>                         
                    </div>                          
                </div> 
                <% String classCostOrg = "hideInfo"; %>
                <s:set name="costOrg" value="costCrop"/>
                <s:if test="%{#costOrg==1}">
                    <% classCostOrg = "";%>
                </s:if>   
                <div class="col-md-6 <%= classCostOrg%>">
                    <div class="form-group">
                        <s:label for="formRowChemical_fer" cssClass="col-md-6" value="%{getText('select.chemfertilizer.formapp')}:"></s:label>
                            <div class="controls col-md-6">
                            <s:select
                                cssClass="form-control"
                                id="%{#attr.formOrgId}__costFormAppOrgFer"
                                name="%{#attr.formOrg}.costFormAppOrgFer"
                                value="%{#attr.costFormAppOrgFer}"             
                                list="#{'0':'---','1':'Manual', '2':'Mecánica','3':'Aérea'}"            
                                headerKey="-1" 
                                />

                        </div>
                    </div> 
                </div>


            </div> 
            <% String classNewProOrg = "hideInfo"; %>
            <s:set name="idCheOrg" value="%{#attr.organicFertilizers.idOrgFer}"/>
            <s:if test="%{#idCheOrg==1000000}">
                <% classNewProOrg = "";%>
            </s:if> 
            <div class="<%= classNewProOrg%>" id="divNewProOrg">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="${formOrgId}__otherProductOrgFer" class="col-md-6 req">
                                <s:property value="getText('text.otherproductorg.fertilization')" />:
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield cssClass="form-control" name="%{#attr.formOrg}.otherProductOrgFer" value="%{#attr.otherProductOrgFer}"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">


                <div class="<%= classCostOrg%>"> 
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="${formOrgId}__costAppCheFer" class="col-md-6">
                                <s:property value="getText('text.costapp.fertilization')" />
                                <button type="button" class="btn btn-initial"><b>(Ha.)</b></button> :
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield cssClass="form-control" name="%{#attr.formOrg}.costAppOrgFer" type="number" id="%{#attr.formOrgId}__costAppOrgFer" value="%{#attr.costAppOrgFer}" maxlength="14"/>
                            </div>                         
                        </div>                          
                    </div> 
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="${formOrgId}__amountProductUsedOrgFer" class="col-md-6 req">
                            <s:property value="getText('text.amountproductorg.fertilization')" /> 
                            <% if (coCodeOrg.equals("CO")) { %>
                            <button type="button" class="btn btn-initial"><b>(kg/ha)</b></button>:
                            <% } else if (coCodeOrg.equals("NI")) { %>
                            <button type="button" class="btn btn-initial"><b>(q/mz)</b></button>:
                            <% }%>
                        </label>
                        <div class="controls col-md-6">
                            <s:textfield cssClass="form-control" name="%{#attr.formOrg}.amountProductUsedOrgFer" type="number" value="%{#attr.amountProductUsedOrgFer}"/>
                        </div>                         
                    </div>                          
                </div> 

            </div>     
            <div class="row">
                <div class="<%= classCostOrg%>"> 
                    <div class="col-md-6" >
                        <div class="form-group">   
                            <label for="${formOrgId}__costProductOrgFer" class="col-md-6">
                                <s:property value="getText('text.costproduct.fertilization')" />
                                <button type="button" class="btn btn-initial"><b>(Ha.)</b></button>:
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield cssClass="form-control" name="%{#attr.formOrg}.costProductOrgFer" type="number" id="%{#attr.formOrgId}__costProductOrgFer" value="%{#attr.costProductOrgFer}" maxlength="14"/>
                            </div>                         
                        </div>                          
                    </div> 
                </div> 
                <div class="col-md-1">
                    <a class="btn btn-small btn-default delete_rows_dt" title="<s:property value="getText('link.removeorgfert.fertilization')" />" style="margin-bottom:1.2em" onclick="$('#RowAdditOrg_<%= numRowsOrg%>').remove();"><i class="icon-trash"></i></a>
                </div>
            </div>   
            <script>
                var formOrgId = '<%= request.getAttribute("formOrgId")%>';
                $("#" + formOrgId + "__amountProductUsedOrgFer").numeric({negative: false});
                $("#" + formOrgId + "__amountProductUsedOrgFer").val(parsePointSeparated($("#" + formOrgId + "__amountProductUsedOrgFer").val()));

                $("#__costAppOrgFer").maskMoney({prefix: ' $'});
                $("#" + formOrgId + "__costAppOrgFer").maskMoney({prefix: ' $'});
                $("#__costProductOrgFer").maskMoney({prefix: ' $'});
                $("#" + formOrgId + "__costProductOrgFer").maskMoney({prefix: ' $'});



            </script>
        </div>
    </td>
</tr>
