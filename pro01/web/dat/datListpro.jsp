<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();


    conn = con.connect();
    String sql = "insert into dat(id, content) values(?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, content);
    rs = pstmt.executeQuery();

    if(rs.next()){
        Dat d = new Dat();
        d.setId(rs.getString("id"));
        d.setContent(rs.getString("content"));
        d.setResdate(rs.getString("resdate"));

    }
    response.sendRedirect("datList.jsp");
    con.close(rs, pstmt, conn);


%>