﻿<%@ page language="java" import="java.util.*,com.user.model.Users" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Users user=(Users)session.getAttribute("LOGINUSER");
%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>在线投票系统</title>
    <meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文"/>
    <meta name="description" content="JS代码网提供Bootstrap模版,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <link id="dtstyle" href="<%=request.getContextPath()%>/assets/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <!-- ace styles -->

    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="assets/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <jsp:include page="/navbar.jsp"/>
    </div><!-- /.navbar-header -->
</div><!-- /.container -->
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <jsp:include page="/sidebarVoter.jsp"/>


        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">投票系统</a>
                    </li>
                    <li class="active">信息修改</li>
                </ul><!-- .breadcrumb -->

                <!--<div class="nav-search" id="nav-search">-->
                <!--<form class="form-search">-->
                <!--<span class="input-icon">-->
                <!--<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />-->
                <!--<i class="icon-search nav-search-icon"></i>-->
                <!--</span>-->
                <!--</form>-->
                <!--</div>&lt;!&ndash; #nav-search &ndash;&gt;-->
            </div>

            <div class="page-content">


                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <form class="form-horizontal">
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label" for="username">用户名</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="username" type="text"
                                               value="<%=user.getUsername()%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="password">密码</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="password"
                                               type="password"
                                               value="<%=user.getPassword()%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="realname">真实姓名</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="realname" type="text"
                                               value="<%=user.getRealname()%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="age">年龄</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="age" type="number"
                                               value="<%=user.getAge()%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="sex">性别</label>
                                    <div class="controls">
                                        <select id="sex">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="phone">联系电话</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="phone" type="number"
                                               value="<%=user.getPhone()%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="role">身份</label>
                                    <div class="controls">
                                        <select id="role">
                                            <option value="voter">投票人</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="remark">备注</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="remark" type="text"
                                               value="<%=user.getRemark()%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <button onclick="save()" class="btn btn-primary" type="button">修改
                                    </button>
                                </div>
                            </fieldset>
                        </form>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->

        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; 选择皮肤</span>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar"/>
                    <label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                    <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs"/>
                    <label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                    <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                    <label class="lbl" for="ace-settings-add-container">
                        切换窄屏
                        <b></b>
                    </label>
                </div>
            </div>
        </div><!-- /#ace-settings-container -->
    </div><!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="assets/js/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>" + "<" + "script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
</script>
<script src="assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="assets/js/excanvas.min.js"></script>
<![endif]-->

<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/jquery.slimscroll.min.js"></script>
<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="assets/js/jquery.sparkline.min.js"></script>
<script src="assets/js/flot/jquery.flot.min.js"></script>
<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="assets/js/flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->

<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>
<script src="assets/js/jquery-2.0.3.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
<!-- inline scripts related to this page -->

<div class="clearfix"></div>
<script>
    $(function () {
        $("#userinfo").addClass("active");
    })
    function save() {
        var username = $("#username").val(),
                password = $("#password").val(),
                realname = $("#realname").val(),
                age = $("#age").val(),
                sex = $("#sex").val(),
                phone = $("#phone").val(),
                role = $("#role").val(),
                remark = $("#remark").val();
        if (username == "" | password == "" | realname == "" | age == "" | phone == "") {
            //alert("先填写完注册信息");
        }
        $.ajax({
            type: "POST", //用POST方式传输
            dataType: "text", //数据格式:JSON
            url: "updateUser", //目标地址
            data: {
                id: "<%=user.getId()%>",
                "username": username,
                "password": password,
                "realname": realname,
                "age": age,
                "sex": sex,
                "role": role,
                "phone": phone,
                "remark": remark
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("qingqiu chucuo")
            },
            success: function (msg) {
                var json = eval('(' + msg + ')');
                if (json.status == "success")
                    alert("修改成功！");
                    window.location.href = "userinfo.jsp"
            }


        });

    }
</script>

</body>
</html>

