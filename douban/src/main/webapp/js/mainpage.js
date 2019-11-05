/**
 * 文章点赞功能
 * @param aid
 * @param num
 * @returns
 */
function agreeArticle(uid,aid,num){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
	$.ajax({
		url:"http://localhost:8080/douban/agree/agreeArticle.do",
		type:"post",
		data:JSON.stringify({"articleId":aid}),
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
 * 点赞转发功能
 * @param uid
 * @param tid
 * @param num
 * @param field
 * @returns
 */
function agreeTranspond(uid,tid,num){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
	$.ajax({
		url:"http://localhost:8080/douban/agree/agreeTranspond.do",
		type:"post",
		data:JSON.stringify({"transpondId":tid}),
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
 * @param flag
 * @returns
 */
function comment(uid,flag){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
	if (document.getElementById(flag).style.display=='none'){
		document.getElementById(flag).style.display='block';
	}else{
		document.getElementById(flag).style.display='none'; 
	}
}

/**
 * 单击转发显示文本框
 * @param flag
 * @returns
 */
function transpond(uid,flag){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
	if (document.getElementById(flag).style.display=='none'){
		document.getElementById(flag).style.display='block';
	}else{
		document.getElementById(flag).style.display='none'; 
	}
}

/**
 * 发表评论功能
 * @param num
 * @param aid
 * @param flag
 * @returns
 */
function commentSubmit(uid,aid,flag){
	var comment = document.getElementById(flag).value;
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
 * @param num
 * @param aid
 * @param flag
 * @returns
 */
function transpondSubmit(uid,aid,flag){
	var content = document.getElementById(flag).value;
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

function deleteTranspond(tid){
	$.ajax({
		url:"http://localhost:8080/douban/transpond/deleteTranspond.do",
		type:"post",
		data:JSON.stringify({"id":tid}),
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
 * 搜索功能
 * @returns
 */
function search(){
	var message = document.getElementById('searchtext').value;
	window.location.href="PageServlet?message="+message+"&method=search";
}