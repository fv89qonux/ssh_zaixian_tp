<%@ page language="java" import="java.util.*,com.user.model.Users" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Users user=(Users)session.getAttribute("LOGINUSER");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="sidebar" id="sidebar">
    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <!--<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">-->
            <!--<button class="btn btn-success">-->
                <!--<i class="icon-signal"></i>-->
            <!--</button>-->

            <!--<button class="btn btn-info">-->
                <!--<i class="icon-pencil"></i>-->
            <!--</button>-->

            <!--<button class="btn btn-warning">-->
                <!--<i class="icon-group"></i>-->
            <!--</button>-->

            <!--<button class="btn btn-danger">-->
                <!--<i class="icon-cogs"></i>-->
            <!--</button>-->
        <!--</div>-->
        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div><!-- #sidebar-shortcuts -->

    <ul class="nav nav-list">
        <li id="design">
            <a href="#" class="dropdown-toggle">
                <i class="icon-bar-chart"></i>
                <span class="menu-text"> 投票 </span>
                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <li>
                    <a href="tableVoter.jsp">
                        <i class="icon-double-angle-right"></i>
                        所有投票
                    </a>
                </li>
                <li>
                    <a href="vote.jsp">
                        <i class="icon-double-angle-right"></i>
                        单/多选投票
                    </a>
                </li>
            </ul>
        </li>
        <li id="adminHome">
            <a href="resultVoter.jsp">
                <i class="icon-circle"></i>
                <span class="menu-text"> 查看投票 </span>
            </a>
        </li>
        <li id="userinfo">
            <a href="userinfo.jsp">
                <i class="icon-user"></i>
                <span class="menu-text"> 信息修改 </span>
            </a>
        </li>
        <li id="myvote">
            <a href="myvote.jsp">
                <i class="icon-eye-open"></i>
                <span class="menu-text"> 我的投票 </span>
            </a>
        </li>
    </ul><!-- /.nav-list -->

    <div class="sidebar-collapse" id="sidebar-collapse">
        <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
    </div>

    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
    </script>
</div>

</body>
</html>