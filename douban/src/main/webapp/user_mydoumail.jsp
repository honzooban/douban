<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-我的豆邮</title>
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
				<div style="float:right;margin-top:-30px;margin-right:211.5px;"><input type="button" onclick="search()" style="border:0px;width:30px;height:30px;background:url(../image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;" /></div>
			</form>
		</div>
	</div>
	<div class="mydoumail-mid" style="height:auto;dispaly:table;">
		<div class="content">
			<h1><font style="font-family:'Microsoft Yahei';font-size:26px"><b>我的豆邮</b></font></h1>
			<hr style="width:700px;"/>
			<div class="doumaillist">
				<c:forEach var="row" items="${userAndPrivateletter}">
        			<c:set var="username" value="${row.user.name}" scope="request" />
        			<li>
        				<div style="margin-left:20px;">
        					<div>
        						<img src="${row.user.avatar}" style="width:50px;height:50px;">
        					</div>
        					<div style="margin-top:-65px;margin-left:60px;">
        						<p style="font-size:15px;">${row.user.name}</p>
        					</div>
        					<div>
								<div style="margin-left:60px;margin-top:-13px"><a href="../privateletter/getUserPrivateletter.do?id=${sessionScope.user.id}&byId=${row.user.id}&name=${row.user.name}" class="items" style="color:#3377aa;font-size:13px;">${row.privateletter.info}</a></div>
								<div style="margin-top:-56px;margin-left:550px;"><p style="font-size:13px;color:#999999">${row.privateletter.time}</p></div>
        					</div>
        				</div>
        				<hr style="margin-left:20px;margin-top:40px;;width:680px;color:#e6e6e6"/>
        			</li>
        		</c:forEach>
			</div>
		</div>
	</div>
	<div class="mydoumail-asize" style="float:left">
        <div style="margin-left:350px;margin-top:150px;">
         	<p><a class="items" href="user_blacklist.jsp">>管理黑名单</a></p>
         	<p><a class="items" href="PageServlet?page=1&method=mf">>去我的好友列表</a></p>
        </div>
    </div>
</body>
</html>