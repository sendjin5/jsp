<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
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
    </style>

    <link rel="stylesheet" href="../ft.css">

</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@include file="../header.jsp"%>
    </header>
    <div class="breadcrumb">
        <p><a href="/">HOME</a> &gt; <a href="onlimechat.jsp">온라인 상담</a>채팅창</p>
    </div>
    <section class="page" id="page">
        <div class="page_wrap">
            <h2 class="page_tit">온라인 상담</h2>
            <form action="onlinepro.jsp">
                <table class="tb1">
                    <tbody>
                    <tr>
                        <th for="name">이름</th>
                        <td><input type="text" name="name1" id="name" class="indata" required>
                        <input type="hidden" name="name2" id="name2" value="<%=sid%>">
                        </td>
                    </tr>
                    <tr>
                        <th for="author">작성자</th>
                        <td><input type="text" name="author" name="from" id="author" class="indata" required></td>
                    </tr>
                    <tr>
                        <th for="email">이메일</th>
                        <td><input type="text" name="from" name="from" id="from" class="indata" required></td>
                    </tr>
                    <tr>
                        <th for="tel">전화번호</th>
                        <td><input type="text" name="tel" name="tel" id="tel" class="indata" required></td>
                    </tr>
                    <tr>
                        <th for="title">글 제목</th>
                        <td><input type="text" name="title" name="title" id="title" class="indata" maxlength="100" required></td>
                    </tr>
                    <tr>
                        <th for="content">글 내용</th>
                        <td><textarea rows="10" cols="80" name="content" id="content" maxlength="790"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="메일 전송하기" class="inbtn"> 회원정보수정
                            <a href="/" class="inbtn"> 메인으로 </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </section>
    <footer class="ft" id="ft">
        <%@include file="../footer.jsp"%>
    </footer>
</div>
</body>
</html>