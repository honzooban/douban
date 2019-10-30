/**
 * 单击分组显示文本框
 * @returns
 */
function show(){
	if (document.getElementById('rt').style.display=='none'){
		document.getElementById('rt').style.display='block';
	}else{
		document.getElementById('rt').style.display='none'; 
	}
}

/**
 * 添加好友分组功能
 * @param uid
 * @param ubyid
 * @returns
 */
function addType(uid,ubyid){
	$.ajax({
		url:"http://localhost:8080/hon/FriendServlet?method=addRelationType",
		type:"post",
		data:{"userId":uid,"userById":ubyid,"type":$("#typevalue").val()},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("添加分组成功");
				window.location.reload();
			}else{
				alert("添加分组失败");
				window.location.reload();
			}
		}
	});
}

/**
 * 添加好友功能
 * @param uid
 * @param aid
 * @returns
 */
function addFriend(uid,ubyid){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
	$.ajax({
		url:"http://localhost:8080/hon/FriendServlet?method=addFriend",
		type:"post",
		data:{"userId":uid,"userById":ubyid},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("添加好友成功");
				window.location.reload();
			}else{
				alert("添加好友失败");
				window.location.reload();
			}
		}
	});
	
}

/**
 * 验证是否已登录
 * @returns
 */
function sendDouMail(){
	if(uid==""){
		alert("你目前暂未登录，请前往登录页面进行登录");
		window.location.href="user_login.jsp";
		return;
	}
}

/**
 * 单击举报好友显示文本框
 * @returns
 */
function report(){
	if (document.getElementById('reportdiv').style.display=='none'){
		document.getElementById('reportdiv').style.display='block';
	}else{
		document.getElementById('reportdiv').style.display='none'; 
	}
}

/**
 * 举报好友功能
 * @param uid
 * @param ubyid
 * @returns
 */
function sendReport(uid,ubyid){
	$.ajax({
		url:"http://localhost:8080/hon/UserServlet?method=report",
		type:"post",
		data:{"uid":uid,"ubyid":ubyid,"content":$("#reportContent").val()},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("举报内容已发送至管理员");
				window.location.reload();
			}else{
				alert("举报失败，请重新举报");
				window.location.reload();
			}
		}
	});
}