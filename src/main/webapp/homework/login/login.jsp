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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<!-- 상단 네비게이션 바 인클루드 -->
			<%@ include file="../inc/top.jsp"%>
		</div>
		<div class="row">
			<!-- 좌측 네비게이션 바 인클루드 -->
			<%@ include file="../inc/left.jsp"%>
			 <div class="col-9 pt-3">
			<h3>로그인</h3>
			<fieldset style="border: 1px solid black">
				<form action="../login/loginProcess.jsp">
					<div class="mb-3 row">
						<label for="loginId" class="col-sm-2 col-form-label">아이디</label>
						<div class="col-sm-5">
							<input type="text" class="form-control-plaintext" name="loginId"
								placeholder="아이디를입력하세요" />
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" name="loginPw"
								placeholder="비밀번호를를입력하세요" />
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-5">
							<button class="btn btn-warning" type="submit">로그인</button>
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
			<%@ include file="../inc/bottom.jsp"%>
		</div>
	</div>
</body>