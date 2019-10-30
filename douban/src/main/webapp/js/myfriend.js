/**
 * 删除好友功能
 * @returns
 */
function deleteFriend(page,uid){
	var userById = [];
	$("input[name='id']:checked").each(function(i){
	       userById[i] = $(this).val();
	});
	if(userById == ""){
		alert("请选择你要操作的对象");
		return;
	}
	$.ajax({
		url:"http://localhost:8080/hon/FriendServlet?method=deleteFriend",
		type:"post",
		data:{"userId":uid,"userById":userById},
		dataType:"text",
		traditional:true,
		success:function(msg){
			if(msg=="true"){
				alert("删除好友成功");
				window.location.href="PageServlet?page="+page+"&method=mf";
			}else{
				alert("删除好友失败");
				window.location.href="PageServlet?page="+page+"&method=mf";
			}
		}
	})
}

/**
 * 移进黑名单功能
 * @param page
 * @param uid
 * @returns
 */
function addBlackList(page,uid){
	var userById = [];
	$("input[name='id']:checked").each(function(i){
	    userById[i] = $(this).val();
	});
	$.ajax({
		url:"http://localhost:8080/hon/FriendServlet?method=addBlackList",
		type:"post",
		data:{"userId":uid,"userById":userById},
		dataType:"text",
		traditional:true,
		success:function(msg){
			if(msg=="true"){
				alert("移入黑名单成功");
				window.location.href="PageServlet?page="+page+"&method=mf";
			}else{
				alert("移入黑名单失败");
				window.location.href="PageServlet?page="+page+"&method=mf";
			}
		}
	})
}

/**
 * 搜索功能
 * @returns
 */
function search(){
	var message = document.getElementById('searchtext').value;
	window.location.href="PageServlet?message="+message+"&method=search";
}