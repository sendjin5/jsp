<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL Operation Basic</title>
<%
    int num1 = 3;
    pageContext.setAttribute("num2", 4);
    pageContext.setAttribute("num3", "5");
    pageContext.setAttribute("num4", "8");
%>
    <c:set scope="page" var="num5" value="7" />
</head>
<body>
<div class="container">
    <h2>EL Basic</h2>
    <p>스크립트릿에서 선언한 값 : ${num1 }</p>
    <p>page에서 선언한 값 : ${num2 }</p>
    <p>page에서 선언한 값 대입 : ${num1 = 7}</p>
    <p>page에서 선언한 값 연산 : ${num2 = 8;''} => ${num2 }</p>
    <p>num1 = ${num1 }, num2 = ${num2 }, num3=${num3 }, num4 = ${num4 }, num5=${num5 }</p>
    <hr>
    <h2>EL Operation - Arithmethic(산술연산)</h2>
    <p>num1 + num2 = ${num1 + num2 }</p>
    <p>num1 - num2 = ${num1 - num2 }</p>
    <p>num1 * num2 = ${num1 * num2 }</p>
    <p>num1 / num2 = ${num1 / num2 }</p>
    <p>num1 div num2 = ${num1 div num2 }</p>
    <p>num1 % num2 = ${num1 % num2 }</p>
    <p>num1 mod num2 = ${num1 mod num2 }</p>
    <p>※ 문자열 연산도 숫자 덧셈이 되며, 문자열은 덧셈만 가능</p>
    <p>num1 + "34" = ${num1 + "34" }</p>
    <p>"12" + "34" = ${"12" + "34" }</p>
    <hr>
    <h2>EL Operation - Compare(비교연산)</h2>
    <p>num4 > num3 = ${num4 gt num3}</p>
    <p>num4 < num3 = ${num4 lt num3}</p>
    <p>num4 >= num3 = ${num4 ge num3}</p>
    <p>num4 <= num3 = ${num4 le num3}</p>
    <p>num4 == num3 = ${num4 eq num3}</p>
    <hr>
    <h2>EL Operation - Logical(논리연산)</h2>
    <p>num1 <= num2 && num3 == num4 = ${num1 le num2 and num3 eq num4}</p>
    <p>num1 >= num2 || num3 != num4 = ${num1 ge num2 or num3 ne num4}</p>
</div>
</body>
</html>
