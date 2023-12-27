<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL Operation Aided</title>
    <c:set var="num3" value="30" />
<%
    pageContext.setAttribute("num1", 9);
    pageContext.setAttribute("num2", "10");

    pageContext.setAttribute("nullStr", null);
    pageContext.setAttribute("emptyStr", "");
    pageContext.setAttribute("lengthZero", new Integer[0]);
    pageContext.setAttribute("sizeZero", new ArrayList());

    //String ssid = (String) session.getAttribute("sid");
%>
</head>
<body>
<div class="container">
    <c:if test="${sid.equals('admin')}">
        <p>관리자님이 로그인 하셨습니다.</p>
    </c:if>
    <c:if test="${not empty sid}">
    <p>${sid }님이 로그인 하셨습니다.</p>
    </c:if>
<%--    <p>표현식 <%=ssid %>님이 로그인 하셨습니다.</p>--%>

    <hr>
    <h2>Empty(null, "", 선언만 한것을 모두 empty로 비교 가능) 연산</h2>
    <p>empty nullStr : ${empty nullStr }</p>
    <p>empty emptyStr : ${empty emptyStr }</p>
    <p>empty lengthStr : ${empty lengthStr }</p>
    <p>empty sizeZero : ${empty sizeZero }</p>
    <hr>
    <h2>삼항 연산자</h2>
    num1 gt num2 ? "참" : "거짓" => ${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }
    <hr>
    <h2>null 연산</h2>
    null + 10 = ${ null + 10 } <br />
    nullStr + 10 = ${ nullStr + 10 } <br />
    param.noVar > 10 = ${ param.noVar > 10 }
    <p>num3 = ${num3 }</p>

</div>
</body>
</html>
