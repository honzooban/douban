<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>豆瓣</title>
  <link rel="stylesheet" type="text/css" href="../css/homepage.css">
  <script src="../js/jquery-3.4.0.min.js"></script>
  <script type="text/javascript" src="../js/homepage.js"></script>
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
      </table>
    </div>
    <div class="line-search">
      <form action="search" method="get">
        <div><input id="searchtext" size="22" style="width:278px;height:28px;border:0px;margin-top:19px;" maxlength="60" autocomplete="off" value="" placeholder="搜索你感兴趣的内容和人..."></div>
        <div style="float:right;margin-top:-30px;margin-right:194.5px;"><input type="button" onclick="search()" style="border:0px;width:30px;height:30px;background:url(../image/search.png);background-color:#ffffff;background-size:100%;background-repeat:no-repeat;" /></div>
      </form>
    </div>
  </div>
  <div id="homepage-mid" style="height:auto;dispaly:table;">
        <div class="mid-main" style="position: absolute;">
          <div class="user-profile" style="position:absolute;">
            <div class="pic" style="position:absolute;margin-top:50px;margin-left:20px;">
              <img src="${userInfo.avatar}" width="50px;" height="50px;">
            </div>
            <div class="signature" style="position:absolute;margin-top:20px;margin-left:82px;">
              <h1>${userInfo.name}</h1>
              <div class="sign" style="position:absolute;margin-top:-36px;">
                <p style="color:#777777;white-space:nowrap;">${userInfo.signature}</p>
              </div>
            </div>
            <div class="userinfo" style="margin-top:120px;margin-left:80px;">
              <a class="items" href="./updateInfo.do" style="text-decoration:none;color:#5488c4;white-space:nowrap;"><font style="font-family:'SimHei';font-size:14px;">个人信息</font></a>
            </div>
            <div class="exit" style="margin-top:-19px;margin-left:170px;">
              <a class="items" onclick="exit()" style="text-decoration:none;color:#5488c4;white-space:nowrap;"><font style="font-family:'SimHei';font-size:14px;">退出系统</font></a>
            </div>
          </div>
          <div class="user-article" style="position:absolute;margin-top:200px;margin-left:20px">
            <p style="white-space:nowrap;color:#007722"><b>我的文章</b>&nbsp;&nbsp;&nbsp;&nbsp;·&nbsp; ·&nbsp; · &nbsp;·&nbsp; ·&nbsp; ·&nbsp;<p>
            <div class="myarticle" style="margin-top:-35px;margin-left:170px;">
              <a href="user_myarticle.jsp?id=${userInfo.id}" class="items" style="color:#666699">全部</a>
            </div>
            <div class="write" style="margin-left:500px;margin-top:-19px;background-color:#fcf7f3; border:1px solid #f3e7e0">
              <a href="../article/publishArticlePage.do" style="color:#777777">+写文章&nbsp;</a>
            </div>
            <div>
              <p style="font-size:13px;margin-left:1px;white-space:nowrap;">在豆瓣上写文章，记录自己的生活、想法。</p>
            </div>
          </div>
          <div class="user-collection" style="position:absolute;margin-top:350px;margin-left:20px">
            <p style="white-space:nowrap;color:#007722"><b>我的收藏</b>&nbsp;&nbsp;&nbsp;&nbsp;·&nbsp; ·&nbsp; · &nbsp;·&nbsp; ·&nbsp; ·&nbsp;<p>
            <div class="mycollection" style="margin-top:-36px;margin-left:170px;">
              <a href="user_mycollection.jsp?id=${userInfo.id}" class="items" style="color:#666699">全部</a>
            </div>
            <div>
              <p style="font-size:13px;margin-left:1px;white-space:nowrap;">收藏文章，让精彩的文章存留在你的记忆中。</p>
            </div>
          </div>
        </div>
  </div>
  <div id="homepage-right">
    <div id="myfriend" style="margin-left:1000px;margin-top:-30px;">
      <div style="position:absolute;margin-top:200px;margin-left:20px">
        <p style="white-space:nowrap;color:#007722"><b>我的好友</b>&nbsp;&nbsp;&nbsp;&nbsp;·&nbsp; ·&nbsp; · &nbsp;·&nbsp; ·&nbsp; ·&nbsp;<p>
        <div style="margin-top:-35px;margin-left:170px;">
          <a href="../relation/getMyFriends.do?pn=1" class="items" style="color:#666699">全部</a>
        </div>
        <div class="friend" style="position: absolute;width:350px;margin-left:-30px;">
          <c:forEach var="friend" items="${friends}">
              <dl class="friobj" style="float:left;margin-left:30px;">
                  <dt><img src="${friend.avatar}" style="width:50px;height:50px;"></dt>
                  <dd style="float:left;width:30px;display:inline-block;margin:0px;">${friend.name}</dd>
              </dl>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
