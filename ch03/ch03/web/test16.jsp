<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="ch03.Member" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>액션태그</title>
</head>
<body>
<%
    request.setAttribute("memberObj", new Member(1, "park", "1234","박지권",100));
    request.setAttribute("strObj", "문자열");
    request.setAttribute("intObj", 100);
%>
<jsp:forward page="test16Result.jsp">
    <jsp:param value="1004" name="num1" />
    <jsp:param value="7979" name="num2" />
</jsp:forward>
</body>
</html>
