<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>豆瓣-个人信息</title>
<link rel="stylesheet" type="text/css" href="./css/homepage.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="./js/userinfo.js"></script>
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
                  <div ><input id="searchtext" size="22" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
                  <div style="float:right;margin-top:-30px;margin-right:211.5px;"><input type="button" onclick="search()" value="" style="border:0px;width:30px;height:30px;background:url(/hon/image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;"></div>
            </div>
      </div>
    </div>
    <div id="userinfopage" class="userinfopage">
      <div class="userinfo" style="position:absolute;">
        <div class="userpic" style="position:absolute;">
          <div style="margin-left:20px;margin-top:40px;">
            <sql:query dataSource="${snapshot}" var="result">
   				select user_pic,user_sex,user_signature from user where user_id = ?;
   				<sql:param value="${sessionScope.user.id}" />
			</sql:query>
			<c:forEach var="row" items="${result.rows}">
				<c:set var="pic" value="${row.user_pic}"/>
				<c:set var="username" value="${sessionScope.user.name}"/>
				<c:set var="sex" value="${row.user_sex}"/>
				<c:set var="email" value="${sessionScope.user.email}"/>
				<c:set var="signature" value="${row.user_signature}"/>
			</c:forEach>
            <img src="${pic}" id="imgPreview">
            <form id="ui">
                  <input type="file" id="img" name="img" class="upload">
                  <table class="info-tab">
                    <tr>
                      <td><font class="font-info">用户ID：</font></td><td><input type="text" id="uid" value="${sessionScope.user.id}" disabled="true"></td>
                    </tr>
                    <tr>
                      <td><font class="font-info">用户名：</font></td><td><input type="text" id="username" value="${username}" disabled="true"></td>
                    </tr>
                    <tr>
                      <td><font class="font-info">性别：</font></td><td><select id="sex" style="width:50px;height:20px;"><c:if test="${sex == '男'}"><option>男</option><option>女</option><option>保密</option></c:if><c:if test="${sex == '女'}"><option>女</option><option>男</option><option>保密</option></c:if><c:if test="${sex == '保密'}"><option>保密</option><option>男</option><option>女</option></c:if><c:if test="${sex == null}"><option>男</option><option>女</option><option>保密</option></c:if></select></td>
                    </tr>
                    <tr>
                      <td><font class="font-info">邮箱：</font></td><td><input type="text" id="email" value="${email}" disabled="true"></td>
                    </tr>
                    <tr>
                      <td><font class="font-info">个性签名：</font></td><td><textarea id="signature" rows="2" cols="20" maxlength="80" placeholder="写下你的个性签名吧(最多80字)" style="resize: none;width:155px;height:50px;">${signature}</textarea></td>
                    </tr>
                    <tr>
                      <td><input type="button" value="确认修改" class="submitpic" id="submitpic" style="margin-left:180px;"></td>
                    </tr>
                  </table>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>