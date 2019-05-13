$(document).ready(function(){

	$("#send-message").click(function() {
		var message = $("#input-message").val();
		if (message !== '') {
			$("#input-message").val('');
			var element = '<div class="chat-message2 chat-message"> <div class="chat-message-content2  animated slideInRight"><div class="info-content"> ' + message + '</div> </div> </div>';z
			var element_float = '<div class="clear-float"></div>';
			$(".chat-content-body").append(element, element_float);
			send(message, '123456');
			//始终保持滚动条滚动到最下方
			$(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

		}
	});

	//回车
	$(document).keypress(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			jQuery("#send-message").click();
		}
	});


	/*var request = {
	    "perception": {
	        "inputText": {
	            "text": "附近的酒店"
	        },
	        "selfInfo": {
	            "location": {
	                "city": "北京",
	                "latitude": "39.45492",
	                "longitude": "119.239293",
	                "nearest_poi_name": "上地环岛南",
	                "province": "北京",
	                "street": "信息路"
	            },
	        }
	    },
	    "userInfo": {
	        "apiKey": "0a1bfc7154e94d009460be836523c1d1",
	        "userId": "user"
	    }
	};*/


});

function send(data,userid){
	var request = {
		"key": "0a1bfc7154e94d009460be836523c1d1",
		"info": data,
		"loc": "沈阳市浑南新区",
		"userid": userid,
	};

	$.post('http://www.tuling123.com/openapi/api', request, 
		function(data, status){
			// alert(data.code);
			if(data.code === 100000){
				showMessage('123456', data.text);
			} else if(data.code === 200000) {
				//链接
				showUrl(data.text, data.url);
			} else if(data.code === 302000) {
				//新闻
				// alert(data.list.length);
				for(var i = 0; i<data.list.length; i++) {
					showNews(data.list[i].article, data.list[i].source, data.list[i].detailurl);
				}
			} else if(data.code === 308000) {
				//菜谱,未完。。
				showUrl(data.text, data.url);
			} else {
				showMessage('123456', data.text);
			}
			
		},"json");
}

function showMessage(receiveName, message) {
	// $("#input-message").val('');
	var receiveId = $('#receiveId').text();
	var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + message + '</div> </div> </div>';
	var element_float = '<div class="clear-float"></div>';
	$(".chat-content-body").append(element, element_float);

	//始终保持滚动条滚动到最下方
	$(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

}

function showUrl(message, url) {
	var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + message + '&nbsp' + '<a href="'+ url +'">点击查看</a>' +'</div> </div> </div>';
	var element_float = '<div class="clear-float"></div>';
	$(".chat-content-body").append(element, element_float);

	//始终保持滚动条滚动到最下方
	$(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

}

function showNews(article, source, detailurl) {
	var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + article + '<br />来源：'+ source + '<br /><a href="'+ detailurl +'">查看详情</a>' +'</div> </div> </div>';
	var element_float = '<div class="clear-float"></div>';
	$(".chat-content-body").append(element, element_float);

	//始终保持滚动条滚动到最下方
	$(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

}