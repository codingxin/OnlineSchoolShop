<%--
  Created by IntelliJ IDEA.
  User: zhangxin
  Date: 2019/5/13
  Time: 15:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="templatemo-top-nav-container">
    <div class="row">
        <nav class="templatemo-top-nav col-lg-12 col-md-12">
            <ul class="text-uppercase">
                <li><a href="${pageContext.request.contextPath}/admin/order/send">未发货</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/order/receiver">未收货</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/order/complete">已完成</a></li>
                <%--<li><a href="login.html">Sign in form</a></li>--%>
            </ul>
        </nav>
    </div>
</div>
