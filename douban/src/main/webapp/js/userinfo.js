/**
 * 搜索功能
 * @returns
 */
function search(){
	var message = document.getElementById('searchtext').value;
	window.location.href="../search/getSearchResult.do?message="+message;
}

/**
 * 头像预览
 * @returns
 */
$(document).ready(function(){
	document.getElementById('avatar').onchange = function() {
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
		form.append("id",$("#uid").val());
		form.append("gender",$("#sex").val());
		form.append("signature",$("#signature").val());
		$.ajax({
			url:"http://localhost:8080/douban/user/updateUser.do",
			type:"post",
			data: form,
			cache: false,
			processData: false,
			contentType: false,
            success: function(msg) {
                if(msg.code == 200){
                	alert(msg.msg);
                	window.location.href="./homepage.do";
                }
                if(msg.code == 400){
                	alert(msg.msg);
                }
            }
		});
	});
});
