<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-豆邮</title>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="./js/doumail.js"></script>
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
                  <td style="text-align:center;width:120px;"><a class="items" href="/hon/PageServlet?page=1&method=mp"><font style="color:#007722;">首页</font></a></td>
                  <td style="text-align:center;width:120px;"><a class="items" href="user_homepage.jsp"><font style="color:#007722;">我的豆瓣</font></a></td>
                  <td style="text-align:center;width:120px;"><a class="items" href="user_mydoumail.jsp"><font style="color:#007722;">我的豆邮</font></a></td>
                </tr>
              </table>
            </div>
            <div class="line-search">
                  <div><input id="searchtext" size="22" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
                  <div style="float:right;margin-top:-30px;margin-right:199.5px;"><input type="button" onclick="search()" value="" style="border:0px;width:30px;height:30px;background:url(/hon/image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;" /></div>
            </div>
      </div>
    </div>
	<div id="doumial-mid" style="margin-left:350px;margin-top:40px;">
		<sql:query dataSource="${snapshot}" var="result">
			SELECT user_name,user_pic,privateletter_info,privateletter_time FROM USER INNER JOIN privateletter ON user.`user_id` IN (?,?) AND privateletter.`user_byid` IN (?,?) AND privateletter.`user_id` = user.`user_id` ORDER BY privateletter.`privateletter_time`;
			<sql:param value="${param.uid}"/>
			<sql:param value="${param.ubyid}"/>
			<sql:param value="${param.uid}"/>
			<sql:param value="${param.ubyid}"/>
		</sql:query>
		<h2>与${param.name}的豆邮</h2>
		<div style="margin-top:-30px;overflow-y:auto;width:650px">
		<c:forEach var="row" items="${result.rows}">
        	<div style="margin-top:50px;">
        		<hr style="width:550px;margin-left:0px;margin-bottom:-10px;"/><br/>
        		<img src="${row.user_pic}" style="width:50px;height:50px;"><br/>
        		<div style="margin-top:-70px;margin-left:60px;"><p>${row.user_name}</p></div>
        		<div style="margin-top:-10px;margin-left:60px;"><p>${row.privateletter_info}</p></div>
        		<div style="margin-left:500px;margin-top:-70px;"><p><fmt:formatDate type="time" value="${row.privateletter_time}" /></p></div>
        	</div>
        </c:forEach>
        </div>
		<div style="margin-top:40px;">
			<textarea rows="10" cols="80" autocomplete="off" id="doumail" style="resize: none;width:550px;height:150px;"></textarea>
		</div>
		<sql:query dataSource="${snapshot}" var="result">
			select relation_status from relation where user_id in (?,?) and user_byid in (?,?);
			<sql:param value="${param.uid}" />
			<sql:param value="${param.ubyid}" />
			<sql:param value="${param.uid}" />
			<sql:param value="${param.ubyid}" />
		</sql:query>
		<c:forEach var="row" items="${result.rows}"><c:set var="relation" value="${row.relation_status}"/></c:forEach>
		<div style="margin-top:20px;margin-left:470px;">
			<input type="button" value="发送豆邮" onclick="send('${relation}',${param.uid},${param.ubyid})" id="sendmail" class="mf-btn" />
		</div>
	</div><br><br>
</body>
</html>