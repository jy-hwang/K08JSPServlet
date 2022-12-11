<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/IsLoggedIn.jsp"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ include file ="../inc/Header_inc.jsp" %>     
	<script src="../../js/board/BoardWrite.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <%@ include file ="../inc/Top.jsp" %>        
    </div>
		<div class="row">
			<%@ include file="../inc/Left.jsp"%>
			<div class="col-9 pt-3">
				<h3>
					게시판 작성 - <small>자유게시판</small>
				</h3>

				<form name="writeFrm" id="writeForm" method="post"
					action="boardWriteProcess.jsp">
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center" style="vertical-align: middle;">작성자</th>
								<td><input type="text" class="form-control" style="width: 150px;"
								value="<%= session.getAttribute("UserName") %>" readonly /></td>
							</tr>

							<tr>
								<th class="text-center" style="vertical-align: middle;">제목</th>
								<td><input type="text" name="title" class="form-control" />
								</td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">내용</th>
								<td><textarea rows="5" name="content" class="form-control"></textarea>
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
							<!-- 각종 버튼 부분 -->
							<button type="button" class="btn btn-danger"
								onclick="return validateForm();">글쓰기</button>
							<button type="button" class="btn btn-dark" onclick="resetForm();">다시쓰기</button>
							<button type="button" class="btn btn-warning"
								onclick="location.href='../board/BoardList.jsp'">리스트보기</button>
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