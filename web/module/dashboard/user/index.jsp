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
            <li><a href="#">用户管理</a></li>
            <li class="active">用户列表</li>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action text-right">
                        <button class="waves-effect waves-light btn" id="refresh-data"><i class="glyphicon glyphicon-refresh"></i></button>
                    </div>
                    <div class="card-content">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <thead>
                                <tr>
                                    <th>用户</th>
                                    <th>邮箱</th>
                                    <th>账户类型</th>
                                    <th>权限类型</th>
                                    <th>注册时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- DATA TABLE SCRIPTS -->
    <script src="${staticResourcePath}/js/dataTables/jquery.dataTables.js"></script>
    <script src="${staticResourcePath}/js/dataTables/dataTables.bootstrap.js"></script>

    <%@ include file="index-js.jsp" %>
</div>