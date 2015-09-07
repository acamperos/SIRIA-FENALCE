<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/ico" href="img/favicon.ico">
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
        <%@ include file="../generals/googleAnalytics.jsp" %>
        <div class="container">
            <ul id="breadcrumbs">
                <li><s:a href="%{request.getContextPath()}/dashboard.action" targets="divBodyLayout"><i class="icon-home"></i><s:property value="getText('text.home.dashboard')" /></s:a></li>
                <li><s:a href="%{request.getContextPath()}/getting.action" targets="divBodyLayout"><s:property value="getText('text.getting.dashboard')" /></s:a></li>
                <li><s:a href="%{request.getContextPath()}/crop/listCrop.action" targets="divBodyLayout"><s:property value="getText('text.listCrops.getting')" /></s:a></li>
                <li><span><s:property value="getText('text.infoCrop.crop')" /></span></li>
            </ul>
        </div>
        <%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
        <%@page import="org.aepscolombia.platform.models.entity.Users"%>
        <%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
        <%@page import="org.aepscolombia.platform.util.APConstants"%>
        <% Users user  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
        <% UsersDao usrDao   = new UsersDao(); %>
        <% Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
        <div class="container" id="divDataInfoCrop">
            <%@ include file="data-infocrop.jsp" %>                 
        </div>
        <div class="container hide" id="divInfoTimeline" style="margin-top: 15px">
            <div class="panel">
                <div class="panel-body">  
                    <fieldset>
                        <legend><h3>Linea de Tiempo del Cultivo</h3></legend>
                        <div id="timeline"></div>
                        <div id="log"></div>
                    </fieldset>
                </div>
            </div>            
        </div>        
        <% int typeCrop = (request.getAttribute("typeCrop") != null) ? Integer.parseInt(String.valueOf(request.getAttribute("typeCrop"))) : 1;%>                    
        <div class="container panel" id="divDataExtendCrop" style="margin-top: 20px"> 
            <div class="accordion" id="accordion2" style="margin-bottom: 0">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne">
                            <h4><s:property value="getText('text.establishment.crop')" /> <i class="colOne icon-chevron-down"></i></h4> 
                        </a>
                    </div>
                    <div id="collapseOne" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <%@ include file="establishment-crop.jsp" %>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#collapseEight">
                            <h4><s:property value="getText('text.physiological.crop')" /> <i class="colSeven icon-chevron-down"></i></h4> 
                        </a>
                    </div>
                    <div id="collapseEight" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <%@ include file="physiological.jsp" %>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#collapseSix">
                            <h4><s:property value="getText('text.irrigation.crop')" /> <i class="colSix icon-chevron-down"></i></h4>
                        </a>
                    </div>
                    <div id="collapseSix" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <%@ include file="irrigation.jsp" %>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                            <h4><s:property value="getText('text.nutrition.crop')" /> <i class="colTwo icon-chevron-down"></i></h4>
                        </a>
                    </div>
                    <div id="collapseTwo" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <%@ include file="nutrition.jsp" %>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#collapseFour">
                            <h4><s:property value="getText('text.monitoring.crop')" /> <i class="colFour icon-chevron-down"></i></h4>
                        </a>
                    </div>
                    <div id="collapseFour" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <%@ include file="monitoring.jsp" %>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapseThree">
                            <h4><s:property value="getText('text.fertilizationMan.crop')" /> <i class="colThree icon-chevron-down"></i></h4>
                        </a>
                    </div>
                    <div id="collapseThree" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <%@ include file="protection.jsp" %>
                        </div>
                    </div>
                </div>                  
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#collapseSeven">
                            <h4><s:property value="getText('text.observations.crop')" /> <i class="colSeven icon-chevron-down"></i></h4> 
                        </a>
                    </div>
                    <div id="collapseSeven" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <%@ include file="descriptions.jsp" %>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapseFive">
                            <h4><s:property value="getText('text.harvest.crop')" /> <i class="colFive icon-chevron-down"></i></h4>
                        </a>
                    </div>
                    <div id="collapseFive" class="accordion-body collapse">                        
                        <div class="accordion-inner">
                            <%@ include file="harvest.jsp" %>                            
                        </div>
                    </div>
                </div>      
            </div>               
        </div>   
        <script>
            $('#collapseOne').on('shown', function () {
               $(".colOne").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseOne').on('hidden', function () {
                $(".colOne").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseTwo').on('shown', function () {
               $(".colTwo").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseTwo').on('hidden', function () {
                $(".colTwo").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseThree').on('shown', function () {
               $(".colThree").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseThree').on('hidden', function () {
                $(".colThree").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseFour').on('shown', function () {
               $(".colFour").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseFour').on('hidden', function () {
                $(".colFour").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $('#collapseFive').on('shown', function () {
               $(".colFive").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseFive').on('hidden', function () {
                $(".colFive").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });
            
            $('#collapseSix').on('shown', function () {
               $(".colSix").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseSix').on('hidden', function () {
                $(".colSix").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });
            
            $('#collapseSeven').on('shown', function () {
               $(".colSix").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });
            
            $('#collapseSeven').on('hidden', function () {
                $(".colSeven").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });
            
            $('#collapseEight').on('shown', function () {
               $(".colSix").removeClass("icon-chevron-down").addClass("icon-chevron-up");
            });

            $('#collapseEight').on('hidden', function () {
                $(".colSix").removeClass("icon-chevron-up").addClass("icon-chevron-down");
            });

            $("#formCropHar_harv_dateHar").datepicker({changeMonth: true, changeYear: true});
            $("#formCropHar_harv_dateHar").mask("99/99/9999", {placeholder: " "});
            $("#formCropHar_harv_productionHar").numeric({decimal: false, negative: false});
            $("#formCropHar_harv_yieldHar").numeric({negative: false});
            $("#formCropHar_harv_productionPerPlantHar").numeric({negative: false});
            $("#formCropHar_harv_humidityPercentageHar").numeric({negative: false});
//            $(document).ready(function() {
//              var container = document.getElementById('timeline');
//              var chart = new google.visualization.Timeline(container);
//              var dataTable = new google.visualization.DataTable();
//
//              dataTable.addColumn({ type: 'string', id: 'Tipo de Fecha' });
//              dataTable.addColumn({ type: 'date', id: 'Inicio' });
//              dataTable.addColumn({ type: 'date', id: 'Fin' });
//              dataTable.addRows([
//                [ 'Fecha de siembra',    new Date(2010, 5, 10),  new Date(2010, 5, 10) ],
//                [ 'Fecha de emergencia', new Date(2010, 5, 10),  new Date(2010, 5, 25) ],
//                [ 'Fecha de floración',  new Date(2010, 5, 10),  new Date(2010, 6, 02) ],
//                [ 'Fecha de cosecha',    new Date(2010, 5, 10),  new Date(2010, 8, 30) ]          
//              ]);
//
//              chart.draw(dataTable);
//            })
        </script>
    </body>
</html>           