<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>


<%
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        Connection conn = null;
        PreparedStatement pstmt = null;

        DBC con = new MariaDBCon();

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String author = request.getParameter("author");

        String sql = "insert into board(title, content, author) value(?, ?, ?)";
        conn = con.connect();
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, author);

        int cnt = pstmt.executeUpdate();

    if (cnt > 0) {
        response.sendRedirect("boardList.jsp");

    } else{
        response.sendRedirect("addboard.jsp");

    }con.close(pstmt, conn);


%>