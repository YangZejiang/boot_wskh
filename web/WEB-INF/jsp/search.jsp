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
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>student/list.action">卫生考核系统 v1.0</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">

            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" href="<%=basePath%>login.action">
                    <i class="fa fa-user">管理员入口</i>
                </a>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>

        <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <div style="margin: 10px"><h2>通知</h2></div>
                <div style="word-wrap:break-word; word-break:break-all;">

                    <!-- 通知栏 -->
                    <c:forEach items="${notice}" var="item">
                        <div style="margin: 20px 10px 30px 10px; height: 40px">
                            <span style="float: left;border-bottom: solid 1px #e2e2e2;"><i class="fa fa-bullhorn fa-lg">&nbsp;&nbsp;</i>${item.notice_text}</span>
                            <span style="float: right;font-size: 10px">${item.notice_date}</span>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>

    <!-- 卫生成绩列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">成绩查看</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/student/list.action">

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
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row">
                            <tr>
                                <td>${row.mk_per}</td>
                                <td>${row.mk_room_id}</td>
                                <td>${row.mk_grade}</td>
                                <td>${row.mk_case}</td>
                                <td>${row.mk_user_id}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/student/list.action"/>
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

</script>
</body>
</html>