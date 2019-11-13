<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
    <script src="../js/jquery-3.4.0.min.js"></script>
	<script type="text/javascript" src="../js/myfriend.js"></script>
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
			</table>，
		</div>
		<div class="line-search">
			<form action="search" method="get">
				<div><input id="searchtext" size="22" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
				<div style="float:right;margin-top:-30px;margin-right:211.5px;"><input type="button" onclick="search()" style="border:0px;width:30px;height:30px;background:url(../image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;" /></div>
			</form>
		</div>
	</div>
    <div class="myfriend-mid" style="margin-top:-35px;">
      <div class="content" style="position:absolute;">
        <h1><font style="font-family:'Microsoft Yahei';font-size:26px"><b>我的好友</b></font></h1>
        <div class="friendType">
        	<ul>
        		<c:forEach var="row" items="${relations}">
        			<li style="float:left;margin-right:20px;"><input type="button" class="fritype" value="${row.type}"></li>
        		</c:forEach>
        	</ul>
        	<br/><br/>
        	<div style="margin-left:0px;width:700px;color:#e6e6e6"><hr/></div>
        	<ul style="line-height:30px;">
        		<c:forEach var="user" items="${friends.list}">
        			<li>
        				<div>
        					<div>
        						<img src="${user.user.avatar}" style="width:50px;height:50px;">
        					</div>
        					<div style="margin-top:-80px;margin-left:60px;">
        						<h3><a href="../user/getUser.do?id=${user.user.id}"><font size="2.5px">${user.user.name}</font></a></h3>
        						<p style="margin-top:-25px;"><font size="2.5px">${user.user.signature}</font></p>
        					</div>
        					<div style="margin-left:600px;margin-top:-70px;">
        						<p style="font-size:13px;color:#999999">${user.relation.type}</p>
        					</div>
        					<div style="margin-left:600px;margin-top:-15px;">
        						<input type="checkbox" name="id" value="${user.user.id}">
        					</div>
        				</div>
        				<hr style="margin-left:-20px;margin-top:5px;;width:650px;color:#e6e6e6"/>
        			</li>
        		</c:forEach>
        	</ul>
        	<div style="margin-left:470px;margin-top:20px;">
        		<input type="button" value="删除好友" class="mf-btn" onclick="deleteFriend(${friends.pageNum},'${sessionScope.user.id}')">&nbsp;&nbsp;&nbsp;
        		<input type="button" value="移入黑名单" class="mf-btn" onclick="addBlackList(${friends.pageNum},'${sessionScope.user.id}')">
        	</div>
        	<div class="foot" style="margin-top:-30px;margin-left:40px;">
        		<a href="../relation/getMyFriends.do?pn=1">首页</a>
        		<c:if test="${friends.hasPreviousPage}">
       	 			<a href="../relation/getMyFriends.do?pn=${friends.pageNum-1}">上一页</a>
    			</c:if>
    			<c:if test="${friends.hasNextPage}">
        		<a href="../relation/getMyFriends.do?pn=${friends.pageNum+1}">下一页</a>
        		</c:if>
        		<a href="../relation/getMyFriends.do?pn=${friends.lastPage}">尾页</a>
        	</div>
      	</div>
      </div>
    </div>
  	<div class="myfriend-asize" style="margin-left:1000px;margin-top:210px;">
         	<p><a class="items" href="../user/getBlackList.do">>管理黑名单</a></p>
  	</div>
  </body>
</html>