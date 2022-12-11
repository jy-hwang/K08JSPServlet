/**
 * 
 */

function validateFrm() {  // 폼 내용 검증
	form = document.getElementById("editForm");
	console.log(form);

	if (form.title.value == "") {
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if (form.content.value == "") {
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}

	form.submit();
}

function resetForm() {
	form = document.getElementById("editForm");

	var confirmed = confirm("다시쓰시겠어요?");

	if (confirmed) {
		form.title.value = "";
		form.content.value = "";

	}
}