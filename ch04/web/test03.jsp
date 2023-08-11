<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전역변수 테스트</title>
    <%
        pageContext.setAttribute("name", "사이다");
        pageContext.setAttribute("age", "22");
    %>
</head>
<body>

        <h2 class="title">include directive</h2>
        <div class="container">
            <%@include file="includefile.jsp"%>
        </div>
        <hr>
<h2 class="title">include action tag</h2>
<div class="container">
    <!-- 액션 태그의 include는 데이터 바인딩인 되지않고 내용만 보낸다.-->
    <jsp:include page="includefile.jsp"></jsp:include>;
</div>
</body>
</html>