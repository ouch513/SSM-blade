<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/dashboard-layout.jsp" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#page-insert-content').after($('#page-wrapper'));
    });
</script>

<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            站内公告
            <small>Bulletin Management</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${webPath}/dashboard/bulletin/index">站内公告</a></li>
            <li><a href="${webPath}/dashboard/bulletin/index">公告列表</a></li>
            <li class="active">修改公告</li>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-sm-12 col-md-10">

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action" >
                        <strong style="font-size:18px;color: #F0433D;">编辑公告</strong><br>
                        <div class="input-field col s12 hide" id="edit-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div>
                        <div class="input-field col s12 hide" id="edit-success">
                            <div class="alert alert-success" role="alert"><strong>success!</strong></div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="row" style="padding: 0 20px;" id="edit-form">

                            <div class="input-field col s12">
                                <strong>标题：</strong>
                                <input id="edit-title" type="text">
                            </div>

                            <div class="input-field col s12">
                                <strong>内容：</strong>
                                <script id="edit-content" type="text/plain"></script>
                            </div>

                            <div class="input-field col s12 text-right">
                                <a class="waves-effect waves-light btn" id="edit-btn">修改</a>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" charset="utf-8" src="${staticResourcePath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${staticResourcePath}/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${staticResourcePath}/ueditor/lang/zh-cn/zh-cn.js"></script>

<%@ include file="edit-js.jsp" %>
