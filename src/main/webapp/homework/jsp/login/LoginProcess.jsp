<%@page import="utils.JSFunction"%>
<%@page import="homework.member.MemberFreeDTO"%>
<%@page import="homework.member.MemberFreeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberFreeDAO dao = new MemberFreeDAO(application);
	
	String userId = request.getParameter("loginId");
	String userPw = request.getParameter("loginPw");
	
	//System.out.println("userId , userPw : "+userId + " , " + userPw);
	
	MemberFreeDTO dto = dao.getMemberDTO(userId, userPw);
	
	dao.close();
	
	if(dto.getId() != null){
	
	    session.setAttribute("UserId", dto.getId());
	    session.setAttribute("UserName", dto.getName());
	    
	    response.sendRedirect("../board/BoardList.jsp");
	}else{
	    JSFunction.alertBack("로그인에 실패하였습니다.",out);
	    /* request.setAttribute("LoginErrMsg", "로그인오류입니다.");
	    
	    request.getRequestDispatcher("../login/login.jsp").forward(request,response);
	 */
	 }

%>