<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajaxSetup({
			url : "../NaverSearchAPI.do",
			type : "get",
			contentType : "text/html;charset:utf-8",
			dataType : "json",
			success : sucFuncJson,
			error : errFunc

		});
		$("#searchBtn").click(function() {
			var frm = $("#searchFrm");
			$.ajax({
				data : {
					keyword : $('#keyword').val(),
					startNum : $('#startNum option:selected').val()
				}
			});
		});
		$('#startNum').change(function(){
			$.ajax({
				data : {
					keyword : $('#keyword').val(),
					startNum : $('#startNum option:selected').val()
				}
			});
		})

	});
	
	function sucFuncJson(d){
		console.log("성공",d);
		var str = "";
		console.log("검색결과",d.total);
		$.each(d.items, function(index,item){
			str +="<ul>";
			str += " <li>" + (index + 1) + "</li>"
			str += " <li>" + item.title + "</li>"
			str += " <li>" + item.description + "</li>"
			str += " <li>" + item.bloggername + "</li>"
			str += " <li>" + item.bloggerlink + "</li>"
			str += " <li>" + item.postdate + "</li>"
			str += " <li><a href='" + item.link + "' target='_blank'>바로가기</a></li>"
			
			str +="</ul>"
		});
		
		$('#searchResult').html(str);
	}
	
	function errFunc(e){
		alert("실패 : " + e.status);
	}
	
</script>

<style>
ul{
border : 2px #cccccc solid;
}
li {
	list-style: none;
}

</style>
</head>
<body>
<body>
	<div class="container">
		<div class="row">
			<a href="../NaverSearchAPI.do?keyword=종각역맛집&startNum=1">
				네이버검색정보JSON바로가기 </a>
		</div>
		<div class="row">
			<form id="searchFrm">
				한페이지에 20개씩 노출됨 <br />
				<select id="startNum">
					<option value="1">1페이지</option>
					<option value="21">2페이지</option>
					<option value="41">3페이지</option>
					<option value="61">4페이지</option>
					<option value="81">5페이지</option>
				</select> <input type="text" id="keyword" size="30" value="종각역맛집" />
				<button type="button" class="btn btn-info" id="searchBtn">
					Naver검색API요청하기</button>
			</form>
		</div>

		<div class="row" id="searchResult">요기에 정보가 노출됩니다</div>
	</div>
</body>


</body>
</html>