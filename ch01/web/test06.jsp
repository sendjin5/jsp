<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자 해봅시다.</title>
</head>
<body>
<%
JspWriter pageOut = pageContext.getOut();
out.println("<h2>out : 출력 객체</h2>");
out.println("<p>브라우저에 태그를 포함하여 출력할 수 있는 객체</p>");
out.println(pageOut == out);

ServletRequest pageRequest = pageContext.getRequest();
out.println("<h2>request : 요청 객체</h2>");
out.println("<p>브라우저에서 요청한 정보를 저장하고 있는 객체</p>");
out.println(pageRequest == request);

ServletResponse pageResponse = pageContext.getResponse();
out.println("<h2>response : 응답 객체</h2>");
out.println("<p>브라우저에서 보낼 정보를 저장하고 있는객체</p>");
out.println(pageResponse == response);

HttpSession pageSession = pageContext.getSession();
out.println("<h2>session : 세션 객체</h2>");
out.println("<p>로그인 정보를 저장하고 있는 객체</p>");
out.println(pageSession == session);

ServletContext pageservlet = pageContext.getservletContext();
out.println("<h2>application : 애플리케이션 객체</h2>");
out.println("<p>프로그램이 시작되어 끝날 때까지 저장되고 있는 객체</p>");
out.println(pageServlet == application);

ServletConfig pageConfig = pageContext.getservletConfig();
out.println("<h2>config : 응답 객체</h2>");
out.println("<p>애플리케이션의 설정 정보를 저장하고 있는 객체</p>");
out.println(pageConfig == config);

Exception pageException = pageContext.getException();
out.println("<h2>exception : 예외 처리 객체</h2>");
out.println("<p>애플리케이션에서 예외 처리를 위한 객체</p>");
//out.println(pageException == exception);

Object pageObject = pageContext.getPage();
out.println("<h2>page : 현재 페이지 객체</h2>");
out.println("<p>현재 페이지에서만 사용할 내용을 저장하고 있는 객체</p>");
out.println(pagePage == page);
%>
</body>
</html>