
$.validator.setDefaults({
	submitHandler: function() {
		form.submit();
	}
});
$(document).ready(function() {
	$('#form2').validate({
		rules: {
			username: "required",
			
			password: {
				required: true,
			},
			confirmlogo: "required",
		},
		messages: {
			username: "用户名输入不能为空",
			
			password: {
				required: "密码输入不能为空",
			},
			confirmlogo: "验证码输入不能为空",
		}
	});
});