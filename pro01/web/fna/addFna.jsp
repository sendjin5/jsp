<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="../encoding.jsp"%>
<%@ page import="com.chunjae.dto.*" %>


<%
    int par = Integer.parseInt(request.getParameter("par"));
    int lev = Integer.parseInt(request.getParameter("lev"));
    String sel = "";

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
                <p><a href="/">HOME</a> &gt; <a href="/qna/addQna.jsp">질문 및 답변</a> 글쓰기</p>
            </div>
            <section class="page" id="page">
                <div class="page_wrap">
                    <h2 class="page tit">글쓰기</h2>
                    <form action="addQnapro.jsp" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><label for="title">글제목</label></th>
                            <td>
                                <input type="text" name="title" id="title" class="indata" maxlength="95" required>
                                <input type="hidden" name="author" id="author" value="<%=sid %>">
                                <input type="hidden" name="par" id="par" value="<%=par %>">
                                <input type="hidden" name="lev" id="lev" value="<%=lev %>">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="content">글내용</label></th>
                            <td><textarea rows="10" cols="50" name="content" id="content" maxlength="990" required></textarea>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="등록하기" class="inbtn">
                                <input type="reset" value="취소하기" class="inbtn">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
            </section>

        </div>
    </div>
    <footer class="ft" id="ft">
            <%@include file="../footer.jsp"%>
    </footer>
</body>
</html>