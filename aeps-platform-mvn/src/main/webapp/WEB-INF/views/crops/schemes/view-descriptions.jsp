<%@page import="java.util.HashMap"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users userc = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrDaoc = new UsersDao(); %>
<% String coCodec = (String) session.getAttribute(APConstants.COUNTRY_CODE); %>

<div id="divMessComment"></div>

<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<% Integer entTypeObsm = new EntitiesDao().getEntityTypeId(userc.getIdUsr()); %>
<div class="panel-body">
    <s:form id="formCropComment" action="saveComment" cssClass="form-horizontal">
        <fieldset>
            <legend> <s:property value="getText('title.formdesrendimiento.desc')" /></legend>
            <div class="form-group">
                <s:hidden name="idCrop"/>
                <s:hidden name="typeCrop"/>
                <s:hidden name="actExe"/>

                <%--<div class="row"> 
                    <div  class="span5">
                        <div class="form-group">

                            <div class="controls radioSelect">
                                <s:radio
                                    name="irr.costRentedquestionIrr"
                                    list="#{'4':'Por encima', '3':'Lo esperado', '2':'Por debajo', '1':'Perdida de lote'}"                                                                         

                                    />
                            </div>
                        </div>
                    </div>
                </div>    --%>
                <div>   


                    <div class="col-md-2" id="radioSel"> 
                        <!--<div class="radio">-->
                            <s:radio  list="#{'1':'Por encima', '2':'Lo esperado', '3':'Por debajo', '4':'Perdida del lote'}" cssClass="radio changesRadio" name="event.performanceProEve" /> 

                        <!--</div>-->             
                    </div>    

                    <div class="col-md-1">
                        <div class="table-responsive">
                            <table>
                                <tr> <td><i class="icon-smile icon-2x"></i></td>
                                </tr>
                                <tr><td><i class="icon-meh icon-2x"></i></td>
                                </tr>
                                <tr> <td><i class="icon-frown icon-2x"></i></td>
                                </tr>
                                <tr> <td><i class="icon-thumbs-down-alt icon-2x"></i></td>

                                </tr>
                            </table>
                        </div>
                    </div> 



                    <div class="col-md-5">
                        <div>                                           
                            <label>
                                <s:property value="getText('title.formdescriptionrendimiento.desc')" />:
                            </label>
                            <div class="controls">   
                                <s:textarea rows="5" cssClass="form-control" name="event.commentPerformanceProEve"></s:textarea>
                            </div>
                        </div>
                    </div>

            </fieldset>
    </s:form>	
    <div style="margin-bottom: 15px" id="divBtMonitoring">
        <% String actExeCom = String.valueOf(request.getAttribute("actExe")); %>
        <% if ((actExeCom == "create" && usrDaoc.getPrivilegeUser(userc.getIdUsr(), "crop/create")) || (actExeCom == "modify" && usrDaoc.getPrivilegeUser(userc.getIdUsr(), "crop/modify"))) { %>
            <% if (entTypeObsm != 3) { %>
                <sj:submit type="button" formIds="formCropComment" cssClass="btn btn-default btn-initial btn-lg"  onclick=" addMessageProcess()"  targets="divMessage" onCompleteTopics="completeComment" ><i class="icon-save"></i> Guardar rendimiento</sj:submit>
            <% } %>
        <% }%>
    </div>
</div>
<script>
    $.subscribe('completeComment', function(event, data) {
        completeFormCrop('', 'formCropComment', 'divMessComment', event.originalEvent.request.responseText);
    });
</script>
<!--<hr class="divider-inner-separator">-->
<div id="divListDes">
    <%--<%@ include file="../descriptions/info-descriptions.jsp" %>--%>            
</div>