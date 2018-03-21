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
            <li class="active">创建用户</li>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-sm-12 col-md-6">

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action">
                        <div class="input-field col s12 hide" id="create-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="row" style="padding: 0 20px;" id="create-form">

                            <div class="input-field col s12">
                                <i class="material-icons prefix">perm_contact_calendar</i>
                                <input id="create-username" type="text" class="validate">
                                <label for="create-username" data-error="wrong" data-success="right">用户名</label>
                            </div>

                            <div class="input-field col s12">
                                <i class="material-icons prefix">email</i>
                                <input id="create-email" type="email" class="validate">
                                <label for="create-email" data-error="wrong" data-success="right">绑定邮箱</label>
                            </div>

                            <div class="input-field col s12">
                                <i class="material-icons prefix">lock_outline</i>
                                <input id="create-password" type="text" class="validate">
                                <label for="create-password" data-error="wrong" data-success="right">设置密码</label>
                            </div>

                            <div class="input-field col s6">
                                <strong>用户类型：</strong><br>

                                <input class="with-gap" name="role" type="radio" id="create-member" value="0" checked/>
                                <label for="create-member" class="radio-inline">普通用户</label>

                                <input class="with-gap" name="role" type="radio" id="create-vip"  value="1"/>
                                <label for="create-vip" class="radio-inline">会员用户</label>
                            </div>

                            <div class="input-field col s6">
                                <strong>权限类型：</strong><br>

                                <input class="with-gap" name="adminRole" type="radio" id="create-user" value="0" checked/>
                                <label for="create-user" class="radio-inline">非管理员</label>

                                <input class="with-gap" name="adminRole" type="radio" id="create-admin"  value="1"/>
                                <label for="create-admin" class="radio-inline">管理员</label>
                            </div>

                            <div class="input-field col s12 text-right">
                                <a class="waves-effect waves-light btn" id="create-btn">创建</a>
                            </div>

                        </div>

                        <%@ include file="create-js.jsp" %>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
