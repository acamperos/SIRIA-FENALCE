<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/ico" href="img/logoAEPS.ico">
    </head>
    <body>     
        <%@ include file="../generals/googleAnalytics.jsp" %>
        <div class="container">
            <ul id="breadcrumbs">
                <li><s:a href="%{request.getContextPath()}/dashboard.action" targets="divBodyLayout"><i class="icon-home"></i><s:property value="getText('link.homeprivate')" /></s:a></li>
                <li><s:a href="%{request.getContextPath()}/reports.action" targets="divBodyLayout"><s:property value="getText('link.reports')" /></s:a></li>
                <li><span>Analisis</span></li>
            </ul>
        </div>
        <div class="container">
            <div class="panel">
                <div class="panel-body">
                    <s:form id="formAnalysis" cssClass="form-horizontal">
                        <fieldset>         
                            <div class="form-group">
                                <label for="formAnalysis_depAna" class="control-label">
                                    <s:property value="getText('select.department.farm')" />:
                                </label>
                                <div class="controls">
                                    <s:select
                                        name="depAna" 
                                        list="list_departments"
                                        listKey="idDep" 
                                        listValue="nameDep"          
                                        headerKey=" " 
                                        headerValue="---"
                                    />
                                </div>  
                            </div>
                            <div class="form-group">
                                <label for="formAnalysis_lastCrop" class="control-label">
                                    <s:property value="getText('select.croptype.crop')" />:
                                </label>
                                <div class="controls">
                                    <s:select
                                        name="lastCrop"                                    
                                        list="type_crops" 
                                        listKey="idCroTyp" 
                                        listValue="nameCroTyp"              
                                        headerKey="-1" 
                                        headerValue="---" 
                                        onchange="showInfoCrop('formAnalysis_lastCrop', 'formAnalysis_depAna', 'divInfoCrop')"
                                    />
                                </div>
                            </div>    
                        </fieldset>  
                        <div id="divInfoCrop" class="hideInfo">
                            <div class="form-group">
                                <img src="img/RANDOM_FOREST/InputRelvance.jpg"/>
                                <a onclick="selectGraph('1','divImage1','divImage2','divImage3','divImage4')"><img src="img/RANDOM_FOREST/1.jpg" style="position: relative; top: -60px; right: 0px; left: -741px; cursor: pointer;"/></a>
                                <a onclick="selectGraph('2','divImage1','divImage2','divImage3','divImage4')"><img src="img/RANDOM_FOREST/2.jpg" style="position: relative; top: -58px; right: 0px; left: -722px; cursor: pointer;"/></a>
                                <a onclick="selectGraph('3','divImage1','divImage2','divImage3','divImage4')"><img src="img/RANDOM_FOREST/3.jpg" style="position: relative; top: -42px; right: 0px; left: -703px; cursor: pointer;"/></a>
                                <a onclick="selectGraph('4','divImage1','divImage2','divImage3','divImage4')"><img src="img/RANDOM_FOREST/4.jpg" style="position: relative; top: -375px; right: 0px; left: 207px; cursor: pointer;"/></a>
                                <div id="divImage1" class="hideInfo">
                                    <img src="img/RANDOM_FOREST/MultiProfile_CANT_FERT_QUI.jpg"/>
                                </div>
                                <div id="divImage2" class="hideInfo">
                                    <img src="img/RANDOM_FOREST/MultiProfile_FREC_FERT_QUI.jpg"/>
                                </div>
                                <div id="divImage3" class="hideInfo">
                                    <img src="img/RANDOM_FOREST/MultiProfile_CANT_FERT_ORG.jpg"/>
                                </div>
                                <div id="divImage4" class="hideInfo">
                                    <img src="img/RANDOM_FOREST/MultiProfile_PROF_PREP.jpg"/>
                                </div>
                            </div>
                        </div>
                    </s:form> 
                </div>      
            </div>      
        </div>                 
        <div class="container" id="divInfoCrop">    
        </div>
        <script>
            $.subscribe('completeSelection', function(event, data) {
                $.unblockUI();
            });
        </script>
    </body>
</html>           