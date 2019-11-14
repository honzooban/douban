<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-文章管理</title>
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript" src="../js/operatearticle.js"></script>
  </head>
<body>
	<div id="center" style="width:900px;">
		<h1 style="margin-left:30px;">文章管理：</h1>
		<div id="content" style="margin-left:-160px;">
			<c:forEach var="userAndArticle" items="${userAndArticle.list}">
				<div style="margin-top:-180px">
					<div>
						<div style="margin-left:200px;margin-top:200px"><img src="${userAndArticle.user.avatar}" style="width:60px;height:60px;" /></div>
						<div style="margin-left:200px">${userAndArticle.user.name}</div>
					</div>
					<div style="width:1000px;">
						<div style="margin-left:270px;margin-top:-85px;">${userAndArticle.article.title}</div>
						<div style="margin-left:890px;margin-top:-20px;"><font color="#777777">类型：${userAndArticle.article.type}</font></div>
						<div style="margin-left:270px;margin-top:15px;">${userAndArticle.article.content}</div>
					</div>
					<c:set var="status" value="${userAndArticle.article.status}"/>
					<c:if test="${status==0}">
						<div style="margin-left:820px;margin-top:20px;">
							<input type="button" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;" onclick="topArticle(${userAndArticle.article.id})" value="置顶文章">
							<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" onclick="delArticle(${userAndArticle.article.id})" value="删除文章">
						</div>
					</c:if>
					<c:if test="${status==1}">
						<div style="margin-left:820px;margin-top:20px;">
							<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" onclick="delTop(${userAndArticle.article.id})" value="取消置顶">
							<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" onclick="delArticle(${userAndArticle.article.id})" value="删除文章">
						</div>
					</c:if>
					<hr style="margin-left:195px;margin-top:20px;width:800px"/>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="foot" style="margin-top:30px;margin-left:540px;">
		<a href="../article/operateArticle.do?pn=1">首页</a>
		<c:if test="${userAndArticle.hasPreviousPage}">
			<a href="../article/operateArticle.do?pn=${userAndArticle.pageNum-1}">上一页</a>
		</c:if>
		<c:if test="${userAndArticle.hasNextPage}">
			<a href="../article/operateArticle.do?pn=${userAndArticle.pageNum+1}">下一页</a>
		</c:if>
		<a href="../article/operateArticle.do?pn=${userAndArticle.lastPage}">尾页</a>
    </div><br><br>
</body>
</html>