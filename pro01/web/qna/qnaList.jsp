<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

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
    String sql = "SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.name AS NAME FROM qna a, member b WHERE a.author=b.id ORDER BY par DESC, lev ASC, qno ASC ";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    List<Qna> qnaList = new ArrayList<>();

    while(rs.next()){
        Qna q = new Qna();
        q.setQno(rs.getInt("qno"));
        q.setTitle(rs.getString("title"));
        q.setContent(rs.getString("content"));
        q.setResdate(rs.getString("resdate"));
        q.setName(rs.getString("name"));
        q.setCnt(rs.getInt("cnt"));
        q.setLev(rs.getInt("lev"));
        q.setPar(rs.getInt("par"));
        qnaList.add(q);

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
        <header class="hd" id="hd">
        <%@include file="../header.jsp"%>

        </header>
        <div class="contents" id="contents">
            <div class="breadcumb">
                <p><a href="/">HOME</a> &gt; <a href="/qna/qanList.jsp">질문 및 답변</a> 질문목록</p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class=" page_tit">질문 및 답변</h2>
                    <hr>
                    <table class="tb1">
                        <thead>
                        <th class="item1">글번호</th>
                        <th class="item2">글제목</th>
                        <th class="item3">작성자</th>
                        <th class="item4">작성일</th>
                        </thead>
                        <tbody>
                        <%  SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                            int tot = qnaList.size();
                            for(Qna q:qnaList) {
                                Date d = ymd.parse(q.getResdate());
                                String date = ymd.format(d);
                        %>
                        <tr>
                            <td class="item1"><%=tot %></td>
                            <td class="item2"><% if(q.getLev()==0) { %>
                                <a href="/qna/getQna.jsp?qno=<%=q.getQno()%>"><%=q.getTitle()%></a>
                                <% } else { %>
                                <a style= "padding-left:28px;" href="/qna/getQna.jsp?qno=<%=q.getQno()%>"> [답변] <%=q.getTitle()%></a>

                                <% }  %>
                            </td>
                            <td class="item3"><%=q.getAuthor() %></td>
                            <td class="item4"><%=date %></td>
                        </tr>
                        <%
                                tot--;
                            } %>
                        </tbody>
                    </table>
                    <scripit>

                    </scripit>
                    <% if(sid !=null) { %>
                    <div class="btn_group">
                        <a href="addQna.jsp?lev=0&par=0" class="inbtn">질문하기</a>
                    </div>
                    <% } %>
                </div>
            </section>

        </div>
    </div>
    <footer class="ft" id="ft">
            <%@include file="../footer.jsp"%>

    </footer>
</body>
</html>