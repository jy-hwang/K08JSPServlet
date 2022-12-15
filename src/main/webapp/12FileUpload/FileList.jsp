<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.MyFileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.MyFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUploadList</title>
</head>
<body>
<h2>DB에 등록된 파일 목록 보기</h2>
<a href="FileUploadMain.jsp">파일등록하기</a>


<%
MyFileDAO dao = new MyFileDAO();
List<MyFileDTO> fileLists = dao.myFileList();
dao.close();

%>

<table border="1">
<tr>
<th>NO</th>
<th>작성자</th>
<th>제목</th>
<th>카테고리</th>
<th>원본파일명</th>
<th>저장된파일명</th>
<th>작성일</th>


</tr>
<%

for(MyFileDTO f : fileLists){
%>
<tr>
<td><%= f.getIdx() %></td>
<td><%= f.getName() %></td>
<td>
<img src="../Uploads/<%= f.getSfile() %>" width="100px" height="100px">
<%= f.getTitle() %></td>
<td><%= f.getCate() %></td>
<td><%= f.getOfile() %></td>
<td><%= f.getSfile() %></td>
<td><%= f.getPostdate() %></td>
<td><a href="Download.jsp?oName=<%= URLEncoder.encode(f.getOfile(),"UTF-8")%>&sName=<%= URLEncoder.encode(f.getSfile(),"UTF-8")%> ">[다운로드]</a></td>


</tr>
<%	
}
%>

</table>


<h2>업로드 된 파일 리스트 보기(디렉토리 읽어오기)</h2>

<%

String dir = application.getRealPath("/Uploads");
File file = new File(dir);
File[] fileArr = file.listFiles();
int fileCnt = 1;
%>
<ul>
<%
for(File f : fileArr){
	
	%>
	
	<li>
	파일명<%=fileCnt %> : <%= f.getName() %>
	파일크기 : <%= (int)Math.ceil(f.length() / 1024.0) %> kb
	</li>
	
	
	<%
	
	fileCnt++;
}
%>


</ul>









</body>
</html>