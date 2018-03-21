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
            个人中心
            <small>Profile</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${webPath}/dashboard/profile/<%=request.getSession().getAttribute("userId")%>">用户中心</a></li>
            <li class="active">账户设置</li>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-sm-12 col-md-6">

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action" style="font-size:18px;color: #F0433D;">
                        查看编辑<br>
                        <div class="input-field col s12 hide" id="account-edit-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div><br>
                        <div class="input-field col s12 hide" id="account-edit-success">
                            <div class="alert alert-success" role="alert"><strong>success!</strong></div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="row" style="padding: 0 20px;" id="edit-form">

                            <div class="input-field col s12">
                                <strong id="show-admin-role">用户：</strong>
                                <input id="account-username" type="text" class="validate" disabled>
                            </div>

                            <div class="input-field col s12">
                                <strong>邮箱：</strong>
                                <input id="account-email" type="email" class="validate">
                            </div>

                            <div class="input-field col s12">
                                <strong>用户类型：</strong><br>
                                <input id="account-role" type="text" disabled>
                            </div>

                            <div class="input-field col s12">
                                <strong>权限类型：</strong><br>
                                <input id="account-admin-role" type="text" disabled>
                            </div>

                            <div class="input-field col s12">
                                <a class="btn btn-primary" id="account-show-btn">刷新</a>
                                <a class="waves-effect waves-light btn" id="account-edit-btn">修改</a>
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
                        <div class="input-field col s12 hide" id="account-pass-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div><br>
                        <div class="input-field col s12 hide" id="account-pass-success">
                            <div class="alert alert-success" role="alert"><strong>success!</strong></div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="row" style="padding: 0 20px;" id="account-pass-form">

                            <div class="input-field col s8">
                                <i class="material-icons prefix">lock_outline</i>
                                <input id="edit-account-password" type="text" class="validate">
                                <label for="edit-account-password" data-error="wrong" data-success="right">新密码</label>
                            </div>

                            <div class="input-field col s4">
                                <a class="waves-effect waves-light btn" id="account-pass-btn">修改</a>
                            </div>

                        </div>
                    </div>
                </div>

                <%@ include file="account-js.jsp" %>

            </div>
        </div>
    </div>
</div>
