<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>액션태그</title>
</head>
<body>
<h2>useBean을 활용한 액션태그</h2>
<p>useBean 액션태그는 해당 클래스를 로딩하면서 객체까지 생성할 때 생성</p>
<jsp:useBean id="mem" scope="request" class="ch03.Member" />
<%
    mem.setNo(1);
    mem.setId("kim");
    mem.setPw("1234");
    mem.setName("김현경");
    mem.setPoint(95);
%>
<hr>
<h2>forward를 활용한 액션태그</h2>
<p>Bean(Class)으로 지정된 내용이나 객체, 일반 데이터 값 등을 전송하는 액션태그</p>
<jsp:forward page="test15Result.jsp" />
</body>
</html>
