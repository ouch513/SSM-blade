<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册-regist</title>

    <%@ include file="../../common/url-config.jsp" %>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${staticResourcePath}/materialize/css/materialize.min.css" media="screen,projection"/>
    <!-- Bootstrap Styles-->
    <link href="${staticResourcePath}/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="${staticResourcePath}/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="${staticResourcePath}/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="${staticResourcePath}/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="${staticResourcePath}/js/Lightweight-Chart/cssCharts.css">

    <script src="${staticResourcePath}/js/jquery-1.10.2.js"></script>
</head>
<body style="background: #ececec;">

<div id="wrapper">
    <%@ include file="../layout/top-guider.jsp" %>

    <div class="row">

        <div class="col-xs-12" style="height: 100px"></div>

        <div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
            <div class="card">
                <div class="card-action" style="font-size:18px;color: #F0433D;">
                    注册 - Registration
                </div>
                <div class="card-action">
                    <div class="row" style="padding: 0 20px;" id="regin-form">

                        <div class="input-field col s12 hide" id="regin-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">perm_contact_calendar</i>
                            <input id="regin-username" type="text" class="validate">
                            <label for="regin-username" data-error="wrong" data-success="right">用户名</label>
                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">email</i>
                            <input id="regin-email" type="email" class="validate">
                            <label for="regin-email" data-error="wrong" data-success="right">绑定邮箱</label>
                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">lock_outline</i>
                            <input id="regin-password" type="password" class="validate">
                            <label for="regin-password" data-error="wrong" data-success="right">设置密码</label>
                        </div>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">spellcheck</i>
                            <input id="check-password" type="password" class="validate">
                            <label for="check-password" data-error="wrong" data-success="right">确认密码</label>
                        </div>

                        <div class="input-field col s12 text-right">
                            <a class="waves-effect waves-light btn" id="regin-btn">注册</a>
                        </div>

                    </div>

                    <script src="${webPath}/module/dashboard/session/regin.js"></script>
                </div>
            </div>
        </div>

    </div>

</div>

<!-- Bootstrap Js -->
<script src="${staticResourcePath}/js/bootstrap.min.js"></script>

<script src="${staticResourcePath}/materialize/js/materialize.min.js"></script>

<!-- Metis Menu Js -->
<script src="${staticResourcePath}/js/jquery.metisMenu.js"></script>

<!-- Custom Js -->
<script src="${staticResourcePath}/js/custom-scripts.js"></script>

</body>
</html>
