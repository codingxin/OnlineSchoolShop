
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/mqttws31.js"></script>
    <script type="text/javascript">
        var client;
        var clientID;
        $(window).on('beforeunload',function(){
            client=null;
            window.opener.document.getElementById("flag").value="0";
        });
        $(function($) {
            //$('#con').bind('click',function(){
            clientID=$('#clientID').val();
            client = new Messaging.Client('127.0.0.1',61614,clientID);
            client.onConnectionLost = function(){
                $('#message').append('连接已断开');
            };
            //收到消息
            client.onMessageArrived = function(message){
                var msgObj=jQuery.parseJSON(message.payloadString);
                $('#toID').val(msgObj.from);
                debugger
                if (msgObj.to===clientID){
                    debugger;
                    $('#message').append("<font color=red>"+msgObj.from+":"+msgObj.body+"</font></br>");
                }
            };
            //建立连接和订阅
            client.connect({onSuccess:function(){
                $('#message').append('连接成功,可以聊天了！'+"</br>");
                //订阅topic
                client.subscribe("topic");

            }});
            //});
            $('#sendBtn').bind('click',function(){
                clientID=$('#clientID').val();
                var msg={};
                msg.from=clientID;
                msg.to=$('#toID').val();
                msg.body=$('#sendMsg').val();
                message = new Messaging.Message(JSON.stringify(msg));
                message.destinationName = "topic";
                client.send(message);
                $('#message').append(msg.from+":"+msg.body+"</br>");
            });

        });
    </script>
</head>
<body>
<%String clientID=request.getParameter("clientID");
    String toID=request.getParameter("toID");
%>
<div id="message"></div><br>
<input type="hidden" id="clientID" value="<%=clientID%>">
<input type="hidden" id="toID" value="<%=toID%>">
<textarea id="sendMsg" rows="3" cols="50">请输入信息</textarea>
<button id='sendBtn'>发送</button>
</body>
</html>
