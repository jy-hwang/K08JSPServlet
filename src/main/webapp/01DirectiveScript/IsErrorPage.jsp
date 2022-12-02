<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isErrorPage = "true"
	%>
<!DOCTYPE html>
<html>
<head>
<!-- 

 -->
<meta charset="UTF-8">
<title>page 지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
<h2>서비스 중 일시적인 오류가 발생했습니다.</h2>
<h4>서버 관리자 <a href="">abc@abc.com</a> 에게 문의해주세요..</h4>
<p>  
오류명 : <%= exception.getClass().getName()  %> <br/>
오류메시지 : <%= exception.getMessage() %>
</p>
<h6></h6>
	<img src="../images/Error.jpg" alt="We're Sorry">
</body>
</html>