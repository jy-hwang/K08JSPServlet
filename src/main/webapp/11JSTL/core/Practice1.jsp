<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h4>연습문제01</h4>
	<!-- 
	연습문제] 아래 모양을 출력하시오. 단 JSTL의 forEach문과 if문을 
	활용하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1
	-->
<c:forEach begin ="1" end="5" var="i">
	<c:forEach begin ="1" end="5" var="j">
	<c:if test="${i eq j }" var="one">
	1
	</c:if>
	<c:if test="${not one }">
	0
	</c:if>
	
	</c:forEach>
<br>
</c:forEach>


<hr>
<c:forEach begin ="1" end="5" var="i">
	<c:forEach begin ="1" end="5" var="j">
	<c:if test="${(i + j) == 6 }" var="one">
	1
	</c:if>
	<c:if test="${not one }">
	0
	</c:if>
	
	</c:forEach>
<br>
</c:forEach>


<hr>
<c:forEach begin ="1" end="5" var="i">
	<c:forEach begin ="1" end="5" var="j">
	<c:if test="${(i + j) % 2 == 0 }" var="one">
	1
	</c:if>
	<c:if test="${not one }">
	0
	</c:if>
	
	</c:forEach>
<br>
</c:forEach>


<hr>
<c:forEach begin ="1" end="5" var="i">
	<c:forEach begin ="1" end="5" var="j">
	<c:if test="${(i + j) % 2 ne 0 }" var="one">
	1
	</c:if>
	<c:if test="${not one }">
	0
	</c:if>
	
	</c:forEach>
<br>
</c:forEach>


<hr>
<c:forEach begin ="1" end="5" var="i">
	<c:forEach begin ="1" end="5" var="j">
	<c:if test="${i <= j}" var="one">
	1
	</c:if>
	<c:if test="${not one }">
	0
	</c:if>
	
	</c:forEach>
<br>
</c:forEach>


<hr>
<c:forEach begin ="1" end="5" var="i">
	<c:forEach begin ="1" end="5" var="j">
	<c:if test="${(i - j) >= 0}" var="one">
	1
	</c:if>
	<c:if test="${not one }">
	0
	</c:if>
	
	</c:forEach>
<br>
</c:forEach>
</body>
</html>