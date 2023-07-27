
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <a href="index.jsp"></a>

<a >
</a>
  </body>
</html>
