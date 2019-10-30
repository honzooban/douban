/**
 * 移出黑名单功能
 * @returns
 */
function exitbl(uid){
	var userById = [];
	$("input[name='id']:checked").each(function(i){
        userById[i] = $(this).val();
  	});
	$.ajax({
		url:"http://localhost:8080/hon/FriendServlet?method=exitBlackList",
		type:"post",
		data:{"userId":uid,"userById":userById},
		dataType:"text",
		traditional:true,
		success:function(msg){
			if(msg=="true"){
				alert("移除黑名单成功");
				window.location.href="user_blacklist.jsp";
			}else{
				alert("移除黑名单失败");
				window.location.href="user_blacklist.jsp";
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