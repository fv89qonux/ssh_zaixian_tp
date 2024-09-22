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
<div class="navbar-header pull-left">
    <a href="#" class="navbar-brand">
        <small>
            <i class="icon-leaf"></i>
            在线投票系统
        </small>
    </a><!-- /.brand -->
</div><!-- /.navbar-header -->

<div class="navbar-header pull-right" role="navigation">
    <ul class="nav ace-nav">
        <!--<li class="grey">-->
            <!--<a data-toggle="dropdown" class="dropdown-toggle" href="#">-->
                <!--<i class="icon-tasks"></i>-->
                <!--<span class="badge badge-grey">0</span>-->
            <!--</a>-->
            <!--<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">-->
                <!--<li class="dropdown-header">-->
                    <!--<i class="icon-ok"></i>-->
                    <!--当前没有任务-->
                <!--</li>-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="clearfix">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-left">软件更新</span>&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-right">65%</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->

                <!--&lt;!&ndash;<div class="progress progress-mini ">&ndash;&gt;-->
                <!--&lt;!&ndash;<div style="width:65%" class="progress-bar "></div>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="clearfix">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-left">硬件更新</span>&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-right">35%</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->

                <!--&lt;!&ndash;<div class="progress progress-mini ">&ndash;&gt;-->
                <!--&lt;!&ndash;<div style="width:35%" class="progress-bar progress-bar-danger"></div>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="clearfix">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-left">单元测试</span>&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-right">15%</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->

                <!--&lt;!&ndash;<div class="progress progress-mini ">&ndash;&gt;-->
                <!--&lt;!&ndash;<div style="width:15%" class="progress-bar progress-bar-warning"></div>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="clearfix">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-left">错误修复</span>&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-right">90%</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->

                <!--&lt;!&ndash;<div class="progress progress-mini progress-striped active">&ndash;&gt;-->
                <!--&lt;!&ndash;<div style="width:90%" class="progress-bar progress-bar-success"></div>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;查看任务详情&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="icon-arrow-right"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->
            <!--</ul>-->
        <!--</li>-->

        <!--<li class="purple">-->
            <!--<a data-toggle="dropdown" class="dropdown-toggle" href="#">-->
                <!--<i class="icon-bell-alt icon-animated-bell"></i>-->
                <!--<span class="badge badge-important">0</span>-->
            <!--</a>-->

            <!--<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">-->
                <!--<li class="dropdown-header">-->
                    <!--<i class="icon-warning-sign"></i>-->
                    <!--0条通知-->
                <!--</li>-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="clearfix">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-left">&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="btn btn-xs no-hover btn-pink icon-comment"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;新闻评论&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-right badge badge-info">+12</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="btn btn-xs btn-primary icon-user"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;切换为编辑登录..&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="clearfix">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-left">&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;新订单&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-right badge badge-success">+8</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="clearfix">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-left">&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="btn btn-xs no-hover btn-info icon-twitter"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;粉丝&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="pull-right badge badge-info">+11</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;查看所有通知&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="icon-arrow-right"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->
            <!--</ul>-->
        <!--</li>-->

        <!--<li class="green">-->
            <!--<a data-toggle="dropdown" class="dropdown-toggle" href="#">-->
                <!--<i class="icon-envelope icon-animated-vertical"></i>-->
                <!--<span class="badge badge-success">0</span>-->
            <!--</a>-->

            <!--<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">-->
                <!--<li class="dropdown-header">-->
                    <!--<i class="icon-envelope-alt"></i>-->
                    <!--0条消息-->
                <!--</li>-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<img src="assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="msg-body">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="msg-title">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="blue">Alex:</span>&ndash;&gt;-->
                <!--&lt;!&ndash;不知道写啥 ...&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->

                <!--&lt;!&ndash;<span class="msg-time">&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="icon-time"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;<span>1分钟以前</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<img src="assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="msg-body">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="msg-title">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="blue">Susan:</span>&ndash;&gt;-->
                <!--&lt;!&ndash;不知道翻译...&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->

                <!--&lt;!&ndash;<span class="msg-time">&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="icon-time"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;<span>20分钟以前</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#">&ndash;&gt;-->
                <!--&lt;!&ndash;<img src="assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="msg-body">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="msg-title">&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="blue">Bob:</span>&ndash;&gt;-->
                <!--&lt;!&ndash;到底是不是英文 ...&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->

                <!--&lt;!&ndash;<span class="msg-time">&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="icon-time"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;<span>下午3:15</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</span>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--&lt;!&ndash;<li>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="inbox.html">&ndash;&gt;-->
                <!--&lt;!&ndash;查看所有消息&ndash;&gt;-->
                <!--&lt;!&ndash;<i class="icon-arrow-right"></i>&ndash;&gt;-->
                <!--&lt;!&ndash;</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->
            <!--</ul>-->
        <!--</li>-->

        <li class="light-blue">
            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                <img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo"/>
								<span class="user-info">
									<small>欢迎,</small>
									<%=user.getUsername()%>
								</span>

                <i class="icon-caret-down"></i>
            </a>

            <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                <!--<li>-->
                <!--<a href="#">-->
                <!--<i class="icon-cog"></i>-->
                <!--设置-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--<i class="icon-user"></i>-->
                <!--个人资料-->
                <!--</a>-->
                <!--</li>-->

                <!--<li class="divider"></li>-->

                <!--<li>-->
                <a href="login.html">
                    <i class="icon-off"></i>
                    退出
                </a>
                </li>
            </ul>
        </li>
    </ul><!-- /.ace-nav -->
</body>
</html>