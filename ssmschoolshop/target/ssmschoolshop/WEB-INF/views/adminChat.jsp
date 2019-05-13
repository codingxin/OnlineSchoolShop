<%--
  Created by IntelliJ IDEA.
  User: 文辉
  Date: 2017/7/26
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mqttws31.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-style.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminchat.js"></script>
    <style>
        .templatemo-content-widget {
            padding: 30px 0 0 0 !important;
        }
        .white-bg {
            /*background-color: #f8ffff !important;*/
            background-color: #fbffff !important;
        }
        .templatemo-content-container {
            padding: 0 !important;
        }
    </style>
</head>
<body>
<div class="templatemo-flex-row">
    <jsp:include page="sidebar.jsp"/>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="${pageContext.request.contextPath}/admin/chat" class="active">聊天</a></li>
                        <%--<li><a href="${pageContext.request.contextPath}/admin/order/receiver">未收货</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/order/complete">已完成</a></li>--%>
                        <%--<li><a href="login.html">Sign in form</a></li>--%>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget white-bg">
                <div id="main">
                    <div class="chat-div">
                        <div class="chat-list">
                            <div class="a-far">
                                <%--<c:forEach items="${chatuserlist}" var="userinfo">
                                    <a class="a-card" data-userid="${userinfo.userid}">
                                        <div class="card">
                                                ${userinfo.username}
                                        </div>
                                    </a>
                                </c:forEach>--%>
                            </div>
                        </div>
                        <div class="chat">
                            <div class="chat-name">
                                <div class="chat-name-detail">
                                    <h3 id="receive">
                                        ${sendto.username}
                                    </h3>
                                    <span id="receiveId" hidden>${sendto.userid}</span>
                                    <h3 id="send" hidden>
                                        客服
                                    </h3>
                                    <span id="sendId" hidden>5</span>

                                    <%--<%String clientID=request.getParameter("clientID");
                                        String toID=request.getParameter("toID");
                                    %>
                                       <h3 id="receive">
                                           <%=toID%>
                                       </h3>
                                       <span id="receiveId" hidden><%=toID%></span>
                                       <h3 id="send" hidden>
                                           <%=clientID%>
                                       </h3>
                                       <span id="sendId" hidden><%=clientID%></span>--%>
                                </div>
                            </div>
                            <div class="chat-content">
                                <div class="chat-content-body">
                                    <%--<div class="chat-message1 chat-message">
                                        <div class="chat-message-content1">
                                            <span class="glyphicon glyphicon-triangle-left message-icon-left" aria-hidden="true"></span>
                                            <div class="info-content">
                                                你好666
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear-float"></div>
                                    <div class="chat-message2 chat-message">
                                        <div class="chat-message-content2">
                                            <span class="glyphicon glyphicon-triangle-right message-icon-right"
                                                  aria-hidden="true"></span>
                                            <div class="info-content">
                                                东大咸鱼太棒了！
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear-float"></div>--%>
                                </div>
                            </div>
                            <div class="chat-input">
                                <div class="form-div">
                                    <div class="form-inline">
                                        <div class="form-group input-div">
								<textarea class="form-control" name="message"
                                          id="input-message" rows="2"></textarea>
                                        </div>
                                        <div class="form-group send-div">
                                            <input class="form-control btn btn-primary btn-block"
                                                   id="send-message" type="submit" value="发送">
                                            <!-- <button class="form-control btn-block" id="send-message">发送</button> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

