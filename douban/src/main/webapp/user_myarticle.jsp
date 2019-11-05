<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-我的文章</title>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="./js/myarticle.js"></script>
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
	<div style="margin-top:40px;margin-left:90px;">
		<h2>我的所有文章</h2>
		<sql:query dataSource="${snapshot}" var="result">
			select article.article_id,article_title,article_content,article_time from article where user_id = ? ORDER BY article_time DESC;
			<sql:param value="${param.id}" />
		</sql:query>
		<div style="width:700px">
   			<c:forEach var="row" items="${result.rows}">
   				<div><a href="user_article.jsp?aid=${row.article_id}"><font style="size:16px;color:#3377aa;">${row.article_title}</font></a></div>
   				<div><font style="size:12px;color:#777777;">${row.article_time}</font></div>
   				<div style="height:62px;overflow-y:auto;">${row.article_content}</div><br>
   				<hr style="width:700px;" />
   			</c:forEach>
   		</div>
	</div><br><br><br><br>
</body>
</html>