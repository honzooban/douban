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
		url:"http://localhost:8080/douban/relation/deleteFriend.do",
		type:"post",
		data:JSON.stringify({"id":uid,"byId":userById}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		traditional:true,
		success:function(msg){
			if(msg.code == 200){
				alert(msg.msg);
				window.location.href="../relation/getMyFriends.do?pn=1";
				return;
			}
			if(msg.code == 400){
				alert(msg.msg);
				window.location.href="../relation/getMyFriends.do?pn=1";
				return;
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
		url:"http://localhost:8080/douban/relation/blackListFriend.do",
		type:"post",
		data:JSON.stringify({"id":uid,"byId":userById}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		traditional:true,
		success:function(msg){
			if(msg.code == 200){
				alert(msg.msg);
				window.location.href="../relation/getMyFriends.do?pn=1";
				return;
			}
			if(msg.code == 400){
				alert(msg.msg);
				window.location.href="../relation/getMyFriends.do?pn=1";
				return;
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
	window.location.href="../search/getSearchResult.do?message="+message;
}