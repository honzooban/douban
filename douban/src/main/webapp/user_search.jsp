<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-搜索结果</title>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		function search(){
			var message = document.getElementById('searchtext').value;
			window.location.href="PageServlet?message="+message+"&method=search";
		}
	</script>
  </head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost/douban" user="root" password="123456"/>
    <div id="homepage-top" class="homepage-top">
      <div class="top-line">
            <div class="line-logo">
              <a style="margin-left:80px;"href="PageServlet?page=1&method=mp"><img src="/hon/image/logo.png" width="184px" height="57px"></a>
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
                  <div><input id="searchtext" size="22" value="" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
                  <div style="float:right;margin-top:-30px;margin-right:194.5px;"><input type="button" onclick="search()" value="" style="border:0px;width:30px;height:30px;background:url(/hon/image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;" /></div>
            </div>
      </div>
    </div>
    <div>
    	<div style="position:absolute;width:300px;height:100%;margin-left:50px;">
    		<h2>与用户有关的搜索结果：</h2>
    		<div>
    			<c:forEach var="user" items="${pageUser.users}">
    				<div style="margin-top:30px">
    					<div><img src="${user.url}" style="width:70px;height:70px;"></div>
    					<div style="margin-top:-70px;margin-left:80px;"><a href="user_userpage.jsp?id=${user.id}"><font style="font-size:20px">${user.name}</font></a></div>
    					<div style="margin-top:20px;margin-left:80px;"><font style="font-color:#777777;font-size:15px;">${user.signature}</font></div>
    				</div>
    			</c:forEach>
    		</div>
    	</div>
    	<div style="width:1000px;margin-left:400px;">
    		<h2>与文章有关的搜索结果：</h2>
    		<div>
    			<c:forEach var="article" items="${pageArticle.articles}">
    				<div style="margin-top:20px">
    					<div><a href="user_article.jsp?aid=${article.id}">${article.title}</a><div style="float:right;"><font style="font-color:#777777;font-size:15px;">时间：${article.time}</font></div><div style="float:right;margin-right:40px"><font style="font-color:#777777;font-size:15px;">类型：${article.type}</font></div></div>
    					<div style="height:200px;overflow:auto;text-overflow:ellipsis;">${article.content}</div>
    					<hr style="width:1000px" />
    				</div>
    			</c:forEach>
    		</div>
    	</div>
    	<div class="foot" style="margin-top:40px;margin-left:540px;">
        <a href="PageServlet?page=1&method=search&message=${param.message}">首页</a>
        <c:if test="${pageUser.currentPage>1}">
       	 	<a href="PageServlet?page=${pageUser.currentPage-1}&method=search&message=${param.message}">上一页</a>
    	</c:if>
    	<c:if test="${pageUser.currentPage!=pageUser.totalPage}">
        	<a href="PageServlet?page=${pageUser.currentPage+1}&method=search&message=${param.message}">下一页</a>
        </c:if>
        <a href="PageServlet?page=${pageUser.totalPage}&method=search&message=${param.message}">尾页</a>
     </div>
    </div>
</body>
</html>