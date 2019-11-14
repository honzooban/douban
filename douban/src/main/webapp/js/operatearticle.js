/**
 * 搜索功能
 * @returns
 */
function search(){
	var message = document.getElementById('searchtext').value;
	window.location.href="../search/getSearchResult.do?message="+message;
}

/**
 * 删除文章(物理删除)功能
 * @param aid
 * @returns
 */
function delArticle(aid){
	$.ajax({
		url:"http://localhost:8080/douban/article/deleteArticle.do",
		type:"post",
		data:JSON.stringify({"id":aid}),
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
 * 置顶文章功能
 * @param aid
 * @returns
 */
function topArticle(aid){
	$.ajax({
		url:"http://localhost:8080/douban/article/topArticle.do",
		type:"post",
		data:JSON.stringify({"id":aid}),
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
 * 取消置顶文章功能
 * @param aid
 * @returns
 */
function delTop(aid){
	$.ajax({
		url:"http://localhost:8080/douban/article/cancelTop.do",
		type:"post",
		data:JSON.stringify({"id":aid}),
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