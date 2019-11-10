<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-用户主页</title>
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript" src="../js/userpage.js"></script>
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
					<td style="text-align:center;width:120px;"><a class="items" href="../relation/getPrivateletter.do"><font style="color:#007722;">我的豆邮</font></a></td>
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
	<div>
		<div style="position:absolute;margin-top:50px;margin-left:20px;">
		   <img src="${user.avatar}" width="50px;" height="50px;">
		</div>
		<div class="signature" style="position:absolute;margin-top:20px;margin-left:82px;">
			<h1>${user.name}</h1>
			<div style="position:absolute;margin-top:-36px;">
			  <p style="color:#777777;white-space:nowrap;"><c:if test="${user.signature != ''}"><c:out value="${user.signature}" /></c:if><c:if test="${user.signature == ''}">(个性签名)</c:if></p>
			</div>
		</div>
	</div>
	<div style="width:320px;height:293.6px;background-color:#fff6ed;margin-top:50px;margin-left:1100px;">
		<div><img src="${user.avatar}" style="width:160px;height:158px;margin-top:10px;margin-left:10px;"></div>
		<c:if test="${sessionScope.user.id!=null}">
		<div>
			<c:set var="relaitonStatus" value="${relation.status}"/>
			<c:set var="relaitonType" value="${relation.type}"/>
   			<c:if test="${empty relation}">
   				<div style="float:left;margin-right:20px;margin-left:15px"><input type="button" value="添加好友" onclick="addFriend('${sessionScope.user.id}',${param.id})" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></div>
   				<div style="margin-top:20px"><input type="button" value="发豆邮" onclick="javascript:window.location.href='user_doumail.jsp?uid=${sessionScope.user.id}&ubyid=${param.id}&name=${name}'" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></div>
   			</c:if>
   			<c:if test="${relaitonStatus==0&&relationStatus==null}">
   				<div style="float:left;margin-right:20px;margin-left:15px"><input type="button" value="添加好友" onclick="addFriend('${sessionScope.user.id}',${param.id})" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></div>
   				<div style="margin-top:20px"><input type="button" value="发豆邮" onclick="javascript:window.location.href='user_doumail.jsp?uid=${sessionScope.user.id}&ubyid=${param.id}&name=${name}'" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></div>
   			</c:if>
   			<c:if test="${relaitonStatus==1}">
   				<div style="margin-top:20px;margin-left:15px"><font color="#777777" size="2px">已为好友</font>&nbsp;&nbsp;&nbsp;<c:if test="${relaitonType!='未分组'}"><font color="#777777" size="2px">${relaitonType}</font>&nbsp;&nbsp;<input type="button" value="修改分组" onclick="show()" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></c:if><c:if test="${relaitonType=='未分组'}"><font color="#777777" size="2px">未分组</font>&nbsp;&nbsp;<input type="button" value="添加分组" onclick="show()" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></c:if></div>
   				<div id="rt" style="margin-top:-24px;margin-left:210px;display:none;"><input type="text" id="typevalue" style="width:55px;" value="" placeholder="输入分组"><input type="button" value="确认" onclick="addType('${sessionScope.user.id}',${param.id})"></div>
   				<div style="margin-top:20px;margin-left:15px"><input type="button" value="发豆邮" onclick="javascript:window.location.href='user_doumail.jsp?uid=${sessionScope.user.id}&ubyid=${param.id}&name=${name}'" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></div>
   				<div style="margin-top:-24px;margin-left:105px"><input type="button" value="举报好友" onclick="report()" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></div>
   			</c:if>
   			<c:if test="${relaitonStatus==2}">
   				<div style="margin-top:20px;margin-left:15px"><font color="#777777" size="2px">已拉入黑名单</font>&nbsp;&nbsp;&nbsp;<a href="user_blacklist.jsp">>前往黑名单</a></div>
   			</c:if>
		</div>
		</c:if>
		<c:if test="${sessionScope.user.id==null}">
			<div style="float:left;margin-right:20px;margin-left:15px;margin-top:20px;"><input type="button" value="添加好友" onclick="addFriend('${sessionScope.user.id}',${param.id})" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></div>
   			<div style="margin-top:20px;"><input type="button" value="发豆邮" onclick="sendDouMail()" style="background-color:#fff3e7;border:1px solid #e8ccb2;width:70px;"></div>
		</c:if>
	</div>
	<div style="margin-top:-200px;margin-left:30px;width:500px">
		<div><font style="color:#007722"><b>我的文章</b></font>&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;<a href="myarticle.jsp?id=${param.id}" class="items" style="color:#666699">全部</a></div>
   		<div style="margin-top:20px;">
			<c:forEach var="myArticle" items="${myArticle}">
				<div><a href="../article/getArticle.do?id=${myArticle.id}"><font style="size:16px;color:#3377aa;">${myArticle.title}</font></a></div>
				<div><font style="size:12px;color:#777777;">${myArticle.time}</font></div>
				<div style="height:62px;overflow-y:auto">${myArticle.content}</div><br>
			</c:forEach>
   		</div>
	</div><br>
	<div style="margin-left:30px;width:500px">
		<div><font style="color:#007722"><b>我的收藏</b></font>&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;<a href="mycollection.jsp?id=${param.id}" class="items" style="color:#666699">全部</a></div>
   		<div style="margin-top:20px;">
   			<c:forEach var="myCollection" items="${myCollection}">
   				<div><a href="article.jsp?aid=${myCollection.id}"><font style="size:16px;color:#3377aa;">${myCollection.title}</font></a></div>
   				<div><font style="size:12px;color:#777777;">${myCollection.time}</font></div>
   				<div style="height:62px;overflow:hidden">${myCollection.content}</div><br>
   			</c:forEach>
   		</div>
	</div>
	<div id="reportdiv" style="margin-left:1100px;margin-top:-10px;display:none;">
		<p>举报内容:</p>
		<textarea id="reportContent" style="width:300px;height:120px;"></textarea>
		<div style="margin-left:215px;margin-top:10px"><input type="button" value="举报" class="mf-btn" onclick="sendReport('${sessionScope.user.id}',${param.id})"></div>
	</div>
</body>
</html>