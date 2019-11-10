/**
 * 文章点赞功能
 * @param uid
 * @param aid
 * @param num
 * @returns
 */
function agreeArticle(uid,id){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="../user_login.jsp";
		return;
	}
	$.ajax({
		url:"http://localhost:8080/douban/agree/agreeArticle.do",
		type:"post",
		data:JSON.stringify({"articleId":id}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		success:function(msg){
			if(msg.code == 200){
				window.location.reload();
				return;
			}
			if(msg.code == 400){
				alert(msg.msg);
				window.location.reload();
				return;
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
		window.location.href="../user_login.jsp";
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
		window.location.href="../user_login.jsp";
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
function commentSubmit(uid,aid){
	var comment = $("#commentInfo").val();
	$.ajax({
		url:"http://localhost:8080/douban/comment/commentArticle.do",
		type:"post",
		data:JSON.stringify({"articleId":aid,"info":comment}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		success:function(msg){
			if(msg.code == 200){
				alert(msg.msg);
				window.location.reload();
				return;
			}
			if(msg.code == 400){
				alert(msg.msg);
				return;
			}
			if(msg.code == 404){
				alert(msg.msg);
				return;
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
function transpondSubmit(uid,aid){
	var content = $("#transpondInfo").val();
	$.ajax({
		url:"http://localhost:8080/douban/transpond/transpondArticle.do",
		type:"post",
		data:JSON.stringify({"articleId":aid,"info":content}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		success:function(msg){
			if(msg.code == 200){
				alert(msg.msg);
				window.location.reload();
				return;
			}
			if(msg.code == 400){
				alert(msg.msg);
				return;
			}
			if(msg.code == 404){
				alert(msg.msg);
				return;
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
		url:"http://localhost:8080/douban/article/deleteArticle.do",
		type:"post",
		data:JSON.stringify({"id":aid}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		success:function(msg){
			if(msg.code == 200){
				alert(msg.msg);
				window.location.href = "../article/getArticles.do";
				return;
			}
			if(msg.code == 400){
				alert(msg.msg);
				return;
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
		window.location.href="../login.jsp";
		return;
	}
	$.ajax({
		url:"http://localhost:8080/douban/collection/collectArticle.do",
		type:"post",
		data:JSON.stringify({"articleId":aid}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		success:function(msg){
			if(msg.code == 200){
				alert(msg.msg);
				window.location.reload();
				return;
			}
			if(msg.code == 400){
				alert(msg.msg);
				return;
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
		url:"http://localhost:8080/douban/agree/agreeComment.do",
		type:"post",
		data:JSON.stringify({"commentId":cid}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		success:function(msg){
			if(msg.code == 200){
				alert(msg.msg);
				window.location.reload();
				return;
			}
			if(msg.code == 400){
				alert(msg.msg);
				return;
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

