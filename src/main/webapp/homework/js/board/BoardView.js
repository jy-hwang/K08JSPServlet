/**
 * 
 */

function deletePost() {
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if (confirmed) {
		var form = document.viewFrm;
		form.method = "post";
		form.action = "../../jsp/board/BoardDeleteProcess.jsp";
		form.submit();
	}
}    