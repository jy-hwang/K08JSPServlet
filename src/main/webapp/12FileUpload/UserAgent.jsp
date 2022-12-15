<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-Agent 확인하기</title>
</head>
<body>
<%

String client = request.getHeader("User-Agent");
out.println(client);
%>
<h2>DB에 등록된 파일 목록 보기</h2>
<a href="FileList.jsp">파일목록보기</a>
<a href="FileUploadMain.jsp">파일등록하기</a>


</body>
</html>