<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Student" %>
<%@ page import="dto.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>객체제어0801</title>
</head>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8"); //강제로
%>
<body>
<%
        Student st1 = new Student();
        st1.setNo(1);
        st1.setName("사이다");
        st1.setKor(100);
        st1.setEng(90);
        st1.setMet(80);
        request.setAttribute("st1", st1); //일반객체는 setAttribuet()

        List<Student> st = new ArrayList<>();
        Student s1 = new Student();
        s1.setNo(2);
        s1.setName("콜라");
        s1.setKor(95);
        s1.setEng(70);
        s1.setMet(90);
        st.add(s1);

    Student s2 = new Student();
    s2.setNo(3);
    s2.setName("환타");
    s2.setKor(95);
    s2.setEng(70);
    s2.setMet(90);
    st.add(s2);
    request.setAttribute("s2", s2);

    ArrayList<String> lst = new ArrayList<>();
    lst.add("밀키스");
    lst.add("맥주");
    lst.add("술");
    lst.add("파인애플");
    request.setAttribute("lst", lst);


    HashSet<String> set = new HashSet<>();
    set.add("스윙칩");
    set.add("포카칩");
    set.add("새우깡");
    set.add("고래밥");
    request.setAttribute("set", set);

    HashMap<String, String> map = new HashMap<>();
    map.put("no", "3");
    map.put("name", "카스");
    map.put("kor", "90");
    map.put("eng", "50");
    map.put("met", "80");
    request.setAttribute("map", map);

    RequestDispatcher rd = request.getRequestDispatcher("test3.jsp");          //보내는 것 중요!!!
    rd.forward(request, response);
    //response.sendRedirect("test3.jsp?map="+map);    //보내는 양이 적어 사이트 이동시에만 자주 쓴다.

%>
<%
    out.println("번호 : "+st1.getNo());
%>
<p>이름: <%=st1.getName()%></p>
<p>국어: <%=st1.getKor()%></p>
<p>영어: <%=st1.getEng()%></p>
<p>수학: <%=st1.getMet()%></p>
<p>총점: <%=st1.getMet()+st1.getKor()+st1.getEng()%>%></p>
</body>
</html>