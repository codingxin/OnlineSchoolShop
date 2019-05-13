<%--
  Created by IntelliJ IDEA.
  User: zhangxin
  Date: 2019/5/13
  Time: 15:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>淘一淘类别</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>
    <style>
        .like-button {
            left: 80% !important;
            top: 70% !important;
        }
        .data>ul {
            padding: 0;
        }
        .page-div {
            margin-top: 10px;
        }
        .page-info {
            padding: 35px 35px 35px 55px;
        }
    </style>
</head>
<body>
<div id="main" class="container">
    <div id="header">
        <jsp:include page="header.jsp"/>
    </div>
    <div class="content">
        <div class="module">
            <div class="">
                <h3>
                    类别><span style="color: red;">${cate}</span>
                </h3>
                <hr>
            </div>

            <div class="bd">
                <div class="data">
                    <ul>
                        <c:forEach items="${pageInfo.list}" var="goods">
                            <li class="data-item-li">
                                <div class="to-big">
                                    <a href="${pageContext.request.contextPath}/detail?goodsid=${goods.goodsid}"> <img src="${pageContext.request.contextPath}/pictures/${goods.imagePaths[0].path}" width="260px" height="260px" alt=""/>
                                    </a>
                                </div>
                                <p class="text-right">
                                    <a href="${pageContext.request.contextPath}/detail?goodsid=${goods.goodsid}">${goods.goodsname}</a>
                                </p>
                                <div class="text-right">
                                    <b>￥${goods.price}</b>
                                </div>
                                <div>
                                    <c:if test="${goods.fav}">
                                        <button
                                                class="like-button glyphicon glyphicon-heart btn btn-default"
                                                data-id="${goods.goodsid}"
                                                style="display: none;"></button>
                                    </c:if>
                                    <c:if test="${!goods.fav}">
                                        <button
                                                class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                data-id="${goods.goodsid}"
                                                style="display: none;"></button>
                                    </c:if>
                                    <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                </div>
                            </li>
                        </c:forEach>

                        <div class="clear-float" style="clear: both;"></div>
                    </ul>
                </div>
                <div class="row page-div">
                    <div class="col-md-5 page-info">
                        当前第${pageInfo.pageNum}页，共${pageInfo.pages}页，总共${pageInfo.size}条记录
                    </div>
                    <div class="col-md-6">
                        <nav aria-label="Page navigation">
                            <ul class="pagination pagination-lg">

                                <c:if test="${pageInfo.hasPreviousPage}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/search?keyword=${keyword}&page=${pageInfo.prePage}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${!pageInfo.hasPreviousPage}">
                                    <li class="disabled">
                                        <a href="${pageContext.request.contextPath}/search?keyword=${keyword}&page=${pageInfo.prePage}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach items="${pageInfo.navigatepageNums}" var="pageNums">
                                    <c:if test="${pageNums == pageInfo.pageNum}">
                                        <li class="active"><a href="${pageContext.request.contextPath}/search?keyword=${keyword}&page=${pageNums}">${pageNums}</a></li>
                                    </c:if>
                                    <c:if test="${pageNums != pageInfo.pageNum}">
                                        <li><a href="${pageContext.request.contextPath}/search?keyword=${keyword}&page=${pageNums}">${pageNums}</a></li>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${pageInfo.hasNextPage}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/search?keyword=${keyword}&page=${pageInfo.nextPage}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${!pageInfo.hasNextPage}">
                                    <li class="disabled">
                                        <a href="${pageContext.request.contextPath}/search?keyword=${keyword}&page=${pageInfo.nextPage}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

