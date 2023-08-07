<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    //Scope Test
        pageContext.setAttribute("pageData", "페이지컨텍스트1");   //현재 페이지에서만 유효
        request.setAttribute("reqData", "요청한데이터");
        session.setAttribute("sesData", "세셔데이터");
        application.setAttribute("appData", "애플리케이션데이터");
        request.setAttribute("msg", "안녕하세요 목요일이네요 이틀 남았어요.");
        RequestDispatcher rd = request.getRequestDispatcher("test5.jsp");       //전송
        rd.forward(request, response);      //해당 페이지도 대체

%>