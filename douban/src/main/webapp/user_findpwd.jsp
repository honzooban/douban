<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>找回密码-豆瓣</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link href="https://fonts.font.im/css?family=Permanent+Marker" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/login.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="./js/findpwd.js"></script>
<script type="text/javascript">
	var countdown= 30;
	function settime(val) {
		if (countdown == 0) {
			val.removeAttribute("disabled");
			val.value="获取验证码";
			countdown = 30;
		} else {
			val.setAttribute("disabled", true);
			val.value="重新发送(" + countdown + ")";
			countdown--;
		}
		setTimeout(function() {
			settime(val)
		},1000)
	}
</script>
</head>
<body>
	<div class="login-form">
		<h1 style="font-family:sans-serif;font-size:30px">找回密码</h1>
		<form>
			<table>
				<tr>
					<td><input type="text" maxlength="11" placeholder="手机号码" style="width:95%" class="txtb" value="" id="email"/></td>
					<td><input type="button" style="margin-top:20px;width:100%" value="发送验证码" id="sendemail" class="login-btn" onclick="settime(this)"/></td>
				</tr>
			</table>
			<input type="text" placeholder="验证码" maxlength="6" class="txtb" id="code" value=""/>
			<input type="button" class="login-btn" value="确认" id="findpwd"/>
		</form>
	</div>
</body>
</html>