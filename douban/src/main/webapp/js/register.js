/**
 * 注册信息提交
 * @returns
 */
$(document).ready(function(){
	$("#register").click(function(){
		var username = $("#username").val();
		var password = $("#password").val();
		var npassword = $("#npassword").val();
		var email = $("#email").val();
		if(username == ""){
			$("#username").focus();
			alert("用户名不能为空");
			return;
		}
		if(password == ""){
			$("#password").focus();
			alert("密码不能为空");
			return;
		}
		if(npassword == ""){
			$("#npassword").focus();
			alert("请再输入一次密码");
			return;
		}
		if(npassword != password){
			$("#npassword").val("");
			$("#npassword").focus();
			alert("前后密码不同，请重新输入");
			return;
		}
		if(email == ""){
			$("#email").focus();
			alert("邮箱地址不能为空");
			return;
		}
		if (username.length < 6 || username.length>25 || !username.match("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$")) {
			$("#username").focus();
			alert("用户名格式不规范");
			return
		}
		if (!password.match("^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{6,20}$")) {
			alert("密码格式为字母数字组合且不能含有特殊字符");
			return;
		}
		if(!email.match("^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.])+[A-Za-z\\d]{2,4}$")){
			$("#email").focus();
			alert("邮箱地址格式有误");
			return;
		}
		$.ajax({
			url:"http://localhost:8080/hon/RegisterServlet",
			type:"post",
			data:{"username":username,"password":password,"email":email},
			async: true,
			beforeSend:function(){
				$("#register").val("注册中");
			},
			success:function(msg){
				if(msg=="false"){
					$("#username").val("");
					$("#email").val("");
					alert("该用户名或邮箱已被注册，请重新输入");
					$("#register").val("注册");
				}
				if(msg=="true"){
					alert("注册成功");
					window.location.href="user_login.jsp";
				}
			}
		});
	});
});