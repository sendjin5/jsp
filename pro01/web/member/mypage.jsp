<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>
<!DOCTYPE html>
<html lang="en">
<%
    String id = (String) session.getAttribute("id");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Member mem = new Member();
    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn !=null){
        System.out.println("DB 연결성공");
    }

    try {
        String sql = "select * from member where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            mem.setId(rs.getString("id"));
            mem.setPw(rs.getString("pw"));
            mem.setName(rs.getString("name"));
            mem.setEmail(rs.getString("email"));
            mem.setTel(rs.getString("tel"));
            mem.setPoint(rs.getInt("point"));
        } else {
            response.sendRedirect("/member/login.jsp");
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문이 안된다.");


    }
%>
<head>

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

        .tb1 { width:500px; line-height:24px; margin:0 auto; }
        .tb1 tr { width:300px; line-height: 60px; padding-top:24px; padding-bottom:24px;
            border-top: 1px solid #333; border-bottom: 1px solid #333; background-color: gray; color:#fff}


        .inbtn { display:block;  border-radius: 30px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 60px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="../ft.css">
    <title>마이페이지</title>
</head>
<body>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <span>내정보 수정</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">내 정보 수정</h2>
                    <table class="tb1">
                        <tbody>
                       <tr>
                           <th>아이디</th><
                           <td><%=mem.getId() %></td>
                       </tr>
                       <tr>
                           <th>비밀번호</th><
                           <td><%=mem.getPw() %></td>
                       </tr>
                       <tr>
                           <th>이름</th><
                          <td><%=mem.getName() %></td>
                       </tr>
                       <tr>
                           <th>이메일</th><
                           <td>><%=mem.getEmail() %></td>
                       </tr>
                       <tr>
                           <th>전화번호</th><
                           <td><%=mem.getTel() %></td>
                       </tr>
                       <tr>
                           <th>포인트</th><
                           <td><%=mem.getPoint() %></td>
                       </tr>
                        <tr>
                            <td colspan="2">
                                <a href="/member/modify.jsp" class="inbtn"> 회원정보수정</a>
                                <a href="/" class="inbtn"> 메인으로</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</body>
</html>