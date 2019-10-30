<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
	<title>豆瓣-写文章</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/publishArticle.css">
	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="./js/publisharticle.js"></script>
</head>
<body>
	<div id="main" align="center">
		<form id="article">
			<div id="article-title">
				<span><textarea tabindex="1" maxlength="50" placeholder="添加标题" rows="1" id="title">${param.title}</textarea></span>
			</div>
			<br/><hr style="width:630px;color:#eeeeee"/>
			<div id="article-content">
				<ul id="content-util">
					<li id="Strik"><img src="./image/icon/b.png" style="width:30px;height:30px;" alt="加粗" /></li>
					<li id="Italic"><img src="./image/icon/ic.png" style="width:30px;height:30px;" alt="斜体" /></li>
					<li id="Underline"><img src="./image/icon/ul.png" style="width:30px;height:30px;" alt="下划线" /></li>
					<li id="StrikeThrough"><img src="./image/icon/dl.png" style="width:30px;height:30px;" alt="中划线" /></li>
					<li><img src="./image/icon/pic.png" style="width:30px;height:30px;" alt="添加图片" ><input type="file" id="Img" name="Img" multiple="multiple"/></li>
				</ul>
				<!--<span><textarea placeholder="写文章..." id="content"></textarea></span>-->
				<div id="content" contenteditable="true" data-text="写文章..." >${param.content}</div>
			</div><br/>
			<span>分类：<select id="classes"><option>影视</option><option>人文</option><option>情感</option><option>体育</option><option>科技</option><option>音乐</option><option>游戏</option><option>生活</option><option>旅行</option></select></span>
			<span><input type="button" onclick="publishArticle('${sessionScope.user.id}','${param.aid}')" id="publish" value="发布文章"></span>
		</form>
	</div>
</body>
<script type="text/javascript">
	function getStyle(dom){
		//获取光标位置的元素
		var tagName = dom.prop("tagName");
		if(tagName != "DIV"){
			if(tagName=="I"){
				$("#Italic>img").attr("src","./image/icon/ic@.png")
			}else if(tagName=="B"){
				$("#Strik>img").attr("src","./image/icon/b@.png")
			}else if(tagName=="U"){
				$("#Underline>img").attr("src","./image/icon/ul@.png")
			}else if(tagName=="STRIKE"){
				$("#StrikeThrough>img").attr("src","./image/icon/dl@.png")
			}
			getStyle(dom.parent());
		}
	}
	
	$("#content").click(function(e){
        // 设置最后光标对象
        var dom = $(getSelection().getRangeAt(0).endContainer.parentElement);
        clearStyle();
		//dom = $(e.target)
		getStyle(dom)
	})
	
	function clearStyle(){
		//重置所有样式
		$("#Strik>img").attr("src","./image/icon/b.png")
		$("#Italic>img").attr("src","./image/icon/ic.png")
		$("#Underline>img").attr("src","./image/icon/ul.png")
		$("#StrikeThrough>img").attr("src","./image/icon/dl.png")
	}
	$("#content").focus();
	
	$("#Strik").click(function() {
		document.execCommand("bold", false, null);
		//document.getElementById('content').style.fontWeight = 'bold';
		if($("#Strik>img").attr("src") == "./image/icon/b.png"){
			$("#Strik>img").attr("src","./image/icon/b@.png")
		}else{
			$("#Strik>img").attr("src","./image/icon/b.png")
		}
		$("#content").focus();
	});
	$("#Italic").click(function() {
		//斜体
		document.execCommand('italic',true,null)
		if($("#Italic>img").attr("src") == "./image/icon/ic.png"){
			$("#Italic>img").attr("src","./image/icon/ic@.png")
		}else{
			$("#Italic>img").attr("src","./image/icon/ic.png")
		}
		$("#content").focus();
	})
	
	$("#Underline").click(function(){
		//下划线
		document.execCommand('underline',true,null)
		if($("#Underline>img").attr("src") == "./image/icon/ul.png"){
			$("#Underline>img").attr("src","./image/icon/ul@.png")
		}else{
			$("#Underline>img").attr("src","./image/icon/ul.png")
		}
		$("#content").focus();
	})
	
	$("#StrikeThrough").click(function(){
		//删除线
		document.execCommand('strikeThrough',true,null)
		if($("#StrikeThrough>img").attr("src") == "./image/icon/dl.png"){
			$("#StrikeThrough>img").attr("src","./image/icon/dl@.png")
		}else{
			$("#StrikeThrough>img").attr("src","./image/icon/dl.png")
		}
		$("#content").focus();
	})

	</script>
</html>