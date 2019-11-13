<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-黑名单</title>
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript" src="../js/blacklist.js"></script>
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
	<div class="blacklist-mid" style="height:auto;dispaly:table;">
      <div class="content">
        <h1><font style="font-family:'Microsoft Yahei';font-size:26px"><b>我的黑名单</b></font></h1>
        <hr style="margin-left:0px;width:700px"/>
        <div class="friendType" style="margin-left:-20px;">
        	<ul style="line-height:26px;">
        		<c:forEach var="row" items="${blackList}">
        			<li>
        				<div>
        					<div>
        						<img src="${row.avatar}" style="width:50px;height:50px;">
        					</div>
        					<div style="margin-top:-75px;margin-left:60px;">
        						<p style="font-size:15px;"><a href="../user/getUser.do?id=${row.id}">${row.name}</a></p>
        						<p style="margin-top:-15px;color:#3377aa;font-size:13px;">${row.signature}</p>
        					</div>
        					<div style="margin-left:550px;margin-top:-55px;">
        						<input type="checkbox" value="${row.id}" name="id" />
        					</div>
        				</div>
        				<hr style="margin-left:-20px;margin-top:30px;width:650px;"/>
        			</li>
        		</c:forEach>
        		<li><input type="button" value="移除黑名单" class="mf-btn" onclick="exitbl('${sessionScope.user.id}')" style="margin-left:540px;margin-top:20px;"></li>
        	</ul>
        </div>
      </div>
    </div>
	<div class="blacklist-asize" style="margin-left:1000px;margin-top:130px;">
		<a href="../relation/getMyFriends.do?pn=1" class="items">>返回我的好友列表</a><br/><br/>
		<p style="color:"><font style="color:#007722;">被加入黑名单的人将不能：</font></p>
		<p><font size="2px" style="color:#666666;">1. 关注你（已关注的会自动取消）<br/>
		   2. 给你发豆邮<br/>
		   <br/>要将一个人从黑名单里删除，请点击移除黑名单的按钮。</font></p>
	</div>
</body>
</html>