<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더 정보 출력하기</title>
    <%
        request.setCharacterEncoding("UTF-8");
        String msg = request.getParameter("msg");
    %>

</head>
<body>

    <div class="container">
        <h2 class="title">요청 정보 및 헤더 정보 출력하기</h2>
        <hr>
        <ul class="list">
            <li><span>메세지</span> : <strong><%=msg%></strong></li>
            <li><span>프로토콜</span><strong><%=request.getProtocol()%></strong></li>
            <li><span>요청된 서버이름</span><strong><%=request.getServerName()%></strong></li>
            <li><span>요청방식</span><strong><%=request.getMethod() %></strong></li>
            <li><span>파라미터열</span><strong><%=request.getQueryString()%></strong></li>
            <li><span>요청주소</span><strong><%=request.getRequestURL()%></strong></li>
            <li><span>요청URI</span><strong><%=request.getRequestURI()%></strong></li>
            <li><span>서버이름</span><strong><%=request.getRemoteHost()%></strong></li>
            <li><span>서버포트(원격)</span><strong><%=request.getServerPort()%></strong></li>
            <li><span>서버포트(지역)</span><strong><%=request.getLocalPort()%></strong></li>
            <li><span>현재 문서의 경로</span><strong><%=request.getLocalPort()%></strong></li>
            <li><span>헤더의 어셉트</span><strong><%=request.getHeader("Accept")%></strong></li>
            <li><span>헤더의 호스트</span><strong><%=request.getHeader("Host")%></strong></li>
            </ul>
    </div>
</body>
</html>