<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhangxin
  Date: 2019/5/13
  Time: 15:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Material Design Lite</title>

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="https://cdn.bootcss.com/material-design-lite/1.3.0/material.cyan-light_blue.min.css" rel="stylesheet">
    <%-- <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/infostyle.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/address.js"></script>
    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">
    <script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
    <style>
        #view-source {
            position: fixed;
            display: block;
            right: 0;
            bottom: 0;
            margin-right: 40px;
            margin-bottom: 40px;
            z-index: 900;
        }

        .templatemo-blue-button {
            background-color: #39ADB4;
            border: none;
            color: white;
        }

        .finish-btn{
            background-color:#e65b0e !important;
        }
    </style>
</head>
<body>

<%--修改地址模态框--%>
<!-- Modal -->
<div class="modal fade" id="update-addr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" id="parentModal">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改地址</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline mt-2 mb-4">
                    <div  data-toggle="distpicker" data-autoselect="3">
                        <label for="telephone" class="col-sm-2 control-label" style="padding-left: 28px;padding-top: 10px">省市区</label>
                        <select class="form-control" id="provinceUpdate"></select>
                        <select class="form-control" id="cityUpdate"></select>
                        <select class="form-control" id="countyUpdate"></select>
                    </div>
                </form>
                <form class="form-horizontal" id="update-form" name="update-form" method="post">
                    <div class="form-group">
                        <label for="detailaddress" class="col-sm-2 control-label">详细地址</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="detailaddress" id="detailaddress"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">收货人</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="name" id="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="telephone" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="telephone" id="telephone">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="saveAddr" >保存</button>
            </div>
        </div>
    </div>
</div>

<%--添加地址模态框--%>
<!-- Modal -->
<div class="modal fade" id="insert-addr" tabindex="-1" role="dialog" aria-labelledby="myModalLabelInsert">
    <div class="modal-dialog" role="document">
        <div class="modal-content" id="parentModalInsert">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabelInsert">添加地址</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline mt-2 mb-4">
                    <div  data-toggle="distpicker" data-autoselect="3">
                        <label for="telephone" class="col-sm-2 control-label" style="padding-left: 28px;padding-top: 10px">省市区</label>
                        <select class="form-control" id="provinceInsert"></select>
                        <select class="form-control" id="cityInsert"></select>
                        <select class="form-control" id="countyInsert"></select>
                    </div>
                </form>
                <form class="form-horizontal" id="insert-form" name="insert-form" method="post">
                    <div class="form-group">
                        <label for="detailaddress" class="col-sm-2 control-label">详细地址</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="detailaddressInsert" id="detailaddressInsert"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">收货人</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="nameInsert" id="nameInsert">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="telephone" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="telephoneInsert" id="telephoneInsert">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="insertAddr" >保存</button>
            </div>
        </div>
    </div>
</div>

<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
    <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
            <span class="mdl-layout-title">收货地址</span>
            <div class="mdl-layout-spacer">
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
                <button class="templatemo-blue-button" name="insertAddr"><h5>添加地址</h5></button>
                <%-- <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
                     <i class="material-icons">search</i>
                 </label>
                 <div class="mdl-textfield__expandable-holder">
                     <input class="mdl-textfield__input" type="text" id="search">
                     <label class="mdl-textfield__label" for="search">Enter your query...</label>
                 </div>--%>
            </div>
            <%-- <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
                 <i class="material-icons">more_vert</i>
             </button>
             <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
                 <li class="mdl-menu__item">About</li>
                 <li class="mdl-menu__item">Contact</li>
                 <li class="mdl-menu__item">Legal information</li>
             </ul>--%>
        </div>
    </header>
    <div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
        <header class="demo-drawer-header">
            <%-- <img src="images/user.jpg" class="demo-avatar">--%>
            <div class="demo-avatar-dropdown">
                <h1>长理商城</h1>
                <%-- <span>hello@example.com</span>--%>
                <div class="mdl-layout-spacer"></div>
                <%--<button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
                    <i class="material-icons" role="presentation">arrow_drop_down</i>
                    <span class="visuallyhidden">Accounts</span>
                </button>
                <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
                    <li class="mdl-menu__item">hello@example.com</li>
                    <li class="mdl-menu__item">info@example.com</li>
                    <li class="mdl-menu__item"><i class="material-icons">add</i>Add another account...</li>
                </ul>--%>
            </div>
        </header>
        <nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
            <a class="mdl-navigation__link" href="${pageContext.request.contextPath}/main"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>主页</a>
            <a class="mdl-navigation__link" href="${pageContext.request.contextPath}/information"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">inbox</i>个人信息</a>
            <a class="mdl-navigation__link" href="${pageContext.request.contextPath}/info/list"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">forum</i>订单管理</a>
            <a class="mdl-navigation__link" href="${pageContext.request.contextPath}/info/address"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">local_offer</i>地址管理</a>
            <a class="mdl-navigation__link" href="${pageContext.request.contextPath}/info/favorite"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">flag</i>我的收藏</a>
        </nav>
    </div>
    <main class="mdl-layout__content mdl-color--grey-100">
<c:forEach items="${addressList}" var="item">
        <div class="mdl-grid demo-content" id="parent">
            <div class="demo-charts mdl-color--white mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid">
                <div class="tab-content">
                    <table class="table" cellpadding="6" cellspacing="1" address-id="${item.addressid}" id="table">
                        <thead>
                        <th style="border: 0px solid transparent">
                            <%--<h1>个人信息</h1>--%>
                        </th>
                        </thead>
                        <tbody >
                        <tr >
                            <th style="border: 0px solid transparent" class="tl">收货人</th>
                            <td style="border: 0px solid transparent" class="tr" id="conname">${item.conname}</td>
                        </tr>
                        <tr>
                            <th style="border: 0px solid transparent" class="tl">手机号</th>
                            <td style="border: 0px solid transparent" class="tr" id="contel">${item.contel}</td>
                        </tr>
                        <tr>
                            <th style="border: 0px solid transparent" class="tl">省</th>
                            <td style="border: 0px solid transparent" class="tr" id="province">${item.province}</td>
                        </tr>
                        <tr>
                            <th style="border: 0px solid transparent" class="tl">市</th>
                            <td style="border: 0px solid transparent" class="tr" id="city">${item.city}</td>
                        </tr>
                        <tr>
                            <th style="border: 0px solid transparent" class="tl">县/区</th>
                            <td style="border: 0px solid transparent" class="tr" id="county">${item.county}</td>
                        </tr>
                        <tr>
                            <th style="border: 0px solid transparent" class="tl">详细地址</th>
                            <td style="border: 0px solid transparent" class="tr" id="detailaddr">${item.detailaddr}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <button class="templatemo-blue-button" name="changeAddr"><h5>修改地址</h5></button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="templatemo-blue-button finish-btn" name="deleteAddr"><h5>删除地址</h5></button>
                </div>
            </div>
        </div>
</c:forEach>
       <%-- <div class="mdl-grid demo-content" >
            <div class="demo-charts mdl-color--white  mdl-shadow--2dp mdl-cell mdl-cell--2-col mdl-grid">
                <button class="templatemo-blue-button" name="insertAddr"><h5>添加地址</h5></button>
            </div>
        </div>--%>
    </main>
</div>
<%--<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>--%>
<script src="https://cdn.bootcss.com/material-design-lite/1.3.0/material.min.js"></script>
</body>
</html>
