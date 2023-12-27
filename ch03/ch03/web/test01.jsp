<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전역 변수 테스트</title>
<%
    //전역 객체 : application
    //setInitParameter("변수명",값);
    //getInitParameter("변수명");
    //setAttribute("속성명",값);
    //getAttribute("속성명");
    //application.setInitParameter("sid", "kim");
    String userId = application.getInitParameter("userId");
    String memberId = application.getInitParameter("memberId");
    application.setAttribute("sid","kim");
%>
</head>
<body>
    <h2><%=userId %> 님의 웹 애플리케이션</h2><hr>
    <h2>관리자님의 아이디는 <%=memberId %>입니다.</h2><hr>
    <%  String sid = (String) application.getAttribute("sid"); %>
    <h2>손님의 아이디는 <%=sid %></h2><hr>
    <a href="test02.jsp">전역변수 테스트2</a>
</body>
</html>
