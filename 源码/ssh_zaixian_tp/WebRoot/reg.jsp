<%@ page language="java" import="java.util.*,com.user.model.Users" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->

    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->


    <!-- ace styles -->

    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-layout">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <i class="icon-leaf green"></i>
                            <span class="red">新用户注册</span>
                            <br>
                            <!--<span class="white">用户登录</span>-->
                        </h1>
                        <!--<h4 class="blue">&copy; Company Name</h4>-->
                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="icon-coffee green"></i>
                                        输入用户名和密码
                                    </h4>

                                    <div class="space-6"></div>

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
                                            <div class="control-group">
                                                <button onclick="save()" class="btn btn-primary" type="button">注册
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>

                                    <!--<div class="social-or-login center">-->
                                    <!--<span class="bigger-110">Or Login Using</span>-->
                                    <!--</div>-->

                                    <!--<div class="social-login center">-->
                                    <!--<a class="btn btn-primary">-->
                                    <!--<i class="icon-facebook"></i>-->
                                    <!--</a>-->

                                    <!--<a class="btn btn-info">-->
                                    <!--<i class="icon-twitter"></i>-->
                                    <!--</a>-->

                                    <!--<a class="btn btn-danger">-->
                                    <!--<i class="icon-google-plus"></i>-->
                                    <!--</a>-->
                                    <!--</div>-->
                                </div><!-- /widget-main -->

                                <!--<div class="toolbar clearfix">-->
                                <!--<div>-->
                                <!--<a href="#" onclick="show_box('forgot-box'); return false;"-->
                                <!--class="forgot-password-link">-->
                                <!--<i class="icon-arrow-left"></i>-->
                                <!--I forgot my password-->
                                <!--</a>-->
                                <!--</div>-->

                                <!--<div>-->
                                <!--<a href="#" onclick="show_box('signup-box'); return false;"-->
                                <!--class="user-signup-link">-->
                                <!--I want to register-->
                                <!--<i class="icon-arrow-right"></i>-->
                                <!--</a>-->
                                <!--</div>-->
                                <!--</div>-->
                            </div><!-- /widget-body -->
                        </div><!-- /login-box -->

                        <div id="forgot-box" class="forgot-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header red lighter bigger">
                                        <i class="icon-key"></i>
                                        Retrieve Password
                                    </h4>

                                    <div class="space-6"></div>
                                    <p>
                                        Enter your email and to receive instructions
                                    </p>

                                    <form>
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control"
                                                                   placeholder="Email"/>
															<i class="icon-envelope"></i>
														</span>
                                            </label>

                                            <div class="clearfix">
                                                <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="icon-lightbulb"></i>
                                                    Send Me!
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div><!-- /widget-main -->

                                <div class="toolbar center">
                                    <a href="#" onclick="show_box('login-box'); return false;"
                                       class="back-to-login-link">
                                        Back to login
                                        <i class="icon-arrow-right"></i>
                                    </a>
                                </div>
                            </div><!-- /widget-body -->
                        </div><!-- /forgot-box -->

                        <div id="signup-box" class="signup-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header green lighter bigger">
                                        <i class="icon-group blue"></i>
                                        New User Registration
                                    </h4>

                                    <div class="space-6"></div>
                                    <p> Enter your details to begin: </p>

                                    <form>
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control"
                                                                   placeholder="Email"/>
															<i class="icon-envelope"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control"
                                                                   placeholder="Username"/>
															<i class="icon-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control"
                                                                   placeholder="Password"/>
															<i class="icon-lock"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control"
                                                                   placeholder="Repeat password"/>
															<i class="icon-retweet"></i>
														</span>
                                            </label>

                                            <label class="block">
                                                <input type="checkbox" class="ace"/>
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
                                            </label>

                                            <div class="space-24"></div>

                                            <div class="clearfix">
                                                <button type="reset" class="width-30 pull-left btn btn-sm">
                                                    <i class="icon-refresh"></i>
                                                    Reset
                                                </button>

                                                <button type="button"
                                                        class="width-65 pull-right btn btn-sm btn-success">
                                                    Register
                                                    <i class="icon-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>

                                <div class="toolbar center">
                                    <a href="#" onclick="show_box('login-box'); return false;"
                                       class="back-to-login-link">
                                        <i class="icon-arrow-left"></i>
                                        Back to login
                                    </a>
                                </div>
                            </div><!-- /widget-body -->
                        </div><!-- /signup-box -->
                    </div><!-- /position-relative -->
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
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
    window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    function show_box(id) {
        jQuery('.widget-box.visible').removeClass('visible');
        jQuery('#' + id).addClass('visible');
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
        if (username == "" | password == "" | realname == "" | age == "" | phone == "" | remark == "") {
            alert("先填写完注册信息");
        }
        $.ajax({
            type: "POST", //用POST方式传输
            dataType: "text", //数据格式:JSON
            url: "addUser", //目标地址
            data: {
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
                    alert("成功");
                window.location.href = "login.html"
            }


        });

    }
</script>
</body>
</html>
