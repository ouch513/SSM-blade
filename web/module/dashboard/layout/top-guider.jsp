<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String curUser = (request.getSession().getAttribute("username")==null)?"":request.getSession().getAttribute("username").toString();
%>

<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand waves-effect waves-dark" href="${webPath}/dashboard/index"><i class="large material-icons">track_changes</i> <strong>Dashboard</strong></a>

        <div id="sideNav" href="${webPath}/dashboard/index"><i class="material-icons dp48">toc</i></div>
    </div>

    <ul class="nav navbar-top-links navbar-right">
        <li class="<%=(curUser.equals("")?"hide":"")%>"><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i
                class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
        <li class="<%=(curUser.equals("")?"hide":"")%>"><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown3"><i
                class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
        <li class="<%=(curUser.equals("")?"hide":"")%>"><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown2"><i
                class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
        <li>
            <a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1">
                <i class="fa fa-user fa-fw"></i> <b><%=curUser%></b> <i class="material-icons right">arrow_drop_down</i>
            </a>
        </li>
    </ul>
</nav>
<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
    <li class="<%=(curUser.equals("")?"":"hide")%>"><a href="${webPath}/dashboard/login"><i class="fa fa-sign-in fa-fw"></i> 登录</a></li>
    <li class="<%=(curUser.equals("")?"":"hide")%>"><a href="${webPath}/dashboard/regin"><i class="fa fa-edit fa-fw"></i> 注册</a></li>
    <li class="<%=(curUser.equals("")?"hide":"")%>"><a href="${webPath}/dashboard/profile/<%=request.getSession().getAttribute("userId")%>"><i class="fa fa-user fa-fw"></i> 个人中心</a></li>
    <li class="<%=(curUser.equals("")?"hide":"")%>"><a href="${webPath}/dashboard/account/<%=request.getSession().getAttribute("userId")%>"><i class="fa fa-gear fa-fw"></i> 账户设置</a></li>
    <li class="<%=(curUser.equals("")?"hide":"")%>"><a href="${webPath}/dashboard/logout"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a></li>
</ul>
<ul id="dropdown2" class="dropdown-content w250">
    <li>
        <a href="#">
            <div>
                <i class="fa fa-comment fa-fw"></i> New Comment
                <span class="pull-right text-muted small">4 min</span>
            </div>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="#">
            <div>
                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                <span class="pull-right text-muted small">12 min</span>
            </div>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="#">
            <div>
                <i class="fa fa-envelope fa-fw"></i> Message Sent
                <span class="pull-right text-muted small">4 min</span>
            </div>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="#">
            <div>
                <i class="fa fa-tasks fa-fw"></i> New Task
                <span class="pull-right text-muted small">4 min</span>
            </div>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="#">
            <div>
                <i class="fa fa-upload fa-fw"></i> Server Rebooted
                <span class="pull-right text-muted small">4 min</span>
            </div>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a class="text-center" href="#">
            <strong>See All Alerts</strong>
            <i class="fa fa-angle-right"></i>
        </a>
    </li>
</ul>
<ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
    <li>
        <a href="#">
            <div>
                <p>
                    <strong>Task 1</strong>
                    <span class="pull-right text-muted">60% Complete</span>
                </p>
                <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60"
                         aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                        <span class="sr-only">60% Complete (success)</span>
                    </div>
                </div>
            </div>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="#">
            <div>
                <p>
                    <strong>Task 2</strong>
                    <span class="pull-right text-muted">28% Complete</span>
                </p>
                <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0"
                         aria-valuemax="100" style="width: 28%">
                        <span class="sr-only">28% Complete</span>
                    </div>
                </div>
            </div>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="#">
            <div>
                <p>
                    <strong>Task 3</strong>
                    <span class="pull-right text-muted">60% Complete</span>
                </p>
                <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                         aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                        <span class="sr-only">60% Complete (warning)</span>
                    </div>
                </div>
            </div>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="#">
            <div>
                <p>
                    <strong>Task 4</strong>
                    <span class="pull-right text-muted">85% Complete</span>
                </p>
                <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85"
                         aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                        <span class="sr-only">85% Complete (danger)</span>
                    </div>
                </div>
            </div>
        </a>
    </li>
    <li class="divider"></li>
</ul>
<ul id="dropdown4" class="dropdown-content dropdown-tasks w250 taskList">
    <li>
        <div>
            <strong><%=request.getSession().getAttribute("username")%></strong>
            <span class="pull-right text-muted"><em>Today</em></span>
        </div>
        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</p>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <div>
            <strong>John Smith</strong>
            <span class="pull-right text-muted"><em>Yesterday</em></span>
        </div>
        <p>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</p>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="#">
            <div>
                <strong>John Smith</strong>
                <span class="pull-right text-muted"><em>Yesterday</em></span>
            </div>
            <p>Lorem Ipsum has been the industry's standard dummy text ever since the...</p>
        </a>
    </li>
    <li class="divider"></li>
    <li>
        <a class="text-center" href="#">
            <strong>Read All Messages</strong>
            <i class="fa fa-angle-right"></i>
        </a>
    </li>
</ul>
