<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table class="mx-auto" border="1" width="95%"> 
    <tr>
        <td align="center">
        <!-- 로그인 여부에 따른 메뉴 변화 -->
        <% if (session.getAttribute("UserId") == null) { %>
            <a href="../06Session/LoginForm.jsp">로그인</a>
        <% } else { %>
            <a href="../06Session/Logout.jsp">로그아웃</a>
        <% } %>
            <!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
            &nbsp;&nbsp;&nbsp; 
             <a href="../08Board/List.jsp">게시판(페이징X)</a> 
<!--            <a href="../05JDBC/ExeQuery_Board_Lists.jsp">게시판(페이징X)</a> -->
            &nbsp;&nbsp;&nbsp; 
            <a href="../09BoardPaging/List.jsp">게시판(페이징O)</a>
            
            <a href="../08Board/List.jsp?b_id=10">자유게시판</a>
            <a href="../08Board/List.jsp?b_id=20">공지사항</a>
        </td>
    </tr>
</table>
