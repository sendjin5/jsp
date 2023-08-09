<%@ page import="com.chunjae.dto.Board" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae.dto.Board" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();


    String sql = "select * from board order by bno desc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    List<Board> boardList = new ArrayList<>();

    while(rs.next()) {
        Board bd = new Board();
        bd.setBno(rs.getInt("bno"));
        bd.setTitle(rs.getString("title"));
        bd.setContent(rs.getString("content"));
        bd.setAuthor(rs.getString("author"));
        bd.setRegdate(rs.getString("regdate"));
        bd.setCnt(rs.getInt("cnt"));
        boardList.add(bd);
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

        .page { clear:both; width: 100vw; height: 100vw; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { width:180px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { width:620px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }
        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:65%; padding-left: 50px}
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:15%; text-align: center; }
        .inbtn { display:block;  border-radius:100px;
            min: width 30px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 30px; background-color: #333; color:#fff; font-size: 15px;
            float: left; margin: 10px;}

    </style>

    <link rel="stylesheet" href="../ft.css">

</head>
<body>
<div class="container">
    <header>
        <%@ include file ="../header.jsp"%>
    </header>
    <div class="contents" id="contents">
        <div class="breadcumb">
            <p><a href="/">HOME</a> &gt; <a href="/board/boardList.jsp">공지사항</a> 공지사항 목록</p>

        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">공지사항 목록</h2>
                <hr>
                <table class="tb1">
                    <thead>
                    <th class="item1">글번호</th>
                    <th class="item2">글제목</th>
                    <th class="item3">작성자</th>
                    <th class="item4">작성일</th>
                    </thead>
                    <tbody>
                    <%
                        SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                        for(Board bd:boardList){
                            Date d = ymd.parse(bd.getRegdate());
                            String date = ymd.format(d);

                    %>
                    <tr>
                        <td class="item1"><%=bd.getBno() %></td>
                        <td class="item2"><% if(sid !=null){ %>
                            <a href="/board/getboard.jsp?bno=<%=bd.getBno() %>"><%=bd.getTitle() %></a>
                            <% } else { %>
                            <span><%=bd.getTitle() %></span>
                            <% } %>
                        </td>
                        <td class="item3"><%=bd.getAuthor() %></td>
                        <td class="item4"><%=date %></td>
                    </tr>
                    <% } %>
                    </tbody>
                    <tr>
                            <td colspan="2">
                                <a href="addboard.jsp" class="inbtn">글쓰기</a>
                            </td>
                    </tr>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file ="../footer.jsp"%>

    </footer>
</div>
</body>
</html>

