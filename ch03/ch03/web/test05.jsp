<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>request Header(헤더)</title>
</head>
<body>
<div class="container">
    <h2>request Header 정보</h2>
    <p>해당 페이지를 보내거나 요청하면,그 요청된 모든 정보를 말함</p>
    <hr>
    <div class="info">
<%
    Enumeration e = request.getHeaderNames();
    while(e.hasMoreElements()){
        String name = (String) e.nextElement();
        String value = request.getHeader(name);
        out.println("<p>name : "+name+", value="+value+"</p>");
    }
%>
        <h2>Server or Client IPAddress/HostName</h2>
<%
    out.println("<p>접속 PC 주소 : "+request.getLocalAddr()+"</p>");
    InetAddress ipaddr = InetAddress.getLocalHost();
    out.println("<p>서버 주소1 : "+request.getRemoteAddr()+"</p>");
    out.println("<p>서버 주소2 : "+ipaddr+"</p>");
    out.println("<p>서버 홈디렉토리 : "+request.getContextPath()+"</p>");
%>
    </div>
</div>
</body>
</html>
