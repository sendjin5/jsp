<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ page import="com.chunjae.db.MariaDBCon" %>
<%@ page import="com.chunjae.db.DBC" %>
<%@ page import="com.chunjae.dto.Board" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int bno = Integer.parseInt(request.getParameter("bno"));

    DBC con = new MariaDBCon();
    conn = con.connect();


    String sql = "select * from board where bno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, bno);
    rs = pstmt.executeQuery();
    Board bd = new Board();

    if(rs.next()) {
        bd.setBno(rs.getInt("bno"));
        bd.setTitle(rs.getString("title"));
        bd.setContent(rs.getString("content"));
        bd.setAuthor(rs.getString("author"));
        bd.setRegdate(rs.getString("regdate"));
        bd.setCnt(rs.getInt("cnt"));
    }
    con.close(rs, pstmt, conn);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>

    <%@ include file ="../head.jsp"%>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../google.css">
    <link rel="stylesheet" href="../fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="../hd.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:500px; margin:50px auto; }
        .tb1 th { width:180px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { width:310px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min: width 30px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 30px; background-color: #333; color:#fff; font-size: 15px;
            float: left; margin: 10px;
        }
        .inbtn :last-child { float: right;}
    </style>

    <link rel="stylesheet" href="../ft.css">

</head>
<body>
<div class="container">

    <header class="hd" id="hd">
        <%@ include file ="../header.jsp"%>
    </header>
    <div class="contents" id="contents">
        <div class="breadcumb">
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">공지사항 상세보기</h2>
                <table class="tb1">
                    <tbody>
                    <tr>
                        <th>글 번호</th>
                        <td><%=bd.getBno() %></td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td><%=bd.getTitle() %></td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td><%=bd.getContent() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><%=bd.getAuthor() %></td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td><%=bd.getRegdate() %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=bd.getCnt() %></td>
                    </tr>
                    </tbody>
                    <tr>
                        <td colspan="2">
                            <% if(sid.equals("admin1") || sid.equals(bd.getAuthor())) { %>
                            <a href="updateboard.jsp?bno=<%=bd.getBno()%>" class="inbtn">글 수정</a>
                            <a href="delboard.jsp?bno=<%=bd.getBno()%>" class="inbtn">글 삭제</a>
                            <% } %>
                            <a href="boardList.jsp" class="inbtn">글 목록</a>

                        </td>
                    </tr>
                </table>


            </div>
        </section>
        <footer class="ft" id="ft">
            <%@ include file ="../footer.jsp"%>

        </footer>
    </div>
</body>
</html>

