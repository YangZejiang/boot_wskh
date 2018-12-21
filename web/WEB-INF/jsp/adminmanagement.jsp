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
            cursor: pointer;
        }

        .otherdo {
            padding: 5px;
            color: white;
            background: #5e5e5e;
            border: 5px solid;
            float: left;
        }

        .nodo {
            padding: 5px;
            color: white;
            background: #3d8b3d;
            border: 5px solid;
            float: left;
            cursor: pointer;

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
                        <a href="${pageContext.request.contextPath }/mark/userinfo.action">
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
                            <i class="fa fa-dashboard fa-fw" class="active"></i> 人员管理
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

    <!-- 人员管理列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">人员管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/mark/adminlist.action">
                    <!-- 学号（usercode） -->
                    <div class="form-group" style="width: 220px">
                        <label for="key_usercode">学号</label>
                        <input type="text" class="form-control" id="key_usercode"
                               value="${key_usercode }" name="key_usercode"/>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <%--<a href="#" class="btn btn-primary" data-toggle="modal"--%>
           <%--data-target="#newAdminDialog" onclick="clearAdmin()">新建</a>--%>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><b>"管理员列表"</b></div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" style="table-layout: fixed">
                        <thead>
                        <tr>
                            <th style="width: 5%"></th>
                            <th style="width: 12%;">学号</th>
                            <th style="width: 12%">姓名</th>
                            <th style="width: 61%;">检查的寝室</th>
                            <th style="width: 10%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${(page.page - 1) * page.size + status.count}</td>
                                <td style="text-align:center">${row.user_code}</td>
                                <td style="text-align:center">${row.user_name}</td>
                                <td style="text-align:center;overflow-x: hidden;text-overflow:ellipsis;
                                    white-space: nowrap" title="${row.user_checkroom}">${row.user_checkroom}</td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                       data-target="#adminEditDialog" onclick="editAdmin(${row.user_id})">修改</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/mark/adminlist.action"/>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 管理员列表查询部分  end-->
</div>

<%--<!-- 创建管理员模态框 -->--%>
<%--<div class="modal fade" id="newAdminDialog" tabindex="-1" role="dialog"--%>
<%--aria-labelledby="myModalLabel">--%>
<%--<div class="modal-dialog" role="document">--%>
<%--<div class="modal-content">--%>
<%--<div class="modal-header">--%>
<%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--<span aria-hidden="true">&times;</span>--%>
<%--</button>--%>
<%--<h4 class="modal-title" id="myModalLabel">新建卫生成绩</h4>--%>
<%--</div>--%>
<%--<div class="modal-body">--%>
<%--<form class="form-horizontal" id="new_mark_form">--%>
<%--<div class="form-group">--%>
<%--<label for="new_mkPer" class="col-sm-2 control-label">周（期）</label>--%>
<%--<div class="col-sm-10">--%>
<%--<input type="text" class="form-control" id="new_mkPer" placeholder="周（期）" name="mk_per"/>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="form-group">--%>
<%--<label for="new_mkRoomId" class="col-sm-2 control-label">寝室号</label>--%>
<%--<div class="col-sm-10">--%>
<%--<input type="text" class="form-control" id="new_mkRoomId" placeholder="例：050413（5号楼413）"--%>
<%--name="mk_room_id"/>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label for="new_mkGrade" class="col-sm-2 control-label">卫生成绩</label>--%>
<%--<div class="col-sm-10">--%>
<%--<input type="text" class="form-control" id="new_mkGrade" placeholder="卫生成绩"--%>
<%--name="mk_grade"/>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label for="new_mkCase" class="col-sm-2 control-label">扣分情况</label>--%>
<%--<div class="col-sm-10">--%>
<%--<input type="text" class="form-control" id="new_mkCase" placeholder="扣分情况" name="mk_case"/>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label for="new_mkUserId" class="col-sm-2 control-label">审核员</label>--%>
<%--<div class="col-sm-10">--%>
<%--<input type="text" class="form-control" id="new_mkUserId" name="mk_user_id"--%>
<%--value="${USER_SESSION.user_id}" readonly="readonly"/>--%>
<%--</div>--%>
<%--</div>--%>
<%--</form>--%>
<%--</div>--%>
<%--<div class="modal-footer">--%>
<%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
<%--<button type="button" class="btn btn-primary" onclick="createMark()">添加成绩</button>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<!-- 修改管理员模态框 -->
<div class="modal fade" id="adminEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改管理信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_admin_form">
                    <input type="=text" id="edit_userId" name="user_id" hidden="hidden" readonly="readonly"/>
                    <input type="=text" id="edit_userCheckroom" name="user_checkroom" hidden="hidden"
                           readonly="readonly"/>
                    <input type="=text" id="edit_userCheckroom_del" name="user_checkroom_del" hidden="hidden"
                           readonly="readonly"/>
                    <!-- 学号 -->
                    <div class="form-group">
                        <label for="edit_userCode" class="col-sm-2 control-label">学号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_userCode" placeholder="学号"
                                   name="user_code"/>
                        </div>
                    </div>
                    <!-- 姓名 -->
                    <div class="form-group">
                        <label for="edit_userName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_userName" placeholder="姓名"
                                   name="user_name"/>
                        </div>
                    </div>


                    <!-- 楼号 -->
                    <div class="form-group">
                        <label for="key_roomLou" class="col-sm-2 control-label">楼号</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="key_roomLou">
                                <option value="">--请选择--</option>
                                <c:forEach items="${allLou}" var="lou">
                                    <option value="${lou}">${lou }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <!-- 层号 -->
                    <div class="form-group">
                        <label for="key_roomCeng" class="col-sm-2 control-label">层号</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="key_roomCeng">
                                <option value="">--请选择--</option>
                                <c:forEach items="${allCeng}" var="ceng">
                                    <option value="${ceng}">${ceng }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <!-- 寝室号 -->
                    <div class="form-group">
                        <label for="key_roomId" class="col-sm-2 control-label">寝室号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="key_roomId" placeholder="例：050413(模糊搜索"/>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="roomlist()">查询</button>

                    <!-- 检查的寝室 -->
                    <div>
                        <fieldset style="width: auto; margin: 0px auto;">
                            <legend>
                                <font style="font-size:15px" face="宋体">
                                    寝室选择
                                </font>
                            </legend>
                            <div id="roomlist" style="overflow-y: scroll">
                            </div>
                        </fieldset>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateAdmin()">保存修改</button>
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


    // //清空新建客户窗口中的数据
    // function clearAdmin() {
    //     $("#new_mkPer").val("");
    //     $("#new_mkRoomId").val("")
    //     $("#new_mkGrade").val("")
    //     $("#new_mkCase").val("")
    // }

    // 添加成绩
    <%--function createAdmin() {--%>
    <%--$.post("<%=basePath%>mark/create.action",--%>
    <%--$("#new_mark_form").serialize(), function (data) {--%>
    <%--if (data == "OK") {--%>
    <%--alert("成绩添加成功！");--%>
    <%--window.location.reload();--%>
    <%--} else if (data == "EXIST") {--%>
    <%--alert("成绩已存在，请重新确认！")--%>
    <%--}--%>
    <%--else {--%>
    <%--alert("成绩添加失败！");--%>
    <%--window.location.reload();--%>
    <%--}--%>
    <%--});--%>
    <%--}--%>

    // 当前被修改的用户id
    var edit_userId = $("#edit_userId").val();
    // 当前被修改的用户管理的寝室[]
    var edit_userCheckroom = $("#edit_userCheckroom").val().split(",");
    var del_roomList = new Array();
    // 点击 td 修改class 变换样式
    $(document).on('click', '#roomlist span', function () {
        if ($(this).hasClass("ido")) {
            $(this).removeClass("ido");
            $(this).addClass("nodo");
            removeByValue(edit_userCheckroom, $(this).attr("id"));
            del_roomList.push($(this).attr("id"));
        }
        else if ($(this).hasClass("nodo")) {
            $(this).removeClass("nodo");
            $(this).addClass("ido");
            edit_userCheckroom.push($(this).attr("id"));
            removeByValue(del_roomList, $(this).attr("id"));
        }
    });

    // 从数组中删除
    function removeByValue(array, val) {
        for (var i = 0; i < array.length; i++) {
            if (array[i] == val) {
                array.splice(i, 1);
                break;
            }
        }
    }

    // 通过楼层寝室号查寝室，显示 <table id="roomlist"></table>模块
    function roomlist() {
        if ($("#key_roomLou").val() == '' &&
            $("#key_roomCeng").val() == '') {
            alert("请填写要查询的范围！");
        }
        else {
            $.ajax({
                type: "get",
                url: "<%=basePath%>mark/roomlist.action",
                data: {
                    "key_roomLou": $("#key_roomLou").val(),
                    "key_roomCeng": $("#key_roomCeng").val(),
                    "key_roomId": $("#key_roomId").val().trim(),
                },
                success: function (data) { //data包括 room_id,room_user_id
                    show_new_roomlist(data);
                }
            })
        }
    }

    // 表单内查询后显示寝室
    function show_new_roomlist(data) {
        //清理之前的数据
        $("#roomlist").empty();
        // $("#roomlist span").siblings("span").remove();
        //添加新的数据
        for (var i = 0; i < data.length; i++) {
            var html_ido = '<span id="' + data[i].room_id + '" class="ido">' + data[i].room_id + '</span>';
            var html_otherdo = '<span id="' + data[i].room_id + '" class="otherdo">' + data[i].room_id + '</span>';
            var html_nodo = '<span id="' + data[i].room_id + '" class="nodo">' + data[i].room_id + '</span>';
            var flag = false;
            for (var j = 0; j < edit_userCheckroom.length && !flag; j++) {
                if (data[i].room_id == edit_userCheckroom[j]) {
                    $("#roomlist").append(html_ido);
                    flag = true;
                }
            }
            if (data[i].room_user_id != edit_userId && data[i].room_user_id != "" && data[i].room_user_id != null) {
                $("#roomlist").append(html_otherdo);
            }
            else if (!flag) {
                $("#roomlist").append(html_nodo);
            }
        }
    }

    // 通过user_id获取被修改者的信息
    function editAdmin(id) {
        $.ajax({
                type: "get",
                url: "<%=basePath%>mark/getAdminByUserid.action",
                data: {"id": id},
                success: function (data) {
                    $("#edit_userId").val(data.user_id);
                    $("#edit_userCode").val(data.user_code);
                    $("#edit_userName").val(data.user_name);
                    $("#edit_userCheckroom").val(data.user_checkroom);
                    edit_userCheckroom = $("#edit_userCheckroom").val().split(",");
                    edit_userId = $("#edit_userId").val();
                    show_roomlist(edit_userCheckroom);
                }
            }
        );
    }

    // 第一次生成表单已分配寝室显示
    function show_roomlist(data) {
        //清理之前的数据
        $("#roomlist").empty();
        // $("#roomlist span").siblings("span").remove();
        //添加新的数据
        if (data[0] != '' && data[0] != null) {
            for (var i = 0; i < data.length; i++) {
                var html_ido = '<span id="' + data[i] + '" class="ido">' + data[i] + '</span>';
                $("#roomlist").append(html_ido);
            }
        }
    }

    // 确认并执行修改操作
    function updateAdmin() {
        if (edit_userCheckroom[0] == "" || edit_userCheckroom[0] == null) {
            edit_userCheckroom.splice(0, 1);
        }
        if (confirm('确认信息：\u000d学号：'
            + $("#edit_userCode").val() + '\u000d姓名：'
            + $("#edit_userName").val() + '\u000d寝室安排：'
            + edit_userCheckroom.toString())) {
            // 修改form中user_checkroom的值
            $("#edit_userCheckroom").val(edit_userCheckroom.toString());
            $.post("<%=basePath%>mark/updateadmin.action",
                $.param({'del_roomlist': del_roomList.toString()}) + '&' +
                $("#edit_admin_form").serialize(),
                function (data) {
                    if (data == "OK") {
                        alert("修改成功！");
                        window.location.reload();
                    } else {
                        alert("修改失败！");
                        window.location.reload();
                    }
                });
        }
    }
</script>
</body>
</html>