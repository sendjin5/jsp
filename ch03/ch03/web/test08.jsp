<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL Data Form(표현 언어 데이터 폼 전송처리)</title>
<%
    pageContext.setAttribute("pname", "김기태");
    request.setAttribute("rname", "신승원");
    session.setAttribute("sname","백준철");
    application.setAttribute("aname","박나연");
%>
</head>
<body>
<div class="container">
    <h2>EL의 Form 데이터 전송</h2>
    <form action="test08_action.jsp" method="post">
        <table>
            <tr>
                <th><label for="id">아이디</label></th>
                <td><input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <th><label>스포츠</label></th>
                <td>
                    <p>좋아하는 스포츠를 선택하세요</p>
                    <input type="checkbox" name="hobby" id="hobby1" value="축구"><label for="hobby1">축구</label>
                    <input type="checkbox" name="hobby" id="hobby2" value="야구"><label for="hobby2">야구</label>
                    <input type="checkbox" name="hobby" id="hobby3" value="배구"><label for="hobby3">배구</label>
                    <input type="checkbox" name="hobby" id="hobby4" vaule="농구"><label for="hobby4">농구</label>
                    <input type="checkbox" name="hobby" id="hobby5" value="피구"><label for="hobby5">피구</label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="전송">
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
