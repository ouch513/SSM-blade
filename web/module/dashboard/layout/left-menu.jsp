<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">

            <li>
                <a class="waves-effect waves-dark" href="${webPath}/dashboard/index" id="menu-dashboard">
                    <i class="fa fa-dashboard"></i>控制面板
                </a>
            </li>

            <li>
                <a class="waves-effect waves-dark" href="${webPath}/dashboard/user/index" id="menu-user">
                    <i class="fa fa-user"></i>用户管理
                </a>
            </li>

        </ul>

    </div>
</nav>

<script>
    $(function () {
        var pathname = window.location.pathname;
        if(pathname.indexOf("dashboard/user")!=-1) {
            $("#menu-user").addClass("active-menu");
        } else {
            $("#menu-dashboard").addClass("active-menu");
        }
    })
</script>
