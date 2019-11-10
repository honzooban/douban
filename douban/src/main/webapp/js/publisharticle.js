/**
 * 发表文章和编辑文章功能
 * @param uid
 * @param aid
 * @returns
 */
function publishArticle(id){
	var form = new FormData(document.getElementById("article"));
	form.append("title",$("#title").val());
	form.append("content",$("#content").html());
	form.append("type",$("#classes option:selected").val());
	form.append("id",id);
	$.ajax({
		url:"http://localhost:8080/douban/article/publishArticle.do",
		type:"post",
		data: form,
		cache: false,
		processData: false,
		contentType: false,
	    beforeSend:function(){
			$("#publish").val("发布中");
		},
		success: function(msg) {
			if(msg.code == 200){
				alert(msg.msg);
				window.location.href="../article/getArticles.do";
			}
			if(msg.code == 400){
				alert(msg.msg);
			}
		}
	});
}