<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users user = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrDao = new UsersDao(); %>
<% String coCode   = (String) session.getAttribute(APConstants.COUNTRY_CODE); %>
<html>
    <head></head>
    <body>
        <s:actionerror theme="bootstrap"/>
        <s:actionmessage theme="bootstrap"/>
        <s:fielderror theme="bootstrap"/>
        <div id="divFarmsForm">
            <div class="col-md-7">	
                <s:form id="formFarm" action="saveFarm.action" cssClass="form-horizontal formClassProperty">
                    <fieldset>
                        <legend><s:property value="getText('title.formfarm.farm')" /></legend>
                        <s:hidden name="typeEnt"/>
                        <%--<s:hidden name="lanSel"/>--%>
                        <s:if test="%{typeEnt==2}">
                            <s:hidden name="idProducer"/>                                
                            <s:hidden name="name_producer"/>
                        </s:if>
                        <s:else>
                            <div class="form-group">
                                <s:hidden name="idProducer"/>                                
                                <label for="formFarm_name_producer" class="col-md-3 req">
                                    <s:property value="getText('text.selproducer.farm')" />:
                                    <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.useoptiontoselaproducer.farm')" />" data-title="<s:property value="getText('help.informationproducer.farm')" />" data-placement="right" data-trigger="hover"></i>
                                </label>
                                <div class="controls col-md-6 input-group">
                                    <s:textfield name="name_producer" readonly="true" cssClass="form-control" onclick="listInfo('/viewProducer.action?selected=property', 'formFarm_name_producer', 'formFarm_idProducer', 'divListFarmsForm', 'divFarmsForm')" />
                                    <a class="btn btn-default input-group-addon" onclick="listInfo('/viewProducer.action?selected=property', 'formFarm_name_producer', 'formFarm_idProducer', 'divListFarmsForm', 'divFarmsForm')"><i class="icon-search"></i></a>
                                </div>  
                            </div>   
                        </s:else>                        
                        <div class="form-group">
                            <s:hidden name="idFarm"/>
                            <label for="formFarm_name_property" class="col-md-3 req">
                                <s:property value="getText('text.namefarm.farm')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.writenamefarm.farm')" />." data-title="<s:property value="getText('help.informationfarm.farm')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield name="name_property" cssClass="form-control" />
                            </div>  
                        </div>
                        <div class="form-group">
                            <label for="formFarm_latitude_property" class="col-md-3 req">
                                <s:property value="getText('text.latitudedecimal.farm')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.latitudedecimal.farm')" />." data-title="<s:property value="getText('help.latitudeinfodecimals.farm')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield cssClass="form-control" type="number" id="formFarm_latitude_property" name="latitude_property" onkeyup="generateDegrees('formFarm_latitude_property', 'formFarm_latitude_degrees_property', 'formFarm_latitude_minutes_property', 'formFarm_latitude_seconds_property')"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="formFarm_latitude_degrees_property" class="col-md-3 req">
                                <s:property value="getText('text.latitudedegree.farm')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.latitudedegree.farm')" />." data-title="<s:property value="getText('help.latitudeinfodegrees.farm')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls form-inline col-md-9">
                                <div class="row">
                                    <div class="col-md-2 input-group controls" style="width: 120px;">
                                        <span class="input-group-addon"><s:property value="getText('text.degrees.farm')" /></span>
                                        <input type="text" class="form-control" name="latitude_degrees_property" onkeyup="generateDecimals('formFarm_latitude_property', 'formFarm_latitude_degrees_property', 'formFarm_latitude_minutes_property', 'formFarm_latitude_seconds_property');" id="formFarm_latitude_degrees_property" class="input-degrees"/>
                                    </div>
                                    <div class="col-md-2 input-group controls" style="width: 120px;">
                                        <span class="input-group-addon"><s:property value="getText('text.minutes.farm')" /></span>
                                        <input type="text" class="form-control" name="latitude_minutes_property" onkeyup="generateDecimals('formFarm_latitude_property', 'formFarm_latitude_degrees_property', 'formFarm_latitude_minutes_property', 'formFarm_latitude_seconds_property'); checkValue('formFarm_latitude_minutes_property', 59);" id="formFarm_latitude_minutes_property" class="input-degrees"/>
                                    </div>
                                    <div class="col-md-2 input-group controls" style="width: 140px;">
                                        <span class="input-group-addon"><s:property value="getText('text.seconds.farm')" /></span>
                                        <input type="text" class="form-control" name="latitude_seconds_property" onkeyup="generateDecimals('formFarm_latitude_property', 'formFarm_latitude_degrees_property', 'formFarm_latitude_minutes_property', 'formFarm_latitude_seconds_property'); checkValueSecond('formFarm_latitude_seconds_property', 60);" id="formFarm_latitude_seconds_property" class="input-degrees"/>
                                    </div>
                                </div>
                            </div>
                        </div>                            
                        <div class="form-group">
                            <label for="formFarm_length_property" class="col-md-3 req">
                                <s:property value="getText('text.longitudedecimal.farm')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.longitudedecimal.farm')" />." data-title="<s:property value="getText('help.longitudedecimal.farm')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield cssClass="form-control" type="number" id="formFarm_length_property" name="length_property" onkeyup="generateDegrees('formFarm_length_property', 'formFarm_length_degrees_property', 'formFarm_length_minutes_property', 'formFarm_length_seconds_property')"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="formFarm_length_degrees_property" class="col-md-3 req">
                                <s:property value="getText('text.longitudedegree.farm')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.longitudedegree.farm')" />." data-title="<s:property value="getText('help.longitudeinfodegrees.farm')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls form-inline col-md-9">
                                <div class="row">
                                    <div class="col-md-2 input-group controls" style="width: 120px;">
                                        <span class="input-group-addon"><s:property value="getText('text.degrees.farm')" /></span>
                                        <input type="text" class="form-control" name="length_degrees_property" onkeyup="generateDecimals('formFarm_length_property', 'formFarm_length_degrees_property', 'formFarm_length_minutes_property', 'formFarm_length_seconds_property');" id="formFarm_length_degrees_property" class="input-degrees"/>
                                    </div>
                                    <div class="col-md-2 input-group controls" style="width: 120px;">
                                        <span class="input-group-addon"><s:property value="getText('text.minutes.farm')" /></span>
                                        <input type="text" class="form-control" name="length_minutes_property" onkeyup="generateDecimals('formFarm_length_property', 'formFarm_length_degrees_property', 'formFarm_length_minutes_property', 'formFarm_length_seconds_property'); checkValue('formFarm_length_minutes_property', 59);" id="formFarm_length_minutes_property" class="input-degrees"/>
                                    </div>
                                    <div class="col-md-2 input-group controls" style="width: 140px;">
                                        <span class="input-group-addon"><s:property value="getText('text.seconds.farm')" /></span>
                                        <input type="text" class="form-control" name="length_seconds_property" onkeyup="generateDecimals('formFarm_length_property', 'formFarm_length_degrees_property', 'formFarm_length_minutes_property', 'formFarm_length_seconds_property'); checkValueSecond('formFarm_length_seconds_property', 60);" id="formFarm_length_seconds_property" class="input-degrees"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-initial btn-space" onclick="viewPosition('/viewPositionFarm.action', 'formFarm', 'latitude_property', 'formFarm_latitude_property', 'length_property', 'formFarm_length_property', 'divFarmsForm', 'divListFarmsForm');">
                            <i class="icon-map-marker" style="font-size: 18px"></i> <s:property value="getText('button.showgeolocation.farm')" />
                        </button>
                        <div class="form-group">
                            <label for="formFarm_altitude_property" class="col-md-3 req">
                                <s:property value="getText('text.altitudemeters.farm')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.altitudemeters.farm')" />." data-title="<s:property value="getText('help.altitudemeters.farm')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls col-md-6">
                                <s:textfield name="altitude_property" type="number" cssClass="form-control" />
                            </div>  
                        </div>                         
                        <div class="form-group">
                            <label for="formFarm_depFar" class="col-md-3 req">
                                <s:property value="getText('select.department.farm')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.department.farm')" />." data-title="<s:property value="getText('help.departmentinfo.farm')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls col-md-6">
                                <s:select
                                    name="depFar" 
                                    list="department_property" 
                                    listKey="idDep" 
                                    listValue="nameDep" 
                                    cssClass="form-control"
                                    headerKey=" " 
                                    headerValue="---"
                                    onchange="chargeValues('/comboMunicipalities.action', 'depId', this.value, 'formFarm_cityFar', 'divMessage')"
                                />
                            </div>  
                        </div>
                        <div class="form-group">
                            <label for="formFarm_cityFar" class="col-md-3 req">
                                <s:property value="getText('select.municipality.farm')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.municipality.farm')" />." data-title="<s:property value="getText('help.municipalityinfo.farm')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls col-md-6">
                                <s:select
                                    list="city_property" 
                                    listKey="idMun" 
                                    listValue="nameMun" 
                                    cssClass="form-control"
                                    headerKey=" " 
                                    headerValue="---"
                                    name="cityFar" 
                                />
                            </div>  
                        </div>
                        <% if (coCode.equals("CO")) { %>                 
                            <div class="form-group">
                                <label for="formFarm_lane_property" class="col-md-3 req">
                                    <s:property value="getText('text.lane.farm')" />:
                                    <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.lane.farm')" />." data-title="<s:property value="getText('help.laneinfo.farm')" />" data-placement="right" data-trigger="hover"></i>
                                </label>
                                <div class="controls col-md-6">
                                    <s:textfield name="lane_property" cssClass="form-control" />
                                </div>  
                            </div> 
                        <% } %>
                        <div class="form-group">
                            <label for="formFarm_direction_property" class="col-md-3">
                                <s:property value="getText('text.direction.farm')" />:
                                <i class="icon-info-sign s2b_tooltip pop-over" data-content="<s:property value="getText('desc.direction.farm')" />." data-title="<s:property value="getText('help.directioninfo.farm')" />" data-placement="right" data-trigger="hover"></i>
                            </label>
                            <div class="controls col-md-6">
                                <s:textarea rows="5" cssClass="form-control" name="direction_property"></s:textarea>
                            </div>  
                        </div>   
                    </fieldset>
                    <p class="warnField reqBef" style="width: 100%"><s:property value="getText('label.requirefields')" /></p>
                    <div> 
                        <s:hidden name="page" id="formFarm_page" />
                        <s:hidden name="actExe"/>
                        <s:hidden name="viewInfo"/>
                        <% String actExe   = String.valueOf(request.getAttribute("actExe")); %>
                        <% if ((actExe.equals("create") && usrDao.getPrivilegeUser(user.getIdUsr(), "farm/create")) || (actExe.equals("modify") && usrDao.getPrivilegeUser(user.getIdUsr(), "farm/modify"))) { %>
                            <sj:submit id="btnFarm" type="button" cssClass="btn btn-initial btn-lg" onclick="searchDecimalNumber('formFarm'); addMessageProcess()" targets="divMessage" onCompleteTopics="completeFarm" validate="true" validateFunction="validationForm"><i class="icon-save"></i>  <s:property value="getText('button.savefarm.farm')" /></sj:submit>
                        <% } %>
                        <button class="btn btn-lg btn-default bt_cancel_farm" onclick="resetForm('formFarm'); closeWindow();"><i class="icon-ban-circle"></i>  <s:property value="getText('button.cancel')" /></button>
                    </div>    
                </s:form>        
                <script>
