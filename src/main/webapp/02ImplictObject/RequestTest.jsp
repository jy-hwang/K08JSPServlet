<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h3>관심사항 선택</h3>

    <fieldset>
      <legend>당신의 관심사항은 무엇인가요?</legend>
		<form action="RequestTest2.jsp">
		<input type="checkbox" name="inter" value="pol" /> 정치
        <input type="checkbox" name="inter" value="eco" /> 경제
        <input type="checkbox" name="inter" value="ent" /> 연예
        <input type="checkbox" name="inter" value="spo" /> 스포츠
          <br />
        <input type="radio" name="job" value="pro" />프로그래머
        <input type="radio" name="job" value="des" />디자이너
        <input type="radio" name="job" value="pub" />퍼블리셔
         <br />
        <input type="submit" value="전송하기" />
      </form>
    </fieldset>


</body>
</html>