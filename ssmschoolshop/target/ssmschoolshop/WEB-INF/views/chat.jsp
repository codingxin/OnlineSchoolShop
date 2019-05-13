<%--
  Created by IntelliJ IDEA.
  User: 文辉
  Date: 2017/7/26
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>长理商城-聊天</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mqttws31.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>
    <script src="${pageContext.request.contextPath}/js/send.js"></script>
</head>
<body>
<div id="main" class="container">
    <div id="header">
        <jsp:include page="header.jsp"/>
    </div>
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
            <%--<div class="list-item" id="list-item0">
                <h3 id="user-name"></h3>
                <span id="user-no"></span>
            </div>
            <div class="list-item" id="list-item1">
                <h3 id="user-name"></h3>
                <span id="user-no"></span>
            </div>
            <div class="list-item" id="list-item2">
                <h3 id="user-name"></h3>
                <span id="user-no"></span>
            </div>
            <div class="list-item" id="list-item3">
                <h3 id="user-name"></h3>
                <span id="user-no"></span>
            </div>
            <div class="list-item" id="list-item4">
                <h3 id="user-name"></h3>
                <span id="user-no"></span>
            </div>
            <div class="list-item" id="list-item5">
                <h3 id="user-name"></h3>
                <span id="user-no"></span>
            </div>
            <div class="list-item" id="list-item6">
                <h3 id="user-name"></h3>
                <span id="user-no"></span>
            </div>
            <div class="list-item" id="list-item7">
                <h3 id="user-name"></h3>
                <span id="user-no"></span>
            </div>
            <div class="list-item" id="list-item8">
                <h3 id="user-name"></h3>
                <span id="user-no"></span>
            </div>--%>
        </div>
        <div class="chat">
            <div class="chat-name">
                <div class="chat-name-detail">
                    <h3 id="receive">
                        ${sendto.username}
                    </h3>
                    <span id="receiveId" hidden>${sendto.userid}</span>
                    <h3 id="send" hidden>
                        ${sessionScope.user.username}
                    </h3>
                    <span id="sendId" hidden>${sessionScope.user.userid}</span>

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
</body>
</html>
