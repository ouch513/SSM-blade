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
            <li class="active">公告列表</li>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action text-right">
                        <a class="waves-effect waves-light btn btn-warning" id="create-bulletin" href="${webPath}/dashboard/bulletin/create">发布公告 <i class="glyphicon glyphicon-plus-sign"></i></a>
                        <a class="waves-effect waves-light btn" id="refresh-data">刷新数据 <i class="glyphicon glyphicon-refresh"></i></a>
                    </div>
                    <div class="card-content">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <thead>
                                <tr>
                                    <th>标题</th>
                                    <th>更新时间</th>
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