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
                        <a href="${pageContext.request.contextPath }/mark/list.action" class="active">
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

    <!-- 卫生成绩列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">成绩管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/mark/list.action">

                    <!-- 周（期） -->
                    <div class="form-group" style="width: 160px">
                        <label for="key_mkPer">周（期）</label>
                        <select class="form-control" id="key_mkPer" name="key_mkPer">
                            <option value="">--请选择--</option>
                            <c:forEach items="${allPer}" var="per">
                                <option value="${per}"
                                        <c:if test="${per == key_mkPer}"> selected</c:if>>
                                        ${per }
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- 楼号 -->
                    <div class="form-group" style="width: 140px">
                        <label for="key_roomLou">楼号</label>
                        <select class="form-control" id="key_roomLou" name="key_roomLou">
                            <option value="">--请选择--</option>
                            <c:forEach items="${allLou}" var="lou">
                                <option value="${lou}"
                                        <c:if test="${lou == key_roomLou}"> selected</c:if>>
                                        ${lou }
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- 层号 -->
                    <div class="form-group" style="width: 140px">
                        <label for="key_roomCeng">层号</label>
                        <select class="form-control" id="key_roomCeng" name="key_roomCeng">
                            <option value="">--请选择--</option>
                            <c:forEach items="${allCeng}" var="ceng">
                                <option value="${ceng}"
                                        <c:if test="${ceng == key_roomCeng}"> selected</c:if>>
                                        ${ceng }
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- 寝室号 -->
                    <div class="form-group" style="width: 220px">
                        <label for="key_roomId">寝室号</label>
                        <input type="text" class="form-control" id="key_roomId" placeholder="例：050413(模糊搜索）"
                               value="${key_roomId }" name="key_roomId"/>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <a href="#" class="btn btn-primary" data-toggle="modal"
           data-target="#newMarkDialog" onclick="clearMark()">新建</a>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><b>"卫生成绩列表"</b></div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>周(期)</th>
                            <th>寝室号</th>
                            <th>卫生成绩</th>
                            <th>扣分情况</th>
                            <th>审核员</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row">
                            <tr>
                                <td style="text-align:center">${row.mk_per}</td>
                                <td style="text-align:center">${row.mk_room_id}</td>
                                <td style="text-align:center">${row.mk_grade}</td>
                                <td style="text-align:center" title="${row.mk_case}">${row.mk_case}</td>
                                <td style="text-align:center">${row.mk_user_id}</td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                       data-target="#markEditDialog"
                                       onclick="editMark(${row.mk_id}, ${row.mk_user_id}, ${USER_SESSION.user_id}, ${USER_SESSION.user_state})">修改</a>
                                    <a href="#" class="btn btn-danger btn-xs"
                                       onclick="deleteMark(${row.mk_id},${row.mk_user_id}, ${USER_SESSION.user_id}, ${USER_SESSION.user_state})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/mark/list.action"/>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 卫生成绩列表查询部分  end-->
</div>
<!-- 创建卫生成绩模态框 -->
<div class="modal fade" id="newMarkDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建卫生成绩</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_mark_form">
                    <div class="form-group">
                        <label for="new_mkPer" class="col-sm-2 control-label">周（期）</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_mkPer" placeholder="周（期）" name="mk_per"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_mkRoomId" class="col-sm-2 control-label">寝室号</label>
                        <div class="col-sm-4">
                            <c:if test="${USER_SESSION.user_state == 1}">
                                <select class="form-control" id="new_mkRoomId" name="mk_room_id">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${myRoom}" var="row">
                                        <option value="${row}">${row}</option>
                                    </c:forEach>
                                </select>
                            </c:if>
                            <c:if test="${USER_SESSION.user_state == 9}">
                                <input type="text" class="form-control" id="new_mkRoomId" name="mk_room_id"
                                       placeholder="例：050413"
                                       name="mk_room_id"/>
                            </c:if>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_mkGrade" class="col-sm-2 control-label">卫生成绩</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_mkGrade" placeholder="卫生成绩"
                                   name="mk_grade"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_mkCase" class="col-sm-2 control-label">扣分情况</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_mkCase" placeholder="扣分情况" name="mk_case"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_mkUserId" class="col-sm-2 control-label">审核员</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_mkUserId" name="mk_user_id"
                                   value="${USER_SESSION.user_id}" readonly="readonly"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="createMark()">添加成绩</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改卫生成绩模态框 -->
