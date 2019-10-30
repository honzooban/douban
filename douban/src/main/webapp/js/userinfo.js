/**
 * 头像预览
 * @returns
 */
$(document).ready(function(){
	document.getElementById('img').onchange = function() {
	    var imgFile = this.files[0];
	    var fr = new FileReader();
	    fr.onload = function() {
	        document.getElementById('imgPreview').src = fr.result;
	    };
	    fr.readAsDataURL(imgFile);
		};
});

/**
 * 提交个人信息
 * @returns
 */
$(document).ready(function(){
	$("#submitpic").click(function(){
		var form = new FormData(document.getElementById("ui"));
		form.append("uid",$("#uid").val());
		form.append("sex",$("#sex").val());
		form.append("signature",$("#signature").val());
		$.ajax({
			url:"http://localhost:8080/hon/UpLoadServlet?method=user",
			type:"post",
			data: form,
            processData: false,
            contentType: false,
            success: function(msg) {
                if(msg="true"){
                	alert("修改成功");
                	window.location.href="user_homepage.jsp";
                }else{
                	alert("修改失败");
                }
            },
            error: function(e) {
                console.log(e);
            }
		});
	});
});
