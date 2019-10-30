<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-用户管理</title>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="./js/operateuser.js"></script>
  </head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost/douban" user="root" password="123456"/>
	<div style="margin-left:30px;width:600px;">
		<h3>用户管理：</h3>
		<sql:query dataSource="${snapshot}" var="result">
   			select user_name,user_pic,report_id,report_content,report_time,report.user_byid from report inner join user on report.user_id in (select user_id from report) and user.user_id = report.user_id ORDER BY report_time DESC; 
   		</sql:query>
   		<c:forEach var="row" items="${result.rows}">
   			<div><img src="${row.user_pic}" style="width:40px;height:40px"></div>
   			<div><font style="size:16px;color:#777777">用户(${row.user_name})在${row.report_time}时发起了举报：</font></div>
   			<div><font style="size:16px;color:#777777">举报对象：UserId:${row.user_byid}</font></div>
   			<div><font style="size:16px;color:#777777">举报内容：${row.report_content}</font></div>
   			<div style="margin-top:10px;margin-left:210px;">
   				<sql:query dataSource="${snapshot}" var="time">
   					select user_bantime from user where user_id = ?;
   					<sql:param value="${row.user_byid}" />
   				</sql:query>
   				<c:forEach var="row1" items="${time.rows}">
   					<c:set var="time" value="${row1.user_bantime}"/>
   				</c:forEach>
   				<c:if test="${time!=''&&time!=null}">
   					<input type="button" value="封禁至${time}" id="ban${row.user_byid}" onclick="show('${row.report_time}')" style="border:1px solid #ca6445;background-color:#fbe9d9;width:auto;">
   					<input type="button" value="删除" onclick="del(${row.report_id})" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;">
   					<input type="button" value="解封" onclick="deblocking(${row.user_byid})" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;">
   				</c:if>
   				<c:if test="${time==''||time==null}">
   					<input type="button" value="封禁" id="ban${row.user_byid}" onclick="show('${row.report_time}')" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;">
   					<input type="button" value="删除" onclick="del(${row.report_id})" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;">
   				</c:if>
   			</div>
   			<div id="${row.report_time}" style="margin-left:400px;margin-top:7px;display:none"><font style="size:8px;color:#777777">封禁天数：</font><select id="${row.user_byid}"><option>3</option><option>5</option><option>7</option></select>&nbsp;&nbsp;<input type="button" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;" value="确认封禁" onclick="ban(${row.user_byid})"></div>
   			<div><hr style="width:600px;"/></div>
   		</c:forEach>
	</div>
</body>
</html>