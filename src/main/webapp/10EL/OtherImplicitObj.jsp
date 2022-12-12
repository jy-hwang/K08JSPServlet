<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
CookieManager.makeCookie(response,"ELCookie","EL좋아요",10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어( EL ) - 그 외 내장 객체(OtherImplictObject)</title>
</head>
<body>
	<h3>쿠키값 읽기</h3>
	<ul>
		<li>EL Cookie 값 : ${ cooke.ELCookie.value }</li>
	</ul>

	<h3>HTTP 헤더 읽기</h3>
	<ul>
		<li>host : ${ header.host }</li>
		<li>user-agent : ${ header['user-agent'] }</li>
		<li>cookie : ${ header.cookie }</li>
	</ul>
	
	<h3>컨텍스트 초기화 매개변수 읽기</h3>
	<ul>
	<li>OracleDriver : ${ iniParam.OracleDriver }</li>
	
	</ul>
	
	<h3>컨텍스트 루트 경로 읽기</h3>
	<ul>
	<li>${ pageContext.request.contextPath }</li>
	
	</ul>
</body>
</html>