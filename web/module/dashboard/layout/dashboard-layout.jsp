<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <title>控制中心-Dashboard</title>

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
    <script src="${staticResourcePath}/js/json2.js"></script>

</head>
<body>
<div id="wrapper">
    <%@ include file="top-guider.jsp" %>
    <%@ include file="left-menu.jsp" %>

    <div id="page-insert-content"></div>
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
