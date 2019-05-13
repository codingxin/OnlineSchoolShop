<%--
  Created by IntelliJ IDEA.
  User: zhangxin
  Date: 2019/5/13
  Time: 15:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台管理</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">

    <%--<c:if test="${empty msg}">
        <script>
            swal(${msg}, "成功","success");
        </script>
    </c:if>--%>
</head>
<body>
<!-- Left column -->
<div class="templatemo-flex-row">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="${pageContext.request.contextPath}/admin/activity/show">所有活动</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/activity/add" class="active">添加活动</a></li>
                        <%--<li><a href="${pageContext.request.contextPath}/admin/goods/addCategory">添加分类</a></li>--%>
                        <%--<li><a href="login.html">。。。</a></li>--%>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget white-bg">
                <h2 class="margin-bottom-10">增加活动</h2>
                <p>活动的一些基本信息</p>
                <form action="${pageContext.request.contextPath}/admin/activity/addResult" class="templatemo-login-form" method="post">
                    <div class="row form-group">
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="inputWithSuccess">活动名称</label>
                            <input type="text" class="form-control show-inpu" id="inputWithSuccess" name="activityname">
                        </div>
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="inputWithDiscount">折扣</label>
                            <input type="number" class="form-control" id="inputWithDiscount" name="discount" step="0.01">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="inputWithFullprice">满</label>
                            <input type="number" class="form-control" id="inputWithFullprice" name="fullprice" placeholder="￥满减">
                        </div>
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="inputWithReduceprice">减</label>
                            <input type="number" class="form-control" id="inputWithReduceprice" name="reduceprice" placeholder="￥满减">
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="inputWithFullnum">满</label>
                            <input type="number" class="form-control" id="inputWithFullnum" name="fullnum" placeholder="满免">
                        </div>
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="inputWithReducenum">免</label>
                            <input type="number" class="form-control" id="inputWithReducenum" name="reducenum" placeholder="满免">
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-lg-12 form-group">
                            <label class="control-label" for="inputNote">活动描述</label>
                            <textarea class="form-control" id="inputNote" rows="3" name="activitydes"></textarea>
                        </div>
                    </div>


                    <div class="form-group text-right">
                        <button type="submit" class="templatemo-blue-button">添加</button>
                        <button type="reset" class="templatemo-white-button">重置</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>        <!-- Templatemo Script -->
<c:if test="${!empty msg}">
    <script type="text/javascript">
        $(document).ready(function () {
            swal('${msg}', '成功', 'success');
        });
    </script>
</c:if>
</body>
</html>