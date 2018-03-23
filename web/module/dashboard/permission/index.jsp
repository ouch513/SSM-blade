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
            <small>Permission Management</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${webPath}/dashboard/permission/index">权限管理</a></li>
            <li class="active">权限列表</li>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action">
                        <form class="form-inline">
                            <div class="form-group">
                                <label for="create-permission-name">权限：</label>
                                <input type="text" class="form-control" id="create-permission-name">&emsp;
                            </div>
                            <div class="form-group">
                                <label for="create-permission-slug">权限方法:</label>
                                <input type="text" class="form-control" id="create-permission-slug" placeholder="eg:UserServiceImpl.add">&emsp;
                            </div>

                            <div class="form-group">
                                <label for="create-permission-type">权限类型:</label>
                                <select class="form-control" id="create-permission-type">
                                    <option value="0">管理权限</option>
                                    <option value="1">公共权限</option>
                                </select>&emsp;
                            </div>

                            <div class="form-group">
                                <a class="waves-effect waves-light btn btn-default" id="create-btn">添加权限</a>
                            </div>

                            <div class="form-group pull-right">
                                <a class="waves-effect waves-light btn pull-right" id="refresh-data">刷新数据 <i class="glyphicon glyphicon-refresh"></i></a>
                            </div>
                        </form>
                    </div>
                    <div class="card-content">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <thead>
                                <tr>
                                    <th>权限</th>
                                    <th>方法</th>
                                    <th>类型</th>
                                    <th>操作</th>
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