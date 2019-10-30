/**
 * 搜索功能
 * @returns
 */
function search(){
	var message = document.getElementById('searchtext').value;
	window.location.href="PageServlet?message="+message+"&method=search";
}