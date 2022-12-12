<%@page import="utils.BoardPageBoot"%>
<%@page import="homework.boardFree.BoardFreeDTO"%>
<%@page import="homework.boardFree.BoardFreeDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    BoardFreeDAO dao = new BoardFreeDAO(application);
    
 	Map<String, Object> param = new HashMap<String,Object>();
    
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");
    
    if(searchWord != null && searchField != null){
    	param.put("searchField", searchField);
    	param.put("searchWord", searchWord);
    }

    
    Map<String, Object> mapPaging = new HashMap<String,Object>();

    int totalCount = dao.selectCount(param);
 	/**페이징 코드 추가부분 s *******************************/
    
    int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
    int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
    int totalPage = (int)Math.ceil((double)totalCount / pageSize);
    
    int pageNum = 1;
    String pageTemp = request.getParameter("pageNum");
    
    if(pageTemp != null && !pageTemp.equals("")){
    	pageNum = Integer.parseInt(pageTemp);
    }
    
    int start = (pageNum -1 ) * pageSize + 1;
    int end = pageNum * pageSize;
    System.out.println("페이징 관련 변수 : " + " " + pageSize + " "+blockPage + " "+ totalPage + " " +start +" " + end);
    param.put("start",start);
    param.put("end",end);
    // totalCount, pageSize, blockPage, pageNum, request.getRequestURI()
    mapPaging.put("totalCount",totalCount);
    mapPaging.put("pageSize",pageSize);
    mapPaging.put("blockPage",blockPage);
    mapPaging.put("pageNum",pageNum);
    mapPaging.put("reqUrl",request.getRequestURI());
    /**페이징 코드 추가부분 e *******************************/
    
    List<BoardFreeDTO> boardLists = dao.selectListPage(param);
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
</head>
<body>
<div class="container">
    <div class="row">
    <!-- 상단 네비게이션 바 인클루드 -->
        <%@ include file ="../inc/Top.jsp" %>
    </div>
    <div class="row">
        <!-- 좌측 네비게이션 바 인클루드 -->
           <%@ include file ="../inc/Left.jsp" %>
        <div class="col-9 pt-3">
            <h3>게시판 목록 - <small>자유게시판</small></h3>

            <div class="row ">
                <!-- 검색부분 -->
                <form method="POST" action="">
                    <div class="input-group ms-auto" style="width: 400px;">
                        <select name="searchField" class="form-control">
                            <option value="title" <%= searchField != null && searchField.equals("title") ? "selected" : "" %> >제목</option>
                            <option value="content" <%= searchField != null && searchField.equals("content") ? "selected" : "" %>>내용</option>
                            <option value="id" <%= searchField != null && searchField.equals("id") ? "selected" : "" %>>작성자</option>
                        </select>
                        <input type="text" name="searchWord" class="form-control" style="width: 150px;" value ="<%= searchWord != null ? searchWord : "" %>"/>
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-secondary">
                                <i class="bi bi-search" style='font-size:20px'></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row mt-3 mx-1">
                <!-- 게시판리스트부분 -->
                <table class="table table-bordered table-hover table-striped">
                    <colgroup>
                        <col width="60px" />
                        <col width="*" />
                        <col width="120px" />
                        <col width="120px" />
                        <col width="80px" />
                        <col width="100px" />
                    </colgroup>
                    <thead>
                        <tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>좋아요수</th>
                        </tr>
                    </thead>
                    <tbody>
                    
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
						    for (BoardFreeDTO dto : boardLists)
						    {
						        virtualNum = totalCount--;   
						%>
						        <tr align="center">
						            <td><%= virtualNum %></td>  
						            <td align="left"> 
						                <a href="BoardView.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
						            </td>
						            <td align="center"><%= dto.getId() %></td>           
						            <td align="center"><%= dto.getPostdate() %></td>    
						            <td align="center"><%= dto.getVisitcount() %></td>   
						            <td align="center"><%= dto.getReccount() %></td>
						        </tr>
						<%
						    }
						}
						%>
                    </tbody>
                </table>
            </div>
				<div class="container my-3">
					<div class="col-md-12 text-center">
						<!-- 각종 버튼 부분 -->
						<button type="button" class="btn btn-primary"
							onclick="location.href='BoardWrite.jsp';">글쓰기</button>
						<button type="button" class="btn btn-warning"
							onclick="location.href='BoardList.jsp';">리스트보기</button>
					</div>
				</div>
				<div class="row mt-3">
                <div class="col">
                    <!-- 페이지번호 부분 -->
        		<% System.out.println("현재경로 : " + request.getRequestURI());  %>
        		<!-- totalCount, pageSize, blockPage, pageNum, request.getRequestURI() -->
        		<%= BoardPageBoot.pagingStr(mapPaging) %>
                
                </div>
            </div>
        </div>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div class="row mb-5 mt-3">
        <!-- 하단 footer 인클루드 -->
		<%@ include file ="../inc/Bottom.jsp" %>        
    </div>
</div>
</body>
