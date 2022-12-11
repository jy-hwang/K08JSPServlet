<%@page import="homework.member.MemberFreeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    String uId = request.getParameter("userId");
    
    MemberFreeDAO dao = new MemberFreeDAO(application);
    boolean isDup = dao.dupChkUid(uId);
    
    dao.close();
    %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script>
      window.onload = function () {
    	  opener.document.signUpFrm.dupChkbox.checked = false;
    	  var url = location.href;
        console.log(url);
        var parameters = url.slice(url.indexOf("?") + 1, url.length).split("&");
        console.log(parameters[0]); //id=입력된값
        returnValue = parameters[0].split("=")[1];
        document.getElementById("user_id").innerHTML = returnValue;
      };

      function idUse() {
        opener.document.signUpFrm.userId.value = document.overlapFrm.retype_id.value;
        opener.document.signUpFrm.dupChkbox.checked = true;
        self.close();
      }
    </script>
  </head>
  <body>
    <h2>아이디 중복확인 하기</h2>

    <h3>
      부모창에서 입력한 아이디 :
      <!-- jsp 연동이후 실행가능한 코드, 파라미터로 전달된 id를 받아온다. -->
      <!-- <%= request.getParameter("id") %> -->
      <span id="user_id"></span>
    </h3>
<% if(isDup){ %>
    <h3>아이디가 중복되었을때 재입력한 아이디</h3>

    <form action="IdDupChk.jsp" name="overlapFrm">
      <input type="text" name="userId" size="20" />
      <input type="submit" value="다시검색하기"/>
    </form>
    
<%} else { %>
    <h3>사용가능한 아이디 입니다.</h3>

    <form action="" name="overlapFrm">
    <input type="hidden" name ="retype_id" value=<%=uId%>>
      <input type="button" value="아이디사용하기" onclick="idUse();" />
    </form>     
     
     
     <%} %>
  </body>
</html>
