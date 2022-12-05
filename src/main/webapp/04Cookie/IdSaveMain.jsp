<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String loginId = CookieManager.readCookie(request, "loginId");

String cookieCheck = "";
if (!loginId.equals("")) {
	cookieCheck = "checked";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie - 아이디 저장하기</title>
</head>
<body>
	<form action="IdSaveProcess.jsp" method="post">
		<fieldset>
			<label for="user_id">아이디 : </label>
			<input type="text" name="user_id" value="<%=loginId%>" tabindex="1">
			<input type="checkbox" name="save_check" value="Y" <%=cookieCheck%>  tabindex="3">
			<label for="save_check">아이디 저장하기</label>
			<br>
			<label for="user_pw">비밀번호 : </label>
			<input type="password" name="user_pw" tabindex="2">
			<br>
			<input type="submit" value="로그인하기" />
		</fieldset>
	</form>
</body>
</html>