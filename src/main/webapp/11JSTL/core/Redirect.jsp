<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - redirect</title>
</head>
<body>
<c:set var="requestVar" value="MustHave" scope="request"/>
<c:redirect url="/11JSTL/inc/OtherPage.jsp">
<c:param name="user_param1" value="출판사"/>
<c:param name="user_param2" value="골든래빗"/>
</c:redirect>


<h4>JSP 내장 객체를 통한 페이지 이동</h4>
<%--
String p1 = URLEncoder.encode("더조은");
String p2 = URLEncoder.encode("종각지점");

response.sendRedirect(request.getContextPath() + "/11JSTL/inc/OtherPage.jsp?user_param1="+p1+"&user_param2="+p2);


--%>
</body>
</html>