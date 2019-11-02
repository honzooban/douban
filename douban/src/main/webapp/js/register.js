/**
 * 注册信息提交
 * @returns
 */
$(document).ready(function(){
	$("#register").click(function(){
		var name = $("#username").val();
		var password = $("#password").val();
		var npassword = $("#npassword").val();
		var phone = $("#phone").val();
		if(name == ""){
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
		if(phone == ""){
			$("#phone").focus();
			alert("手机号码不能为空");
			return;
		}
		if (name.length < 6 || name.length>25 || !name.match("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$")) {
			$("#username").focus();
			alert("用户名格式不规范");
			return
		}
		if (!password.match("^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{6,20}$")) {
			alert("密码格式为字母数字组合且不能含有特殊字符");
			return;
		}
		if(!phone.match("^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$")){
			$("#email").focus();
			alert("手机号码格式有误");
			return;
		}
		$.ajax({
			url:"http://localhost:8080/douban/user/register.do",
			type:"post",
			data:JSON.stringify({"name":name,"password":password,"phone":phone}),
			contentType:"application/json;charset=utf-8",
			dataType:"json",

			beforeSend:function(){
				$("#register").val("注册中");
			},
			success:function(msg){
				if(msg.code == 500){
					alert(msg.msg);
					$("#phone").val("");
					$("#register").val("注册");
					return;
				}
				if(msg.code == 400){
					alert(msg.msg);
					$("#register").val("注册");
					return;
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