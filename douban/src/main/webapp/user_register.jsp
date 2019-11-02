<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>注册-豆瓣</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link href="https://fonts.font.im/css?family=Permanent+Marker" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="./css/login.css">
	<script src="./js/jquery-3.4.0.min.js"></script>
	<script type="text/javascript" src="./js/register.js"></script>
</head>
<body>
	<div class="login-form">
		<h1>Sign Up</h1>
		<form>
			<input type="text" placeholder="用户名" class="txtb" id="username" value="">
			<input type="password" placeholder="密码" class="txtb" id="password" value="">
			<input type="password" placeholder="确认密码" class="txtb" id="npassword" value="">
			<input type="text" placeholder="手机号码" class="txtb" id="phone" value="">
			<input type="button" class="login-btn" value="注册" id="register">
		</form>
	</div>
</body>
</html>