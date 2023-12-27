<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>useBean</title>
    <jsp:useBean id="mem" scope="request" class="ch03.Member" />
</head>
<body>
<div class="container">
    <h2>Expression(표현식) 가져오기</h2>
    <ul class="list">
        <li>번호 : <%=mem.getNo() %></li>
        <li>아이디 : <%=mem.getId() %></li>
        <li>비밀번호 : <%=mem.getPw() %></li>
        <li>이름 : <%=mem.getName() %></li>
    </ul>
    <hr>
    <h2>Expression Langauge(표현언어) 가져오기</h2>
    <ul class="list">
        <li>번호 : ${mem.no }</li>
        <li>아이디 : ${mem.id }</li>
        <li>비밀번호 : ${mem.pw }</li>
        <li>이름 : ${mem.name }</li>
    </ul>
    <hr>
</div>
</body>
</html>
