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
		url:"http://localhost:8080/hon/UserServlet?method=agree",
		type:"post",
		data:{"uid":uid,"id":aid,"num":num,"field":"article"},
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
		url:"http://localhost:8080/hon/UserServlet?method=agree",
		type:"post",
		data:{"uid":uid,"id":tid,"num":num,"field":"transpond"},
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
function commentSubmit(uid,num,aid,flag){
	var comment = document.getElementById(flag).value;
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
 * @param num
 * @param aid
 * @param flag
 * @returns
 */
function transpondSubmit(uid,num,aid,flag){
	var content = document.getElementById(flag).value;
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

function deleteTranspond(tid){
	$.ajax({
		url:"http://localhost:8080/hon/UserServlet?method=deltranspond",
		type:"post",
		data:{"tid":tid},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("删除成功");
				window.location.reload();
			}else{
				alert("删除失败");
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