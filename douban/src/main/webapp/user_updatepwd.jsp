<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改密码-豆瓣</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/login.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="./js/findpwd.js"></script>
</head>
<body>
	<div class="login-form">
		<h1 style="font-family:sans-serif;font-size:30px">修改密码</h1>
		<form>
			<input type="password" value="" class="txtb" id="password" placeholder="新密码">
			<input type="password" value="" class="txtb" id="npassword" placeholder="再输入一次新密码">
			<input type="button" value="确认修改" id="updatepwd" class="login-btn">	
		</form>
	</div>
</body>
</html>