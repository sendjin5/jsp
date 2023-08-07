
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%!
  private String name;
  public String getName(){
    return this.name;
  }
  public void setName(String name){
    this.name = name;
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <title>천재교육</title>
  </head>
  <body>
  <%
    setName("사이다");
    String addr = "가산동";
  %>
  <hr>
  <div id="container">천재교육</div>

  <p>이름 : <%=getName() %></p>
  <p>주소 : <%=addr %></p>
  <a href="test01.jsp">소개</a>
  <a href="test02.jsp">로그인</a>
  <a href="test03.jsp">설문조사</a>
  <a href="test04.jsp?msg=한시간 남았네">요청 정보 및 헤더정보</a>
  <a href="test05.jsp">Response</a>
  <a href="test06.jsp">Servlet 객체</a>


<a >
</a>
  </body>
</html>
