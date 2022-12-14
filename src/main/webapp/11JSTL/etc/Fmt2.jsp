<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt2</title>
</head>

<body>

<c:set var="today" value="<%= new java.util.Date() %>" />

<h4>날짜 포맷</h4>
full : <fmt:formatDate value="${today }" type="date" dateStyle="full" />
<br>
short : <fmt:formatDate value="${today }" type="date" dateStyle="short" />
<br>
long : <fmt:formatDate value="${today }" type="date" dateStyle="long" />
<br>
default : <fmt:formatDate value="${today }" type="date" dateStyle="default" />
<hr>
<h4>시간 포맷 </h4>
full : <fmt:formatDate value="${today }" type="time" dateStyle="full" />
<br>
short : <fmt:formatDate value="${today }" type="time" dateStyle="short" />
<br>
long : <fmt:formatDate value="${today }" type="time" dateStyle="long" />
<br>
default : <fmt:formatDate value="${today }" type="time" dateStyle="default" />

<hr>
<h4>날짜/시간 표시</h4>
<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
<br>
<fmt:formatDate value="${today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>

<h4>타임존 설정</h4>

<fmt:timeZone value="GMT">
<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
<br>
</fmt:timeZone>

<fmt:timeZone value="America/Chicago">
<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
<br>
</fmt:timeZone>
<fmt:timeZone value="America/New_York">
<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
<br>
</fmt:timeZone>
<fmt:timeZone value="America/Los_Angeles">
<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
<br>
</fmt:timeZone>
<fmt:timeZone value="Asia/Seoul">
<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
<br>
</fmt:timeZone>
<fmt:timeZone value="Indian/Chagos">
<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
<br>
</fmt:timeZone>

<h4>timezone 에 사용할 수 있는 문자열 구하기</h4>
<c:forEach var ="ids" items="<%=java.util.TimeZone.getAvailableIDs() %>">
${ids }<br>
</c:forEach>
</body>
</html>