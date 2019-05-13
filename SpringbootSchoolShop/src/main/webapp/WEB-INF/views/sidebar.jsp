<%--
  Created by IntelliJ IDEA.
  User: zhangxin
  Date: 2019/5/13
  Time: 15:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="templatemo-sidebar">
    <header class="templatemo-site-header">
        <div class="square"></div>
        <h1>后台管理</h1>
    </header>
    <div class="mobile-menu-icon">
        <i class="fa fa-bars"></i>
    </div>
    <nav class="templatemo-left-nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/user/show"><i class="fa fa-user fa-fw"></i>用户管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/goods/show"><i class="fa fa-bar-chart fa-fw"></i>商品管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/order/send"><i class="fa fa-users fa-fw"></i>订单管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/activity/show"><i class="fa fa-database fa-fw"></i>活动管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/logout"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>
        </ul>
    </nav>
</div>
