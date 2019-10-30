<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-我的好友</title>
    <style>
    .mf-btn{
    	width: 87px;
 		height: 30px;
  		border: 0;
  		color:#ffffff;
  		background-color: #30983f;
  		border-radius: 44px;
  		cursor: pointer;
  		transition: 0.8s;
    }
    </style>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="./js/myfriend.js"></script>
</head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost/douban" user="root" password="123456"/>
    <div id="homepage-top" class="homepage-top">
      <div class="top-line">
            <div class="line-logo">
              <a style="margin-left:80px;"href="PageServlet?page=1&method=mp"><img src="./image/logo.png" width="184px" height="57px"></a>
            </div>
            <div class="line-items">
              <table style="height:67px;">
                <tr>
                  <td style="text-align:center;width:120px;"><a class="items" style="text-decoration: none;" href="PageServlet?page=1&method=mp"><font style="color:#007722;">首页</font></a></td>
                  <td style="text-align:center;width:120px;"><a class="items" style="text-decoration: none;" href="user_homepage.jsp"><font style="color:#007722;">我的豆瓣</font></a></td>
                  <td style="text-align:center;width:120px;"><a class="items" style="text-decoration: none;" href="user_mydoumail.jsp"><font style="color:#007722;">我的豆邮</font></a></td>
                </tr>
              </table>
            </div>
            <div class="line-search">
                  <div ><input id="searchtext" name="searchtext" size="22" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
                  <div style="float:right;margin-top:-30px;margin-right:211.5px;"><input type="button" onclick="search()" value="" style="border:0px;width:30px;height:30px;background:url(./image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;"></div>
            </div>
      </div>
    </div>
    <div class="myfriend-mid" style="margin-top:-35px;">
      <div class="content" style="position:absolute;">
        <h1><font style="font-family:'Microsoft Yahei';font-size:26px"><b>我的好友</b></font></h1>
        <div class="friendType">
        	<ul>
        		<sql:query dataSource="${snapshot}" var="result">
        			select distinct relation_type from relation where user_id = ? and relation_status = 1;
        			<sql:param value="${sessionScope.user.id}" />
        		</sql:query>
        		<c:forEach var="row" items="${result.rows}">
        			<li style="float:left;margin-right:20px;"><input type="button" class="fritype" value="${row.relation_type}"></li>
        		</c:forEach>
        	</ul>
        	<br/><br/>
        	<div style="margin-left:0px;width:700px;color:#e6e6e6"><hr/></div>
        	<ul style="line-height:30px;">
        		<c:forEach var="user" items="${pageObjective.users}">
        			<li>
        				<div>
        					<div>
        						<img src="${user.url}" style="width:50px;height:50px;">
        					</div>
        					<div style="margin-top:-80px;margin-left:60px;">
        						<h3><a href="user_userpage.jsp?id=${user.id}"><font size="2.5px">${user.name}</font></a></h3>
        						<p style="margin-top:-25px;"><font size="2.5px">${user.signature}</font></p>
        					</div>
        					<div style="margin-left:600px;margin-top:-70px;">
        						<p style="font-size:13px;color:#999999">${user.type}</p>
        					</div>
        					<div style="margin-left:600px;margin-top:-15px;">
        						<input type="checkbox" name="id" value="${user.id}">
        					</div>
        				</div>
        				<hr style="margin-left:-20px;margin-top:5px;;width:650px;color:#e6e6e6"/>
        			</li>
        		</c:forEach>
        	</ul>
        	<div style="margin-left:470px;margin-top:20px;">
        		<input type="button" value="删除好友" class="mf-btn" onclick="deleteFriend(${pageObjective.currentPage},'${sessionScope.user.id}')">&nbsp;&nbsp;&nbsp;
        		<input type="button" value="移入黑名单" class="mf-btn" onclick="addBlackList(${pageObjective.currentPage},'${sessionScope.user.id}')">
        	</div>
        	<div class="foot" style="margin-top:-30px;margin-left:40px;">
        		<a href="PageServlet?page=1&method=mf">首页</a>
        		<c:if test="${pageObjective.currentPage>1}">
       	 			<a href="PageServlet?page=${pageObjective.currentPage-1}&method=mf">上一页</a>
    			</c:if>
    			<c:if test="${pageObjective.currentPage!=pageObjective.totalPage-1}">
        		<a href="PageServlet?page=${pageObjective.currentPage+1}&method=mf">下一页</a>
        		</c:if>
        		<a href="PageServlet?page=${pageObjective.totalPage-1}&method=mf">尾页</a>
        	</div>
      	</div>
      </div>
    </div>
  	<div class="myfriend-asize" style="margin-left:1000px;margin-top:210px;">
         	<p><a class="items" href="user_blacklist.jsp">>管理黑名单</a></p>
  	</div>
  </body>
</html>