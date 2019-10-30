<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-文章</title>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="./js/article.js"></script>
</head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost/douban" user="root" password="123456"/>
	<div id="homepage-top" class="homepage-top">
      <div class="top-line">
            <div class="line-logo">
              <a style="margin-left:80px;"href="/hon/PageServlet?page=1&method=mp"><img src="/hon/image/logo.png" width="184px" height="57px"></a>
            </div>
            <div class="line-items">
              <table style="height:67px;">
                <tr>
                  <td style="text-align:center;width:120px;"><a class="items" href="PageServlet?page=1&method=mp"><font style="color:#007722;">首页</font></a></td>
                  <td style="text-align:center;width:120px;"><a class="items" href="user_homepage.jsp"><font style="color:#007722;">我的豆瓣</font></a></td>
                  <td style="text-align:center;width:120px;"><a class="items" href="user_mydoumail.jsp"><font style="color:#007722;">我的豆邮</font></a></td>
                </tr>
              </table>
            </div>
            <div class="line-search">
              <form action="search" method="get">
                  <div><input id="searchtext" size="22" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
                  <div style="float:right;margin-top:-30px;margin-right:194.5px;"><input type="button" onclick="search()" value="" style="border:0px;width:30px;height:30px;background:url(/hon/image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;" /></div>
              </form>
            </div>
      </div>
    </div>
    <div id="article" style="width:1100px;">
    	<sql:query dataSource="${snapshot}" var="article">
   			SELECT user.user_id,user_name,user_pic,article_id,article_title,article_content,article_time,article_type,article_agreementnum,article_commentnum,article_transpondnum FROM USER INNER JOIN article ON article.`article_id` = ? AND user.`user_id`=article.`user_id`;
   			<sql:param value="${param.aid}" />
		</sql:query>
		<c:forEach var="row" items="${article.rows}">
			 <div style="margin-top:50px;margin-left:200px;"><h2>${row.article_title}</h2></div>
			 <div style="margin-top:10px;margin-left:200px;"><img src="${row.user_pic}" style="width:50px;height:50px;"></div>
			 <div style="margin-top:-35px;margin-left:260px;"><a href="user_userpage.jsp?id=${row.user_id}">${row.user_name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#777777">${row.article_time}</font></div>
			  <div style="margin-top:-20px;margin-left:1000px;"><input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="收藏" onclick="collect('${sessionScope.user.id}',${row.article_id})"></div>
			 <div style="margin-top:20px;margin-left:200px;"><p>${row.article_content}</p></div>
			 <sql:query dataSource="${snapshot}" var="picture">
   				SELECT picture_url FROM picture WHERE article_id = ?;
   				<sql:param value="${param.aid}" />
			</sql:query>
			<div style="margin-left:200px;margin-top:30px;">
				<c:forEach var="pic" items="${picture.rows}">
					<div style="display:inline"><img src="${pic.picture_url}" style="width:150px;height:150px"></div>
				</c:forEach>
			</div>
			 <c:set var="id" value="${row.user_id}"/>
			 <c:if test="${sessionScope.user.id!=id}">
			 <div style="margin-top:40px;margin-left:830px;">
			 	<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" value="赞(${row.article_agreementnum})" onclick="agreeArticle('${sessionScope.user.id}',${param.aid},${row.article_agreementnum})" />&nbsp;&nbsp;
			 	<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="评论(${row.article_commentnum})" onclick="comment('${sessionScope.user.id}')" />&nbsp;&nbsp;
			 	<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="转发(${row.article_transpondnum})" onclick="transpond('${sessionScope.user.id}')" />
			 	<div id="com" style="margin-left:-195px;margin-top:15px;display:none;"><input type="text" id="commentInfo" style="width:400px;"><input type="button" value="评论" id="submitComment" onclick="commentSubmit('${sessionScope.user.id}',${row.article_commentnum},${param.aid})"></div>
				<div id="tran" style="margin-left:-195px;margin-top:15px;display:none;"><input type="text" id="transpondInfo" style="width:400px;"><input type="button" value="转发" id="submitTranspond" onclick="transpondSubmit('${sessionScope.user.id}',${row.article_transpondnum},${param.aid})"></div>
			 </div>
			 </c:if>
			 <c:if test="${sessionScope.user.id==id}">
			 <div style="margin-top:40px;margin-left:710px;">
			 	<a href='user_publish_article.jsp?title=${row.article_title}&content=${row.article_content}&aid=${row.article_id}'>编辑</a>&nbsp;&nbsp;
				<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="删除文章" onclick="deleteArticle(${row.article_id})">&nbsp;&nbsp;
			 	<input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;" value="赞(${row.article_agreementnum})" onclick="agreeArticle('${sessionScope.user.id}',${param.aid},${row.article_agreementnum})">&nbsp;&nbsp;
			 	<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="评论(${row.article_commentnum})" onclick="comment('${sessionScope.user.id}')" />&nbsp;&nbsp;
			 	<input type="button" style="border:1px solid #e2f1e7;background-color:#eff7ed;width:70px;" value="转发(${row.article_transpondnum})" onclick="transpond('${sessionScope.user.id}')" />
			 	<div id="com" style="margin-left:-210px;margin-top:15px;display:none;"><input type="text" id="commentInfo" style="width:400px;"><input type="button" value="评论" id="submitComment" onclick="commentSubmit('${sessionScope.user.id}',${row.article_commentnum},${param.aid})"></div>
				<div id="tran" style="margin-left:-210px;margin-top:15px;display:none;"><input type="text" id="transpondInfo" style="width:400px;"><input type="button" value="转发" id="submitTranspond" onclick="transpondSubmit('${sessionScope.user.id}',${row.article_transpondnum},${param.aid})" /></div>
			 </div>
			 </c:if>
		</c:forEach>
    </div>
    <div id="foot" style="width:1100px;">
    	<div style="margin-top:30px;margin-left:200px;"><p style="color:#5477bb;">评论</p></div>
    	<hr style="width:900px;margin-left:195px;;"/>
    	<sql:query dataSource="${snapshot}" var="article">
   			SELECT user.user_id,user_name,user_pic,comment_id,comment_info,comment_time,comment_agreementnum FROM USER INNER JOIN COMMENT ON comment.`article_id` = ? AND user.`user_id` = comment.`user_id`;
   			<sql:param value="${param.aid}" />
		</sql:query>
		<c:forEach var="row" items="${article.rows}">
			<div style="margin-top:40px;margin-left:200px;"><img src="${row.user_pic}" style="width:50px;height:50px;"></div>
			<div style="background-color:#f2fbf2;margin-left:270px;margin-top:-50px;"><a href="user_userpage.jsp?id=${row.user_id}">${row.user_name}</a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#777777">${row.comment_time}</font><input type="button" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;margin-left:500px" value="赞(${row.comment_agreementnum})" onclick="agreeComment('${sessionScope.user.id}',${row.comment_id},${row.comment_agreementnum})"></div>
			<div style="margin-top:20px;margin-left:270px;">${row.comment_info}</div>
		</c:forEach>
    </div><br><br><br>
</body>
</html>