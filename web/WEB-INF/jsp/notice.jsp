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
        .ahide {
            background: #5e5e5e;
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
                            <i class="fa fa-dashboard fa-fw"></i> 人员管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mark/noticelist.action" class="active">
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
                <h1 class="page-header">通知信息管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <a href="#" class="btn btn-primary" data-toggle="modal"
           data-target="#newNoticeDialog" onclick="clearMark()">发布新通知</a>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><b>"通知信息列表"</b></div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" style="table-layout: fixed">
                        <thead>
                        <tr>
                            <th style="width: 5%"></th>
                            <th style="width: 70%">内容</th>
                            <th style="width: 15%">发布日期</th>
                            <th style="width: 10%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${(page.page - 1) * page.size + status.count}</td>
                                <td style="text-align:center;overflow-x: hidden;text-overflow:ellipsis;
                                    white-space: nowrap" title="${row.notice_text}">${row.notice_text}</td>
                                <td style="text-align:center">${row.notice_date}</td>
                                <td>
                                    <c:if test="${row.notice_state == 1}">
                                        <a href="#" class="btn btn-primary btn-xs" id="${row.notice_id}"
                                           onclick="notice_toggle(${row.notice_id})">下线</a>
                                    </c:if>
                                    <c:if test="${row.notice_state == 0}">
                                        <a href="#" class="btn btn-primary btn-xs ahide" id="${row.notice_id}"
                                           onclick="notice_toggle(${row.notice_id})" disabled="disabled">下线</a>
                                    </c:if>
                                    <a href="#" class="btn btn-danger btn-xs" data-toggle="modal"
                                       data-target="#noticeEditDialog"
                                       onclick="editNotice(${row.notice_id})">修改</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/mark/noticelist.action"/>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 列表查询部分  end-->
</div>
<!-- 创建模态框 -->
<div class="modal fade" id="newNoticeDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">发布新通知</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_notice_form">
                    <div class="form-group">
                        <label for="new_noticeText" class="col-sm-2 control-label">通知内容</label>
                        <div class="col-sm-10">
                            <textarea id="new_noticeText" style="width: 470px;height: 110px" placeholder="请在这里输入"
                                      name="notice_text"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="publish()">发布</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改模态框 -->
<div class="modal fade" id="noticeEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改通知</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_notice_form">
                    <input type="=text" id="edit_noticeId" name="notice_id" hidden="hidden" readonly="readonly"/>
                    <div class="form-group">
                        <label for="edit_noticeText" class="col-sm-2 control-label">通知内容</label>
                        <div class="col-sm-10">
                            <textarea id="edit_noticeText" style="width: 470px;height: 110px"
                                      name="notice_text"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateNotice()">保存修改</button>
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
    //清空新建窗口中的数据
    function clearMark() {
        $("#new_noticeText").val("");
    }

    // 发布通知
    function publish() {
        $.post("<%=basePath%>mark/publish.action",
            $("#new_notice_form").serialize(), function (data) {
                if (data == "OK") {
                    alert("发布成功！");
                    window.location.reload();
                }
                else {
                    alert("发布失败！");
                    window.location.reload();
                }
            });
    }

    // 通过id获取修改的信息
    function editNotice(id) {
        $.ajax({
                type: "get",
                url: "<%=basePath%>mark/getNoticeById.action",
                data: {"id": id},
                success: function (data) {
                    $("#edit_noticeId").val(data.notice_id);
                    $("#edit_noticeText").val(data.notice_text);
                }
            }
        );
    }

    // 执行修改信息操作
    function updateNotice() {
        $.post("<%=basePath%>mark/updateNotice.action", $("#edit_notice_form").serialize(),
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

    // 修改状态
    function notice_toggle(id) {
        $.ajax({
                type: "get",
                url: "<%=basePath%>mark/editState.action",
                data: {"id": id},
                success: function (data) {
                    if (data == "OK") {
                        $('#' + id).addClass("ahide");
                        $('#' + id).attr("disabled", true);
                    } else {
                        alert("请重试！");
                    }
                }
            }
        );
    }

</script>
</body>
</html>