/**
 * 发送豆邮功能
 * @param relation
 * @param uid
 * @param ubyid
 * @returns
 */
function send(relation,uid,ubyid){
	if(relation=='2'){
		alert("用户已被拉入黑名单，无法发送豆邮");
		return;
	}
	var text = $("#doumail").val();
	if(text == ""){
		alert("请输入要发送的内容");
	}
	$.ajax({
		url:"http://localhost:8080/douban/privateletter/sendPrivateletter.do",
		type:"post",
		data:JSON.stringify({"userId":uid,"userById":ubyid,"info":text}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		beforeSend:function(){
			$("#sendmail").val("发送中");
		},
		success:function(msg){
			if(msg.code == 200){
				alert(msg.msg);
				window.location.reload();
			}
			if(msg.code == 400){
				alert(msg.msg);
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