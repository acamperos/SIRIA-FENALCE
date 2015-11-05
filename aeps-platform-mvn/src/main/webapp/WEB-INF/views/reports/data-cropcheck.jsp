<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page import="java.lang.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<div class="panel">
    <div class="panel-body w-box">             
        <fieldset>
            <legend>
                <h2>
                    <s:property value="getText('title.infoCrop.report')" /> 
                </h2>    
            </legend>
            <fieldset>
                <legend><h5><s:property value="getText('title.identprod.report')" /></h5>  
                </legend>
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th style="width: 30%"><s:property value="getText('td.producername.report')" /></th>
                            <td><s:property value="%{fieldInfo.get('name_producer')}" /></td>
                            <th><s:property value="getText('td.docproducer.report')" /></th>
                            <td><s:property value="%{fieldInfo.get('type_doc_pro')}" />: <s:property value="%{fieldInfo.get('no_doc_pro')}" /></td>
                        </tr>
                        <tr>
                            <th style="width: 30%"><s:property value="getText('td.department.report')" /></th>
                            <td><s:property value="%{fieldInfo.get('name_dep')}" /></td>
                            <th><s:property value="getText('td.municipality.report')" /></th>
                            <td><s:property value="%{fieldInfo.get('name_mun')}" /></td>
                        </tr>
                        <tr>
                            <th style="width: 30%"><s:property value="getText('td.communename.report')" /></th>
                            <td><s:property value="%{fieldInfo.get('name_commune')}" /></td>
                            <th><s:property value="getText('td.farmname.report')" /></th>
                            <td><s:property value="%{fieldInfo.get('name_farm')}" /></td>
                        </tr>
                        <tr>
                            <th style="width: 30%"><s:property value="getText('td.latitude.report')" /></th>
                            <td><s:property value="%{fieldInfo.get('latitude_lot')}" /></td>
                            <th><s:property value="getText('td.longitude.report')" /></th>
                            <td><s:property value="%{fieldInfo.get('length_lot')}" /></td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>                         
            <fieldset>
                <legend><h5><s:property value="getText('title.features.report')" /></h5>  
                </legend>  
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th>No.</th>
                            <th><s:property value="getText('td.topic.fenalcheck')" /></th>
                            <th><s:property value="getText('td.variable.fenalcheck')" /></th>
                            <th><s:property value="getText('td.point.fenalcheck')" /></th>
                            <th>OK</th>
                            <th><s:property value="getText('td.missing.fenalcheck')" /></th>
                        </tr>
                        <tr>
                            <th>1</th>
                            <th rowspan="3"><s:property value="getText('td.soilstatus.fenalcheck')" /></th>
                            <td><s:property value="getText('td.viewlayer.fenalcheck')" /></td>
                            <td><s:property value="getText('td.soilwithoutlayer.fenalcheck')" /></td>
                            <s:set var="capasEndSel" value="%{'' + rasta.capasEndurecidasRas}"/>                                    
                            <td>
                                <s:if test="%{#capasEndSel == 'true'}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#capasEndSel != 'true'}">
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                        <tr>
                            <th>2</th>
                            <td><s:property value="getText('td.deptheffective.fenalcheck')" /></td>
                            <td><s:property value="getText('td.depthgrade.fenalcheck')" /></td>
                            <s:set var="depth" value="%{rasta.profundidadEfectivaRas}"/>                                   
                            <td>
                                <s:if test="%{#phVal>30}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#phVal<=30}">      
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                        <tr>
                            <th>3</th>
                            <td><s:property value="getText('td.ph.fenalcheck')" /></td>
                            <td><s:property value="getText('td.phgrade.fenalcheck')" /></td>
                            <s:set var="phVal" value="%{rasta.phRas}"/>                                   
                            <td>
                                <s:if test="%{#phVal>=5.5 && #phVal<=6.5}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#phVal<5.5 || #phVal>6.5}">     
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                        <tr>
                            <th>4</th>
                            <th rowspan="2"><s:property value="getText('td.fieldpreparation.fenalcheck')" /></th>
                            <td><s:property value="getText('td.withdirectsowing.fenalcheck')" /></td>
                            <td><s:property value="getText('td.burningchemical.fenalcheck')" /></td>
                            <s:set var="burningSowing" value="%{'' + checkBurning}"/>                                    
                            <td>
                                <s:if test="%{#burningSowing == 'true'}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#burningSowing != 'true'}">
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                        <tr>
                            <th>5</th>
                            <td><s:property value="getText('td.sowingconvencional.fenalcheck')" /></td>
                            <td><s:property value="getText('td.workingdepthgrade.fenalcheck')" /></td>
                            <s:set var="depth" value="%{maxDepth}"/>                                   
                            <td>
                                <s:if test="%{#depth>30}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#depth<=30}">      
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                        <tr>
                            <th>6</th>
                            <th><s:property value="getText('td.sowing.fenalcheck')" /></th>
                            <td><s:property value="getText('td.density.fenalcheck')" /></td>
                            <td><s:property value="getText('td.densitygrade.fenalcheck')" /></td>
                            <s:set var="furrows" value="%{sowing.furrowsDistanceSow}"/>                                    
                            <s:set var="sites" value="%{sowing.sitesDistanceSow}"/>                                    
                            <td>
                                <s:if test="%{(#furrows>=0.75 && #furrows<=0.85) && (#sites>=0.17 && #sites<=0.2)}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{(#furrows<0.75 || #furrows>0.85) && (#sites<0.17 || #sites>0.2)}">
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                        <s:set var="typeCrop" value="%{cropInfo.get('typeCrop')}"/>                         
                        <tr>
                            <th>7</th>
                            <s:if test="%{#typeCrop==1}">
                                <th rowspan="3"><s:property value="getText('td.fertilization.fenalcheck')" /></th>
                            </s:if>
                            <s:elseif test="%{#typeCrop==2}">
                                <th rowspan="2"><s:property value="getText('td.fertilization.fenalcheck')" /></th>
                            </s:elseif>
                            <td><s:property value="getText('td.contributionelements.fenalcheck')" /></td>
                            <td>[N,P,K,Mg,S]</td>
                            <s:set var="elements" value="%{infoReport.get('elements')}"/>                              
                            <td>
                                <s:if test="%{#elements==true}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#elements!=true}">
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>                        
                        <s:if test="%{#typeCrop==1}">  
                            <tr>
                                <th rowspan="2">8</th>
                                <td rowspan="2"><s:property value="getText('td.divisions.fenalcheck')" /></td>
                                <td>
                                    <s:property value="getText('td.nitrogen.fenalcheck')" /> [V0:20%, V6:60%, V10:100%]                                
                                </td>
                                <td>
                                    <s:if test="%{(divisions[0]==true)}">                                             
                                        <i class="icon-ok main-color"></i>
                                    </s:if>
                                </td>
                                <td>
                                    <s:if test="%{(divisions[0]!=true)}">             
                                        <i class="icon-remove check-remove"></i>
                                    </s:if>
                                </td>
                            </tr>
                            <tr>                            
                                <td><s:property value="getText('td.potassium.fenalcheck')" /> [V0:50%, V6:100%]</td>                              
                                <td>
                                    <s:if test="%{(divisions[2]==true)}">                                          
                                        <i class="icon-ok main-color"></i>
                                    </s:if>
                                </td>
                                <td>
                                    <s:if test="%{(divisions[2]!=true)}">
                                        <i class="icon-remove check-remove"></i>
                                    </s:if>
                                </td>
                            </tr>
                        </s:if>
                        <s:elseif test="%{#typeCrop==2}">
                            <tr>
                                <th>8</th>
                                <td><s:property value="getText('td.divisions.fenalcheck')" /></td>
                                <td>
                                    <s:if test="%{beans.growingEnvironment.idGroEnv==1}"><s:property value="getText('td.nitrogenshrubby.fenalcheck')" /> [V0:40%, V4:100%]</s:if>
                                    <s:elseif test="%{beans.growingEnvironment.idGroEnv==2}"><s:property value="getText('td.nitrogenfickle.fenalcheck')" /> [V0:40%, V4:80%, R5:100%]</s:elseif>
                                </td>
                                <td>
                                    <s:if test="%{(divisions[0]==true)}">                                             
                                        <i class="icon-ok main-color"></i>
                                    </s:if>
                                </td>
                                <td>
                                    <s:if test="%{(divisions[0]!=true)}">             
                                        <i class="icon-remove check-remove"></i>
                                    </s:if>
                                </td>
                            </tr>
                        </s:elseif>
                        <tr>
                            <th>9</th>
                            <th><s:property value="getText('td.establishedpopulation.fenalcheck')" /></th>
                            <td><s:property value="getText('td.populationtwenty.fenalcheck')" /></td>
                            <td><s:property value="getText('td.populationgrade.fenalcheck')" /></td>
                            <s:set var="population" value="%{phys.daysPopulationMonFis}"/>                                    
                            <td>
                                <s:if test="%{#population>=60000 && population<=70000}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#population<60000 || population>70000}">
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                        <tr>
                            <th>10</th>
                            <th rowspan="3"><s:property value="getText('td.pestsdiseasweeds.fenalcheck')" /></th>
                            <td><s:property value="getText('td.monitoring.fenalcheck')" /></td>
                            <td><s:text name="getText('td.doingsixmonitoring.fenalcheck')" /></td>
                            <s:set var="monValue" value="%{infoReport.get('monCheck')}"/>                                    
                            <td>
                                <s:if test="%{#monValue==true}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#monValue!=true}">
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                        <tr>
                            <th>11</th>
                            <td><s:property value="getText('td.weedscontrols.fenalcheck')" /></td>
                            <td><s:property value="getText('td.applicationeightdays.fenalcheck')" /></td>
                            <s:set var="weedsValue" value="%{infoReport.get('conWeeds')}"/>                                    
                            <td>
                                <s:if test="%{#weedsValue==true}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#weedsValue!=true}">
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td><s:property value="getText('td.diseasescontrols.fenalcheck')" /></td>
                            <td><s:property value="getText('td.controltendays.fenalcheck')" /></td>
                            <s:set var="diseasesValue" value="%{infoReport.get('conDiseases')}"/>                                    
                            <td>
                                <s:if test="%{#diseasesValue==true}">                                             
                                    <i class="icon-ok main-color"></i>
                                </s:if>
                            </td>
                            <td>
                                <s:if test="%{#diseasesValue!=true}">
                                    <i class="icon-remove check-remove"></i>
                                </s:if>
                            </td>
                        </tr>
                    </tbody>
                </table>      
            </fieldset>
            
        </fieldset>
    </div>       
</div>
