<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String num = request.getParameter("num");

BoardDAO dao  = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);

String userId = "";
if(session.getAttribute("UserId") != null){
	userId = session.getAttribute("UserId").toString();
}

System.out.println("userId : " + userId);
System.out.println("dto.getId() : " +dto.getId());
System.out.println(userId == dto.getId());
System.out.println(userId.equals(dto.getId()));
if(!userId.equals(dto.getId())){
	//dao.updateVisitCount(num);
}

dao.close();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;      
        form.method = "post"; 
        form.action = "DeleteProcess.jsp"; 
        form.submit();         
    }
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 상세 보기(View)</h2>
<form name="writeFrm">
<input type="hidden" name="num" value="<%= num %>" />  
    <table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%= dto.getNum() %></td>
            <td>작성자</td>
            <td><%= dto.getName() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%= dto.getPostdate() %><% if(dto.getUpdtdate() != null){
                        %><small>(최종수정일 : <%= dto.getUpdtdate() %>)</small>
                        <% } %></td>
            <td>조회수</td>
            <td><%= dto.getVisitcount() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%= dto.getTitle() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <!-- 엔터키로 처리된 부분을 <br>태그로 변경해야지만 줄바꿈되어 출력된다. -->
            <td colspan="3" height="100"><%= dto.getContent().replace("\r\n", "<br/>") %></td> 
        </tr>
        <tr>
            <td colspan="4" align="center">
<%
if(session.getAttribute("UserId") != null &&
   dto.getId().equals(session.getAttribute("UserId").toString())){
%>            
                <button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">
                    수정하기</button>
                <button type="button" onclick="deletePost();">삭제하기</button> 

<%
}

%>            
<%
if(session.getAttribute("UserId") != null &&
!dto.getId().equals(session.getAttribute("UserId").toString())){
%>

 				<button type="button" onclick="">추천하기</button>
<%
}
%>
                <button type="button" onclick="location.href='List.jsp';">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
