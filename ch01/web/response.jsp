<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>page, request, response, out, session(Cookie), application</title>
<%
    /*page/out <request/response < session(cookie) > application
    request : 요청한 정보가 해당 페이지를 벗어나면 소멸
    response : 요청한 페이지가 결과를 전달 후 소멸
    session : 로그아웃시에 소멸됨
    application : 브라우저가 닫히거나 웹 어플리케이션이 종료되면 자동으로 소멸
    -> 모든 웹의 객체는 attribute가 값을 저장할 수 있다.
    -> 저장 (setAttribute) / 보내기 (getAttribute)
    */
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");

%>
<%-- session.setAttribute : 로그인 처리가 되었다.
     addHeader는 있는 것을 수정하여 보낼때
     setHeader는 없는 것을 추가할때
--%>
   </head>
<body><%
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String msg = "로그인 실패";

        response.addHeader("site", "https://chunjae.co.kr");
        response.setHeader("Url2", "https://github.com/sendjin5");
        //out.println("<h2>Response + Session 알아보기</h2>");
        //Cookie ck = null;

    String[] idArr = {"hwang", "kyo", "jin"};
    String[] pwArr = {"1111", "2222", "3333"};


        if(id.equals("admin") && pw.equals("1234")){
            /*
            response.addCookie(ck); : 쿠키로 로그인 처리
            session.setAttribute("id", id);
            session.setAttribute("pw", pw);
            session.invalidate(); : 로그아웃처리
            session.removeAttribute("id") : 세션 속성 비우기
            response.setStatus(200); : 수동 정상처리
            response.sendError(200, "페이지가 정상적으로 처리되었습니다.");
            */
            session.setAttribute("id", id);
            session.setAttribute("pw", pw);
            msg = "로그인 성공";
           // response.sendRedirect("test05.jsp?msg=" +msg);
        }  else {
            msg = "로그인 실패";
            // response.sendRedirect("test05.jsp?msg=" +msg);}
        }

%>
<div class="container">
<p><a href='test05.jsp?msg="+<%=msg%>+"'><%=msg %> - 요청 페이지로 이동</a></p>
<p>콘텐츠 유형 : <%= response.getContentType()%></p>
<p>문자 인코딩 : <%= response.getCharacterEncoding()%></p>
<p>추가된 헤더 : <%= response.getHeader("site")%></p>
<p>설정된 헤더 : <%= response.getHeader("Urel2")%></p>
<p>추가된 헤더 존재 유무확인 : <%= response.containsHeader("site")%></p>
<p>설정된 헤더 존재 유무확인 : <%= response.containsHeader("Url2")%></p>
<p>저장된 상태코드 : <%= response.getStatus()%></p>
<p>저장된 세션정보 아이디 : <%= session.getAttribute("")%></p>
<p>콘텐츠 유형 : <%= response.getContentType()%></p>
</div>
</body>
</html>