/**
 * 验证码验证
 * @returns
 */
$(document).ready(function(){
	$("#findpwd").click(function(){
		var code = $("#code").val();
        var phone = $("#email").val();
		if(code == ""){
			alert("验证码不能为空");
			$("#code").focus();
			return;
		}
		$.ajax({
			url:"http://localhost:8080/douban/user/checkCode.do",
			type:"post",
			data:JSON.stringify({"code":code,"phone":phone}),
			contentType:"application/json;charset=utf-8",
			dataType:"json",

			success:function(msg){
				if(msg.code == 400){
					$("#code").val("");
					alert(msg.msg);
					$("#findpwd").val("确认");
					return;
				}
				if(msg.code == 200){
					window.location.href="user_updatepwd.jsp";
					return;
				}
			}
		});
	});
});

/**
 * 发送验证码
 * @returns
 */
$(document).ready(function(){
	$('#sendemail').click(function(){
		var phone = $("#email").val();
		if(phone == ""){
			alert("手机号码不能为空");
			$("#email").focus();
			return;
		}
		if(!phone.match("^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$")){
			$("#email").focus();
			alert("手机号码格式有误");
			return;
		}
		$.ajax({
			url:"http://localhost:8080/douban/user/sendCode.do",
			type:"post",
			data:JSON.stringify({"phone":phone}),
			contentType:"application/json;charset=utf-8",
			dataType:"json",

			success:function(msg) {
				if (msg.code == 404) {
                    alert(msg.msg);
					$("#email").val("");
					$("#sendemail").val("发送验证码");
					return;
				}
                if (msg.code == 400) {
                    alert(msg.msg);
                    $("#email").val("");
                    $("#sendemail").val("发送验证码");
                    return;
                }
				if (msg.code == 200) {
                    alert(msg.msg);
					$("#sendemail").val("发送验证码");
					return;
				}
			}
		});
	});
});

/**
 * 修改密码
 * @returns
 */
$(document).ready(function(){
	$("#updatepwd").click(function(){
		var password = $("#password").val();
		var npassword = $("#npassword").val();
		if(password == "" || npassword == ""){
			$("#password").focus();
			alert("信息不能为空");
			return;
		}
		if(password.length<6 || password.length>25){
			$("#password").focus();
			alert("密码格式有误，请重新输入");
			return;
		}
		if(password != npassword){
			$("#npassword").focus();
			alert("前后密码不相同，请重新输入");
			return;
		}
		$.ajax({
			url:"http://localhost:8080/douban/user/updatePassword.do",
			type:"post",
			data:JSON.stringify({"password":password}),
            contentType:"application/json;charset=utf-8",
            dataType:"json",
			beforeSend:function(){
				$("#findpwd").val("请稍等");
			},
			success:function(msg){
				if(msg.code == 400){
                    alert(msg.msg);
					$("#code").val("");
					$("#findpwd").val("确认");
					return;
				}
				if(msg.code == 404){
                    alert(msg.msg);
                    window.location.href="user_findpwd.jsp"
                }
				if(msg.code == 200){
					alert(msg.msg);
					window.location.href="user_login.jsp";
					return;
				}
			}
		});
	});
});