<div class="modal fade" id="markEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改卫生成绩</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_mark_form">
                    <input type="=text" id="edit_mkId1" name="mk_id" hidden="hidden" readonly="readonly"/>
                    <div class="form-group">
                        <label for="edit_mkPer" class="col-sm-6 control-label">编号：<span id="edit_mkId2"></span></label>
                    </div>
                    <div class="form-group">
                        <label for="edit_mkPer" class="col-sm-2 control-label">周（期）</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mkPer" placeholder="周（期）" name="mk_per"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mkRoomId" class="col-sm-2 control-label">寝室号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mkRoomId" placeholder="例：050413（5号楼413）"
                                   name="mk_room_id" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mkGrade" class="col-sm-2 control-label">卫生成绩</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mkGrade" placeholder="卫生成绩"
                                   name="mk_grade"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mkCase" class="col-sm-2 control-label">扣分情况</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mkCase" placeholder="扣分情况" name="mk_case"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mkUserId" class="col-sm-2 control-label">审核员</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mkUserId" name="mk_user_id"
                                   value="${USER_SESSION.user_id}" readonly="readonly"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateMark()">保存修改</button>
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
    //清空新建客户窗口中的数据
    function clearMark() {
        $("#new_mkPer").val("");
        $("#new_mkRoomId").val("")
        $("#new_mkGrade").val("")
        $("#new_mkCase").val("")
    }

    // 添加成绩
    function createMark() {
        $.post("<%=basePath%>mark/create.action",
            $("#new_mark_form").serialize(), function (data) {
                if (data == "OK") {
                    alert("成绩添加成功！");
                    window.location.reload();
                } else if (data == "EXIST") {
                    alert("成绩已存在，请重新确认！")
                }
                else {
                    alert("成绩添加失败！");
                    window.location.reload();
                }
            });
    }

    // 通过id获取修改的成绩信息
    function editMark(id, user_id, log_userId, log_userState) {
        if (user_id == log_userId || log_userState == '9') {
            $.ajax({
                    type: "get",
                    url: "<%=basePath%>mark/getMarkById.action",
                    data: {"id": id},
                    success: function (data) {
                        $("#edit_mkId1").val(data.mk_id);
                        $("#edit_mkId2").append(data.mk_id);
                        $("#edit_mkPer").val(data.mk_per);
                        $("#edit_mkRoomId").val(data.mk_room_id)
                        $("#edit_mkGrade").val(data.mk_grade)
                        $("#edit_mkCase").val(data.mk_case)
                        $("#edit_mkUserId").val(data.mk_user_id);

                    }
                }
            );
        }
        else {
            alert("您无法修改此成绩！")
            window.location.reload();
        }
    }

    // 执行修改成绩信息操作
    function updateMark() {
        $.post("<%=basePath%>mark/update.action", $("#edit_mark_form").serialize(),
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

    // 删除成绩信息
    function deleteMark(id, user_id, log_userId, log_userState) {
        if (user_id == log_userId || log_userState == '9') {
            if (confirm('确实要删除该条成绩吗?')) {
                $.post("<%=basePath%>mark/delete.action", {"id": id},
                    function (data) {
                        if (data == "OK") {
                            alert("删除成功！");
                            window.location.reload();
                        }
                        else {
                            alert("删除失败！");
                            window.location.reload();
                        }
                    });
            }
        }
        else if (user_id != log_userId && log_userState != '9') {
            alert("您无法删除此成绩！")
            window.location.reload();
        }
    }

</script>
</body>
</html>