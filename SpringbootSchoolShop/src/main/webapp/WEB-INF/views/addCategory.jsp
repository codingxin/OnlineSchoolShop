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
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
   <%-- <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>--%>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/categery.js"></script>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>
    <%--<c:if test="${empty msg}">
        <script>
            swal(${msg}, "成功","success");
        </script>
    </c:if>--%>
</head>
<body>

<%--修改商品信息模态框--%>
<!-- Modal -->
<div class="modal fade" id="update-cate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改分类名称</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update-form" name="update-form" method="post">
                    <div class="form-group">
                        <label for="categoryName" class="col-sm-2 control-label">分类名</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="categoryName" name="categoryName">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="saveCatename" >保存</button>
            </div>
        </div>
    </div>
</div>
<!-- Left column -->
<div class="templatemo-flex-row">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <jsp:include page="goodsNav.jsp"></jsp:include>
        <div class="templatemo-content-container">

            <div class="templatemo-content-widget white-bg">
                <div class="templatemo-content-widget no-padding">
                    <div class="panel panel-default table-responsive">
                        <table id="goodsinfo" class="table  table-bordered templatemo-user-table">
                            <thead>
                            <tr>
                                <td>分类名</td>
                                <td >编辑</td>
                                <td >删除</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${categoryList}" var="category">
                                <tr>
                                    <td><a href="" class="templatemo-link" cateId="${category.cateid}">${category.catename}</a></td>
                                    <td><button href="" class="templatemo-edit-btn" name="changCate">编辑</button></td>
                                    <td><button href="" class="templatemo-delete-btn" name="deleteCate">删除</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <label class="control-label" for="catename">添加分类</label>
                <form action="${pageContext.request.contextPath}/admin/goods/addCategoryResult" method="post">
                    <div class="row form-group">
                        <div class="col-lg-6 form-group">
                            <input type="text" class="form-control" id="catename" name="catename">
                        </div>
                        <div class="col-lg-4 form-group">
                            <button type="submit" class="templatemo-blue-button">添加</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!-- JS -->
        <!-- Templatemo Script -->
<c:if test="${!empty msg}">
    <script type="text/javascript">
        $(document).ready(function () {
            swal('${msg}');
        });
    </script>
</c:if>
</body>
</html>

