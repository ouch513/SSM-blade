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
            权限管理
            <small>User Management</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${webPath}/dashboard/permission/index">权限管理</a></li>
            <li><a href="${webPath}/dashboard/permission/index">权限列表</a></li>
            <li class="active">查看权限</li>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-sm-12 col-md-6">

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action" style="font-size:18px;color: #F0433D;">
                        查看与编辑<br>
                        <div class="input-field col s12 hide" id="edit-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div><br>
                        <div class="input-field col s12 hide" id="edit-success">
                            <div class="alert alert-success" role="alert"><strong>success!</strong></div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="row" style="padding: 0 20px;" id="edit-form">

                            <div class="input-field col s12">
                                <strong>权限：</strong>
                                <input id="edit-permission-name" type="text" class="validate">
                            </div>

                            <div class="input-field col s12">
                                <strong>权限方法：</strong>
                                <input id="edit-permission-slug" type="email" class="validate">
                            </div>

                            <div class="input-field col-xs-12 col-sm-6">
                                <strong>权限类型：</strong><br>

                                <select class="form-control" id="edit-permission-type">
                                    <option value="0">管理权限</option>
                                    <option value="1">公共权限</option>
                                </select>&emsp;
                            </div>

                            <div class="input-field col s12 text-right" style="margin-top: 30px;">
                                <a class="btn btn-primary" id="refresh-show-btn">刷新</a>
                                <a class="waves-effect waves-light btn" id="edit-btn">修改</a>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

            <div class="col-sm-12 col-md-6">

                <div class="card">
                    <div class="card-action" style="font-size:18px;color: #F0433D;">
                        其他操作<br>
                        <div class="input-field col s12 hide" id="delete-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div><br>
                        <div class="input-field col s12 hide" id="delete-success">
                            <div class="alert alert-success" role="alert"><strong>success!</strong></div>
                        </div>
                    </div>
                    <div class="card-content">

                        <button class="btn btn-danger" id="delete-permission">删除权限</button>

                    </div>
                </div>

                <%@ include file="show-js.jsp" %>

            </div>
        </div>
    </div>
</div>
