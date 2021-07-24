<%--
  Created by IntelliJ IDEA.
  User: zhangxin
  Date: 2019/5/13
  Time: 15:45
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>长理商城</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>

    <script>

    </script>
    <style type="text/css">
        .button
        {
            clear:both;
            margin:10px auto;
            text-align:center;
            font-size: 20px;
            padding:10px 0;
            line-height:25px;
            color:#666;
            border-top:#ddd 1px solid;
        }
        .button a
        {
            margin:0 7px;
            color:#666;
        }
        .button a:hover
        {
            color:#000;
            text-decoration:none;
        }
    </style>
</head>
<body>
<div id="main" class="container">

    <div id="header">
        <%@ include file="header.jsp" %>

        <!-- 旋转图 -->
        <div class="header-bottom">
            <div class="sort">
                <div class="sort-channel">
                    <ul class="sort-channel-list list-group">
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=数码">数码</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=手机">手机</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=手机壳">手机壳</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=充电器">充电器</a> <a href="">电池</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=耳机">耳机</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=相机">相机</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=镜头">镜头</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=单反">单反</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=胶片">胶片</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=摄像">摄像</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=电脑">电脑</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=显示屏">显示屏</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=显卡">显卡</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=硬盘">硬盘</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=内存条">内存条</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=影音">影音</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=MP3">MP3</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=音响">音响</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=麦克风">麦克风</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=收音机">收音机</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=日用">日用</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=护肤">护肤</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=洗发水">洗发水</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=沐浴露">沐浴露</a> <a href="">洗面奶</a> <a
                                            href="">洗手液</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=美妆">美妆</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=面膜">面膜</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=口红">口红</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=防嗮">防嗮</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=香水">香水</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=家居">家居</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=书架">书架</a><a href="${pageContext.request.contextPath}/category?cate=鞋柜">鞋柜</a>
                                        <a href="${pageContext.request.contextPath}/category?cate=衣架">衣架</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=台灯">台灯</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=闲置书籍">书籍</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=英语">英语</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=四六级">四六级</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=充电器">商务英语</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=听力">听力</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=考研">考研</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=考研">考研</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=计算机">计算机</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=自动化">自动化</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=金融">金融</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=其他">其他</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=体育">体育</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=足球">足球</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=乒乓球">乒乓球</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=篮球">篮球</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=羽毛球">羽毛球</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=经典">经典</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=历史">历史</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=名人">名人</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=政治">政治</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=小说">小说</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=服饰">服饰</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=女装">女装</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=连衣裙">连衣裙</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=充电器"> 半身裙</a> <a
                                            href="${pageContext.request.contextPath}/category?cate= T恤"> T恤 衬衫</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=卫衣">卫衣</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=男装">男装</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=外套">外套</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=衬衫">衬衫</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=夹克">夹克</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=运动外套">运动外套</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=鞋子">鞋子</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=运动鞋">运动鞋</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=单鞋">单鞋</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=皮鞋">皮鞋</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=拖鞋">拖鞋</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=箱包">箱包</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=女包">女包</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=男包">男包</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=旅行箱">旅行箱</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=装饰品">装饰品</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=配饰">配饰</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=腰带">腰带</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=皮带">皮带</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=帽子">帽子</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=围巾">围巾</a>
                                        <a
                                                href="${pageContext.request.contextPath}/category?cate=手套">手套</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=手表">手表</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=机械表">机械表</a><a
                                            href="${pageContext.request.contextPath}/category?cate=石英表">石英表</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=电子表">电子表</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=饰品">饰品</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=眼镜">眼镜</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=手链">手链</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=项链">项链</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=吊坠">吊坠</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=收藏品">收藏品</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=古玩">古玩</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=邮票">邮票</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=钱币">钱币</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=陶瓷">陶瓷</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=学习用品">学习用品</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=编码">编码</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=Java">Java</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=PHP">PHP</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=C">C++</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=Python">Python</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=培训">培训</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=驾照">驾照</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=考研">考研</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=计算机证书">计算机证书</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=四六级">四六级</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=线上课程">线上课程</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=健身">健身</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=考证">考证</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=学习">学习</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=闲置百货">百货</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=日用">日用</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=雨伞">雨伞</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=口罩">口罩</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=拖布">拖布</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=电风扇">电风扇</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=餐具">餐具</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=餐盘">餐盘</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=保温杯">保温杯</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=饭盒">饭盒</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=餐具套装">餐具套装</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=出行">出行</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=自行车">自行车</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=电动车">电动车</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=滑板">滑板</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- <div class="sort-detail">
                    <dl class="dl-horizontal">
                        <dt>手机</dt>
                        <dd>
                            <a href="${pageContext.request.contextPath}/category?cate=手机壳">手机壳</a>
                            <a href="${pageContext.request.contextPath}/category?cate=充电器">充电器</a>
                            <a href="">电池</a>
                            <a href="${pageContext.request.contextPath}/category?cate=耳机">耳机</a>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>相机</dt>
                        <dd>
                            <a href="">镜头</a>
                            <a href="">单反</a>
                            <a href="">胶片</a>
                            <a href="">摄像</a>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>电脑</dt>
                        <dd></dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>MP3</dt>
                        <dd></dd>
                    </dl>
                </div> -->
            </div>
            <div id="mycarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="${pageContext.request.contextPath}/image/4.jpg" alt="">
                    </div>

                    <div class="item">
                        <img src="${pageContext.request.contextPath}/image/3.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/image/5.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/image/6.jpg" alt="">
                    </div>
                </div>

                <ol class="carousel-indicators">
                    <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#mycarousel" data-slide-to="1"></li>
                    <li data-target="#mycarousel" data-slide-to="2"></li>
                    <li data-target="#mycarousel" data-slide-to="3"></li>
                </ol>

                <a class="left carousel-control" href="#mycarousel" role="button"
                   data-slide="prev" style="display: none;"> <span
                        class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a> <a class="right carousel-control" href="#mycarousel" role="button"
                        data-slide="next" style="display: none;"> <span
                    class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            </div>
            <div class="clear-float"></div>
        </div>
    </div>
    <div class="content">

        <c:if test="${!empty digGoods}">
            <div class="module">
                <div class="hd">
                    <h2>数码</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${digGoods}" var="goods">
                                <li class="data-item-li">
                                    <div class="to-big">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${goods.goodsid}"><img src="${pageContext.request.contextPath}/pictures/${goods.imagePaths[0].path}" alt=""
                                                        width="200" height="200"/>
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
                </div>
            </div>
        </c:if>

        <c:if test="${!empty houseGoods}">
            <div class="module">
                <div class="hd">
                    <h2>家电</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${houseGoods}" var="housegoods">
                                <li class="data-item-li">
                                    <div class="to-big">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${housegoods.goodsid}"> <img
                                                src="${pageContext.request.contextPath}/pictures/${housegoods.imagePaths[0].path}" alt=""
                                                width="200" height="200">
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${housegoods.goodsid}">${housegoods.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${housegoods.price}</b>
                                    </div>
                                    <div>
                                        <c:if test="${housegoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart btn btn-default"
                                                    data-id="${housegoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <c:if test="${!housegoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                    data-id="${housegoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>

                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty colGoods}">
            <div class="module">
                <div class="hd">
                    <h2>服饰</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${colGoods}" var="colgoods">
                                <li class="data-item-li">
                                    <div class="to-big">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${colgoods.goodsid}"> <img
                                                src="${pageContext.request.contextPath}/pictures/${colgoods.imagePaths[0].path}" alt=""
                                                width="200" height="200">
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${colgoods.goodsid}">${colgoods.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${colgoods.price}</b>
                                    </div>
                                    <div>
                                        <c:if test="${colgoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart btn btn-default"
                                                    data-id="${colgoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <c:if test="${!colgoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                    data-id="${colgoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty bookGoods}">
            <div class="module">
                <div class="hd">
                    <h2>书籍</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${bookGoods}" var="bookgoods">
                                <li class="data-item-li">
                                    <div class="to-big">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${bookgoods.goodsid}"> <img
                                                src="${pageContext.request.contextPath}/pictures/${bookgoods.imagePaths[0].path}" alt=""
                                                width="200" height="200">
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${bookgoods.goodsid}">${bookgoods.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${bookgoods.price}</b>
                                    </div>
                                    <div>
                                        <c:if test="${bookgoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart btn btn-default"
                                                    data-id="${bookgoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <c:if test="${!bookgoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                    data-id="${bookgoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>
<div class="button">欢迎报考长沙理工大学</div>
</body>
</html>


