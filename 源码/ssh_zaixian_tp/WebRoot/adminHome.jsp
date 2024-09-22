<%@ page language="java" import="java.util.*,com.user.model.Users" pageEncoding="utf-8"%>
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

        <jsp:include page="/sidebarAdmin.jsp"/>


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
                    <li class="active">投票人管理</li>
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
                        <table id="table" class="table table-striped table-bordered" width="100%">

                            <thead>
                            <tr>
                                <th>用户名</th>
                                <th>密码</th>
                                <th>真实姓名</th>
                                <th>年龄</th>
                                <th>性别</th>
                                <th>联系电话</th>
                                <th>身份</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                            <!-- tbody是必须的 -->
                        </table>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog" style="width: 400px">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">×</button>
                                        <h3>投票人</h3>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal">
                                            <fieldset>
                                                <div class="control-group">
                                                    <label class="control-label" for="username">用户名</label>
                                                    <div class="controls">
                                                        <input class="input-xlarge focused" id="username" type="text"
                                                               placeholder="输入用户名">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="password">密码</label>
                                                    <div class="controls">
                                                        <input class="input-xlarge focused" id="password"
                                                               type="password"
                                                               placeholder="输入密码">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="realname">真实姓名</label>
                                                    <div class="controls">
                                                        <input class="input-xlarge focused" id="realname" type="text"
                                                               placeholder="输入真实姓名">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="age">年龄</label>
                                                    <div class="controls">
                                                        <input class="input-xlarge focused" id="age" type="number"
                                                               placeholder="输入年龄">
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
                                                               placeholder="联系电话">
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
                                                               placeholder="备注">
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="save()" class="btn btn-primary" type="button">保存</button>
                                        <button onclick="cancel()" class="btn " type="button">取消</button>
                                    </div>
                                </div>
                            </div>
                        </div>

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
    editflag = true//为真表示编辑
    $(function () {
        $("#adminHome").addClass("active");
        table = $("#table").DataTable({
            ajax: {
                url: "findAllUsers"
            },
            processing: true,
            serverSide: true,
            bSortClasses: true,
            columnDefs: [
                {
                    targets: 8,
                    render: function (a, b, c, d) {
                        var html = "<button type='button' class='btn-sm btn-primary' onclick=\"editItem(\'"
                                + c.id
                                + "\',\'" + c.username
                                + "\',\'" + c.password
                                + "\',\'" + c.realname
                                + "\',\'" + c.age
                                + "\',\'" + c.sex
                                + "\',\'" + c.role
                                + "\',\'" + c.phone
                                + "\',\'" + c.remark
                                + "\')\">修改</button>"
                                + "<button type='button' class='btn-sm btn-danger' onclick=deleteItem(\'" + c.username + "\')>删除</button>"
                        return html;
                    }
                }
            ],
            columns: [
                {"data": "username"},
                {"data": "password"},
                {"data": "realname"},
                {"data": "age"},
                {"data": "sex"},
                {"data": "phone"},
                {"data": "role"},
                {"data": "remark"},
            ],
            "language": {
                "lengthMenu": "每页_MENU_条记录 ",
                "zeroRecords": "没有找到记录",
                "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                "infoEmpty": "无记录",
                "infoFiltered": "(从 _MAX_ 条记录过滤)",
                "sSearch": "搜索:",
                "paginate": {
                    "previous": "上一页",
                    "next": "下一页"
                }
            },
            initComplete: function () {
                $("#table_length").append('<button type="button" class="btn-primary" id="add" onclick=addItem()>添加投票人</button>');
            }
        });
    });
    function addItem() {
        clearModal();
        editflag = false;
        $("#myModal").modal('show');
    }
    function save() {
        var username = $("#username").val(),
                password = $("#password").val(),
                realname = $("#realname").val(),
                age = $("#age").val(),
                sex = $("#sex").val(),
                phone = $("#phone").val(),
                role = $("#role").val(),
                remark = $("#remark").val();
        $.ajax({
            type: "POST", //用POST方式传输
            dataType: "text", //数据格式:JSON
            url: (function () {
                if (editflag == true)
                    return "updateUser";
                else
                    return "addUser";
            })(), //目标地址
            data: {
                "username": username,
                "id": $("#username").attr('iid'),
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
                    alert("成功");
                $("#myModal").modal('hide');
                table.ajax.reload();
            }


        });

    }
    function cancel() {
        clearModal();
        $("#myModal").modal('hide');
    }
    function editItem(id, username, password, realname, age, sex, role,phone, remark) {
        editflag = true;
        $("#username").attr('iid', id);
        $("#username").val(username);
        $("#password").val(password);
        $("#realname").val(realname);
        $("#age").val(age);
        $("#sex").val(sex);
        $("#role").val(role);
        $("#phone").val(phone);
        $("#remark").val(remark);
        $("#myModal").modal('show');
    }
    function deleteItem(username) {
        if (window.confirm("确定要删除此条目？")) {
            $.ajax({
                type: "POST", //用POST方式传输
                dataType: "text", //数据格式:JSON
                url: "deleteUser", //目标地址
                data: {
                    "username": username
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("qingqiu chucuo")
                },
                success: function (msg) {
                    var json = eval('(' + msg + ')');
                    if (json.status == "success")
                        alert("删除成功");
                    table.ajax.reload();
                }

            });
        }
    }
    function clearModal() {
        $("#dName").val("");
        $("#symptom").val("");
        $("#prescription").val("");
        $("#efficacy").val("");
        $("#remark").val("");
    }
</script>

</body>
</html>

