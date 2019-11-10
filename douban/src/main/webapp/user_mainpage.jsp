<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>豆瓣-首页</title>
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript" src="../js/mainpage.js"></script>
</head>
<body>
    <div>
    <div id="homepage-top">
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
              </table>
            </div>
            <div class="line-search">
              <form action="search" method="get">
                  <div><input id="searchtext" size="22" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
                  <div style="float:right;margin-top:-30px;margin-right:194.5px;"><input type="button" onclick="search()" style="border:0px;width:30px;height:30px;background:url(../image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;" /></div>
              </form>
            </div>
      </div>
    </div>
    <div style="margin-top:20px;margin-left:500px;"><a href="../article/getArticles.do?pn=1">文章专区</a><a style="margin-left:200px;" href="../transpond/getTransponds.do?pn=1">转发专区</a></div>
    <div id="mainpage-mid" style="margin-top:-450px;margin-left:-30px;width:1000px;">
		<div id="content" style="margin-top:500px">
			<c:forEach var="item" items="${article.list}">
					<div style="margin-top:-180px">
						<div>
							<div style="margin-left:200px;margin-top:200px"><img src="${item.user.avatar}" style="width:60px;height:60px;" /></div>
							<div style="margin-left:200px">${item.user.name}</div>
						</div>
						<div style="width:1000px;">
							<div style="margin-left:270px;margin-top:-85px;"><a id="wrap" href="../article/getArticle.do?id=${item.article.id}">${item.article.title}</a></div>
							<div style="margin-left:890px;margin-top:-20px;"><font color="#777777">类型：${item.article.type}</font></div>
                                <div style="margin-left:270px;margin-top:15px;">${item.article.content}</div>
						</div>
						<div style="margin-left:820px;margin-top:20px;">
							<input type="button" style="border:0px;background-color:#ffffff" onclick="agreeArticle('${sessionScope.user.id}',${item.article.id},${item.article.agreementNum})" value="赞(${item.article.agreementNum})">
							<input type="button" style="border:0px;background-color:#ffffff" value="评论(${item.article.commentNum})" onclick="comment('${sessionScope.user.id}','com${item.article.id}')">
							<input type="button" style="border:0px;background-color:#ffffff" value="转发(${item.article.transpondNum})" onclick="transpond('${sessionScope.user.id}','tran${item.article.id}')">
							<div id="com${item.article.id}" style="margin-left:-270px;margin-top:15px;display:none;"><input type="text" id="cc${item.article.id}" style="width:400px;"><input type="button" value="评论" id="submitComment" onclick="commentSubmit('${sessionScope.user.id}',${item.article.id},'cc${item.article.id}')"></div>
							<div id="tran${item.article.id}" style="margin-left:-270px;margin-top:15px;display:none;"><input type="text" id="tc${item.article.id}" style="width:400px;"><input type="button" value="转发" id="submitTranspond" onclick="transpondSubmit('${sessionScope.user.id}',${item.article.id},'tc${item.article.id}')"></div>
						</div>
						<hr style="margin-left:195px;margin-top:20px;width:800px"/>
					</div>
			</c:forEach>
			<c:forEach var="transpond" items="${transpond.list}">
				<div style="margin-top:-180px">
					<div style="margin-left:200px;">
						<div style="margin-top:200px"><img src="${transpond.user.avatar}" style="width:60px;height:60px;" /></div>
						<div style=""><a href="../user_userpage.jsp?id=${transpond.user.id}">${transpond.user.name}</a></div>
						<div style="margin-left:80px;margin-top:-90px;"><font style="size:12px;color:#777777">转发说：</font>${transpond.transpond.info}</div>
						<div style="background-color:#f9f9f9;width:700px;margin-left:80px;">
							<div><a href="user_userpage.jsp?id=${transpond.articleUser.id}">${transpond.articleUser.name}</a></div>
							<div style="margin-top:5px;"><a href="../article/getArticle.do?id=${transpond.article.id}">${transpond.article.title}</a></div>
							<div style="margin-top:5px;width:700px;height:100px;overflow-y:auto"><font style="size:6px;color:#777777">${transpond.article.content}</font></div>
						</div>
						<div style="margin-top:10px;"><font style="size:12px;color:#777777">${transpond.transpond.time}</font></div>
						<div style="margin-left:650px;margin-top:-25px;">
							<c:if test="${transpond.user.id == sessionScope.user.id}"><input type="button" value="删除" onclick="deleteTranspond(${transpond.transpond.id})" style="width:50px;border:0px;background-color:#ffffff">&nbsp;&nbsp;</c:if>
							<input type="button" value="赞(${transpond.transpond.agreementNum})" onclick="agreeTranspond('${sessionScope.user.id}',${transpond.transpond.id},${transpond.transpond.agreementNum})" style="width:50px;border:0px;background-color:#ffffff;">
						</div>
					</div>
					<hr style="margin-left:195px;margin-top:20px;width:800px"/>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="foot" style="margin-top:30px;margin-left:540px;">
        <c:if test="${transpond == null}">
        	<a href="../article/getArticles.do?pn=1">首页</a>
        	<c:if test="${article.hasPreviousPage == true}">
       	 		<a href="../article/getArticles.do?pn=${article.pageNum-1}">上一页</a>
    		</c:if>
    		<c:if test="${article.hasNextPage == true}">
        		<a href="../article/getArticles.do?pn=${article.pageNum+1}">下一页</a>
        	</c:if>
        	<a href="../article/getArticles.do?pn=${article.lastPage}">尾页</a>
        </c:if>
        <c:if test="${article == null}">
        	<a href="../transpond/getTransponds.do?pn=1">首页</a>
        		<c:if test="${transpond.hasPreviousPage == true}">
       	 			<a href="../transpond/getTransponds.do?pn=${transpond.pageNum-1}">上一页</a>
    			</c:if>
    			<c:if test="${transpond.hasNextPage == true}">
        			<a href="../transpond/getTransponds.do?pn=${transpond.pageNum+1}">下一页</a>
        		</c:if>
        		<a href="../transpond/getTransponds.do?pn=${transpond.lastPage}">尾页</a>
        </c:if>
    </div><br><br>
    <div id="mainpage-asize" style="position:fixed;left:1100px;top:50px;width:300px">
			<c:if test="${sessionScope.user.id!=null}">
				<div style="background-color:#fff6ed;margin-top:60px">
                    <div style="margin-left:10px;"><img src="${userInfo.avatar}" style="width:60px;height:60px"></div>
                    <div style="margin-left:80px;margin-top:-60px;font-size:25px;">${userInfo.name}</div>
                    <div style="margin-left:80px;margin-top:10px;"><a href="./homepage.do">个人中心</a></div>
				</div>
			</c:if>
			<c:if test="${sessionScope.user.id==null}">
				<div style="background-color:#fff6ed;width:180px;margin-top:120px;">
					<a href="../user_login.jsp">还未登陆，点击前往登录</a>
				</div>
			</c:if>
		</div>
		</div>
</body>
</html>