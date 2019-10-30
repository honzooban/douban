<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-文章管理</title>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="./js/operatearticle.js"></script>
  </head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost/douban" user="root" password="123456"/>
	<div id="center" style="width:800px;">
		<h1 style="margin-left:30px;">文章管理：</h1>
		<div id="content" style="margin-left:-200px;">
			<c:forEach var="article" items="${pageAdmin.articles}">
					<div style="margin-top:-180px">
						<div>
							<div style="margin-left:200px;margin-top:200px"><img src="${article.upic}" style="width:60px;height:60px;" /></div>
							<div style="margin-left:200px">${article.uname}</div>
						</div>
						<div style="width:1000px;">
							<div style="margin-left:270px;margin-top:-85px;">${article.title}</div>
							<div style="margin-left:890px;margin-top:-20px;"><font color="#777777">类型：${article.type}</font></div>
							<div style="margin-left:270px;margin-top:15px;">${article.content}</div>
						</div>
						<sql:query dataSource="${snapshot}" var="result">
        					select article_status from article where article_id = ?;
        					<sql:param value="${article.id}" />
        				</sql:query>
        				<c:forEach var="row" items="${result.rows}">
        					<c:set var="status" value="${row.article_status}" />
        				</c:forEach>
        				<c:if test="${status==0}">
							<div style="margin-left:820px;margin-top:20px;">
								<input type="button" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;" onclick="topArticle(${article.id})" value="置顶文章">
								<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" onclick="delArticle(${article.id})" value="删除文章">
							</div>
						</c:if>
						<c:if test="${status==1}">
							<div style="margin-left:820px;margin-top:20px;">
								<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" onclick="delTop(${article.id})" value="取消置顶">
								<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" onclick="delArticle(${article.id})" value="删除文章">
							</div>
						</c:if>
						<hr style="margin-left:195px;margin-top:20px;width:800px"/>
					</div>
			</c:forEach>
		</div>
	</div>
	<div class="foot" style="margin-top:30px;margin-left:540px;">
        		<a href="PageServlet?page=1&method=ap">首页</a>
        		<c:if test="${pageAdmin.currentPage>1}">
       	 			<a href="PageServlet?page=${pageAdmin.currentPage-1}&method=ap">上一页</a>
    			</c:if>
    			<c:if test="${pageAdmin.currentPage!=pageObjective.totalPage}">
        		<a href="PageServlet?page=${pageAdmin.currentPage+1}&method=ap">下一页</a>
        		</c:if>
        		<a href="PageServlet?page=${pageAdmin.totalPage}&method=ap">尾页</a>
    </div><br><br>
</body>
</html>