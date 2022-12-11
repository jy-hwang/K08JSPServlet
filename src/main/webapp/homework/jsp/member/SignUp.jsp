<%@page import="homework.boardFree.BoardFreeDTO"%>
<%@page import="homework.boardFree.BoardFreeDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<%@ include file ="../inc/Header_inc.jsp" %> 
<script src="../../js/member/SignUp.js"></script>        
</head>
<body>
	<div class="container">
		<div class="row">
			<!-- 상단 네비게이션 바 인클루드 -->
			<%@ include file="../inc/Top.jsp"%>
		</div>
		<div class="row">
			<!-- 좌측 네비게이션 바 인클루드 -->
			<%@ include file="../inc/Left.jsp"%>
			 <div class="col-9 pt-3">
			<h3>회원가입</h3>
			<fieldset>
				<form action="../member/SignUpProcess.jsp" name="signUpFrm" method="POST">
					<div class="mb-3 row">
						<label for="loginId" class="col-sm-2 col-form-label">아이디</label>
							<div class="col-sm">
								<div class="row">
									<div class="col-sm-4"><input type="text" class="form-control" name="userId"
										placeholder="아이디를입력하세요" /></div>
									<div class="col-sm-4"><button type="button" class="btn btn-dark" name="dupIdChk"
										onclick="idCheck(this.form);">중복확인</button></div>
									<div class="col-sm-4"><input type="checkbox" name="dupChkbox" style="display:none;"></div>
								</div>
							</div>
						</div>
					<div class="mb-3 row">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
								<div class="col-sm-4"><input type="text" class="form-control" name="name"
									placeholder="이름을입력하세요" /></div>
					</div>
					<div class="mb-3 row">
						<label for="pass1" class="col-sm-2 col-form-label">비밀번호입력</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" name="pass1"
								placeholder="비밀번호를입력하세요" />
						</div>
					</div>
					<div class="mb-3 row">
						<label for="pass2" class="col-sm-2 col-form-label">비밀번호확인</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" name="pass2"
								placeholder="비밀번호를다시입력하세요" />
						</div>
					</div>
					<div class="mb-3 row">
						<label for="email" class="col-sm-2 col-form-label">이메일</label>
						<div class="col-sm-8">
							<div class="row">
								<div class="col-sm-4 ms-0"><input type="text" name="email1" value="" class="form-control" /></div>
								<div class="col-sm-1"><strong>＠</strong></div>
								<div class="col-sm-4"><input type="text" id="email2" name="email2" value="" class="form-control" readonly /></div>
								<div class="col-sm-3">
									<select name="email_domain" id="email_domain" onchange="javascript:chngEmailDomain(this.value);" class="form-select">
										<option value="">-- 선택 --</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="write" selected>직접입력</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="container my-3">
					<div class="col-md-12 text-center">
							<button class="btn btn-warning" type="button" onclick="return formValidate();">회원가입</button>
						</div>
					</div>
				</form>
			</fieldset>
		</div>
		</div>
		<div
			class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<div class="row mb-5 mt-3">
			<!-- 하단 footer 인클루드 -->
			<%@ include file="../inc/Bottom.jsp"%>
		</div>
	</div>
</body>