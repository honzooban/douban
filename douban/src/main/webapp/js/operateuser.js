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
		url:"http://localhost:8080/douban/user/banUser.do",
		type:"post",
		data:JSON.stringify({"id":uid,"time":day}),
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

function del(rid){
	$.ajax({
		url:"http://localhost:8080/douban/report/deleteReport.do",
		type:"post",
		data:{"rid":rid},
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

function deblocking(uid){
	$.ajax({
		url:"http://localhost:8080/douban/user/cancelBanUser.do",
		type:"post",
		data:JSON.stringify({"id":uid}),
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