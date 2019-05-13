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
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet'
          type='text/css'>
    <!-- JS -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">
    <%--<script src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>--%>
    <style>
        .show-span {
            border: none !important;
        }
    </style>
</head>
<body>

<%--修改商品信息模态框--%>
<!-- Modal -->
<div class="modal fade" id="update-goods" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改商品信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update-form" name="update-form" method="post">
                    <div class="form-group">
                        <label for="goodsid" class="col-sm-2 control-label">id</label>
                        <div class="col-sm-9">
                            <span id="goodsid" class="form-control"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="goodsname" class="col-sm-2 control-label">商品名</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="goodsname" id="goodsname">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="price" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" name="price" id="price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="num" class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" id="num" name="num">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" id="description" name="description"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="category" class="col-sm-2 control-label">类别</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="category" name="category">
                                <c:forEach items="${categoryList}" var="item">
                                    <option value="${item.cateid}">${item.catename}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detailcate" class="col-sm-2 control-label">详细分类</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="detailcate" name="detailcate">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="saveUpdate">保存</button>
            </div>
        </div>
    </div>
</div>

<%--修改商品活动--%>
<div class="modal fade" id="activity-goods" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加商品活动</h4>
            </div>
            <div class="modal-body">
                <form class="templatemo-login-form">
                    <div class="row form-group">
                        <div class="col-lg-6 form-group">
                            <div id="activity-goodsid" hidden></div>
                            <label class="control-label" for="activity-id">活动号</label>
                            <select class="form-control" id="activity-id">
                                <option value="1">1</option>
                                <option value="1">1</option>
                                <option value="1">1</option>
                            </select>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="activityname">活动名称</label>
                            <span type="text" class="form-control show-span" id="activityname" name="activityname"></span>
                        </div>
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="discount">折扣</label>
                            <span type="number" class="form-control show-span" id="discount" name="discount" step="0.01"></span>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="fullprice">满</label>
                            <span type="number" class="form-control show-span" id="fullprice" name="fullprice"></span>
                        </div>
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="reduceprice">减</label>
                            <span type="number" class="form-control show-span" id="reduceprice" name="reduceprice"></span>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="fullnum">满</label>
                            <span type="number" class="form-control show-span" id="fullnum" name="fullnum"></span>
                        </div>
                        <div class="col-lg-6 form-group">
                            <label class="control-label" for="reducenum">免</label>
                            <span type="number" class="form-control show-span" id="reducenum" name="reducenum"></span>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-lg-12 form-group">
                            <label class="control-label" for="activitydes">活动描述</label>
                            <span class="form-control show-span" id="activitydes" rows="3" name="activitydes">asfd</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="saveActivity">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- Left column -->
<div class="templatemo-flex-row">
    <jsp:include page="sidebar.jsp"/>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <jsp:include page="goodsNav.jsp"/>
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget no-padding">
                <div class="panel panel-default table-responsive">
                    <table id="goodsinfo" class="table table-striped table-bordered templatemo-user-table">
                        <thead>
                        <tr>
                            <td><a href="" class="white-text templatemo-sort-by">id<span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">商品名<span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">价格<span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">数量<span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">类别<span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">活动<span class="caret"></span></a></td>
                            <td>详情</td>
                            <td>编辑</td>
                            <td>删除</td>
                            <td>活动</td>
                        </tr>
                        </thead>
                        <tbody>
                        <%--<c:forEach items="${pageInfo.list}" var="goods" varStatus="num">
                            <tr>
                                <td>${goods.goodsid}</td>
                                <td>${goods.goodsname}</td>
                                <td>${goods.price}</td>
                                <td>${goods.num}</td>
                                <td>${goods.detailcate}</td>
                                <td><a href="" class="templatemo-link">详情</a></td>
                                <td><button href="" class="templatemo-edit-btn">编辑</button></td>
                                <td><button href="" class="templatemo-delete-btn">删除</button></td>
                            </tr>
                        </c:forEach>--%>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="pagination-wrap" id="page-div-nav">
                <div class="page-info" id="page-info-area">
                    <%--当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共${pageInfo.total}记录--%>
                </div>
                <%--<ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/goods/show?page=1" aria-label="Next">
                            <span aria-hidden="true">首页</span>
                        </a>
                    </li>

                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/goods/show?page=${pageInfo.pageNum - 1}" aria-label="Previous">
                                <span aria-hidden="true"><i class="fa fa-backward"></i></span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNums">
                        <c:if test="${pageNums == pageInfo.pageNum}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/goods/show?page=${pageNums}">${pageNums}</a></li>
                        </c:if>
                        <c:if test="${pageNums != pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/admin/goods/show?page=${pageNums}">${pageNums}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/goods/show?page=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true"><i class="fa fa-forward"></i></span>
                            </a>
                        </li>
                    </c:if>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/goods/show?page=${pageInfo.pages}" aria-label="Next">
                            <span aria-hidden="true">末页</span>
                        </a>
                    </li>
                </ul>--%>
            </div>
        </div>
    </div>
</div>
<div id="path" style="display: none;">${pageContext.request.contextPath}</div>
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>
<script src="${pageContext.request.contextPath}/js/goodsManage.js"></script>
<!-- Templatemo Script -->
<script>
    $(document).ready(function () {
        // Content widget with background image
        var imageUrl = $('img.content-bg-img').attr('src');
        $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
        $('img.content-bg-img').hide();
    });
</script>
</body>
</html>
