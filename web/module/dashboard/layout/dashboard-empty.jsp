<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/dashboard-layout.jsp" %>

<script type="text/javascript">
    $(document).ready(function() {
        $('#page-insert-content').after($('#page-wrapper'));
    });
</script>

<!-- 这是一个模板页面，直接在各模块中复制引用 -->
<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            Empty Page <small>Create new page.</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#">Home</a></li>
            <li><a href="#">Empty</a></li>
            <li class="active">Data</li>
        </ol>
    </div>

    <div id="page-inner">

        <div class="row">

        </div>

    </div>
</div>