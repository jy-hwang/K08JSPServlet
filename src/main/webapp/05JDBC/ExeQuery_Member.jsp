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
<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>


<%
JDBConnect jdbc = new JDBConnect();

String sql = "select id,pass,name,regidate,updtdate from member";

Statement stmt = jdbc.con.createStatement();

ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
	
	String id  = rs.getString(1);
	String pw  = rs.getString(2);
	String name  = rs.getString("name");
	java.sql.Date regidate = rs.getDate("regidate");
	java.sql.Date updtdate = rs.getDate("updtdate");
	
	out.println(String.format("%s %s %s %s %s",id,pw,name,regidate,updtdate) + "<br>");
	
}

jdbc.close();

%>
</body>
</html>