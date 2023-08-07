<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    session.invalidate();   //로그데이터를 모두 지우기 -> 로그아웃
    response.sendRedirect("test5.jsp");     //로그아웃 후 진행될 페이지
%>