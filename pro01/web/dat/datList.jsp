<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>



<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();


    conn = con.connect();
    String sql = "select * from dat order by dno desc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    List<Dat> datList = new ArrayList<>();

    while(rs.next()){
        Dat d = new Dat();
        d.setDno(rs.getInt("dno"));
        d.setId(rs.getString("id"));
        d.setContent(rs.getString("content"));
        d.setResdate(rs.getString("resdate"));
        datList.add(d);

    }
    con.close(rs, pstmt, conn);


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <%@ include file="../head.jsp" %>


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
        .contents { clear:both; min-height:100vh; height: auto;
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
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px;}

        .tb1 { width:1000px; margin:50px auto; }
        .tb1 th { width:1000px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid black; border-bottom:1px solid black;
            background-color:deepskyblue; color:#fff; }
        .tb1 th:nth-child(4) {border-top: hidden; border-bottom: none; background-color: white;}
        .tb1 td { width:1000px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }
        .tb1 td:nth-child(4) { display:block;  border-radius:100px; border-top: hidden; border-bottom: none; background-color: white;}
        .tb1 .item1 { width:5%; text-align: center; }
        .tb1 .item2 { width:60%; padding-left: 50px}
        .tb1 .item3 { width:25%; text-align: center; }
        .tb1 .item4 { width:10%; text-align: center; }

        .tet {width:850px; line-height:32px; padding-top:8px; padding-bottom:8px; float: left;  }
        .tet2 {width:150px; line-height:60px; padding-top:8px; padding-bottom:8px;float: right;}
        .inbtn { display:block;  border-radius:100px;
            min: width 30px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 30px; background-color: #333; color:#fff; font-size: 15px;
            float: right; margin: 10px;}
    </style>

    <link rel="stylesheet" href="../ft.css">

</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@include file="../header.jsp"%>

    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/dat/datList.jsp">자유게시판</a> 자유게시판</p>
        </div>
        <section class="page" id="page">
            <div class="page_wrap">
                <h2 class="page_tit">자유게시판</h2>
                <hr>
                <table class="tb1">
                    <thead>
                        <th class="item1">아이디</th>
                        <th class="item2">글내용</th>
                        <th class="item3">작성일</th>
                        <th class="item4"></th>
                    </thead>
                    <tbody>
                    <% if(sid!=null) { %>
                    <form action="datListpro.jsp">
                        <input type="hidden" name="id" id="id" class="indata" value="<%=sid%>" readonly>
                        <tr>
                            <td colspan="3">
                                <textarea rows="1" cols="50" name="content" id="content" class="tet" maxlength="50" required placeholder="댓글내용" autofocus></textarea></td>
                            <td><input type="submit" value="등록" class="tet2"> </td>
                        </tr>
                    </form>
                    <% } %>
                    <% for(Dat d:datList) { %>
                    <tr>
                        <td class="item1" name="ddf"><%=d.getId()%></td>
                        <td class="item2" name="ddf"><%=d.getContent()%></td>
                        <td class="item3" name="ddf"><%=d.getResdate()%></td>
                        <% if(sid!=null && (sid.equals("admin1") || sid.equals(d.getId()))) {%>
                        <td>
                            <a href="deldat.jsp?dno=<%=d.getDno()%>">삭제하기</a>
                        </td>
                        <% } %>
                    </tr>
                    <% } %>
                    </tbody>
                </table>

            </div>
        </section>

    </div>
</div>
<footer class="ft" id="ft">
    <%@include file="../footer.jsp"%>

</footer>
</body>
</html>