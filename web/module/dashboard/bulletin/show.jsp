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
            <li class="active">查看公告</li>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-sm-12 col-md-10">

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action" style="font-size:18px;color: #F0433D;padding-bottom: 0;margin-bottom: 0;">
                        查看公告<br>

                        <div class="input-field col s12 hide" id="delete-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="row" style="padding: 0 20px;" id="edit-form">

                            <div class="input-field col s12">
                                <h2 id="show-title" class="text-center"></h2>
                                <h5 id="show-info" class="text-right"></h5>
                                <div id="show-content"></div>
                            </div>

                            <div class="input-field col s12 text-right" style="margin-top: 30px;">
                                <a class="btn btn-danger" id="delete-btn">删除</a>
                                <a class="btn btn-primary" id="refresh-show-btn">刷新</a>
                                <a class="waves-effect waves-light btn" href="${webPath}/dashboard/bulletin/edit/${bulletinId}">修改</a>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
            <%@ include file="show-js.jsp" %>

        </div>
    </div>
</div>
