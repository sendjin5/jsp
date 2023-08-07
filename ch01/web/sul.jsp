<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설문조사 결과</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String year = request.getParameter("year");
        String[] pet = request.getParameterValues("pet");
        for(int i=0; i<pet.length;i++) {
            if(pet[i].equals("dog")) {
                pet[i] = "강아지";
            } else if (pet[i].equals("cat")) {
                pet[i] = "고양이";
            } else if (pet[i].equals("bird")) {
                pet[i] = "새";
            } else {
                pet[i] = "물고기";
            }
        }

    %>


</head>
<body>
    <div id="container">
        <ul class="lst">
            <li><span>아이디 : </span><%=id%></li>
            <li><span>출생년도 : </span><%=year%></li>
            <li><span>이름 : </span><%=name%></li>
            <li><span>좋아하는 동물 </span><br>
            <% for(int i=0;i<pet.length;i++){ %>
                <span><%=pet[i]%></span>
            <% } %>
            </li>

        </ul>

    </div>
</body>
</html>