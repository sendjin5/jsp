<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="ch03.Member" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSTL Format</title>
</head>
<body>
<div class="container">
    <h1>JSTL fmt(Format)</h1>
    <!-- 필요한 변수 선언 -->
    <c:set var="num" value="12345678.9876543" />
    <c:set var="data" value="3,652,733" />
    <c:set var="su1" value="0" />
    <c:set var="su2" value="4" />
    <c:set var="su3" value="-6500000" />
    <c:set var="today" value="<%=new Date() %>" />
    <br><hr><br>
    <h2 class="title">01. 숫자 데이터 변환문 - fmt:parseNumber</h2>
    <p><fmt:parseNumber value="${data }" pattern="0,000" var="num2" /></p>
    <p>${num2 }</p>
    <p>1년은 ${num2/10000} 일 입니다.</p>
    <hr>
    <h2 class="title">02. 숫자를 특정 형식으로 변환하여 출력 - fmt:formatNumber</h2>
    <h3>groupingUsed 속성 : 천단위 구분기호 사용여부</h3>
    <p><fmt:formatNumber value="${num }" groupingUsed="true" /></p>
    <p><fmt:formatNumber value="${su1 }" groupingUsed="true" /></p>
    <p><fmt:formatNumber value="${su3 }" groupingUsed="true" /></p>
    <h3>pattern 속성 : 숫자 코드를 활용(#과 0)</h3>
    <p><fmt:formatNumber value="${num }" pattern="#.##" /></p>
    <p><fmt:formatNumber value="${su1 }" pattern="#.##" /></p>
    <p><fmt:formatNumber value="${su3 }" pattern="#.##" /></p>
    <br>
    <p><fmt:formatNumber value="${num }" pattern="0.00" /></p>
    <p><fmt:formatNumber value="${su1 }" pattern="0.00" /></p>
    <p><fmt:formatNumber value="${su3 }" pattern="0.00" /></p>
    <br>
    <p><fmt:formatNumber value="${num }" pattern="#,##0" /></p>
    <p><fmt:formatNumber value="${su1 }" pattern="#,##0" /></p>
    <p><fmt:formatNumber value="${su3 }" pattern="#,##0" /></p>
    <p><fmt:formatNumber value="${num }" pattern="\ #,##0" /></p>
    <h3>type 속성 : percent, currency</h3>
    <p><fmt:formatNumber value="${num }" type="percent" /></p>
    <p><fmt:formatNumber value="${su1 }" type="percent" /></p>
    <p><fmt:formatNumber value="${su3 }" type="percent" /></p>
    <br>
    <h4>한국</h4>
    <fmt:setLocale value="ko_kr" /><!-- Locale 해당 지역의 화폐 또는 도량형 단위를 자동으로 표시 -->
    <p><fmt:formatNumber value="${num }" type="currency" /></p>
    <p><fmt:formatNumber value="${su1 }" type="currency" /></p>
    <p><fmt:formatNumber value="${su3 }" type="currency" /></p>
    <p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" /></p>
    <br>
    <h4>일본</h4>
    <fmt:setLocale value="ja_jp" />
    <p><fmt:formatNumber value="${num }" type="currency" /></p>
    <p><fmt:formatNumber value="${su1 }" type="currency" /></p>
    <p><fmt:formatNumber value="${su3 }" type="currency" /></p>
    <p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" /></p>
    <br>
    <h4>미국</h4>
    <fmt:setLocale value="en_us" />
    <p><fmt:formatNumber value="${num }" type="currency" /></p>
    <p><fmt:formatNumber value="${su1 }" type="currency" /></p>
    <p><fmt:formatNumber value="${su3 }" type="currency" /></p>
    <p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" /></p>
    <br>
    <h4>중국</h4>
    <fmt:setLocale value="zh_CN" />
    <p><fmt:formatNumber value="${num }" type="currency" /></p>
    <p><fmt:formatNumber value="${su1 }" type="currency" /></p>
    <p><fmt:formatNumber value="${su3 }" type="currency" /></p>
    <p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" /></p>
    <br>
    <h4>대만</h4>
    <fmt:setLocale value="zh_TW" />
    <p><fmt:formatNumber value="${num }" type="currency" /></p>
    <p><fmt:formatNumber value="${su1 }" type="currency" /></p>
    <p><fmt:formatNumber value="${su3 }" type="currency" /></p>
    <p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" /></p>
    <br>
    <h4>말레이시아</h4>
    <fmt:setLocale value="ms_MY" />
    <p><fmt:formatNumber value="${num }" type="currency" /></p>
    <p><fmt:formatNumber value="${su1 }" type="currency" /></p>
    <p><fmt:formatNumber value="${su3 }" type="currency" /></p>
    <p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" /></p>
    <br>
    <h4>베트남</h4>
    <fmt:setLocale value="vi_VN" />
    <p><fmt:formatNumber value="${num }" type="currency" /></p>
    <p><fmt:formatNumber value="${su1 }" type="currency" /></p>
    <p><fmt:formatNumber value="${su3 }" type="currency" /></p>
    <p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" /></p>
    <fmt:setLocale value="ko_kr" />
    <br>

    <br><hr><br>
    <c:set var="date1" value="2023-08-14" />
    <c:set var="time1" value="14:42:17" />
    <c:set var="today2" value="<%=new Date() %>" />
    <br>
    <h2>03. 날짜 데이터 변환문 - fmt:parseDate</h2>
    <fmt:parseDate value="${date1 }" pattern="yyyy-MM-dd" var="date2" />
    <fmt:parseDate value="${time1 }" pattern="HH:mm:ss" var="time2" />
    <p>문자열을 날짜 데이터로 변환 : ${date2 }</p>
    <p>문자열을 시간 데이터로 변환 : ${time2 }</p>
    <br>    <hr>    <br>
    <h2>04. 날짜 표시형식으로 지정하여 출력 - fmt:formatDate</h2>
    <p>${today2 }</p>
    <h3>type 속성 : both, date, time</h3>
    <p>type : both - <fmt:formatDate value="${today2}" type="both" /></p>
    <p>type : date - <fmt:formatDate value="${today2}" type="date" /></p>
    <p>type : time - <fmt:formatDate value="${today2}" type="time" /></p>
    <h3>dateStyle/timeStyle 속성</h3>
    <h4>date의 경우</h4>
    <p>dateStyle : full - <fmt:formatDate value="${today }" type="date" dateStyle="full"/></p>
    <p>dateStyle : long - <fmt:formatDate value="${today }" type="date" dateStyle="long"/></p>
    <p>dateStyle : medium - <fmt:formatDate value="${today }" type="date" dateStyle="medium"/></p>
    <p>dateStyle : short - <fmt:formatDate value="${today }" type="date" dateStyle="short"/></p>
    <h4>time의 경우</h4>
    <p>dateStyle : full - <fmt:formatDate value="${today }" type="time" dateStyle="full"/></p>
    <p>dateStyle : long - <fmt:formatDate value="${today }" type="time" dateStyle="long"/></p>
    <p>dateStyle : medium - <fmt:formatDate value="${today }" type="time" dateStyle="medium"/></p>
    <p>dateStyle : short - <fmt:formatDate value="${today }" type="time" dateStyle="short"/></p>
    <h4>both의 경우</h4>
    <p>timeStyle : full - <fmt:formatDate value="${today }" type="both" timeStyle="full"/></p>
    <p>timeStyle : long - <fmt:formatDate value="${today }" type="both" timeStyle="long"/></p>
    <p>timeStyle : medium - <fmt:formatDate value="${today }" type="both" timeStyle="medium"/></p>
    <p>timeStyle : short - <fmt:formatDate value="${today }" type="both" timeStyle="short"/></p>
    <br>
    <p>dateStyle : full - <fmt:formatDate value="${today }" type="both" dateStyle="full"/></p>
    <p>dateStyle : long - <fmt:formatDate value="${today }" type="both" dateStyle="long"/></p>
    <p>dateStyle : medium - <fmt:formatDate value="${today }" type="both" dateStyle="medium"/></p>
    <p>dateStyle : short - <fmt:formatDate value="${today }" type="both" dateStyle="short"/></p>
    <h3>pattern 속성</h3>
    <!--
    y:년도, M:월, d:일, D:1월1일부터 몇 번째 날인지, E:요일
    a:오전/오후 h:12시간제, H:24시간제, m:분, s:초, S:밀리초
     -->
    <p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" /></p>
    <p><fmt:formatDate value="${today }" pattern="yy/M/d E H:m:s" /></p>
    <br>
    <hr><br>
    <%-- 05. timeZone 문  --%>
    <h2 class="title">05. 타임존 표시형식 지정문(fmt:timeZone)</h2>
    <p>fmt:timeZone은 개폐 태그 사이에 있는 데이터에만 타임존을 적용</p>
    <h3>서울</h3>
    <p>
        <fmt:timeZone value="Asia/Seoul">
            <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
        </fmt:timeZone>
    </p>
    <h3>토쿄</h3>
    <p>
        <fmt:timeZone value="Asia/Tokyo">
            <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
        </fmt:timeZone>
    </p>
    <h3>뉴욕</h3>
    <p>
        <fmt:timeZone value="America/New_York">
            <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
        </fmt:timeZone>
    </p>
    <h3>런던</h3>
    <p>
        <fmt:timeZone value="Europe/London">
            <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
        </fmt:timeZone>
    </p>
    <h3>파리</h3>
    <p>
        <fmt:timeZone value="Europe/Paris">
            <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
        </fmt:timeZone>
    </p>
    <h3>세계표준시</h3>
    <p>
        <fmt:timeZone value="UTC">
            <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
        </fmt:timeZone>
    </p>
    <br>
    <hr><br>
    <%-- 06. setTimeZone 문 --%>
    <h2 class="title">06. 타임존 지정문(fmt:setTimeZone)</h2>
    <p>fmt:setTimeZone은 설정문 이후의 모든 타임존에 적용</p>
    <h3>서울</h3>
    <p>
        <fmt:setTimeZone value="Asia/Seoul" />
        <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
    </p>
    <h3>토쿄</h3>
    <p>
        <fmt:setTimeZone value="Asia/Tokyo" />
        <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
    </p>
    <h3>뉴욕</h3>
    <p>
        <fmt:setTimeZone value="America/New_York" />
        <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
    </p>
    <h3>런던</h3>
    <p>
        <fmt:setTimeZone value="Europe/London" />
        <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
    </p>
    <h3>파리</h3>
    <p>
        <fmt:setTimeZone value="Europe/Paris" />
        <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
    </p>
    <h3>세계표준시</h3>
    <p>
        <fmt:setTimeZone value="UTC" />
        <fmt:formatDate value="${today }" pattern="yyyy/MM/dd EEEE a hh:mm:ss" />
    </p>
    <fmt:setTimeZone value="Asia/Seoul" />
    <br>
    <hr>
</div>
</body>
</html>
