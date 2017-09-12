<%@page import="java.util.HashMap"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users user  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrDao = new UsersDao(); %>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <s:actionerror theme="bootstrap"/>
        <s:actionmessage theme="bootstrap"/>
        <s:fielderror theme="bootstrap"/>
        <div  id="divMonForm">
            <s:form id="formCropMonGen" action="saveMon" cssClass="form-horizontal">
                <fieldset>
                    <legend><s:property value="getText('title.formmonitoring.monitoring')" /></legend>
                    <div class="row">
                        <div class="col-md-9">
                            <s:hidden name="idCrop"/>
                            <s:hidden name="typeCrop"/>
                            <%--<s:hidden name="lanSel"/>--%>
                            <s:hidden name="actExe"/>
                            <s:hidden name="mon.idMon"/>
                            <div class="form-group">
                                <label for="formCropMonGen_mon_dateMon" class="col-md-6 req">
                                    <s:property value="getText('text.datemonitoring.monitoring')" />:
                                </label>
                                <div class="date controls col-md-6">
                                    <s:date name="mon.dateMon" format="MM/dd/yyyy" var="dateTransformMon"/>
                                    <s:textfield name="mon.dateMon" class="form-control" value="%{#dateTransformMon}" readonly="true"/>
                                    <span class="prefix sec">&nbsp;[mm/dd/yyyy]</span>
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                </div>                          
                            </div>                          
                        </div>       
                    </div>
                    <div class="table-responsive w-box">
                        <table class="table table-bordered table-condensed">
                            <tbody>
                                <tr>
                                    <td style="width: 25%;"></td>
                                    <th style="width: 25%;"><s:property value="getText('td.pest.monitoring')" /></th>
                                    <th style="width: 25%;"><s:property value="getText('td.disease.monitoring')" /></th>
                                    <th style="width: 25%;"><s:property value="getText('td.weed.monitoring')" /></th>
                                </tr>
                                <tr>
                                    <th><s:property value="getText('td.monitoringto.monitoring')" /></th>
                                    <td>
                                        <div class="form-group col-md-12">
                                            <div class="radioSelect">
                                                <s:radio list="#{'true':'Si', 'false':'No'}" name="mon.monitorPestsMon" onclick="optSel('mon.monitorPestsMon', 'divMonPest')" />                                                
                                            </div>
                                            <div id="divMonPest" class="hideInfo">
                                                <s:select
                                                    name="mon.pests.idPes"
                                                    list="type_pest_con"
                                                    cssClass="form-control"
                                                    listKey="idPes" 
                                                    listValue="namePes"            
                                                    headerKey="-1" 
                                                    headerValue="---"
                                                    onchange="showOtherElement(this.value, 'divNewObjControlPes')"
                                                />
                                                <s:textfield name="mon.perImpactPestMon" cssClass="form-control" placeholder="%{getText('text.percentimpactpest.monitoring')}" />
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group col-md-12">
                                            <div class="radioSelect">
                                                <s:radio list="#{'true':'Si', 'false':'No'}" name="mon.monitorDiseasesMon" onclick="optSel('mon.monitorDiseasesMon', 'divMonDisease')"/>                                                
                                            </div>
                                            <div id="divMonDisease" class="hideInfo">
                                                <s:select
                                                    name="mon.diseases.idDis"
                                                    list="type_dis_con" 
                                                    cssClass="form-control"
                                                    listKey="idDis" 
                                                    listValue="nameDis"            
                                                    headerKey="-1" 
                                                    headerValue="---"
                                                    onchange="showOtherElement(this.value, 'divNewObjControlDis')"
                                                />
                                                <s:textfield name="mon.perImpactDiseaseMon" cssClass="form-control" placeholder="%{getText('text.percentimpactdis.monitoring')}" />
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group col-md-12">
                                            <div class="radioSelect">
                                                <s:radio list="#{'true':'Si', 'false':'No'}" name="mon.monitorWeedsMon" onclick="optSel('mon.monitorWeedsMon', 'divMonWeed')"/>                                                
                                            </div>
                                            <div id="divMonWeed" class="hideInfo">
                                                <s:select
                                                    name="mon.weeds.idWee"
                                                    list="type_weeds_con"
                                                    cssClass="form-control"
                                                    listKey="idWee" 
                                                    listValue="nameWee"            
                                                    headerKey="-1" 
                                                    headerValue="---"
                                                    onchange="showOtherElement(this.value, 'divNewObjControlWee')"
                                                />
                                                <s:textfield name="mon.perImpactWeedMon" cssClass="form-control" placeholder="%{getText('text.percentimpactweed.monitoring')}" />                                            
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <fieldset>
                        <legend>Observaciones</legend>                   
                        <div class="row">
                            <div class="col-md-9">
                                <div  class="form-group">
                                    <div class="controls col-md-12">                                      
                                        <s:textarea rows="5" name="mon.commentMon" cssClass="form-control"></s:textarea>
                                    </div>

                                </div>        
                            </div>                     
                        </div>    
                    </fieldset>
                    <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                    <script>
                        optSel('mon.monitorPestsMon', 'divMonPest');
                        optSel('mon.monitorDiseasesMon', 'divMonDisease');
                        optSel('mon.monitorWeedsMon', 'divMonWeed');
                        $("#formCropMonGen_mon_dateMon").datepicker({dateFormat: 'mm/dd/yy'});
                        $("#formCropMonGen_mon_dateMon").mask("99/99/9999", {placeholder: " "});
                        $("#formCropMonGen_mon_perImpactPestMon").numeric({negative: false});
                        $("#formCropMonGen_mon_perImpactDiseaseMon").numeric({negative: false});
                        $("#formCropMonGen_mon_perImpactWeedMon").numeric({negative: false});
                    </script>
                    <div id="divBtMon">
                        <% String actExe   = String.valueOf(request.getAttribute("actExe")); %>
                        <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "crop/modify"))) { %>
                            <sj:submit type="button" cssClass="btn btn-initial btn-lg" onclick="searchDecimalNumber('formCropMonGen'); addMessageProcess()" targets="divMessage" onCompleteTopics="completeMon" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.savemonitoring.monitoring')" /></sj:submit>
                        <% } %>
                        <button class="btn btn-default btn-lg" onclick="resetForm('formCropMonGen'); closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                    </div>
                </fieldset>
                                                    
            </s:form>	
            <script>       
                $.ui.dialog.prototype._focusTabbable = function(){};
                $.subscribe('completeMon', function(event, data) {    
                    if(event.handled !== true){
                        completeFormGetting('dialog-form', 'formCropMonGen', 'divMon', event.originalEvent.request.responseText);
                        setTimeout(function() {
                            showInfo("/crop/searchMon.action?idCrop="+$("#formCropMonGen_idCrop").val(), "divListMonGen");
                            showTimeline("/crop/viewInfoTime.action?idCrop="+$("#formCropMonGen_idCrop").val(), "divInfoTimeline", "timeline");
                        }, 2000);
                        event.handled = true;
                    }    
                });
            </script>
        </div>
        <div class="row" id="divListMonForm"></div>
    </body>
</html>
