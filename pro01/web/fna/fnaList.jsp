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
    String sql = "select * from fna order by fno desc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    List<Fna> fnaList = new ArrayList<>();

    while(rs.next()){
        Fna fn = new Fna();
        fn.setFno(rs.getInt("fno"));
        fn.setQuestion(rs.getString("question"));
        fn.setAnswer(rs.getString("answer"));
        fn.setCnt(rs.getInt("cnt"));
        fnaList.add(fn);

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
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px;}

        .tb1 { width:800px; margin:50px auto; }
        .tb1 ul { width:800px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid black; border-bottom:1px solid black;
            background-color:deepskyblue; color:#fff; }
        .tb1 li { width:800px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }
        .inbtn { display:block;  border-radius:100px;
            min: width 30px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 30px; background-color: #333; color:#fff; font-size: 15px;
            float: left; margin: 10px;}
        .ans {display: none;}
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
                <p><a href="/">HOME</a> &gt; <a href="/fna/fanList.jsp">자주쓰는 답변</a> 질문목록</p>
            </div>
            <section class="page" id="page">
                <div class="page_wrap">
                    <h2 class="page_tit">자주쓰는 질문목록</h2>
                    <hr>
                    <table class="tb1">
                        <tbody>
                        <ul class = fnaList>
                            <% for(Fna fn:fnaList) { %>
                            <li>
                                <div class="que"><%=fn.getQuestion()%></div>
                                <div class="ans"><%=fn.getAnswer()%></div>
                            </li>
                            <% } %>
                        </ul>
                        <script>
                            $(document).ready(function(){
                            $(".fnaList li").click(function(){
                            $(this).find(".answer").slideToggle(500);
                            });
                            });
                        </script>
                        </tbody>
                        <tr>
                            <td>
                                <a href="/fna/addFna.jsp" class="inbtn">추가하기</a>
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