<%@page import="utils.JSFunction"%>
<%@page import="homework.boardFree.BoardFreeDAO"%>
<%@page import="homework.boardFree.BoardFreeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardFreeDTO dto = new BoardFreeDTO();

dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());

BoardFreeDAO dao = new BoardFreeDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

if(iResult == 1){
	response.sendRedirect("../board/boardList.jsp");
}else{
	JSFunction.alertBack("글쓰기에 실패하였습니다.",out);
}


%>