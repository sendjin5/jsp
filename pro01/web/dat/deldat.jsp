<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();

    conn = con.connect();
    int dno = Integer.parseInt(request.getParameter("dno"));

    String sql = "delete from dat where dno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, dno);
    int cnt = pstmt.executeUpdate();

    if(cnt > 0 ){
        System.out.println("삭제완료");
        response.sendRedirect("/dat/datList.jsp");
    } else {
        System.out.println("삭제실패");
        response.sendRedirect("/dat/datList.jsp");
    }

    con.close(rs, pstmt, conn);


%>