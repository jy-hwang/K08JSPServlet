<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>4. 쿠키값 확인하기</h2>
<%
Cookie[] cookies = request.getCookies();

if(null != cookies ){
	for(int i = 0 ; i<cookies.length;i++){
		String cookieName = cookies[i].getName();
		String cookieValue = cookies[i].getValue();
		out.println(String.format("쿠키 명 : %s - 쿠키값 :  %s<br/>",cookieName,cookieValue));	
	
	
	}
}
%>
</body>
</html>