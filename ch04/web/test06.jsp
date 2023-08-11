<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jst/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jst/jstl/fmt"%>
<%@page import="java.util.*" %>
<%@page import="ch04.Member" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL & JSTL</title>
</head>
<body>
<%
        String name = "kyo";
        int age = 42;
        int num1= 78, num2= 42, num3= 100;

    Member m1 = new Member();
    m1.setNo(1);
    m1.setName("사이다");
    m1.setId("sid");
    m1.setPw("1234");
    m1.setPoint(100);

    Member m2 = new Member();
    m2.setNo(2);
    m2.setName("콜라");
    m2.setId("col");
    m2.setPw("1234");
    m2.setPoint(250);

    List<Member> lst = new ArrayList<>();
    lst.add(m1);
    lst.add(m2);

    request.getAttribute("name", name);
    request.getAttribute("age", age);
    request.getAttribute("num1", num1);
    request.getAttribute("num2", num2);
    request.getAttribute("num3", num3);
    request.getAttribute("m1", m1);
    request.getAttribute("m2", m2);
    request.getAttribute("lst", lst);
    %>

<div class="container">
    <section class="page">
            <h2 class="title">표현식(Expresstion)과 표현언어(Expresstion Language)</h2>
        <div class="item_wrap">
            <h3>표현식+스크립트릿 활용</h3>
            <p class="name">이름 : <%=name %></p>
            <p class="age">나이 : <%=age %></p>
            <p class="point">점수 : <%=num1+num2+num3 %></p>
            <hr>
            <h3>m1 출력</h3>
            <p>번호 : <%=m1.getNo()%></p>
            <p>이름 : <%=m1.getName()%></p>
            <p>아이디 : <%=m1.getId()%></p>
            <p>비밀번호 : <%=m1.getPw()%></p>
            <p>포인트 : <%=m1.getPoint()%></p>
            <hr>
            <h3>m2 출력</h3>
            <p>번호 : <%=m2.getNo()%></p>
            <p>이름 : <%=m2.getName()%></p>
            <p>아이디 : <%=m2.getId()%></p>
            <p>비밀번호 : <%=m2.getPw()%></p>
            <p>포인트 : <%=m2.getPoint()%></p>
            <hr>

            <h2>List 출력</h2>
            <%
                for(int i=0;i<lst.size();i++){
                    Member m = lst.get(i);
            %>
            <p>번호 : <%=m.getNo()%></p>
            <p>이름 : <%=m.getName()%></p>
            <p>아이디 : <%=m.getId()%></p>
            <p>비밀번호 : <%=m.getPw()%></p>
            <p>포인트 : <%=m.getPoint()%></p>
            <%
                }
            %>
            <div class="item_wrap">
                <h3>표현어와 스크립트릿</h3>
                <p class="name"> ${name }</p>
                <p class="age">나이 : ${age }</p>
                <p class="point">점수 : ${ num1+num2+num3 }</p>
                <hr>
                <h3>m1 출력</h3>
                <p>번호 : ${m1.No()}</p>
                <p>이름 : ${m1.Name()}</p>
                <p>아이디 : ${m1.Id()}</p>
                <p>비밀번호 : ${m1.Pw()}</p>
                <p>포인트 : ${m1.Point()}</p>
                <hr>
                <h3>m2 출력</h3>
                <p>번호 : ${m2.No()}</p>
                <p>이름 : ${m2Name()}</p>
                <p>아이디 : ${m2.Id()}</p>
                <p>비밀번호 : ${m2.Pw()}</p>
                <p>포인트 : ${m2.Point()}</p>
                <hr>
                <h3>List 출력</h3>
                <%
                    for(Member m: lst){
                        pageContext.setAttribute("m", m);
                %>
                <p>번호 : ${m.no}</p>
                <p>이름 : ${m.name}</p>
                <p>아이디 :${m.id}</p>
                <p>비밀번호 : ${m.pw}</p>
                <p>포인트 : ${m.point}</p>
                <%
                    }
                %>

                <div class="page_wrap">
                    <h3>표현어와 태그라이브러리</h3>
                    <c:forEach var="m" item="${lst }" varStatus="status">
                    <p>번호 : ${status.count }</p>
                    <p>번호 : ${m.no }</p>
                    <p>이름 : ${m.name }</p>
                    <p>아이디 :${m.id }</p>
                    <p>비밀번호 : ${m.pw }</p>
                    <p>포인트 : ${m.point }</p>
                    </c:forEach>
                    <c:set var="tot" value="${num1+num2+num3}" />
                    <h4>총점 : ${tot }</h4>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>