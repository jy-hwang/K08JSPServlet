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
			<h3>로그인</h3>
			<fieldset>
				<form action="../login/LoginProcess.jsp" method="POST">
					<div class="mb-3 row">
						<label for="loginId" class="col-sm-2 col-form-label">아이디</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="loginId"
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
					<div class="container my-3">
						<div class="col-md-12 text-center">
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
			<%@ include file="../inc/Bottom.jsp"%>
		</div>
	</div>
</body>