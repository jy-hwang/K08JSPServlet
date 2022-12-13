<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
     <%
     
     
     
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - if</title>
</head>

<body>
<h4>연습문제 : if 태그</h4>
<!--  아이디 패스워드를 입력후 submit 을 누르면 EL식을 통해 파라미터를 받은후
tjoeun / 1234 인 경우에는 "tjoeun 님 하이룽~ " 이라고 출력한다.
만약 틀렸다면 "아이디/ 비번" 을 확인하세요 라고 출력한다.
EL과 JSTL 의 if 태그만을 이용해서 구현하시오.
  -->

<form action="" method="get">

아이디 : <input type="text" name="user"/><br>
비밀번호 : <input type="text" name="pass"/><br>
<input type="submit" /><br>

<!-- 
<c:if test="${ param.user eq '' or param.pass eq '' }" var="loginResult">
<h3></h3>
</c:if>
<c:if test="${ param.user eq 'tjoeun' and param.pass eq '1234' }" var="loginResult">
<h3>tjoeun 님 하이룽</h3>
</c:if>
<c:if test="${ not loginResult }">
<h3>아이디 / 비번을 확인하세요</h3>
</c:if>
 -->
 
 <c:if test="${ not empty param.user }">
 전송된 아이디  : ${param.user}<br>
 전송된 비밀번호 : ${param.user} <br>
 <c:if test="${param.user == 'tjoeun' and param.pass =='1234' }" var ="loginResult">
<h3>${param.user}님 하이룽</h3> 
 </c:if>
 <c:if test="${ not loginResult }">
<h3>아이디 / 비번을 확인하세요</h3> 
 </c:if>
 </c:if>
</form>


</body>
</html>