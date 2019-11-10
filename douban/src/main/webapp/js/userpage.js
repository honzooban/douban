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
		url:"http://localhost:8080/douban/relation/updateRelation.do",
		type:"post",
		data:JSON.stringify({"userId":uid,"userById":ubyid,"type":$("#typevalue").val()}),
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
				window.location.reload();
				return;
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
		url:"http://localhost:8080/douban/relation/addFriend.do",
		type:"post",
		data:JSON.stringify({"userId":uid,"userById":ubyid}),
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
                window.location.reload();
                return;
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
		window.location.href="../user_login.jsp";
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
		url:"http://localhost:8080/douban/report/reportUser.do",
		type:"post",
		data:JSON.stringify({"userId":uid,"userById":ubyid,"content":$("#reportContent").val()}),
        contentType:"application/json;charset=utf-8",
        dataType:"json",
        success:function(msg){
            if(msg.code == 200){
                alert(msg.msg);
                $("#reportContent").val("");
                return;
            }
            if(msg.code == 400){
                alert(msg.msg);
                return;
            }
        }
	});
}