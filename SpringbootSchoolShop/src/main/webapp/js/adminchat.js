
var client;
var clientID;
$(window).on('beforeunload',function(){
    client=null;
    window.opener.document.getElementById("flag").value="0";
});
$(document).ready(function() {
    clientID=$('#sendId').text();
    client = new Messaging.Client('127.0.0.1',61614,clientID);
    client.onConnectionLost = function(){
        alert("连接已断开");
    };
    //收到消息
    client.onMessageArrived = function(message){

        var userid = $("#receiveId").text();
        clientID = $('#sendId').text();
        var msgObj=jQuery.parseJSON(message.payloadString);
        // $('#toID').val(msgObj.from);
        // debugger
        if (msgObj.to===clientID&&msgObj.from===userid){
            // debugger;
            var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + msgObj.body + '</div> </div> </div>';
            var element_float = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element, element_float);
            /!*$('#message').append("<font color=red>"+msgObj.from+":"+msgObj.body+"</font></br>");*!/
        }
    };
    //建立连接和订阅
    client.connect({onSuccess:function(){
        //订阅topic
        client.subscribe("topic");
        // alert("连接成功");
    }});
    //var loadMessage = setInterval(receive,1000);
    //var loadList = setInterval(refreshList,1000);
    //receive();
    // refreshList();
    //点击发送按钮
    $("#send-message").click(function() {

        var message = $("#input-message").val();
        if (message !== '') {

            clientID=$('#sendId').text();
            var msg={};
            msg.from=clientID;
            msg.to=$('#receiveId').text();
            msg.body=message;
            message = new Messaging.Message(JSON.stringify(msg));
            message.destinationName = "topic";
            client.send(message);

            $("#input-message").val('');
            var element = '<div class="chat-message2 chat-message"> <div class="chat-message-content2  animated slideInRight"><div class="info-content"> ' + msg.body + '</div> </div> </div>';
            var element_float = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element, element_float);


            //始终保持滚动条滚动到最下方
            $(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

            $.ajax({
                url: "/shop/sendMessage/", //把表单数据发送到ajax.jsp
                type: "POST",
                data: {
                    senduser: clientID,
                    receiveuser: msg.to,
                    msgcontent: msg.body
                },
                error: function(request) {
                    alert("保存消息失败");
                },
                success: function(data) {
                    // alert("success!"); //将返回的结果显示到ajaxDiv中
                }
            });

        }
    });

    //回车
    $(document).keypress(function(e) {
        if (e.which == 13) {
            e.preventDefault();
            jQuery("#send-message").click();
        }
    });

    $('.a-card').click(function() {
        $('.a-card').css("background","#FFFFFF")
        $(this).css("background","#F8F8F8");
        var userid = $(this).attr("data-userid");
        var username = $(this).children(".card").text();
        $("#receive").text(username);
        $("#receiveId").text(userid);

        //发异步请求查聊天消息
        $.ajax({
            url: "/shop/getMessage/", //把表单数据发送到ajax.jsp
            type: "POST",
            data: {
                senduser: $("#sendId").text(),
                receiveuser: userid,
            },
            error: function(request) {
                alert("保存消息失败");
            },
            success: function(result) {
                $('.chat-content-body').empty();
                showMessage(result.info.message);
                // alert("success!"); //将返回的结果显示到ajaxDiv中
            }
        });
    });

    $('.chat-list').hover(function() {
        $(this).css("overflow-y","auto");
    }, function() {
        $(this).css("overflow-y","hidden");
    });

});


function showMessage(message) {
    // $("#input-message").val('');
    var receiveId = $('#receiveId').text();

    $.each(message, function (index,item) {
        if (item.senduser == receiveId) {
            var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + item.msgcontent + '</div> </div> </div>';
            var element_float = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element, element_float);
        } else {
            var element1 = '<div class="chat-message2 chat-message"> <div class="chat-message-content2"><div class="info-content"> ' + item.msgcontent + '</div> </div> </div>';
            var element_float1 = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element1, element_float1);
        }
    });

    //始终保持滚动条滚动到最下方
    $(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

}

*/


