function show(flag){
	if (document.getElementById(flag).style.display=='none'){
		document.getElementById(flag).style.display='block';
	}else{
		document.getElementById(flag).style.display='none'; 
	}
}

function ban(uid){
	var day = document.getElementById(uid).value;
	$.ajax({
		url:"http://localhost:8080/hon/AdminServlet?method=ban",
		type:"post",
		data:{"uid":uid,"day":day},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("封禁成功");
				window.location.reload();
			}else{
				alert("封禁失败");
				window.location.reload();
			}
		}
	});
}

function del(rid){
	$.ajax({
		url:"http://localhost:8080/hon/AdminServlet?method=del",
		type:"post",
		data:{"rid":rid},
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

function deblocking(uid){
	$.ajax({
		url:"http://localhost:8080/hon/AdminServlet?method=dbk",
		type:"post",
		data:{"uid":uid},
		async: true,
		success:function(msg){
			if(msg=="true"){
				alert("解封成功");
				window.location.reload();
			}else{
				alert("解封失败");
				window.location.reload();
			}
		}
	});
}