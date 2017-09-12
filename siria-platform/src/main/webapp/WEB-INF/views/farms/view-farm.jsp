<%@ taglib prefix="s" uri="/struts-tags" %>
<% int pageSel = (request.getParameter("page") != null) ? Integer.parseInt(String.valueOf(request.getParameter("page"))) : 1;%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <s:hidden name="coCode"/>
            <s:hidden name="points"/>
            <div class="tabbable tabbable-bordered">
                <ul class="nav nav-tabs">                    
                    <li class="active"><a href="#tb3_a" data-toggle="tab"><s:property value="getText('tab.listinfo.farm')" /></a></li>
                    <li><a href="#tb3_b" id="aMap" data-toggle="tab"><i class="icon-star color-star"></i> <s:property value="getText('tab.mapinfo.farm')" /></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane" id="tb3_b" style="height: 700px">
                        <div id="map_general" style="width:85%; height:92%; position: absolute;"></div>
                        <script>                
                            var lanVal = $('#lanSel').val();
                            var str   = lanVal;
                            var valEs = str.search("es");
                            var valEn = str.search("en");            
                            var pageSel = "<%=pageSel%>";
                            var jsonString  = $("#points").val();
                            var codeCountry = $("#coCode").val();    
                            var posCountry = null;
                            if (codeCountry=='NI') {
                                posCountry = new google.maps.LatLng(18.115696, -101.197561);
                            } else if (codeCountry=='CO') {
                                posCountry = new google.maps.LatLng(13.207186, -90.000665);
                            }


                            var mapInfo = document.getElementById('map_general');  
                            var map;
                            var infowindow = new google.maps.InfoWindow({
                                maxWidth: 300
                            });   

                            var locateFarm = "";
                            if(valEs!=-1) {
                                    locateFarm = "Ubicacion";
                            }

                            if(valEn!=-1) {
                                    locateFarm = "Location";
                            }

                          var image = '../../img/market.png';

//                          var jsonString = '{"features":[{"properties":{"latFarm":"5.694153196271036","nameDep":"VALLE DEL CAUCA","lonFarm":"-74.27217881944443","status":"true","typeEnt":"2","dirFarm":"","idFarm":"1470","idPro":"1550","nameFarm":"la prueba","namePro":"Carlos Andres Perez Gomez","nameMun":"CALIMA","altFarm":"101.2843322753906"},"type":"Feature","geometry":{"type":"Point","coordinates":[-74.27217881944443,5.694153196271036]}}],"type":"FeatureCollection"}';
                          var geojson = $.parseJSON(jsonString);

                          var myOptions = {
                            zoom: 5,
                            center: posCountry,
                            mapTypeControl: true,
                            mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
                            navigationControl: true,
                            mapTypeId: google.maps.MapTypeId.HYBRID 
                          }

                            map = new google.maps.Map(mapInfo, myOptions);
                            var featureStyle = {
                              icon: image
                            }
//                            map.data.setStyle(featureStyle);

                            map.data.addGeoJson(geojson);
                            function showContent(feature) {
                                var name = "";
                                var howfind = "";
                                var department = "";
                                var municipality = "";
                                var latitude = "";
                                var longitude = "";
                                var altitude = "";
                                var buttonModify = "";
                                if(valEs!=-1) {
                                    name = "Nombre";
                                    howfind = "Indicación (Como llegar)";
                                    department = "Departamento";
                                    municipality = "Municipio";
                                    latitude = "Latitud";
                                    longitude = "Longitud";
                                    altitude = "Altura";     
                                    buttonModify = "Editar Finca";
                                }
                                
                                if(valEn!=-1) {
                                    name = "Name";
                                    howfind = "Information (How i can arrive)";
                                    department = "Department";
                                    municipality = "Municipality";
                                    latitude = "Latitude";
                                    longitude = "Longitude";
                                    altitude = "Altitude"; 
                                    buttonModify = "Modify farm";
                                }
                                var info = '<div>'+
                                  '<div class="w-box">'+
                                      '<fieldset>'+
                                          '<table class="table table-bordered">'+
                                              '<tbody>'+
                                                  '<tr>'+
                                                      '<th style="width: 30%">'+name+'</th>'+
                                                      '<td>'+feature.getProperty("nameFarm")+'</td>'+
                                                  '</tr>'+
                                                  '<tr>'+
                                                      '<th>'+howfind+'</th>'+
                                                      '<td>'+feature.getProperty("dirFarm")+'</td>'+
                                                  '</tr>'+   
                                                  '<tr>'+   
                                                      '<th>'+department+'</th>'+
                                                      '<td>'+feature.getProperty("nameDep")+'</td>'+
                                                  '</tr>'+
                                                  '<tr>'+
                                                      '<th>'+municipality+'</th>'+
                                                      '<td>'+feature.getProperty("nameMun")+'</td>'+
                                                  '</tr>'+
                                                  '<tr>'+
                                                      '<th>'+latitude+'</th>'+
                                                      '<td>'+feature.getProperty("latFarm")+'</td>'+
                                                  '</tr>'+
                                                  '<tr>'+
                                                      '<th>'+longitude+'</th>'+
                                                      '<td>'+feature.getProperty("lonFarm")+'</td>'+
                                                  '</tr>'+
                                                  '<tr>'+
                                                      '<th>'+altitude+'</th>'+
                                                      '<td>'+feature.getProperty("altFarm")+'</td>'+
                                                  '</tr>'+
                                              '</tbody>'+
                                          '</table>'+
                                      '</fieldset>'+
                                  '</div>'+       
                              '</div>'+
                              '<button type="button" class="btn btn-initial" onclick="viewForm(\'/showFarm.action?action=modify&page='+pageSel+'\', \'idFar\', '+feature.getProperty("idFarm")+', \''+buttonModify+'\', 1050, 550)">'+
                                  '<i class="icon-pencil"></i> '+buttonModify+
                              '</button>';
                                infowindow.setContent(info);
                            };
                            
                            function initialize() {   
                                google.maps.event.addListener(map, 'click', function() {
                                  infowindow.close();
                                });
                            }  
                            var markers=[];
                            map.data.forEach(function(feature){
                                  var latLngPos = feature.getGeometry().get();
                                  var marker = new google.maps.Marker({
                                       position: latLngPos,
                                       icon: image
                                  });
                                  markers.push(marker);
                                  map.data.remove(feature);
                                  google.maps.event.addListener(marker, 'click', function() {
                                      infowindow.open(map,marker);
                                      showContent(feature);
                                  });

                            });
                            
                            var markerCluster = new MarkerClusterer(map, markers);                            
                            google.maps.event.addDomListener(window, 'load', initialize);
                        </script> 
                    </div>
                    <div class="tab-pane active" id="tb3_a">
                        <div id="divSearchFarms">
                            <div class="panel">
                                <div class="panel-body">
                                    <%@ include file="search-farm.jsp" %>
                                </div>
                            </div>    
                        </div>     
                        <div id="divConListFarms">
                            <%@ include file="info-farm.jsp" %>            
                        </div> 
                    </div>
                </div>
            </div>
            <script>
                $('a[href="#tb3_b"]').click(function(e) {
                    setTimeout(showMap, 1000);
                });

                function showMap() {
                    var myMap = document.getElementById('map_general');
                    google.maps.event.trigger(myMap, 'resize');
                };
            </script>
        </div>
    </div>
</div>
