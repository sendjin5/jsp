<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전역변수 테스트</title>
    <%

        String userid = application.getInitParmeter("userid");
        String memberid = application.getInitParmeter("userid");
        String sid = (String) application.setAttribute("sid");
    %>
</head>
<body>
    <h2><%=userid%>웹 어플리케이션</h2>
    <hr>
    <h2>관리자님의 아이디는 <%=memberid%></h2>
    <hr>
    <h2>손님의 아이디는 <%=sid%></h2>
    <a href="test01.jsp">전역변수 테스트</a>
    <a href="/">메인으로</a>
</body>
</html>