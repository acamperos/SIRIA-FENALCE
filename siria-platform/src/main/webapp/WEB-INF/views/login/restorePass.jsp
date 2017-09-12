<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="icon" type="image/ico" href="img/logoAEPS.ico">
        <title>SIRIA</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 	
        <meta http-equiv="Cache-control: max-age=86400" content="public">
        <sj:head jqueryui="false"/>
        <sb:head includeScripts="true" includeScriptsValidation="true"/>        
        <link rel="stylesheet" href="scripts/css/generals/login.css">        
        <link href = 'http://fonts.googleapis.com/css?family=Istok+Web:400700400cursiva,700italicysubconjunto=latin,latin-ext' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <%@ include file="../generals/googleAnalytics.jsp" %>
        <s:actionerror theme="bootstrap"/>
        <s:actionmessage theme="bootstrap"/>
        <s:fielderror theme="bootstrap"/>
        <div id="divMessage" style="display:none;"></div>
        <div id="login-wrapper" class="container col-md-3">  
            <div class="panel-heading">
                <a href="initial.action" class="img-responsive"><img src="img/logoAEPS.png"/></a>
            </div>
            <div class="panel-body">
                <div class="panel" id="divRestPass">
                    <h3><s:property value="getText('title.restorepass.login')" /></h3>
                    <s:form id="formRestCon" action="changePassUser.action" method="post">
                        <s:hidden name="actExe" value="changepass"/>
                        <s:hidden name="idUser"/>
                        <s:hidden name="lanSel"/>
                        <div class="form-group">
                            <label class="control-label req" for="formRestCon_passRest"><s:property value="getText('text.newpass.login')" />:</label>
                            <div class="controls">
                                <s:password class="form-control" id="formRestCon_passRest" name="passRest"/>
                                <div id="pwdMeter" class="progress progress-danger">
                                    <div class="bar" style="width: 0%"></div>
                                    <span class="pwdText pwdTextRes"></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label req" for="formRestCon_passRestCon"><s:property value="getText('text.repnewpass.login')" />:</label>
                            <div class="controls">
                                <s:password class="form-control" id="formRestCon_passRestCon" name="passRestCon"/>
                            </div>
                        </div>
                        <div>
                            <sj:submit cssClass="btn btn-initial btn-lg" onclick="addMessageProcess()" targets="divMessage" onCompleteTopics="completeRestore" value="%{getText('button.restorepass.login')}" validate="true" validateFunction="validationForm"/>
                        </div>                            
                    </s:form>
                    <script type="text/javascript" src="scripts/js/jquery/pwdMeter/jquery.pwdMeter.js"></script>
                    <script type="text/javascript" src="scripts/js/jquery/jquery.blockUI.js"></script>
                    <script type="text/javascript" src="scripts/js/jquery/jquery.validate.js"></script>
                    <script type="text/javascript" src="scripts/js/generals/functions.min.js"></script>	        
                    <script>
                        var lanVal = $('#formRestCon_lanSel').val();
                        var str   = lanVal;
                        var valEs = str.search("es");
                        var valEn = str.search("en");
                        var veryWeakRess = "";
                        var weakRess = "";
                        var mediumRess = "";
                        var strongRess = "";
                        var veryStrongRess = "";

                        if(valEs!=-1) {
                                veryWeakRess = "Muy Debil";
                                weakRess = "Debil";
                                mediumRess = "Normal";
                                strongRess = "Fuerte";
                                veryStrongRess = "Muy Fuerte";
                        }

                        if(valEn!=-1) {
                                veryWeakRess = "Very Weak";
                                weakRess = "Weak";
                                mediumRess = "Normal";
                                strongRess = "Strong";
                                veryStrongRess = "Very Strong";
                        }										
										
                        if($('#formRestCon_passRest').length) {
                            $('#formRestCon_passRest').pwdMeter({
                                minLength: 6,
                                displayGeneratePassword: false,
                                neutralText:"",
                                veryWeakText:veryWeakRess,
                                weakText:weakRess,
                                mediumText:mediumRess,
                                strongText:strongRess,
                                veryStrongText:veryStrongRess
                            });  
                        }
                        
                        $.subscribe('completeRestore', function(event, data) {
                            $.unblockUI();
                            completeFormChange('', 'formRestCon', event.originalEvent.request.responseText);
                            setTimeout( function() {
                                document.location = "/signin.action";
//                                document.location = "aeps/signin.action";
                            }, 3000);
                        });
                    </script>
                </div>
            </div>            
        </div>
    </body>
</html>
