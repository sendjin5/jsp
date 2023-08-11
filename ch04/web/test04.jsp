<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="java.net.*, java.net.InetAddress.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   <%--일처리 --%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  <%--화폐 등등 단위 --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>디렉티브</title>
</head>
<body>
    <div class="container">
        <h1>디렉티드(Directive)</h1>
        <p>필요한 자원을 가져올 때 사용하는 jsp의 기본(필수) 요소</p>
        <hr>
        <h2>page directive</h2>
        <p>jsp문서의 선언과 정보 설정 및 필요한 라이브러리 가져오기</p>
        <hr>
        <h2>include directive</h2>
        <p>현재 문서에 다른 jsp 문서를 포함시킬때</p>
        <hr>
        <h2>taglib directive</h2>
        <p>필요한 jstl(자바 표준 태그 라이브러리)을 로딩하기 위함</p>
        <hr>
        <div class="info">
    <%
        Enumeration e = request.getHeaderNames();
        while(e.hasMoreElements()){
            String name = (String) e.nextElement();
            String values = request.getHeader(name);
            out.println("<p>name : " +name+", value : "+values+"</p>");

        }
    %>
            <h2>Server or Client IPAddress/HostName</h2>
            <%
                out.println(<p>
                InetAddress ipaddr = InetAddress.getLocalHost();
            %>
        </div>
</body>
</html>