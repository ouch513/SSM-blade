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
            <li class="active">发布公告</li>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-sm-12 col-md-10">

                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action">
                        发布公告<br>
                        <div class="input-field col s12 hide" id="create-warning">
                            <div class="alert alert-danger" role="alert"><strong>Warning!</strong></div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="row" style="padding: 0 20px;" id="create-form">

                            <div class="input-field col s12">
                                <strong>标题：</strong>
                                <input id="create-title" type="text" class="validate">
                            </div>

                            <div class="input-field col s12">
                                <strong>内容：</strong>
                                <input id="create-content" type="text" class="validate">
                            </div>

                            <div class="input-field col s12 text-right">
                                <a class="waves-effect waves-light btn" id="create-btn">发布</a>
                            </div>

                        </div>

                        <%@ include file="create-js.jsp" %>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

