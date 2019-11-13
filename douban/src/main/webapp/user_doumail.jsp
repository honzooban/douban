<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-豆邮</title>
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript" src="../js/doumail.js"></script>
</head>
<body>
	<div class="top-line">
		<div class="line-logo">
			<a style="margin-left:80px;"href="../article/mainpage.do"><img src="../image/logo.png" width="184px" height="57px"></a>
		</div>
		<div class="line-items">
			<table style="height:67px;">
				<tr>
					<td style="text-align:center;width:120px;"><a class="items" href="../article/getArticles.do?pn=1"><font style="color:#007722;">首页</font></a></td>
					<td style="text-align:center;width:120px;"><a class="items" href="../user/homepage.do"><font style="color:#007722;">我的豆瓣</font></a></td>
					<td style="text-align:center;width:120px;"><a class="items" href="../privateletter/getPrivateletter.do"><font style="color:#007722;">我的豆邮</font></a></td>
				</tr>
			</table>
		</div>
		<div class="line-search">
			<form action="search" method="get">
				<div><input id="searchtext" size="22" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
				<div style="float:right;margin-top:-30px;margin-right:194.5px;"><input type="button" onclick="search()" style="border:0px;width:30px;height:30px;background:url(../image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;" /></div>
			</form>
		</div>
	</div>
	<div id="doumial-mid" style="margin-left:350px;margin-top:40px;">
		<h2>与${param.name}的豆邮</h2>
		<div style="margin-top:-30px;overflow-y:auto;width:650px">
		<c:forEach var="row" items="${privateletter}">
        	<div style="margin-top:50px;">
        		<hr style="width:550px;margin-left:0px;margin-bottom:-10px;"/><br/>
        		<img src="${row.user.avatar}" style="width:50px;height:50px;"><br/>
        		<div style="margin-top:-70px;margin-left:60px;"><p>${row.user.name}</p></div>
        		<div style="margin-top:-10px;margin-left:60px;"><p>${row.privateletter.info}</p></div>
        		<div style="margin-left:500px;margin-top:-70px;"><p>${row.privateletter.time}</p></div>
        	</div>
        </c:forEach>
        </div>
		<div style="margin-top:40px;">
			<textarea rows="10" cols="80" autocomplete="off" id="doumail" style="resize: none;width:550px;height:150px;"></textarea>
		</div>
		<div style="margin-top:20px;margin-left:470px;">
			<input type="button" value="发送豆邮" onclick="send('${relation.status}',${param.id},${param.byId})" id="sendmail" class="mf-btn" />
		</div>
	</div><br><br>
</body>
</html>