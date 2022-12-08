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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" />
  
</head>
<body>
<div class="container">
<jsp:include page="../Common/Link.jsp"/>
<h2>게시글 목록 조회 테스트(executeQuery() 사용)</h2>
    <table class="table table-hover table-bordered">
        <thead>
            <colgroup>
                <col style="width: 10%" />
                <col style="width: 20%" />
                <col style="width: 20%" />
                <col style="width: 10%" />
                <col style="width: 10%" />
                <col style="width: 10%" />
                <col style="width: 10%" />
            </colgroup>
            <tr class="text-center">
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>좋아요수</th>
            </tr>
        </thead>
        <tbody>
          
                            

<%
JDBConnect jdbc = new JDBConnect();

String sql = "select num,title,content,id,postdate,visitcount,likecount from board";

System.out.println(sql);
Statement stmt = jdbc.con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

//out.println(String.format("%s %s %s %s %s %s %s","글번호","제목","내용","글쓴이","글쓴날짜","조회수","좋아요수") + "<br>");
while(rs.next()){
	out.print("<tr>");
	
	String num  = rs.getString(1);
	String title  = rs.getString(2);
	String content  = rs.getString("content");
	String id  = rs.getString("id");
	java.sql.Date postdate = rs.getDate("postdate");
	String visitcount  = rs.getString("visitcount");
	String likecount  = rs.getString("likecount");
	
	out.print("<td>"+ num + "</td>");
	out.print("<td>"+ title + "</td>");
	out.print("<td>"+ content + "</td>");
	out.print("<td>"+ id + "</td>");
	out.print("<td>"+ postdate + "</td>");
	out.print("<td>"+ visitcount + "</td>");
	out.print("<td>"+ likecount + "</td>");

	out.print("</tr>");
}

jdbc.close();

%>
	</tbody>
  </table>
  </div>
  <div class="container">
	  <div class="d-grid gap-2 d-md-flex justify-content-center">
	     <button type="button" class="btn btn-primary">글쓰기</button>
	     <a href="../05JDBC/ExeQuery_Board_Lists.jsp" class="btn btn-warning" role="button">리스트보기</a>
	  </div>
  </div>
  
                  
</body>
</html>