<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    BoardDAO dao = new BoardDAO(application);
    
    Map<String, Object> param = new HashMap<String,Object>();
    
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");
    
 	String b_id = request.getParameter("b_id");
    
    if(searchWord != null){
    	param.put("searchField", searchField);
    	param.put("searchWord", searchWord);
    }
    param.put("b_id", b_id);
    int totalCount = dao.selectCount(param);
    List<BoardDTO> boardLists = dao.selectList(param);
    dao.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="../Common/Link.jsp" />  
<%
if(b_id.equals("10")){

%>
    <h2>b_id = 10 자유게시판 목록 보기(List)</h2>

<%
}else{

%>
<h2>b_id = 20 공지사항 목록 보기(List)</h2>

<%

}
%>

    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="hidden" name="b_id" value="10">
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="40%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="10%">추천수</th>
            <th width="15%">작성일</th>
        </tr>
<%
if (boardLists.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
    int virtualNum = 0; 
    for (BoardDTO dto : boardLists)
    {
        virtualNum = totalCount--;   
%>
        <tr align="center">
            <td><%= virtualNum %></td>  
            <td align="left"> 
                <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
            </td>
            <td align="center"><%= dto.getId() %></td>           
            <td align="center"><%= dto.getVisitcount() %></td>   
            <td align="center"><%= dto.getReccount() %></td>
            <td align="center"><%= dto.getPostdate() %></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>

</body>
</html>