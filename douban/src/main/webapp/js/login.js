/**
 * 登录验证
 * @returns
 */
function login(){
	var phone = $("#phone").val();
	var password = $("#password").val();
	if(phone == ""){
		alert("手机号码不能为空");
		$("#phone").focus();
		return;
	}
	if(password == ""){
		alert("密码不能为空");
		$("#password").focus();
		return;
	}
	$.ajax({
		url:"http://localhost:8080/douban/user/login.do",
		type:"post",
		data:JSON.stringify({"phone":phone,"password":password}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		beforeSend:function(){
			$("#login").val("登陆中");
		},
		success:function(msg){
			if(msg.code == 400){
				$("#phone").val("");
				$("#password").val("");
				alert("账号或密码有误，请重新输入");
				$("#login").val("登录");
				return;
			}
			if(msg.code == 403){
				alert("该账号正处于封禁状态，请联系管理员解封");
				window.location.reload();
				return;
			}
			if(msg.code == 200){
				alert("登录成功，欢迎你的使用");
				window.location.href="user_homepage.jsp";
				return;
			}
		}
	});
}