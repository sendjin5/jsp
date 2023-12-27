<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="ch03.Member" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>디스패치 페이지</title>
</head>
<body>
    <h2>names 배열로 온 데이터</h2>
    <ul>
        <c:forEach var="name" items="${names }">
            <li>${name }</li>
        </c:forEach>
    </ul><hr>
    <h2>lst1로 온 List 데이터</h2>
    <ul>
        <c:forEach var="name" items="${lst1 }">
            <li>${name }</li>
        </c:forEach>
    </ul><hr>
    <h2>map로 온 Map 데이터</h2>
    <ul>
        <c:forEach var="i" items="${map }">
            <li>${i.key } : ${i.value }</li>
        </c:forEach>
    </ul><hr>
    <h2>mList로 온 List 데이터</h2>
    <ul>
        <c:forEach var="member" items="${mList }">
            <li>
                <p>번호 : ${member.no }</p>
                <p>아이디 : ${member.id }</p>
                <p>비밀번호 : ${member.pw }</p>
                <p>이름 : ${member.name }</p>
                <p>포인트 : ${member.point }</p>
            </li>
        </c:forEach>
    </ul><hr>
</body>
</html>
