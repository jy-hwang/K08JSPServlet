<%@page import="homework.boardFree.BoardFreeDAO"%>
<%@page import="homework.boardFree.BoardFreeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../login/IsLoggedIn.jsp" %>


<%
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardFreeDTO boardOne = new BoardFreeDTO();
boardOne.setNum(num);
boardOne.setTitle(title);
boardOne.setContent(content);


BoardFreeDAO dao = new BoardFreeDAO(application);
System.out.println(boardOne.getNum() + " " + boardOne.getTitle() + " " + boardOne.getContent());
int affected = dao.updateEdit(boardOne);

dao.close();

if(affected == 1){
	response.sendRedirect("boardView.jsp?num="+boardOne.getNum());
}else{
	JSFunction.alertBack("수정하기에 실패하였습니다.",out);
}



%>