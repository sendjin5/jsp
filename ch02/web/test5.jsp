<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scope Test</title>
</head>
<body>
<div class="container">
    <header id="hd">
        <%@ include file="nav.jsp"%>  <%--헤더와 푸터 끌고오기 --%>
    </header>
        <h2 class="title">Scope Test</h2>
        <hr>
<%

        String pg = (String)pageContext.getAttribute("pageData");       //현재페이지까지만
        String req = (String)request.getAttribute("reqData");      //목적지까지만(전송해주는 매게체가 있어야함)
        String ses = (String)session.getAttribute("sesData");       //로그아웃 전까지
        String app = (String)application.getAttribute("appData");   //현재 서버에서 나갈때까지
        String msg = (String)request.getAttribute("msg");

%>
        <ul class="list">
            <li>pageContext : <%=pg %></li>
            <li>request : <%=req %></li>
            <li>session : <%=ses %></li>
            <li>application : <%=app %></li>
            <li>msg : <%=msg %></li>
            <li>img : <img src="<%=path%>/img/pooky.jpg" alt="pooky"></li>
        </ul>
    <p>
        <a href="test6.jsp?req=<%=req%>&msg=<%=msg%>">페이지6로 이동</a>
        <%if(ses!=null) { %>
        <a href="logout.jsp">로그아웃</a>
        <% } else{%>
        <a href="test4.jsp">로그인</a>
        <% } %>

    </p>
    </div>
</body>
</html>