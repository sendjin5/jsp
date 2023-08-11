<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@page import="com.chunjae.db.*" %>
<%@include file="../encoding.jsp"%>
<%@ page import="com.chunjae.dto.*" %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    int qno = Integer.parseInt(request.getParameter("qno"));
    int lev = Integer.parseInt(request.getParameter("lev"));
    int par = Integer.parseInt(request.getParameter("par"));

    conn = con.connect();

    String sql = "delete from qna where qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    int cnt = pstmt.executeUpdate();

    if (cnt > 0) {
        if(lev==0) {
            pstmt.close();
            sql = "delete from qna where par=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, par);
            pstmt.executeUpdate();

            System.out.println("질문글과 답변글이 삭제되었습니다.");
            response.sendRedirect("qnaList.jsp");
        } else {
            System.out.println("답변 글이 삭제되었습니다.");
            response.sendRedirect("qnaList.jsp");
        }
    } else {
        System.out.println("글 삭제가 실패하였습니다.");
        System.out.println("<script>history.go(-1)</script>");

    } con.close(pstmt, conn);
%>
