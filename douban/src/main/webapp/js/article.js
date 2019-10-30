/**
 * 文章点赞功能
 * @param uid
 * @param aid
 * @param num
 * @returns
 */
function agreeArticle(uid,id,num){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
	$.ajax({
		url:"http://localhost:8080/douban/UserServlet?method=agree",
		type:"post",
		data:{"uid":uid,"id":id,"num":num,"field":"article"},
		async: true,
		success:function(msg){
			if(msg=="true"){
				window.location.reload();
			}else{
				alert("你已点赞过了，请勿重复点赞");
				window.location.reload();
			}
		}
	});
}

/**
 * 单击评论显示文本框
 * @param uid
 * @returns
 */
function comment(uid){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
	if (document.getElementById('com').style.display=='none'){
		document.getElementById('com').style.display='block';
	}else{
		document.getElementById('com').style.display='none'; 
	}
}

/**
 * 单击转发显示文本框
 * @param uid
 * @returns
 */
function transpond(uid){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
	if (document.getElementById('tran').style.display=='none'){
		document.getElementById('tran').style.display='block';
	}else{
		document.getElementById('tran').style.display='none'; 
	}
}

/**
 * 文章评论功能
 * @param uid
 * @param num
 * @param aid
 * @returns
 */
function commentSubmit(uid,num,aid){
	var comment = $("#commentInfo").val();
	$.ajax({
		url:"http://localhost:8080/hon/UserServlet?method=comment",
		type:"post",
		data:{"uid":uid,"aid":aid,"comment":comment,"num":num},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("评论成功");
				window.location.reload();
			}else{
				alert("评论失败");
				window.location.reload();
			}
		}
	});
}

/**
 * 转发文章功能
 * @param uid
 * @param num
 * @param aid
 * @returns
 */
function transpondSubmit(uid,num,aid){
	var content = $("#transpondInfo").val();
	$.ajax({
		url:"http://localhost:8080/hon/UserServlet?method=transpond",
		type:"post",
		data:{"uid":uid,"aid":aid,"num":num,"content":content},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("转发成功");
				window.location.reload();
			}else{
				alert("转发失败");
				window.location.reload();
			}
		}
	});
}

/**
 * 删除文章(物理删除)功能
 * @param aid
 * @returns
 */
function deleteArticle(aid){
	$.ajax({
		url:"http://localhost:8080/hon/UserServlet?method=delarticle",
		type:"post",
		data:{"aid":aid},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("删除成功");
				window.location.href="http://localhost:8080/hon/PageServlet?page=1&method=mp";
			}else{
				alert("删除失败");
				window.location.reload();
			}
		}
	});
}

/**
 * 收藏文章功能
 * @param uid
 * @param aid
 * @returns
 */
function collect(uid,aid){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="login.jsp";
		return;
	}
	$.ajax({
		url:"http://localhost:8080/hon/UserServlet?method=collection",
		type:"post",
		data:{"uid":uid,"aid":aid},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("收藏成功");
			}else{
				alert("你已收藏该文章，请勿重复收藏");
			}
		}
	});
}

/**
 * 评论点赞功能
 * @param uid
 * @param id
 * @param num
 * @param field
 * @returns
 */
function agreeComment(uid,cid,num){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
	$.ajax({
		url:"http://localhost:8080/hon/UserServlet?method=agree",
		type:"post",
		data:{"uid":uid,"id":cid,"num":num,"field":"comment"},
		async: true,
		success:function(msg){
			if(msg=="true"){
				window.location.reload();
			}else{
				alert("你已点赞过了，请勿重复点赞");
				window.location.reload();
			}
		}
	});
}

/**
 * 搜索功能
 * @returns
 */
function search(){
	var message = document.getElementById('searchtext').value;
	window.location.href="PageServlet?message="+message+"&method=search";
}