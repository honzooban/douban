/**
 * 搜索功能
 * @returns
 */
function search(){
	var message = document.getElementById('searchtext').value;
	window.location.href="PageServlet?message="+message+"&method=search";
}

/**
 * 删除文章(物理删除)功能
 * @param aid
 * @returns
 */
function delArticle(aid){
	$.ajax({
		url:"http://localhost:8080/hon/AdminServlet?method=delate",
		type:"post",
		data:{"aid":aid},
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
 * 置顶文章功能
 * @param aid
 * @returns
 */
function topArticle(aid){
	$.ajax({
		url:"http://localhost:8080/hon/AdminServlet?method=top",
		type:"post",
		data:{"aid":aid},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("置顶成功");
				window.location.reload();
			}else{
				alert("置顶失败");
				window.location.reload();
			}
		}
	});
}

/**
 * 取消置顶文章功能
 * @param aid
 * @returns
 */
function delTop(aid){
	$.ajax({
		url:"http://localhost:8080/hon/AdminServlet?method=deltop",
		type:"post",
		data:{"aid":aid},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("取消置顶成功");
				window.location.reload();
			}else{
				alert("取消置顶失败");
				window.location.reload();
			}
		}
	});
}