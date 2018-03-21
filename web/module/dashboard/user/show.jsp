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
            用户管理
            <small>User Management</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${webPath}/dashboard/user/index">用户管理</a></li>
            <li><a href="${webPath}/dashboard/user/index">用户列表</a></li>
            <li class="active">查看用户</li>
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
                                <strong id="show-admin-role">用户：</strong>
                                <input id="edit-username" type="text" class="validate" disabled>
                            </div>

                            <div class="input-field col s12">
                                <strong>邮箱：</strong>
                                <input id="edit-email" type="email" class="validate">
                            </div>

                            <div class="input-field col-xs-12 col-sm-6">
                                <strong>用户类型：</strong><br>

                                <input class="with-gap" name="role" type="radio" id="edit-member" value="0" checked/>
                                <label for="edit-member" class="radio-inline">普通用户</label>

                                <input class="with-gap" name="role" type="radio" id="edit-vip"  value="1"/>
                                <label for="edit-vip" class="radio-inline">会员用户</label>
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

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action" style="font-size:18px;color: #F0433D;">
                        修改密码<br>
                        <div class="input-field col s12 hide" id="edit-pass-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div><br>
                        <div class="input-field col s12 hide" id="edit-pass-success">
                            <div class="alert alert-success" role="alert"><strong>success!</strong></div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="row" style="padding: 0 20px;" id="edit-pass-form">

                            <div class="input-field col s8">
                                <i class="material-icons prefix">lock_outline</i>
                                <input id="edit-pass-password" type="text" class="validate">
                                <label for="edit-pass-password" data-error="wrong" data-success="right">新密码</label>
                            </div>

                            <div class="input-field col s4">
                                <a class="waves-effect waves-light btn" id="edit-pass-btn">修改</a>
                            </div>

                        </div>
                    </div>
                </div>

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

                        <button class="btn btn-danger" id="delete-user">删除用户</button>

                    </div>
                </div>

                <%@ include file="show-js.jsp" %>

            </div>
        </div>
    </div>
</div>
