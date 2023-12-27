<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="ch03.Member" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSTL CORE</title>
<%
    List<Member> mList = new ArrayList<>();
    mList.add(new Member(3,"kim","7979","김현경",90));
    mList.add(new Member(4,"park","1234","박진권",80));
    mList.add(new Member(5,"shin","4321","신승원",85));
%>
</head>
<body>
<div class="container">
    <h1>JSTL CORE</h1>
    <hr>
    <h2 class="title">01. 출력문 - c:out</h2>
    <c:out value="김기태천사" />
    <hr>

    <h2 class="title">02. 변수선언문 - c:set</h2>
    <c:set var="name" value="김천사" scope="session" />
    <c:out value="${name }"/>
    <hr>

    <h2 class="title">03. 임포트문 - c:import</h2>
    <c:set var="path1" value="/login.jsp" />
<%--    <c:import url="${path1}" />--%>
    <hr>
    <h2 class="title">04. Scope</h2>
    <p>page, request, session, application</p>
<%--    <c:set var="root" value="${path}" scope="application" />--%>
    <hr>
    <h2 class="title">05. 조건문 - c:if</h2>
    <c:set var="age" value="42"/>
    <c:if test="${age >= 20}">
        <c:out value="성년" />
    </c:if>
    <c:if test="${age < 20}">
        <c:out value="미성년" />
    </c:if>
    <hr>
    <h2 class="title">06. 변수 또는 객체 제거 - c:remove</h2>
    <c:remove var="age" />
    <hr>
    <h2 class="title">07. 선택문 - c:choose</h2>
    <c:set var="jum" value="96"/>
    <c:choose>
        <c:when test="${jum >= 90}"><span>수</span></c:when>
        <c:when test="${jum >= 80}"><span>우</span></c:when>
        <c:when test="${jum >= 70}"><span>미</span></c:when>
        <c:otherwise><span>집에가</span></c:otherwise>
    </c:choose>
    <hr>
    <h2 class="title">08. 반복실행문 - c:forEach</h2>
    <c:forEach var="mem" items="mList" varStatus="status">
        <ul>
            <li>연번 : ${status.count }</li>
            <li>이름 : ${mem.name }</li>
            <li>아이디 : ${mem.id }</li>
        </ul>
    </c:forEach>
    <hr>
    <h2 class="title">09. 토큰이 있는 반복실행문 - c:forTokens</h2>
    <c:forTokens items="백준철-신승원-구예진" delims="-" var="name">
        <p>${name }</p>
    </c:forTokens>
    <br><br>
    <c:forTokens items="백준철/신승원*구예진 김기태" delims="/* " var="name">
        <p>${name }</p>
    </c:forTokens>
    <hr>
    <h2 class="title">10. URL 정의문 - c:url</h2>
    <c:url value="test13.jsp" var="kbs">
        <c:param name="id" value="kim" />
        <c:param name="pw" value="1234" />
    </c:url>
    <a href="kbs">데이터 던지기</a>
</div>
<div class="msg">
    <h2 class="title">오늘의 학습한 JSTL core 태그</h2>
    <p><pre>
	01. c:out value="값"
	02. c:import url="파일주소"
	03. c:set var="변수명" scope="스코프" value="값"
	04. c:if test="조건식"
	05. c:remove var="변수명"
	06. c:choose
			c:when test="조건"  실행문장     /c:when
			c:otherwise   실행문장    	  /c:otherwise
		/c:when
	07. c:forEach items="컬렉션명" var="인스턴스명" varStatus="status"
	08. c:forTokens items="컬렉션" delims="구분자" var="변수명"
	09. c:url value="전송URL"
	</pre></p>
</div>
</body>
</html>