//                    var page   = $("#formFarm_page").val();                    
                    // $.mask.definitions['i'] = "[-0-9]";
                    $.mask.definitions['f'] = "[-.0-9]";
                    $("#formFarm_latitude_property").numeric();
                    $("#formFarm_length_property").numeric();
                    $("#formFarm_latitude_property").val(parsePointSeparated($("#formFarm_latitude_property").val()));
                    $("#formFarm_length_property").val(parsePointSeparated($("#formFarm_length_property").val()));           
                    
                    $("#formFarm_altitude_property").numeric({decimal: false, negative: false});
                    $("#formFarm_length_degrees_property").numeric({decimal: false});
                    $("#formFarm_length_minutes_property").numeric({decimal: false});
                    $("#formFarm_length_seconds_property").numeric();
                    if ($("#formFarm_length_minutes_property").val()>60) {                        
                        $("#formFarm_length_minutes_property").val('');
                    }
                    if ($("#formFarm_length_seconds_property").val()>60) {                        
                        $("#formFarm_length_seconds_property").val('');
                    }
                    
                    $("#formFarm_altitude_property").val(parseValueInt( $("#formFarm_altitude_property").val()));
                    
                    $("#formFarm_latitude_degrees_property").numeric({decimal: false});
                    $("#formFarm_latitude_minutes_property").numeric({decimal: false});
                    $("#formFarm_latitude_seconds_property").numeric();
                    if ($("#formFarm_latitude_minutes_property").val()>60) {                        
                        $("#formFarm_latitude_minutes_property").val('');
                    }
                    if ($("#formFarm_latitude_seconds_property").val()>60) {                        
                        $("#formFarm_latitude_seconds_property").val('');
                    }
                    generateDegrees('formFarm_latitude_property', 'formFarm_latitude_degrees_property', 'formFarm_latitude_minutes_property', 'formFarm_latitude_seconds_property');
                    generateDegrees('formFarm_length_property', 'formFarm_length_degrees_property', 'formFarm_length_minutes_property', 'formFarm_length_seconds_property');
                    $.subscribe('completeFarm', function(event, data) {
                        if(event.handled !== true){
                            var actExeFarm = $("#formFarm_actExe").val();
                            if (actExeFarm=='create') {
                                $('#btnFarm').on('click', function() {
                                    ga('send', 'event', 'Farms', 'click', 'Create');
                                });
                            } else if (actExeFarm=='modify') {
                                $('#btnFarm').on('click', function() {
                                    ga('send', 'event', 'Farms', 'click', 'Update');
                                });                
                            }
                            //   	 alert('status: ' + event.originalEvent.status + '\n\nresponseText: \n' + event.originalEvent.request.responseText + 
                            //     '\n\nThe output div should have already been updated with the responseText.');
                            //        var json = jQuery.parseJSON(event.originalEvent.request.responseText);
                            //        alert('responseText: \n' + json.info);
    //                        completeForm('dialog-form', 'formFarm', event.originalEvent.request.responseText);
                            completeFormGetting('dialog-form', 'formFarm', 'divFarms', event.originalEvent.request.responseText);
                            setTimeout( function() {
                                showInfo("/viewFarm.action?page="+$("#formFarm_page").val(), "divViewFarm");
                            }, 2000);
                            event.handled = true;
                        }    
                        
                    });
                    if($('.pop-over').length) {
                        $('.pop-over').popover();
                    }
                </script>
            </div>
            <div class="col-md-5">
                <div class="alert alert-warning">
                    <s:text name="%{getText('area.aboutgeolocation')}" />		
                </div>
            </div>
        </div>
        <div id="divListFarmsForm" class="container" style="height:550px;"></div>
    </body>
</html>
