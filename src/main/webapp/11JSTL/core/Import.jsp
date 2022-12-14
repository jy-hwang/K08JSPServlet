<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - Import</title>
</head>
<body>
<c:set var="requestVar" value="MustHave" scope="request"/>
<c:import url="/11JSTL/inc/OtherPage.jsp" var="contents">
<c:param name="user_param1" value="JSP"/>
<c:param name="user_param2" value="기본서"/>
</c:import>

<div>
<h4>이미지삽입하기</h4>
<h5>상대경로 지정</h5>
<img alt="" src="../../images/Error.jpg" width="150">
<h5>절대경로 지정(경로명 하드코딩)</h5>
<img alt="" src="/K08JSPServlet/images/Error.jpg" width="150">
<h5>절대경로 지정(request 내장객체 사용)</h5>
<img alt="" src="<%= request.getContextPath() %>/images/Error.jpg" height="80"  width="150">

</div>


	<h4>J다른 문서 삽입하기</h4>
	
${contents}
	<h4>외부자원삽입하기</h4>
	<!-- <iframe src="../inc/GoldPage.jsp" style="width:100%;height:600px;"></iframe> -->

</body>
</html>