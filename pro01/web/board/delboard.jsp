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

        int bno = Integer.parseInt(request.getParameter("bno"));

        String sql = "delete from board where bno=?";
        conn = con.connect();
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bno);
        int cnt = pstmt.executeUpdate();
        if (cnt > 0){
                response.sendRedirect("boardList.jsp");
        }       else{
                response.sendRedirect("getboard.jsp");

        }       con.close(pstmt, conn);



%>