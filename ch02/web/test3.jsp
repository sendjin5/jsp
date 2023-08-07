<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <%
        request.setCharacterEncoding("UTF-8");
        Student st1 = (Student) request.getAttribute("st1");
        ArrayList<String> lst = (ArrayList<String>) request.getAttribute("lst");
        HashSet<String> set = ( HashSet<String>) request.getAttribute("set");
        HashMap<String, String> map = ( HashMap<String, String>) request.getAttribute("map");

    %>


</head>
<body>
    <div class="container">

    <h2>Student 받자</h2>
       <ul class="st1">
            <li></li>
           <li>번호: <%=st1.getNo()%></li>
           <li>이름: <%=st1.getName()%></li>
            <li>국어: <%=st1.getKor()%></li>
            <li>영어: <%=st1.getEng()%></li>
            <li>수학: <%=st1.getMet()%></li>
            <li></li>
        </ul>
        <hr>
        <h3>ArrayList Collection</h3>
        <%
            for(int i=0;i<lst.size();i++){
        %>
        <li><%=lst.get(i)%>%></li>
        <%
            }
        %>
        <hr>
        <h3>HashSet Collection</h3>
        <ul>
            <%
             Iterator iter = set.iterator();
             while (iter.hasNext()){
            %>
            <li><%=iter.next()%></li>
            <%
                }
            %>
        </ul>
        <hr>
        <h3>HashMap Collection</h3>
        <ul>
        <%
            Set<Map.Entry<String, String>> entrySet = map.entrySet();
            for(Map.Entry<String, String> entry : entrySet) {
        %>
            <li>
                키 : <span><%=entry.getKey() %></span>
                값 : <span><%=entry.getValue() %></span>

            </li>
            <%
                }
            %>

        </ul>
        <hr>

        <h2>Map Object Access</h2>
        <h3>Map의 키만 출력 : keySet()</h3>
        <%
            Set<String> keys = map.keySet();
            for(String key:keys){
                %>
            <p>키 : <%=key%></p>
            <p>값 : <%=map.get(key)%></p>

        <%
            }
        %>
        <hr>
        <h3>Map의 값만 : values()</h3>
        <%
            Collection<String> val = map.values();
            for(String item : val){


        %>
        <p><%=item%></p>
<%
    }
%>

    </div>
</body>
</html>