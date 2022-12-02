<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - out</title>
</head>
<body>

<%
out.print("가나다라");
out.clearBuffer();

out.print("<h2>out 내장 객체</h2>");
out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>");
//버퍼에 저장된 내용을 플러시(출력) 한다.
out.flush();
//버퍼의 모든내용이 출력되었으므로 크기는 원상복구된다.
out.print("flush 후 버퍼의 크기 : " +  out.getRemaining() + "<br> ");


out.println(1);
out.println(false);
out.print('가');
out.print('가');


%>
</body>
</html>