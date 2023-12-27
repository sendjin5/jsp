<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*, java.net.InetAddress.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>디렉티브(Directive)</title>
</head>
<body>
<div class="container">
    <h1>디렉티브(Directive)</h1>
    <p>필요한 자원을 가져올 때 활용하는 jsp의 기본(필수) 요소이다.</p>
    <hr>
    <h2>page directive(페이지 디렉티브)</h2>
    <p>jsp 문서의 선언과 정보 설정 및 필요한 라이브러릴 가져오는 디렉티브</p>
    <hr>
    <h2>include directive(인클루드 디렉티브)</h2>
    <p>현재 문서에 다른 jsp 문서를 포함시키는 디렉티브</p>
    <hr>
    <h2>taglib directive(태그라이브러리 디렉티브)</h2>
    <p>필요한 jstl(자바 표준 태그 라이브러리)을 로딩을 하는 디렉티브</p>
</div>
</body>
</html>
