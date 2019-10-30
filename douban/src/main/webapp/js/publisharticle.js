/**
 * 发表文章和编辑文章功能
 * @param uid
 * @param aid
 * @returns
 */
function publishArticle(uid,aid){
	var form = new FormData(document.getElementById("article"));
	form.append("uid",uid);
	form.append("title",$("#title").val());
	form.append("content",$("#content").html());
	form.append("type",$("#classes option:selected").val())
	form.append("aid",aid)
	$.ajax({
		url:"http://localhost:8080/hon/UpLoadServlet?method=article",
		type:"post",
		data: form,
	    processData: false,
	    contentType: false,
	    beforeSend:function(){
			$("#publish").val("发布中");
		},
	    success: function(msg) {
	        if(msg="true"){
	            alert("发布成功");
	            window.location.href="http://localhost:8080/hon/PageServlet?page=1&method=mp";
	            }else{
	               alert("发布失败");
	            }
	        },
	    error: function(e) {
	        console.log(e);
	    }
	});
}