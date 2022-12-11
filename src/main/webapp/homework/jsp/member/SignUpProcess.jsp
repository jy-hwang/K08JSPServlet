<%@page import="homework.member.MemberFreeDAO"%>
<%@page import="homework.member.MemberFreeDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("userId");
	String pw = request.getParameter("pass1");
	String name = request.getParameter("name");
	//String email = request.getParameter("email")
	MemberFreeDTO dto = new MemberFreeDTO();
	
	dto.setId(id);
	dto.setPass(pw);
	dto.setName(name);
	
	MemberFreeDAO dao = new MemberFreeDAO(application);
	int iResult = dao.insertMember(dto);
	dao.close();
	
	if(iResult == 1){
		session.setAttribute("UserId", id);
		session.setAttribute("UserName", name);
		response.sendRedirect("../board/BoardList.jsp");
	}else{
		JSFunction.alertBack("회원가입에 실패하였습니다.",out);
	}
	

%>