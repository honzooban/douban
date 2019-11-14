/**
 * 搜索功能
 * @returns
 */
function search(){
	var message = document.getElementById('searchtext').value;
	window.location.href="../search/getSearchResult.do?message="+message;
}

/**
 * 退出系统功能
 * @returns
 */
function exit(){
	if(confirm("您确定要关闭本页吗？")){
		sessionStorage.clear();
		window.location.href="user_login.jsp";
	}
}