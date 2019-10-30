<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-管理员</title>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
    <style>
    	body{
    		background-image:url("./image/adminbp.jpg");
    	}
		#login{
			width: 300px;
			padding: 0px;
			text-align: center;
			margin: auto;
			position: absolute;
     	 	margin-left: 620px;
      		margin-top: 250px;
			transition: translate(-50%,-50%);
			overflow: hidden;
		}
		input{
			margin-bottom:0px;
			display: block;
			width: 90%;
			padding: 0 16px;
			height: 40px;
			text-align: center;
			box-sizing: border-box;
			outline: none;
			border: none;
			font-family: "montserrat",sans-serif;
			border-radius: 44px;
		}
	</style>
</head>
<body>
	<div id="login">
		<input type="text" id="adminid" value="" placeholder="管理员账号" /><br>
		<input type="password" value="" id="adminpwd" placeholder="管理员密码" /><br>
		<input type="text" value="" style="width:140px;" id="code" maxlength="4" placeholder="验证码" />
		<img border=0 id="checkCode" style="width:100px;height:40px;margin-top:-180px;margin-left:120px;" src="CheckCodeServlet" onclick="changeCode()"/><br>
		<input type="button"  id="login-btn" style="background:#41ac52" value="登录">	
	</div>
</body>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
/**
 * 登录验证
 * @returns
 */
$(document).ready(function(){
	$('#login-btn').click(function(){
		var username = $("#adminid").val();
		var password = $("#adminpwd").val();
		var code = $("#code").val();
		if(username == ""){
			alert("ID不能为空");
			$("#username").focus();
			return;
		}
		if(password == ""){
			alert("密码不能为空");
			$("#password").focus();
			return;
		}
		if(code == ""){
			alert("验证码不能为空");
			$("#code").focus();
			return;
		}
		$.ajax({
			url:"http://localhost:8080/hon/LoginServlet?obj=1",
			type:"post",
			data:{"username":username,"password":password,"code":code},
			async: true,
			beforeSend:function(){
				$("#login-btn").val("登陆中");
			},
			success:function(msg){
				console.log(msg);
				if(msg=="false"){
					$("#username").val("");
					$("#password").val("");
					alert("账号或密码有误，请重新输入");
					$("#login-btn").val("登录");
				}
				if(msg=="codefalse"){
					$("#code").val("");
					alert("验证码有误，请重新输入");
					$("#login-btn").val("登录");
				}
				if(msg=="user"||msg=="banned"){
					alert("该用户不是管理员，请重新输入");
				}
				if(msg=="admin"){
					alert("登录成功，欢迎你的使用");
					window.location.href="admin_homepage.jsp";
				}
			}
		});
	});
});
/**
 * 验证码刷新
 */
window.onload = function () {
    var img = document.getElementById("checkCode");
    img.onclick = function () {
       var date = new Date().getTime();
       img.src = "checkcode?"+date;
    }
};
</script>
</html>