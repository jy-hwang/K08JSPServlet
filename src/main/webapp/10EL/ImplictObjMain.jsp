<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("scopeValue", "페이지영역");
request.setAttribute("scopeValue", "리퀘스트영역");
session.setAttribute("scopeValue", "세션영역");
application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어( EL ) - 내장 객체(ImplictObject)</title>
</head>
<body>
	<h2>ImplictObjMain 페이지</h2>
	<h3>각 영역에 저장된 속성 읽기</h3>
	<ul>
		<li>페이지 영역 : ${ pageScope.scopeValue }</li>
		<li>리퀘스트 영역 : ${ requestScope.scopeValue }</li>
		<li>세션 영역 : ${ sessionScope.scopeValue }</li>
		<li>애플리케이션 영역 : ${ applicationScope.scopeValue }</li>

	</ul>

	<h3>영역지정 없이 속성 읽기</h3>
	<ul>
		<li>${ scopeValue }</li>
	</ul>
	<!--<jsp:forward page ="ImplictForwardResult.jsp"/>-->
	<!-- 
	앞의 Main 파일을 한번 실행하면 4가지 영역 전체에 속성값을 저장하므로 session, application 영역에도 저장된다.
	이 값들은 브라우저를 종료하거나  서버를 종료해야 소멸되는 영역이므로 해당 파일을 단독적으로 실행하더라도
	값이 출력된다. 이때 가장 좁은 영역은 session 이 된다.
	
	 -->
</body>
</html>