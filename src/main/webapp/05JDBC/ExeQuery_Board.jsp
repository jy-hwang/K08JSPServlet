<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>게시글 목록 조회 테스트(executeQuery() 사용)</h2>


<%
JDBConnect jdbc = new JDBConnect();

String sql = "select num,title,content,id,postdate,visitcount,likecount from board";

System.out.println(sql);
Statement stmt = jdbc.con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

out.println(String.format("%s %s %s %s %s %s %s","글번호","제목","내용","글쓴이","글쓴날짜","조회수","좋아요수") + "<br>");
while(rs.next()){
	
	String num  = rs.getString(1);
	String title  = rs.getString(2);
	String content  = rs.getString("content");
	String id  = rs.getString("id");
	java.sql.Date postdate = rs.getDate("postdate");
	String visitcount  = rs.getString("visitcount");
	String likecount  = rs.getString("likecount");
	
	out.println(String.format("%s %s %s %s %s %s %s",num,title,content,id,postdate,visitcount,likecount) + "<br>");
	
}

jdbc.close();

%>
</body>
</html>