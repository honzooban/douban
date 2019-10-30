/**
 * 登录验证
 * @returns
 */
function login(uid){
	var username = $("#username").val();
	var password = $("#password").val();
	var code = $("#code").val();
	if(username == ""){
		alert("用户名不能为空");
		$("#username").focus();
		return;
	}
	if(password == ""){
		alert("密码不能为空");
		$("#password").focus();
		return;
	}
	if(code == ""){
		alert("验证码不能为空");
		$("#code").focus();
		return;
	}
	if(uid==username){
		alert("你已经登录过该账号");
		return;
	}
	$.ajax({
		url:"http://localhost:8080/douban/LoginServlet?obj=0",
		type:"post",
		data:{"username":username,"password":password,"code":code},
		async: true,
		beforeSend:function(){
			$("#login").val("登陆中");
		},
		success:function(msg){
			if(msg=="false"){
				$("#username").val("");
				$("#password").val("");
				alert("账号或密码有误，请重新输入");
				$("#login").val("登录");
			}
			if(msg=="codefalse"){
				$("#code").val("");
				alert("验证码有误，请重新输入");
				$("#login").val("登录");
			}
			if(msg=="banned"){
				alert("该账号正处于封禁状态，请联系管理员解封");
				window.location.reload();
			}
			if(msg=="user"){
				alert("登录成功，欢迎你的使用");
				window.location.href="user_homepage.jsp";
			}
		}
	});
}

/**
 * 验证码刷新
 */
window.onload = function () {
    var img = document.getElementById("checkCode");
    img.onclick = function () {
       var date = new Date().getTime();
       img.src = "CheckCodeServlet?"+date;
    }
};