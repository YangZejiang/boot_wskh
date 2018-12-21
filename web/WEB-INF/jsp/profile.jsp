<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>卫生考核系统</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"/>
    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet"/>
    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet"/>
    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet"/>
    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/boot-wskh.css" rel="stylesheet" type="text/css"/>
    <style>
        .ido {
            padding: 5px;
            color: white;
            background: #5bc0de;
            border: 5px solid;
            float: left;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>mark/list.action">卫生考核系统 v1.0</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>
                        用户：${USER_SESSION.user_name}
                    </a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath }/logout.action">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>

        <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="查询内容...">
                            <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
                        </div>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mark/userinfo.action" class="active">
                            <i class="fa fa-user fa-fw"></i> 个人信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mark/list.action">
                            <i class="fa fa-edit fa-fw"></i> 成绩管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mark/adminlist.action">
                            <i class="fa fa-dashboard fa-fw"></i> 人员管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mark/noticelist.action">
                            <i class="fa fa-book fa-fw"></i> 通知管理
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>
    <!-- 列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">个人信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-10">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="user_code" class="col-sm-1 control-label">学号</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="user_code" value="${user.user_code}"
                                       disabled="disabled"/>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="user_name" class="col-sm-1 control-label">姓名</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="user_name" value="${user.user_name}"
                                       disabled="disabled"/>
                            </div>
                        </div>
                        <br>
                        <c:if test="${user.user_state == 1}">
                            <div class="form-group">
                                <label for="user_checkroom" class="col-sm-1 control-label">我的管理</label>
                                <div class="col-sm-10" id="user_checkroom">
                                    <c:forEach items="${roomlist}" var="roomlist">
                                        <span id="${roomlist}" class="ido">${roomlist}</span>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>
                        <br>
                        <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                           data-target="#pwEditDialog">修改密码</a>
                    </div>
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>


    <!-- 修改模态框 -->
    <div class="modal fade" id="pwEditDialog" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">修改密码</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="edit_pw_form">
                        <div class="form-group">
                            <label for="edit_pw" class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="edit_pw" placeholder="密码至少6位"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_pw_test" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="edit_pw_test" placeholder="确认密码"/>
                            </div>
                        </div>
                        <span id="msg" style="color: red;"></span>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="updatePw(${user.user_id})">确认</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
    function updatePw(id) {
        if ($("#edit_pw").val().length < 6 || $("#edit_pw_test").val().length < 6) {
            $("#msg").text("密码至少6位！");
        }
        else if ($("#edit_pw").val() != $("#edit_pw_test").val()) {
            $("#msg").text("密码不一致！")
        }
        else {
            $.ajax({
                type: "get",
                url: "<%=basePath%>mark/updatepw.action",
                data: {
                    "user_id": id,
                    "user_password": $("#edit_pw").val(),
                },
                success: function (data) {
                    if (data == "OK") {
                        alert("修改成功！");
                        window.location.reload();
                    } else {
                        alert("修改失败！");
                        window.location.reload();
                    }
                }
            })
        }
    }


</script>
</body>
</html>