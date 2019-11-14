<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-用户管理</title>
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript" src="../js/operateuser.js"></script>
  </head>
<body>
	<div style="margin-left:30px;width:600px;">
		<h3>用户管理：</h3>
   		<c:forEach var="row" items="${userAndReport.list}">
   			<div><img src="${row.user.avatar}" style="width:40px;height:40px"></div>
   			<div><font style="size:16px;color:#777777">用户(${row.user.name})在${row.report.time}时发起了举报：</font></div>
   			<div><font style="size:16px;color:#777777">举报对象：UserId:${row.report.userById}</font></div>
   			<div><font style="size:16px;color:#777777">举报内容：${row.report.content}</font></div>
   			<div style="margin-top:10px;margin-left:210px;">
				<c:set var="time" value="${row.user.banTime}"/>
   				<c:if test="${time!=''&&time!=null}">
   					<input type="button" value="封禁至${time}" id="ban${row.report.userById}" onclick="show('${row.report.time}')" style="border:1px solid #ca6445;background-color:#fbe9d9;width:auto;">
   					<input type="button" value="删除" onclick="del(${row.report.id})" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;">
   					<input type="button" value="解封" onclick="deblocking(${row.report.userById})" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;">
   				</c:if>
   				<c:if test="${time==''||time==null}">
   					<input type="button" value="封禁" id="ban${row.report.userById}" onclick="show('${row.report.time}')" style="border:1px solid #ca6445;background-color:#fbe9d9;width:70px;">
   					<input type="button" value="删除" onclick="del(${row.report.id})" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;">
   				</c:if>
   			</div>
   			<div id="${row.report.time}" style="margin-left:400px;margin-top:7px;display:none"><font style="size:8px;color:#777777">封禁天数：</font><select id="${row.report.userById}"><option>3</option><option>5</option><option>7</option></select>&nbsp;&nbsp;<input type="button" style="border:1px solid #4f946e;background-color:#eff7ed;width:70px;" value="确认封禁" onclick="ban(${row.report.userById})"></div>
   			<div><hr style="width:600px;"/></div>
   		</c:forEach>
	</div>
	<div class="foot" style="margin-top:30px;margin-left:60px;">
		<a href="../report/operateReport.do?pn=1">首页</a>
		<c:if test="${userAndReport.hasPreviousPage}">
			<a href="../report/operateReport.do?pn=${userAndReport.pageNum-1}">上一页</a>
		</c:if>
		<c:if test="${userAndReport.hasNextPage}">
			<a href="../report/operateReport.do?pn=${userAndReport.pageNum+1}">下一页</a>
		</c:if>
		<a href="../report/operateReport.do?pn=${userAndReport.lastPage}">尾页</a>
	</div><br><br>
</body>
</html>