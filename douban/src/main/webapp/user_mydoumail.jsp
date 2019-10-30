<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-我的豆邮</title>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="./js/doumail.js"></script>
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
                  <div><input id="searchtext" size="22" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
                  <div style="float:right;margin-top:-30px;margin-right:211.5px;"><input type="button" onclick="search()" value="" style="border:0px;width:30px;height:30px;background:url(/hon/image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;" /></div>
            </div>
      </div>
    </div>
	<div class="mydoumail-mid" style="height:auto;dispaly:table;">
		<div class="content">
			<h1><font style="font-family:'Microsoft Yahei';font-size:26px"><b>我的豆邮</b></font></h1>
			<hr style="width:700px;"/>
			<div class="doumaillist">
				<sql:query dataSource="${snapshot}" var="result">
					SELECT user_id,user_name,user_pic FROM USER where user_id in (select user_byid from privateletter where user_id = ?) OR user_id IN (SELECT user_id FROM privateletter WHERE user_byid = ?);
					<sql:param value="${sessionScope.user.id}"/>
					<sql:param value="${sessionScope.user.id}"/>
				</sql:query>
				<c:forEach var="row" items="${result.rows}">
        			<c:set var="username" value="${row.user_name}" scope="request" /> 
        			<li>
        				<div style="margin-left:20px;">
        					<div>
        						<img src="${row.user_pic}" style="width:50px;height:50px;">
        					</div>
        					<div style="margin-top:-65px;margin-left:60px;">
        						<p style="font-size:15px;">${row.user_name}</p>
        					</div>
        					<div>
        						<sql:query dataSource="${snapshot}" var="privateletter">
									SELECT privateletter_info,privateletter_time FROM privateletter WHERE user_id IN (?,?) AND user_byid IN(?,?) ORDER BY privateletter_time DESC LIMIT 0,1;
									<sql:param value="${sessionScope.user.id}"/>
									<sql:param value="${row.user_id}"/>
									<sql:param value="${sessionScope.user.id}"/>
									<sql:param value="${row.user_id}"/>
								</sql:query>
								<c:forEach var="clm" items="${privateletter.rows}">
									<div style="margin-left:60px;margin-top:-13px"><a href="user_doumail.jsp?uid=${sessionScope.user.id}&ubyid=${row.user_id}&name=${row.user_name}" class="items" style="color:#3377aa;font-size:13px;">${clm.privateletter_info}</a></div>
        							<div style="margin-top:-56px;margin-left:550px;"><p style="font-size:13px;color:#999999"><fmt:formatDate pattern="yyyy-MM-dd" value="${clm.privateletter_time}" /></p></div>
        						</c:forEach>
        					</div>
        				</div>
        				<hr style="margin-left:20px;margin-top:40px;;width:650px;color:#e6e6e6"/>
        			</li>
        		</c:forEach>
			</div>
		</div>
	</div>
	<div class="mydoumail-asize" style="float:left">
        <div style="margin-left:350px;margin-top:150px;">
         	<p><a class="items" href="user_blacklist.jsp">>管理黑名单</a></p>
         	<p><a class="items" href="PageServlet?page=1&method=mf">>去我的好友列表</a></p>
        </div>
    </div>
</body>
</html>