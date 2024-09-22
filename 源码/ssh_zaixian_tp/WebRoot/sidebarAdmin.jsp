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

    <!--<div class="sidebar-shortcuts" id="sidebar-shortcuts">-->
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

        <!--<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">-->
            <!--<span class="btn btn-success"></span>-->

            <!--<span class="btn btn-info"></span>-->

            <!--<span class="btn btn-warning"></span>-->

            <!--<span class="btn btn-danger"></span>-->
        <!--</div>-->
    <!--</div>&lt;!&ndash; #sidebar-shortcuts &ndash;&gt;-->

    <ul class="nav nav-list">
        <li id="adminHome">
            <a href="adminHome.jsp">
                <i class="icon-user"></i>
                <span class="menu-text"> 投票人管理 </span>
            </a>
        </li>
        <li id="design">
            <a href="#" class="dropdown-toggle">
                <i class="icon-bar-chart"></i>
                <span class="menu-text"> 投票设计 </span>
                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <li>
                    <a href="table.jsp">
                        <i class="icon-double-angle-right"></i>
                        查看投票
                    </a>
                </li>
                <li>
                    <a href="add.jsp">
                        <i class="icon-double-angle-right"></i>
                        添加投票
                    </a>
                </li>
                <li>
                    <a href="edit.jsp">
                        <i class="icon-double-angle-right"></i>
                        修改投票
                    </a>
                </li>
                <li>
                    <a href="del.jsp">
                        <i class="icon-double-angle-right"></i>
                        删除投票
                    </a>
                </li>
                <li>
                    <a href="result.jsp">
                        <i class="icon-double-angle-right"></i>
                        投票结果
                    </a>
                </li>
            </ul>
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