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
		url:"http://localhost:8080/hon/UserServlet?method=sendmail",
		type:"post",
		data:{"uid":uid,"byid":ubyid,"text":text},
		async: true,
		beforeSend:function(){
			$("#sendmail").val("发送中");
		},
		success:function(msg){
			if(msg=="true"){
				alert("发送成功");
				window.location.reload();
			}else{
				alert("发送失败");
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