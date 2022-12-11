/**
 * 
 */


function formValidate() {
	//form 에서 this 를 통해 전달한 DOM 과 동일하다.
	var frm = document.signUpFrm;
	//var frm = document.forms[0];

	//아이디 입력 값이 있는 지 검증
	if ("" == frm.userId.value) {
		alert("아이디를 입력해주세요");
		frm.userId.focus();
		return false;
	}
	if (frm.dupChkbox.checked == false) {
		alert("중복확인을 해주세요");
		frm.userId.focus();
		return false;
	}
	//이름 확인
	if ("" == frm.name.value) {
		alert("이름을 입력해주세요");
		frm.name.focus();
		return false;
	}
	//패스워드 입력 및 일치여부 확인
	if ("" == frm.pass1.value) {
		alert("비밀번호를 입력해주세요");
		frm.pass1.focus();
		return false;
	}

	if ("" == frm.pass2.value) {
		alert("비밀번호를 확인해주세요");
		frm.pass2.focus();
		return false;
	}

	if (frm.pass1.value != frm.pass2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		frm.pass1.value = "";
		frm.pass2.value = "";
		return false;
	}
	/*
	  if ("" == frm.email1.value) {
		alert("이메일을 확인해주세요");
		frm.email1.focus();
		return false;
	  }
	
	  if ("" == frm.email2.value) {
		alert("이메일 도메인을 선택해주세요");
		frm.email_domain.focus();
		return false;
	  }
	*/
	if (!confirm("입력하신 내용으로 가입하시겠습니까?")) {
		return false;
	}
	
	frm.submit();
}

function chngEmailDomain(domain) {
	//alert("이메일도메인변경");
	var email2 = document.getElementById("email2");
	if ("write" != domain) {
		email2.value = domain;
		email2.readOnly = true;
	} else {
		email2.value = "";
		email2.readOnly = false;
	}
}

function commonFocusMove(thisObj, numLength, nextObj) {
	var obj2 = document.getElementById(thisObj);
	var strLen2 = obj2.value.length;

	// console.log(count2, numLength);
	if (strLen2 == numLength) {
		document.getElementById(nextObj).focus();
	}
}

function idCheck(fn) {
	if (fn.userId.value == "") {
		alert("아이디를 입력하고 중복확인 체크해주세요");
		fn.userId.focus();
	} else {
		fn.userId.readOnly = true;
		window.open(
			"../member/IdDupChk.jsp?userId=" + fn.userId.value,
			"idover",
			"width=600,height=400"
		);
	}
}
