<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>

    <%
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
    %>

</head>
<body>
<div class="msg"></div>
    <%


    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

        String[] idArr = {"hwang", "kyo", "jin"};
        String[] pwArr = {"1111", "2222", "3333"};
        String msg = "로그인 실패";

        for(int i=0;i<idArr.length;i++){
            if(idArr[i].equals(id) && pwArr[i].equals(pw)){
                session.setAttribute("id", id);
                session.setAttribute("pw", pw);

                msg = "로그인 성공";
            }

        }

    %>
</body>
</html>