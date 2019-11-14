<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-文章</title>
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript" src="../js/article.js"></script>
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
    <div id="article" style="width:1100px;">
		 <div style="margin-top:50px;margin-left:200px;"><h2>${article.article.title}</h2></div>
		 <div style="margin-top:10px;margin-left:200px;"><img src="${article.user.avatar}" style="width:50px;height:50px;"></div>
		 <div style="margin-top:-35px;margin-left:260px;"><a href="../user/getUser.do?id=${article.user.id}">${article.user.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#777777">${article.article.time}</font></div>
		  <div style="margin-top:-20px;margin-left:1000px;"><input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="收藏" onclick="collect('${sessionScope.user.id}',${param.id})"></div>
		 <div style="margin-top:20px;margin-left:200px;"><p>${article.article.content}</p></div>
		 <div style="margin-left:200px;margin-top:30px;">
		 	<c:forEach var="picture" items="${article.article.pictures}">
				<div style="display:inline"><img src="${picture.url}" style="width:150px;height:150px"></div>
			</c:forEach>
		 </div>
		 <c:set var="id" value="${article.user.id}"/>
		 <c:if test="${sessionScope.user.id != id}">
		 <div style="margin-top:40px;margin-left:830px;">
			<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" value="赞(${article.article.agreementNum})" onclick="agreeArticle('${sessionScope.user.id}',${param.id})" />&nbsp;&nbsp;
			<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="评论(${article.article.commentNum})" onclick="comment('${sessionScope.user.id}')" />&nbsp;&nbsp;
			<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="转发(${article.article.transpondNum})" onclick="transpond('${sessionScope.user.id}')" />
			<div id="com" style="margin-left:-195px;margin-top:15px;display:none;"><input type="text" id="commentInfo" style="width:400px;"><input type="button" value="评论" id="submitComment" onclick="commentSubmit('${sessionScope.user.id}',${param.id})"></div>
			<div id="tran" style="margin-left:-195px;margin-top:15px;display:none;"><input type="text" id="transpondInfo" style="width:400px;"><input type="button" value="转发" id="submitTranspond" onclick="transpondSubmit('${sessionScope.user.id}',${param.id})"></div>
		 </div>
		 </c:if>
		 <c:if test="${sessionScope.user.id == id}">
		 <div style="margin-top:40px;margin-left:710px;">
			 <!--这里改用在控制层写一个接口来进行文章编辑-->
			<a href='../article/editArticle.do?title=${article.article.title}&content=${article.article.content}&id=${param.id}'>编辑</a>&nbsp;&nbsp;
			<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="删除文章" onclick="deleteArticle(${param.id})">&nbsp;&nbsp;
			<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" value="赞(${article.article.agreementNum})" onclick="agreeArticle('${sessionScope.user.id}',${param.id})">&nbsp;&nbsp;
			<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="评论(${article.article.commentNum})" onclick="comment('${sessionScope.user.id}',${param.id})" />&nbsp;&nbsp;
			<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="转发(${article.article.transpondNum})" onclick="transpond('${sessionScope.user.id}',${param.id})" />
			<div id="com" style="margin-left:-210px;margin-top:15px;display:none;"><input type="text" id="commentInfo" style="width:400px;"><input type="button" value="评论" id="submitComment" onclick="commentSubmit('${sessionScope.user.id}',${param.id})"></div>
			<div id="tran" style="margin-left:-210px;margin-top:15px;display:none;"><input type="text" id="transpondInfo" style="width:400px;"><input type="button" value="转发" id="submitTranspond" onclick="transpondSubmit('${sessionScope.user.id}',${param.id})" /></div>
		 </div>
		 </c:if>
    </div>
    <div id="foot" style="width:1100px;">
    	<div style="margin-top:30px;margin-left:200px;"><p style="color:#5477bb;">评论</p></div>
    	<hr style="width:900px;margin-left:195px;;"/>
		<c:forEach var="comment" items="${comments}">
			<div style="margin-top:40px;margin-left:200px;"><img src="${comment.user.avatar}" style="width:50px;height:50px;"></div>
			<div style="background-color:#f2fbf2;margin-left:270px;margin-top:-50px;"><a href="../user_userpage.jsp?id=${comment.user.id}">${comment.user.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#777777">${comment.comment.time}</font><input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;margin-left:500px" value="赞(${comment.comment.agreementNum})" onclick="agreeComment('${sessionScope.user.id}',${comment.comment.id},${comment.comment.agreementNum})"></div>
			<div style="margin-top:20px;margin-left:270px;">${comment.comment.info}</div>
		</c:forEach>
    </div><br><br><br>
</body>
</html>