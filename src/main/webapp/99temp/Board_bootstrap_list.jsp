<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    BoardDAO dao = new BoardDAO(application);
    
    Map<String, Object> param = new HashMap<String,Object>();
    
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");
    
    if(searchWord != null){
    	param.put("searchField", searchField);
    	param.put("searchWord", searchWord);
    }

    int totalCount = dao.selectCount(param);
    List<BoardDTO> boardLists = dao.selectList(param);
    dao.close();
    %>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" />
        <script>
        </script>
    </head>
<body>

    <body>
        <div class="container ">
            <nav class="navbar navbar-expand-sm navbar-white bg-secondary">
                <a class="navbar-brand bg-white" href="javascript:void(0)">
                    <img src="https://tjoeun.co.kr/images/logo.gif?v=20190918" alt="">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" aria data-bs-target="#mynavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mynavbar">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)">자유게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0);">자료실</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0);">방명록</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0);" role="button"
                                data-bs-toggle="dropdown">드롭다운</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">SubMenu1</a></li>
                                <li><a class="dropdown-item" href="#">SubMenu2</a></li>
                                <li><a class="dropdown-item" href="#">SubMenu3</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">

                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Search">
                                <button class="btn btn-warning" type="submit">
                                    <i class="bi bi-search"></i></button>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)">
                                <i class="bi bi-person-fill-add"></i> 회원가입</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0);">
                                <i class="bi bi-person-lines-fill"></i> 회원정보수정</a>
                        </li>
                        <li class="nav-item">

                            <a class="nav-link" href="javascript:void(0);">
                                <i class="bi bi-box-arrow-in-right"></i> 로그인</a>
                        </li>
                        <li class="nav-item">

                            <a class="nav-link" href="javascript:void(0);">
                                <i class="bi bi-box-arrow-right"></i> 로그아웃</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row" style="height: 100px;">
                <div class="col-sm-3 mb-3 mt-2">
                    <button class="btn btn-secondary" style="width: 100%; height: 110%; font-weight: bold;">
                        웹사이트제작</button>

                </div>
                <div class="col-sm-5 mt-2">
                    <h3>게시판 목록 - 자유게시판</h3>
                </div>
                    <form action="" class="col-sm-4">
                    <div class="input-group mt-5 mb-3">
                        <select class="form-select w-25" name="searchField">
                            <option value ="title" selected>제목</option>
                            <option value ="content">내용</option>
                            <option value ="id">작성자</option>
                        </select>
                        <input type="text" class="form-control w-50" placeholder="" name="searchWord"/>
                        <button class="btn btn-warning" type="submit">
                            <i class="bi bi-search"></i></button>
                    </div>
                   </form>
            </div>
        </div>


        <div class="container">
            <div class="row ">
                <div class="col-sm-3">
                    <div class="btn-group-vertical dropend" style=" width: 100%; height: 120px; margin-top: 20px;">
                        <button type="button" class="btn btn-primary active-">자유게시판</button>
                        <button type="button" class="btn">자료실</button>
                        <button type="button" class="btn">방명록</button>
                        <button type="button" class="btn btn-white dropdown-toggle"
                            data-bs-toggle="dropdown">드롭다운</button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">SubMenu1</a>
                            <a class="dropdown-item" href="#">SubMenu2</a>
                            <a class="dropdown-item" href="#">SubMenu3</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9 ">
                    <table class="table table-hover table-striped">
                        <thead>
                            <colgroup>
                                <col style="width: 5%" />
                                <col style="width: 40%" />
                                <col style="width: 10%" />
                                <col style="width: 8%" />
                                <col style="width: 8%" />
                                <col style="width: 10%" />
                            </colgroup>
                             <tr>
					            <th>번호</th>
					            <th>제목</th>
					            <th>작성자</th>
					            <th>조회수</th>
					            <th>추천수</th>
					            <th>작성일</th>
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
                            
                        </tbody>
                    </table>
                    <div class="btn-group mb-3 ms-5 btn btn-justify-content-end">
                        <button type="button" class="btn">Basic</button>
                        <button type="button" class="btn btn-primary">글쓰기</button>
                        <button type="button" class="btn btn-secondary">수정하기</button>
                        <button type="button" class="btn btn-success">삭제하기</button>
                        <button type="button" class="btn btn-info">답글쓰기</button>
                        <button type="button" class="btn btn-warning">리스트보기</button>
                        <button type="button" class="btn btn-danger">전송하기</button>
                        <button type="button" class="btn btn-dark">Reset</button>
                        <button type="button" class="btn btn-light">Light</button>
                        <button type="button" class="btn btn-link">Link</button>
                    </div>
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="#"><i class="bi bi-skip-backward-fill"></i></a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#"><i class="bi bi-skip-start-fill"></i></a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item "><a class="page-link" href="#"><i class="bi bi-skip-end-fill"></i></a>
                        </li>
                        <li class="page-item "><a class="page-link" href="#"><i class="bi bi-fast-forward-fill"></i></a>
                        </li>
                    </ul>
                </div>
                <hr>
            </div>
        </div>
        <div class="container">
            <div class="footer">
                <div class="row">
                    <div class="col-3">Coding King &TRADE;</div>
                    <div class="col-9 justify-content-center">
                        Email: st****jy@gmail.com Address : 서울 어딘가 <br>
                        Mobile : 010-****-9247 <br>
                        copyright &copy; 2022 더조은아카데미 All right reserved
                    </div>
                </div>
            </div>

        </div>
    </body>

</html>