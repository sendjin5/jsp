<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL(Expresstion Language) - 표현 언어</title>
    EL과 JSTL
</head>
<body>
<%
    String title = "오늘 증말 배고프구나";
    String[] kyo = {"배고프다", "허기짐", "웃김"};
    Map<String, String> jin = new HashMap<>();
    jin.put("name", "황씨다");
    jin.put("agd", "72");
    jin.put("nick", "만배");

    //데이터를 넘기는 곳에서 setAttribute
    request.setAttribute("tit", title);
    request.setAttribute("k", kyo);
    request.setAttribute("j", jin);

%>
    <h2>표현식(Expression)</h2>
    <p><%=title%></p>
    <div class="cate">
        <% for(String s:kyo){ %>
        <p><%=s%></p>
        <% } %>
    </div>
    <p><%=jin%></p>
    <a href="test07.jsp?title=<%=title%>&k=<%=kyo%>"></a>
    <hr>
<h2>표현언어(Expression Language)</h2>

    <p>${tit}</p>
    <c:forEach var="s" item="${k}">
    <p>${k}</p>
    </c:forEach>
    <p>${j}</p>
</body>
</html>