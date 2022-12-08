<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
//라디오 버튼 getParameter()   job

String jobValue = request.getParameter("job"); 

    out.println(jobValue);
//체크박스 getParameterValues()   inter
    String polCheck = "";
    String ecoCheck = "";
    String entCheck = "";
    String spoCheck = "";
	String [] interValue = request.getParameterValues("inter");
	   
	
	for(int i = 0 ; i < interValue.length ; i++){
		out.println(interValue[i]);
		if(interValue[i].equals("pol")){
			polCheck = "checked";
		}else if(interValue[i].equals("eco")){
			ecoCheck = "checked";
		}else if(interValue[i].equals("ent")){
			entCheck = "checked";
		}else if(interValue[i].equals("spo")){
			spoCheck = "checked";
		}
	}
   
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>선택한 관심사항</h3>

    <fieldset>
      <legend>당신이 선택한 관심사항</legend>
		<form action="">
        <input type="checkbox" name="inter" value="pol" <%= polCheck %> /> 정치
        <input type="checkbox" name="inter" value="eco" <%= ecoCheck %> /> 경제
        <input type="checkbox" name="inter" value="ent" <%= entCheck %> /> 연예
        <input type="checkbox" name="inter" value="spo" <%= spoCheck %> /> 스포츠
          <br />
          
        <input type="radio" name="job" value="pro" <%=  jobValue.equals("pro") ? "checked" :  ""  %> disabled />프로그래머
        <input type="radio" name="job" value="des" <%=  jobValue.equals("des") ? "checked" :  ""  %> disabled />디자이너
        <input type="radio" name="job" value="pub" <%=  jobValue.equals("pub") ? "checked" :  ""  %> disabled />퍼블리셔
         <br />
       
      </form>
    </fieldset>

</body>
</html>