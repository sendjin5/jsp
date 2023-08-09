<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>


<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");


    int par = Integer.parseInt(request.getParameter("par"));
    int lev = Integer.parseInt(request.getParameter("lev"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = request.getParameter("author");

    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "";
    int cnt = pstmt.executeUpdate();


    if (cnt > 1) {

        if (lev == 0) {
            sql = "insert into qna(title, content, author, lev, par) value(?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, author);
            pstmt.setInt(4, lev);
            pstmt.executeUpdate();

        } else {
            sql = "insert into qna(title, content, author, lev, par) value(?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, author);
            pstmt.setInt(4, lev);
            pstmt.setInt(5, par);
            pstmt.executeUpdate();

            pstmt.close();

            sql = "update qna set par=qno where lev=? and par=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, lev);
            pstmt.setInt(2, par);
            pstmt.executeUpdate();

        }
        response.sendRedirect("qnaList.jsp");
        con.close(pstmt, conn);
    } else {
        response.sendRedirect("addQna.jsp");
        con.close(pstmt, conn);
    }

%>