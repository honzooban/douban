<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-错误</title>
	<script type="text/javascript">
		var time = 4;
		function turnPage(){
			window.setTimeout('turnPage()',1000);
			time = time - 1;
			document.getElementById("layer").innerHTML = time;
		}
	</script>
  </head>
<body  onload="turnPage()">
	<div align="center">
		<h3>请先登录你的账号！</h3>
		<b><span id="layer">3</span>秒后自动跳转登录页面.   .   .</b><br><br>
		<a href="user_login.jsp"><h3>点击即刻跳转至登录页面</h3></a>
	</div>
	<%
		//转向语句
		response.setHeader("Refresh", "3;user_login.jsp");
	%>
</body>
</html>