var client;
var clientID;
$(window).on('beforeunload', function () {
    client = null;
    window.opener.document.getElementById("flag").value = "0";
});
$(document).ready(function () {

    console.log(getChatList(2));
    reGetChatUser($("#receiveId").text());

    clientID = $('#sendId').text();
    client = new Messaging.Client('127.0.0.1', 61614, clientID);
    client.onConnectionLost = function () {
        alert("连接已断开");
    };
    //收到消息
    client.onMessageArrived = function (message) {
        clientID = $('#sendId').text();
        var userid = $("#receiveId").text();
        var msgObj = jQuery.parseJSON(message.payloadString);
        // $('#toID').val(msgObj.from);
        // debugger
        if (msgObj.to === clientID && msgObj.from === userid) {
            // debugger;
            var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + msgObj.body + '</div> </div> </div>';
            var element_float = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element, element_float);

            //始终保持滚动条滚动到最下方
            $(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);
            /*$('#message').append("<font color=red>"+msgObj.from+":"+msgObj.body+"</font></br>");*/
        } else if (msgObj.to === clientID && !getChatList(msgObj.from)) {
            //重新获取聊天列表
            reGetChatUser(msgObj.from);
            // reGetChatUser(null);
            /* var chatlistitem = '<a class="a-card" data-userid="' + msgObj.from + '"> <div class="card">' + msgObj.from + '</div> </a>';
             $('.a-far').prepend(chatlistitem);*/
        }
    };
    //建立连接和订阅
    client.connect({
        onSuccess: function () {
            //订阅topic
            client.subscribe("topic");
            // alert("连接成功");
        }
    });
    //var loadMessage = setInterval(receive,1000);
    //var loadList = setInterval(refreshList,1000);
    //receive();
    // refreshList();
    //点击发送按钮
    $("#send-message").click(function () {

        var message = $("#input-message").val();
        if (message !== '') {

            clientID = $('#sendId').text();
            var msg = {};
            msg.from = clientID;
            msg.to = $('#receiveId').text();
            msg.body = message;
            message = new Messaging.Message(JSON.stringify(msg));
            message.destinationName = "topic";
            client.send(message);

            $("#input-message").val('');
            var element = '<div class="chat-message2 chat-message"> <div class="chat-message-content2  animated slideInRight"><div class="info-content"> ' + msg.body + '</div> </div> </div>';
            var element_float = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element, element_float);


            //始终保持滚动条滚动到最下方
            $(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

            $.ajax({
                url: "/shop/sendMessage/", //把表单数据发送到ajax.jsp
                type: "POST",
                data: {
                    senduser: clientID,
                    receiveuser: msg.to,
                    msgcontent: msg.body
                },
                error: function (request) {
                    alert("保存消息失败");
                },
                success: function (data) {
                    // alert("success!"); //将返回的结果显示到ajaxDiv中
                }
            });
            var receive = $("#receiveId").text();
            /*$.post("servlet/ChatServlet", {
             message: message,
             time: new Date(),
             receiveId: receive
             });
             receive();
             refreshList();*/
            /*$.get("servlet/ChatServlet", {
             message: message,
             time: new Date(),
             receiveId: receive
             },
             function(data,status){
             alert("数据: \n" + data + "\n状态: " + status);
             });*/
        }
    });

    //回车
    $(document).keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault();
            jQuery("#send-message").click();
        }
    });

    $('.a-card').click(function () {
        $('.a-card').css("background", "#FFFFFF")
        $(this).css("background", "#F8F8F8");
        var userid = $(this).attr("data-userid");
        var username = $(this).children(".card").text();
        $("#receive").text(username);
        $("#receiveId").text(userid);

        //发异步请求查聊天消息
        $.ajax({
            url: "/shop/getMessage/", //把表单数据发送到ajax.jsp
            type: "POST",
            data: {
                senduser: $("#sendId").text(),
                receiveuser: userid,
            },
            error: function (request) {
                alert("保存消息失败");
            },
            success: function (result) {
                $('.chat-content-body').empty();
                showMessage(result.info.message);
                // alert("success!"); //将返回的结果显示到ajaxDiv中
            }
        });
    });
    /*function hitList(){
     $('.list-item').css("background","#FAFAFA");
     $(this).css("background","#EBEBEC");
     var name = $(this).children("#user-name").text();
     var number = $(this).children("#user-no").text();
     $("#receive").text(name);
     $("#receiveId").text(number);

     }*/

    $('.chat-list').hover(function () {
        $(this).css("overflow-y", "auto");
    }, function () {
        $(this).css("overflow-y", "hidden");
    });
    //refreshList();

});

