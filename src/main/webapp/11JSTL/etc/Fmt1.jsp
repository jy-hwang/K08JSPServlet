<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 1</title>
</head>
<body>
<h4>숫자 포맷 설정</h4>

<c:set var="number1" value="12345"/>

콤마 O : <fmt : formatNumber value ="${number1 }" /><br>

콤마 X :<fmt : formatNumber value ="${number1 }" groupingUsed="false" /><br>
<fmt : formatNumber value ="${number1 }" type="currency" var="printNum1" /><br>
통화기호 : ${printNum } <br>
<fmt : formatNumber value ="0.03" type="percent"var="printNum2" />
퍼센트 : ${printNum2 }

<h4>문자열을 숫자로 변경</h4>
<c:set var="number2" value="6789.01"/>
<fmt : parseNumber value ="${number2 }"  pattern= "_0.000.0" var="printNum3"/>
소수점까지: ${printNum3 }<br>

<fmt:formatNumber value ="${number2 }" groupingUsed="false" /><br>
통화기호 : ${printNum } <br>
<fmt : formatNumber value ="${number2 }" type="currency" var="printNum1" /><br>

<fmt : formatNumber value ="0.03" type="percent"var="printNum2" />
퍼센트 : ${printNum2 }
</body>
</html>