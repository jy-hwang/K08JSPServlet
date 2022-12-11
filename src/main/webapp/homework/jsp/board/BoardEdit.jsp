<%@page import="utils.JSFunction"%>
<%@page import="homework.boardFree.BoardFreeDTO"%>
<%@page import="homework.boardFree.BoardFreeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정페이지로 진입시 로그인을 확인한다. --> 
<%@ include file="../login/IsLoggedIn.jsp"%>  

<%
String num = request.getParameter("num");

BoardFreeDAO dao = new BoardFreeDAO(application);
BoardFreeDTO boardOne = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();
if(!sessionId.equals(boardOne.getId())){
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}

dao.close();


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <%@ include file ="../inc/Header_inc.jsp" %>    
   <script src="../../js/board/BoardEdit.js"></script>     
</head>
<body>
<div class="container">
    <div class="row">
        <%@ include file ="../inc/Top.jsp" %>        
    </div>
    <div class="row">
        <%@ include file ="../inc/Left.jsp" %>        
        <div class="col-9 pt-3">
            <h3>게시판 수정 - <small>자유게시판</small></h3>

         <form name="editFrm" id="editForm" method="post" action="BoardEditProcess.jsp">
<input type="hidden" name="num" value="<%= num %>" />  
             <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성자</th>
                        <td>
                            <input type="text" class="form-control" 
                                style="width:150px;" value="<%= session.getAttribute("UserName") %>" readonly />
                        </td>
                    </tr>
                    
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td>
                            <input type="text" name="title" class="form-control" value ="<%= boardOne.getTitle() %> " />
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">내용</th>
                        <td>
                            <textarea rows="5" name="content" class="form-control"><%=boardOne.getContent() %></textarea>
                        </td>
                    </tr>
<!--                     <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">첨부파일</th>
                        <td>
                            <input type="file" class="form-control" />
                        </td>
                    </tr>
     -->        
        </tbody>
                </table>
					<div class="container my-3">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-danger"
								onclick="return validateFrm();">수정하기</button>
							<button type="button" class="btn btn-dark" onclick="resetForm();">다시쓰기</button>
							<button type="button" class="btn btn-warning"
								onclick="location.href='BoardList.jsp'">리스트보기</button>
						</div>
					</div>
				</form>
        </div>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div class="row mb-5 mt-3">
         <%@ include file ="../inc/Bottom.jsp" %>        
    </div>
</div>
</body>
</html>