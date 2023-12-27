<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String name = (String) pageContext.getAttribute("name");
    String age = (String) pageContext.getAttribute("age");
%>
<div class="infile">
    <h1>includeFile.jsp</h1>
    <div class="dataarea">
        <p>Name : <%=name %></p>
        <p>Age : <%=age %></p>
    </div>
</div>