function userListClick() {

    //发异步请求查聊天消息
    $.ajax({
        url: "/shop/getMessage/", //把表单数据发送到ajax.jsp
        type: "POST",
        data: {
            senduser: $("#sendId").text(),
            receiveuser: $("#receiveId").text(),
        },
        error: function (request) {
            alert("保存消息失败");
        },
        success: function (result) {
            $('.chat-content-body').empty();
            showMessage(result.info.message);
            // alert("success!"); //将返回的结果显示到ajaxDiv中
        }
    });
}

/*function receive(){
 var sendUser = $('#receiveId').text();
 $.post("servlet/ReceiveServlet", {
 sendId: sendUser,
 },
 function(data, status){
 //alert(JSON.stringify(data));
 // alert(typeof(data));
 //var arr = eval(data);
 //console.log(data.MsgContent);
 //alert(data);
 $(".chat-content-body").html('');
 for (var i = 0; i < data.length; i++) {
 showMessage(data[i].User1,data[i].MsgContent);
 }
 },"json");
 }*/


function showMessage(message) {
    // $("#input-message").val('');
    var receiveId = $('#receiveId').text();

    $.each(message, function (index, item) {
        if (item.senduser == receiveId) {
            var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + item.msgcontent + '</div> </div> </div>';
            var element_float = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element, element_float);
        } else {
            var element1 = '<div class="chat-message2 chat-message"> <div class="chat-message-content2"><div class="info-content"> ' + item.msgcontent + '</div> </div> </div>';
            var element_float1 = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element1, element_float1);
        }
    });

    //始终保持滚动条滚动到最下方
    $(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

}

//获取所有聊天列表
function getChatList(id) {
    var chatList = [];
    $('.a-far>a').each(function () {
        chatList.push($(this).attr("data-userid"));
    });
    console.log(chatList);
    for (var i = 0; i < chatList.length; i++) {
        if (chatList[i] == id) {
            return true;
        }
    }
    return false;

    /*$('.a-far').children().each(function(index,item){
     alert(item.attr("data-userid"));
     })*/

}

//重新获取列表
function reGetChatUser(sendto) {
    $.ajax({
        url: "/shop/adminchat/", //把表单数据发送到ajax.jsp
        type: "POST",
        data: {
            sendto: sendto
        },
        error: function (request) {
            alert(result.msg);
        },
        success: function (result) {
            $('.a-far').empty();
            showChatList(result.info.userlist);
        }
    });
}

function showChatList(userlist) {
    $.each(userlist, function (index, item) {
        var chatlistitemA = $("<a></a>").addClass("a-card").attr("data-userid", item.userid).attr("data-username", item.username);
        var chatlistitem = chatlistitemA.addClass("card").append(item.username);
        chatlistitemA.click(function () {
            $('.a-card').css("background", "#FFFFFF")
            $(this).css("background", "#F8F8F8");
            var userid = $(this).attr("data-userid");
            // var username = $(this).children(".card").text();
            var username = $(this).attr("data-username");
            $("#receive").text(username);
            $("#receiveId").text(userid);
            userListClick();
        });

        /* <div class="card">' + item.username + '</div>
         *!/*/
        $('.a-far').prepend(chatlistitem);
    });
}


/*
 function refreshList() {
 $.post("servlet/RefreshServlet",
 function(data, status){
 //alert(JSON.stringify(data));
 // alert(typeof(data));
 //var arr = eval(data);
 //console.log(data.MsgContent);
 //alert(data);
 //$(".chat-list").html('');
 for (var i = 0; i < data.length; i++) {
 // showList(data[i].UserId,data[i].Name);
 $('#list-item'+i).children("#user-name").text(data[i].Name);
 $('#list-item'+i).children("#user-no").text(data[i].UserId);
 $('#list-item'+i).css("display","block");
 }
 },"json");
 }

 function showList(id,name) {
 var item = '<div class="list-item"><h3 id="user-name">'+name+'</h3><span id="user-no">'+id+'</span></div>';
 $('.chat-list').append(item);
 }*/

