<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<html>
    <head>
    </head>
    <body>
        <%@ include file="googleAnalytics.jsp" %>
        <div class="container">
            <div id="carousel-487454" class="carousel" data-ride="carousel">
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <a href="signin.action"><img src="img/platform.jpg"/></a>
                        <div class="carousel-caption">
                            <p><s:property value="getText('area.descaepsplatform.platform')" /></p><br />
                            <a href="signin.action" class="btn btn-initial btn-lg"><s:property value="getText('button.ingress.platform')" /></a>
                            <a href="signin.action?logSel=new" class="btn btn-default btn-lg"><s:property value="getText('button.register.platform')" /></a>
                        </div>
                    </div>
<!--                    <div class="item">
                        <a href="https://play.google.com/store/apps/details?id=com.aepsmovil.aepsmovil"><img class="slide slide-apps-mobile"/></a>
                        <div class="container">
                            <div class="carousel-caption">
                                <p class="lead" style="margin-bottom:20px !important;">countryCode!=null<%--<s:property value="getText('area.descaepsmobile.mobile')" />--%></p>
                                <a href="https://play.google.com/store/apps/details?id=com.aepsmovil.aepsmovil" class="btn btn-primary btn-lg"><%--<s:property value="getText('button.go.mobile')" />--%></a>
                            </div>
                        </div>
                    </div>-->
                    <div class="item">
                        <a href="tryFree.action"><img src="img/usuario_prueba.png"/></a>
                        <div class="carousel-caption">
                            <p>
                                <s:property value="getText('area.descaepsfree.platform')" />																	
                            </p><br />
                            <a href="tryFree.action" class="btn btn-initial btn-lg"><s:property value="getText('link.tryfree.platform')" /></a>
                        </div>
                    </div>
                </div>
                <ol class="carousel-indicators">
                    <li data-target="#carousel-487454" data-slide-to="0" class="active">
                    </li>
                    <li data-target="#carousel-487454" data-slide-to="1" class="">
                    </li>
<!--                    <li data-target="#carousel-487454" data-slide-to="2" class="">
                    </li>-->
                </ol>
                <a class="left carousel-control" href="#carousel-487454" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a> 
                <a class="right carousel-control" href="#carousel-487454" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <script>
                !function ($) {
                  $(function(){
                    $('#carousel-487454').carousel();
                  })
                }(window.jQuery)
            </script>
            <div class="panel">
                <div class="panel-body">
                    <h3><s:property value="getText('title.whatisaeps.group')" /></h3>
                    <p><s:property value="getText('area.whatisaeps.group')" /></p>
                    <div class="tabbable tabbable-bordered">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tb3_a" aria-controls="tb3_a" role="tab" data-toggle="tab"><s:property value="getText('label.generalreports.home')" /></a></li>
                            <li><a href="#tb3_b" aria-controls="tb3_b" role="tab" data-toggle="tab"><s:property value="getText('label.howuseit.home')" /></a></li>
                            <li><a href="#tb3_c" aria-controls="tb3_c" role="tab" data-toggle="tab"><s:property value="getText('label.guiderasta.home')" /></a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="tb3_a">
                                <p></p>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="tb3_b">
                                <pre><s:property value="getText('area.descripsystem.home')" /></pre>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="tb3_c">
                                <div class="form-group">
                                    <s:text name="%{getText('title.descriprasta.home')}"/>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <a href="http://www.open-aeps.org/RASTA.pdf"><div class="img img-rasta"></div></a>
                                            <s:text name="%{getText('link.guidedownload.home')}"/>  
                                        </div>
                                        <div class="col-md-10">
                                            <s:text name="%{getText('area.descriprasta.home')}"/>                                
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
