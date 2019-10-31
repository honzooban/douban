<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<title>豆瓣-登录</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link href="https://fonts.font.im/css?family=Permanent+Marker" rel="stylesheet">
	<script src="./js/jquery-3.4.0.min.js"></script>
	<script type="text/javascript" src="./js/login.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/login.css">
</head>
<body>
	<div class="login-form">
		<h1>Log In</h1>
			<input type="text" value=""  value="" class="txtb" id="username" placeholder="用户名">
			<input type="password" value="" value="" class="txtb" id="password" placeholder="密码">
			<table>
				<tr>
					<td><input type="text" value="" value="" class="txtb" id="code" maxlength="4" placeholder="验证码"></td>
					<td><img border=0 id="checkCode" style="width: 80px;margin-top:20px" src="" /></td>
				</tr>
			</table>
			<input type="button" onclick="login('${sessionScope.user.name}')" class="login-btn" value="登录">
			<a href="user_register.jsp">还未注册?</a>
			<a href="user_findpwd.jsp">&nbsp;忘记密码?</a>
			<a href="admin_login.jsp">&nbsp;管理员登录</a>
	</div>
</body>
</html>