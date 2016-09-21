<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/ico" href="img/logoAEPS.ico">
        <style type="text/css">
            .vis-item.sowing {
                background-color: white;
                border-color: black;
            }
            .vis-item.emergency {
                background-color: greenyellow;
                border-color: greenyellow;
            }
            .vis-item.flowering {
                background-color: salmon;
                border-color: salmon;
            }
            .vis-item.preparations {
                background-color: chocolate;
                border-color: chocolate;
            }
            .vis-item.residuals {
                background-color: orange;
                border-color: orange;
            }
            .vis-item.irrigations {
                background-color: dodgerblue;
                border-color: dodgerblue;
            }
            .vis-item.fertilizations {
                background-color: red;
                border-color: red;
            }
            .vis-item.monitorings {
                background-color: lightgray;
                border-color: lightgray;
            }
            .vis-item.controls {
                background-color: dimgrey;
                border-color: dimgrey;
            }
            .vis-item.maize {
                background-color: white;
                border-color: black;
            }
            .vis-item.beans {
                background-color: white;
                border-color: black;
            }
            .vis-item.rice {
                background-color: white;
                border-color: black;
            }
        </style>
    </head>
    <body>     
        <%@ include file="../../generals/googleAnalytics.jsp" %>
        <div class="container">
            <ul id="breadcrumbs">
                <li><s:a href="%{request.getContextPath()}/dashboard.action" targets="divBodyLayout"><i class="icon-home"></i><s:property value="getText('link.homeprivate')" /></s:a></li>
                <li><s:a href="%{request.getContextPath()}/getting.action" targets="divBodyLayout"><s:property value="getText('link.collectdata')" /></s:a></li>
                <li><s:a href="%{request.getContextPath()}/crop/listCrop.action" targets="divBodyLayout"><s:property value="getText('link.listCrops')" /></s:a></li>
                <li><span><s:property value="getText('label.optCrop')" /></span></li>
            </ul>
        </div>
        <%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
        <%@page import="org.aepscolombia.platform.models.entity.Users"%>
        <%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
        <%@page import="org.aepscolombia.platform.util.APConstants"%>
        <% Users user = (Users) session.getAttribute(APConstants.SESSION_USER); %>
        <% UsersDao usrDao = new UsersDao(); %>
        <% Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
        <% //String coCode     = user.getCountryUsr().getAcronymIdCo(); %>
        <% String coCode    = (String) session.getAttribute(APConstants.COUNTRY_CODE); %>
        <% Boolean costCrop =  Boolean.valueOf(String.valueOf(request.getAttribute("costCrop")));  %>
        <% //Integer typeCrop =  Integer.parseInt(String.valueOf(request.getAttribute("typeCrop")));  %>

        <div class="container" id="divDataInfoCrop">
            <%@ include file="../generals/data-crops.jsp" %>                 
        </div>       
        <div class="container hideInfo" id="divInfoTimeline" style="margin-top: 15px">
            <div class="panel">
                <div class="panel-body">  
                    <fieldset>
                        <legend><h3><s:property value="getText('title.timeline.crop')" /></h3></legend>
                        <div id="timeline"></div>
                        <div id="log"></div>
                    </fieldset>
                </div>
            </div>            
        </div>
        <% int typeCrop = (request.getAttribute("typeCrop") != null) ? Integer.parseInt(String.valueOf(request.getAttribute("typeCrop"))) : 1;%>                    
        <div class="container" id="divDataExtendCrop"> 
            <div class="panel"> 
                <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                <h4><s:property value="getText('link.establishment.crop')" /> <i class="colOne icon-chevron-down"></i></h4> 
                            </a>
                        </div>
                        <div id="collapseOne" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <%@ include file="view-establishment-crop.jsp" %>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">
                                <h4><s:property value="getText('title.formphysiology.monitoring')" /> <i class="colEight icon-chevron-down"></i></h4> 
                            </a>
                        </div>
                        <div id="collapseEight" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <%@ include file="view-physiological.jsp" %>
                            </div>
                        </div>
                    </div>        
                    <% if (coCode.equals("NI")) { %>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                <h4><s:property value="getText('link.fertilizationMan.crop')" /> <i class="colThree icon-chevron-down"></i></h4>
                            </a>
                        </div>
                        <div id="collapseThree" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <%@ include file="view-controls.jsp" %>
                            </div>
                        </div>
                    </div>  
                    <% } else if (coCode.equals("CO")) { %>
                        <% if (typeCrop!=6) { %> 
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                                <h4><s:property value="getText('link.irrigation.crop')" /> <i class="colSix icon-chevron-down"></i></h4>
                            </a>
                        </div>
                        <div id="collapseSix" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <%@ include file="view-irrigations.jsp" %>
                            </div>
                        </div>
                    </div>
                              <% } %>    
                    <% } %>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                <h4><s:property value="getText('link.nutrition.crop')" /> <i class="colTwo icon-chevron-down"></i></h4>
                            </a>
                        </div>
                        <div id="collapseTwo" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <%@ include file="view-nutrition.jsp" %>
                            </div>
                        </div>
                    </div>
                                          
                    <% if (coCode.equals("NI")) { %>
                    <% if (typeCrop!=6) { %>  
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                                <h4><s:property value="getText('link.irrigation.crop')" /> <i class="colSix icon-chevron-down"></i></h4>
                            </a>
                        </div>
                        <div id="collapseSix" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <%@ include file="view-irrigations.jsp" %>
                            </div>
                        </div>
                    </div>
                       <% } %>           
                    <% } else if (coCode.equals("CO")) { %>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                <h4><s:property value="getText('link.fertilizationMan.crop')" /> <i class="colThree icon-chevron-down"></i></h4>
                            </a>
                        </div>
                        <div id="collapseThree" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <%@ include file="view-controls.jsp" %>
                            </div>
                        </div>
                    </div>
                    <% } %>                  
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                <h4><s:property value="getText('link.monitoring.crop')" /> <i class="colFour icon-chevron-down"></i></h4>
                            </a>
                        </div>
                        <div id="collapseFour" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <%@ include file="view-monitorings.jsp" %>
                            </div>
                        </div>
                    </div>

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                <h4><s:property value="getText('link.harvest.crop')" /> <i class="colFive icon-chevron-down"></i></h4>
                            </a>
                        </div>
                        <div id="collapseFive" class="accordion-body collapse">                        
                            <div class="accordion-inner">
                                <%@ include file="view-harvest.jsp" %>                            
                            </div>
                        </div>
                    </div>    
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">
                                <h4><s:property value="getText('link.observations.crop')" /><i class="colSeven icon-chevron-down"></i></h4> 
                            </a>
                        </div>
                        <div id="collapseSeven" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <%@ include file="view-descriptions.jsp" %>
                            </div>
                        </div>
                    </div>
                    <% if (costCrop) { %>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">
                                    <h4><s:property value="getText('link.costindirect.crop')" /><i class="colNine icon-chevron-down"></i></h4>
                                </a>
                            </div>
                            <div id="collapseNine" class="accordion-body collapse">                        
                                <div class="accordion-inner">
                                    <%@ include file="view-cost-indirect.jsp" %>           
                                </div>
                            </div>
                        </div>   
                    <% } %>       

                </div>               
            </div>               
        </div>   
        <script>
            $('#collapseOne').on('shown.bs.collapse', function() {
                $(".colOne").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseOne').on('hidden.bs.collapse', function() {
                $(".colOne").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseTwo').on('shown.bs.collapse', function() {
                $(".colTwo").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseTwo').on('hidden.bs.collapse', function() {
                $(".colTwo").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseThree').on('shown.bs.collapse', function() {
                $(".colThree").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseThree').on('hidden.bs.collapse', function() {
                $(".colThree").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseFour').on('shown.bs.collapse', function() {
                $(".colFour").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseFour').on('hidden.bs.collapse', function() {
                $(".colFour").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseFive').on('shown.bs.collapse', function() {
                $(".colFive").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseFive').on('hidden.bs.collapse', function() {
                $(".colFive").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseSix').on('shown.bs.collapse', function() {
                $(".colSix").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseSix').on('hidden.bs.collapse', function() {
                $(".colSix").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseSeven').on('shown.bs.collapse', function() {
                $(".colSeven").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseSeven').on('hidden.bs.collapse', function() {
                $(".colSeven").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseEight').on('shown.bs.collapse', function() {
                $(".colEight").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseEight').on('hidden.bs.collapse', function() {
                $(".colEight").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseNine').on('shown.bs.collapse', function() {
                $(".colNine").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseNine').on('hidden.bs.collapse', function() {
                $(".colNine").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $("#formCropHar_harv_dateHar").datepicker({changeMonth: true, changeYear: true});
            $("#formCropHar_harv_dateHar").mask("99/99/9999", {placeholder: " "});
            $("#formCropHar_harv_productionHar").numeric({decimal: false, negative: false});
            $("#formCropHar_harv_yieldHar").numeric({negative: false});
            $("#formCropHar_harv_productionPerPlantHar").numeric({negative: false});
            $("#formCropHar_harv_humidityPercentageHar").numeric({negative: false});
        </script>
    </body>
</html>           
