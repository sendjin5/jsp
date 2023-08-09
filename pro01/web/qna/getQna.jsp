<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@page import="com.chunjae.db.*" %>
<%@page import="com.chunjae.vo.*" %>
<%@page import="com.chunjae.db.DBC" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    int qno = Integer.parseInt(request.getParameter("qno"));

    conn = con.connect();
    String sql ="select  * from qna where qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    rs = pstmt.executeQuery();
    Qna q = new Qna();

    if(rs.next()){
        q.setQno(rs.getInt("qno"));
        q.setTitle(rs.getString("title"));
        q.setContent(rs.getString("content"));
        q.setAuthor(rs.getString("author"));
        q.setResdate(rs.getString("resdate"));
        q.setCnt(rs.getInt("cnt"));
        q.setLev(rs.getInt("lev"));
        q.setPar(rs.getInt("Par"));



    }
    con.close(rs, pstmt, conn);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질의응답 상세보기</title>

    <%@include file="../head.jsp"%>

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

        .tb1 { width:600px; height: 50px; margin: 400px auto; }
        .tb1 th { width:150px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { width:450px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }


        .inbtn { display:block;  border-radius:100px;
            min: width 50px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 30px; background-color: #333; color:#fff; font-size: 15px;
            float: left; margin: 10px;
        }
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
            <p><a href="/">HOME</a> &gt; <a href="/qna/getQna.jsp">질의응답 글쓰기</a>글쓰기</p>
        </div>
        <section class="page">
            <div class="page_wrap" id="page_wrap">
                <h2> QNA 상세보기 </h2>
                <table class="tb1">
                    <tbody>
                    <tr>
                        <th>글번호</th>
                        <td><%=q.getQno()%></td>
                    </tr>
                    <tr>
                        <th>글제목</th>
                        <td> <%=q.getTitle()%></td>
                    </tr>
                    <tr>
                        <th>글내용</th>
                        <td><%=q.getContent()%></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><%=q.getAuthor()%></td>
                    </tr>
                    <tr>
                        <th>작성시간</th>
                        <td><%=q.getResdate()%></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=q.getCnt()%></td>
                    </tr>
                    </tbody>
                    <tr>
                        <td colspan="2">
                            <% if(q.getLev()==0) { %>
                            <% if(sid !=null) { %>
                               <a href="/qna/addQna.jsp?lev=1&par=<%=q.getQno()%>" class="inbtn">답변하기</a>
                            <% } if (sid != null && (sid.equals(q.getAuthor()) || sid.equals("admin1"))) { %>
                               <a href="/qna/updateQna.jsp?qno=<%=q.getQno()%>" class="inbtn">수정하기</a>
                               <a href="/qna/delQna.jsp?qno=<%=q.getQno()%>&lev=0&par=<%=q.getPar()%>" class="inbtn">삭제하기</a>
                            <% } %>
                            <% } else { %>
                            <%  if (sid != null && (sid.equals(q.getAuthor()) || sid.equals("admin1"))) { %>
                                <a href="/qna/updateQna.jsp?qno=<%=q.getQno()%>" class="inbtn">수정하기</a>
                                <a href="/qna/delQna.jsp?qno=<%=q.getQno()%>&lev=1&par=<%=q.getPar()%>" class="inbtn">삭제하기</a>
                            <% } %>
                            <% } %>
                              <a href="/qna/qnaList.jsp" class="inbtn">목록으로 돌아가기</a>

                        </td>
                    </tr>
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