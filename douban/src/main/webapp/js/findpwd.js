/**
 * 验证码验证
 * @returns
 */
$(document).ready(function(){
	$("#findpwd").click(function(){
		var email = $("#email").val();
		var code = $("#code").val();
		if(code == ""){
			alert("验证码不能为空");
			$("#code").focus();
			return;
		}
		$.ajax({
			url:"http://localhost:8080/hon/UserServlet?method=checkcode",
			type:"post",
			data:{"email":email,"code":code},
			async: true,
			beforeSend:function(){
				$("#findpwd").val("请稍等");
			},
			success:function(msg){
				if(msg=="false"){
					$("#code").val("");
					alert("验证码有误，请重新输入");
					$("#findpwd").val("确认");
				}else{
					window.location.href="user_updatepwd.jsp";
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
		var email = $("#email").val();
		if(email == ""){
			alert("邮箱地址不能为空");
			$("#email").focus();
			return;
		}
		if(!email.match("^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.])+[A-Za-z\\d]{2,4}$")){
			$("#email").focus();
			alert("邮箱地址格式有误");
			return;
		}
		$.ajax({
			url:"http://localhost:8080/hon/UserServlet?method=sendcode",
			type:"post",
			data:{"email":email},
			async: true,
			beforeSend:function(){
				$("#sendemail").val("发送中");
			},
			success:function(msg){
				if(msg=="false"){
					$("#email").val("");
					$("#sendemail").val("发送验证码");
					alert("该邮箱未注册，请重新输入");
				}else{
					$("#sendemail").val("发送验证码");
					alert("验证码发送成功，请到您的邮箱查看");
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
			url:"http://localhost:8080/hon/UserServlet?method=updatepwd",
			type:"post",
			data:{"password":password,"npassword":npassword},
			async: true,
			beforeSend:function(){
				$("#findpwd").val("请稍等");
			},
			success:function(msg){
				if(msg=="false"){
					$("#code").val("");
					alert("修改密码失败，请重新修改");
					$("#findpwd").val("确认");
				}else{
					alert("修改密码成功");
					window.location.href="user_login.jsp";
				}
			}
		});
	});
});
