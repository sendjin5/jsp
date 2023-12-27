<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>JSTL(Java Standard Tag Library) - jstl functions, xml, sql</title>
    <style>
    </style>
</head>
<body>
<div class="msg">
    <h1 class="title">JSTL(Java Standard Tag Library) : 자바 표준 태그 라이브러리</h1>
    <h2>function - 태그가 fn:으로 시작 </h2>
    <h3>fn(함수 - Function) - jsp에서 자주사용하는 함수를 사용할 때 지정</h3>
    <p>fn:함수명 으로 시작하여 /fn:함수명으로 끝나거나 열 때 /로 닫는다.</p>
    <%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>
    <h4>fn:contains() - 주로 해당 변수 값이나 데이터에 특정 데이터가 있는지 검사할 때 활용</h4>
	<c:set var="str" value="Hello World!" />
	<c:if test = "${fn:contains(str, 'World')}">
		<p>해당하는 문자열이 존재합니다.<p>
	</c:if>
	<c:if test = "${fn:contains(str, 'Kim')}">
		<p>해당하는 문자열을 찾을 수 없습니다.<p>
	</c:if>
	<br>

	<h4>fn:containsIgnoreCase() - 주로 해당 변수 값이나 데이터에 특정 데이터가 대소문자 구분없이 있는지 검사할 때 활용</h4>
	<c:if test = "${fn:containsIgnoreCase(str, 'world')}">
	<p>해당하는 문자열이 존재합니다.<p>
	</c:if>
	<c:if test = "${fn:containsIgnoreCase(str, 'kim')}">
	<p>해당하는 문자열을 찾을 수 없습니다.<p>
	</c:if>

    <h4>fn:endsWith() - 주로 해당 변수의 값이나 데이터에 특정 데이터로 끝나는지 검사할 때 활용</h4>
	<%-- <c:if test="${fn:endsWith(str, '~')}">
	<p>해당하는 문자열로 끝납니다.<p>
	</c:if>  --%>
	<br>

    <h4>fn:escapeXml() - XML 언어가 섞여 있을 경우 해독할 때 활용</h4>
	<c:set var="str1" value="This is normal String."/>
	<c:set var="str2" value="<a>This is XML String</a>"/>
	<p>With escapeXml() Function</p>
	<p>str1 : ${fn:escapeXml(str1)}</p>
	<p>str2 : ${fn:escapeXml(str2)}</p>
	<p>Without escapeXml() Function:</p>
	<p>str1 : ${str1}</p>
	<p>str2 : ${str2}</p>
	<br>

    <h4>fn:indexOf() - 주로 해당 변수의 값이나 데이터에 특정 문자열의 위치를 반환받을 때 활용</h4>
	<%--
	// 6
	${fn:indexOf("Hello Java","Java") }

	// 0
	${fn:indexOf("Hello Java","Hello") }

	// 없으면 -1
	${fn:indexOf("Hello Java","substring") }

	// 대소문자 구분 -1
	${fn:indexOf("Hello Java","j") }

	// 연속되지 않는 문자열 -1
	${fn:indexOf("Hello Java","Helo") }
	--%>
	<br>

    <h4>fn:trim() - 주로 해당 변수의 값이나 문자 데이터에 있는 앞 뒤의 공백을 제거할 때 활용</h4>
	<c:set var = "str01" value = "  Hello World! "/>
	<p>str01 Length : ${fn:length(str01)}</p>
	<c:set var = "str02" value = "${fn:trim(str01)}" />
	<p>str02 Length : ${fn:length(str02)}</p>
	<p>str02 : ${str02}</p>
	<br>

	<h4>fn:startsWith() - 주로 해당 변수의 값이나 데이터에 특정 데이터로시작하는지 검사할 때 활용</h4>
	<%-- <c:if test="${fn:startsWith(str, '~')}">
	<p>해당하는 문자열로 시작합니다.<p>
	</c:if>  --%>
	<br>

    <h4>fn:split() - 문자열 데이터를 배열 데이터로 분할</h4>
	<c:set var="food" value="피자,사이다,치킨,콜라" />
	<input type="text" value="${fn:split(food, ',')[0]}" />
	<br>

    <h4>fn:toLowerCase() - 소문자로 변환</h4>
	<c:set var="string2" value = "${fn:toLowerCase(str01)}" />
	<br>

    <h4>fn:toUpperCase() - 대문자로 변환</h4>
	<c:set var="string3" value = "${fn:toUpperCase(str01)}" />
	<br>

    <h4>fn:substring() - 특정 시작번째 부터 끝번째이전까지 문자를 반환할 때 사용</h4>
	<c:set var="TextValue" value="010-abcd-1234" />
	<p>1번 :${fn:substring(TextValue,0,3) }</p>
	<p>2번 :${fn:substring(TextValue,4,8) }</p>
	<p>3번 :${fn:substring(TextValue,9,13) }</p>
	<br>

    <h4>fn:length() - 문자열의 길이 = 글자수를 반환할 때 사용 </h4>
	<p>문자열 길이 : ${fn:length(str01) }</p>
	<br>

    <h4>fn:replace() - 특정 문자열을 다른 문자열로 치환할 때 사용</h4>
	<c:set var="str001" value="Hello World."/>
	<p>replace 전 str001 : ${str001}</p>
	<c:set var="str002" value="${fn:replace(str001, 'World', 'Earth')}" />
	<p>replace 후 str002 : ${str002}</p>
	<br><hr><br>

    <h2>xml - 태그가 xml:으로 시작 </h2>
    <h4>x:out - XPath에 지정된 패턴에 따라 xml 내용을 출력. </h4><br>
    <p><pre>
	<%--
    request.getParameter("phone")
    ${param.phone}
    XPath 통한 내장객체 접근 표현
    $param:phone
	--%>
	x:out select="XPathExpression" [escapseXml="(true|false)"]
	x:out select="$param:phone"
	</pre></p>

    <h4>x:set - XPath에 따라 선택된 내용을 변수에 저장. </h4>
    <p><pre>
	x:set select="XPathExpression" [var"변수"] [scope="영역"]
	<%-- 영역은 page, request, session, application 중 하나
	--%>
	<%-- 선택된 내용을 변수에 저장하는것.
	     변환기능 transform 태그 예제로 대체
	--%>
	</pre></p>

    <h4>x:parse - xml 문서를 읽어서 파싱. </h4>
    <pre>
	x:parse xml="XMLDocument" {[var="변수"] [scope="영역"]
	|[varDom="DOM변수"] [scopeDom="DOM영역"]}
	[systemId="시스템ID"] [filter="필터"]
	x:parse xml="XMLDocument" ...   파싱할XML문서      /x:parse
	<%-- body 내용을 지정된 XML 문서에서는
	     xml="XMLDocument"를 제거한다
	     DOM영역은
	     page, request, session, application 중 하나
	--%>
	<x:parse var="objParam">
	<phones>
	   <info>
	       <num>01011112222</num>
	       <id>신승원</id>
	   </info>
	   <info>
	       <num>01012341234</num>
	       <id>백준철</id>
	   </info>
	</phones>
    </x:parse>
	<%-- xml 데이터를 objParam 변수에 할당 --%>
	c:out select="$objParam//info[1]/num"
	c:out select="$objParam//info[last()]/id"
	<%-- XPath를 이용해 objParam에서 추출 --%>
	</pre>

    <h4>x:choose - 다중 조건을 처리할때 사용. </h4>
    <pre>
	x:choose
	    x:when select="XPathExpression"
	       ...
	    /x:when
	    x:when select="XPathExpression"
	       ...
	    /x:when
	    x:otherwise
	       ...
	    /x:otherwise
	/x:choose
	<%-- 조건1 true면 조건1의 내부 블록 수행,
	     조건1 false, 조건2 true면 조건2 내부 블록 수행,
	     조건1 false, 조건2 false면 otherwise 내부 블록 수행 --%>
	</pre>

    <h4>x:forEach - 콜렉션이나 Map의 각 항목을 처리할 때 사용. </h4>
    <pre>
	<%-- XPath에 따라 해당하는 자원 수만큼 반복(for)  --%>
	x:forEach [var="변수"] select="XPathExpression"
	   ...
	/x:forEach
	x:parse var="objParam"
	   ...
	/x:parse
	x:forEach select="$objParam//info"
	   ...
	   x:out select="num"
	/x:forEach
	<%-- parse로 선언된 objParam에
	     num을 가져와 쓴다. --%>
	</pre>


    <h4>x:if - 조건에 따라 내부 코드를 수행. </h4>
    <pre>
	x:if select="XPathExpression" var="변수" [scope="영역"]
	x:if select="XPathExpression" var="변수" [scope="영역"]
	   ...
	   조건 영역
	/x:if
	<%-- 영역은 page, request, session, application 중 하나
	--%>
	</pre>

    <h4>x:transform - xml과 xslt 파일을 결합해서 새로운 문서를 생성. </h4>
    <pre>생략</pre>
    <br><hr><br>


    <h2>sql - 태그가 sql:으로 시작 </h2>
    <h3>sql - 해당 sql 명령을 실행할 때 사용</h3>
    <%-- <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> --%>
    <h4>sql:setDataSource : 데이터 원본을 설정</h4>
    <pre>
	....
	pageContext.setAttribute("dbconnectUrl", dbconnectUrl);
	pageContext.setAttribute("Db_USER", Db_USER);
	pageContext.setAttribute("Db_PASS", Db_PASS);
	....
	sql:setDataSource url="${dbconnectUrl}" user="${Db_USER}" password="${Db_PASS}"
    var="dataSource" scope="application"
	</pre>

    <h4>sql:query : select문을 구현하고자 할 때</h4>
    <pre>
	c:set var="sqlstr" value="select a.*, (select c_pass from ... = ${item.team_no} and c_use = 0 ) as c_exp ... where a.c_home = ${c_home} and ... order by a.c_no asc"
	sql:query var="result" dataSource="${dataSource}" sql="${sqlstr}"
	</pre>

    <h4>sql:update : update문/delete문/insert문을 구현하고자 할 때</h4>
    <pre>생략</pre>

    <h4>sql:param : sql문의 매개변수를 지정할 때</h4>
    <pre>생략</pre>

    <h4>sql:dateParam : sql문의 날짜 매개변수를 지정할 때</h4>
    <pre>생략</pre>

    <h4>sql:transaction : 트랜잭션을 지정할 때</h4>
    <pre>생략</pre>

</div>
</body>
</html>
