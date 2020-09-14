<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kh.model.vo.Person" %><%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-09
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <title>JSTL core Library</title>
</head>
<body>
<h1>Test core Library</h1>

<h3>1. 변수</h3>
<pre>
    * 변수선언 (c:set var="" value="" scope="")
    - 변수 선언하고 초기값을 대입하는 기능을 제공
    - 변수 선언 시 scope 지정가능(지정 안할 시 기본 scope는 page)
    - 사용방법
    1) 변수 타입은 별도로 선언하지 않는다.
    2) 초기값은 반드시 지정해야한다.
    3) c:set을 통해 선언한 변수는 EL안에서 사용 가능
    단, 스크립트릿 요소에서는 사용 불가 // 달러 안에서 변수를 호출가능 꺽쇠퍼센트안에서 c:set에서 선언한 변수 사용 불가능
</pre>
<%--범위 페이지--%>
<c:set var="num1" value="10"/>
<%--범위 리퀘스트--%>
<c:set var="num2" value="20" scope="request"/>

<c:set var="result" value="${num1+num2}" scope="session"/>
<%--<%=num1+num2%> 불가 --%>
num1 변수값 : ${num1}<br>
num2 변수값 : ${num2}<br>
result 변수 값 : ${result}<br><br>
${pageScope.num1}<br>
${requestScope.num2}<br>
${sessionScope.result}<br>
${requestScope.result}<br> <!--출력안된다. 오류발생도 안한다.-->

<h5>array 처럼 사용 가능</h5>
<c:set var="arr" scope="request">
    red,blue,yellow,pink,green
</c:set>
arr 배열값 : ${arr}<br>

<hr>
<pre>
    * 변수 삭제(c:remove var="" scope="") 변수선언할 때 스코프 지정을 해줄 수 있으므로, 그리고 영역별로 변수를 삭제하고싶을 수 있기때문에.
    지정한 변수를 모든 scope에서 검색해 삭제한다.
    또는 지정한 scope만 삭제할 수도있다.
</pre>
<c:set var="result" value="9999" scope="request"/>
result는 session영역에 30 하나 request영역에 9999 하나 총 두가지가 있음, 영역별로 result값 총 두개.<br>

1) 특정 스코프에서 삭제<br>
<c:remove var="result" scope="request"/>
작은 범위에서 큰범위까지 el이 검색을 해준다. 그래서 리퀘스트꺼를 삭제해도 세션까지 찾게돼서 30을 찾아온다.<br>
삭제 후 result : ${result} <br><br>

2) 모든 스코프에서 삭제<br>
<c:remove var="result"/>
모두 삭제 후 result : ${result}<br><br>
<hr>
<pre>
    * 변수 출력(c:out value="" escapeXml="") //태그형태로 보여줄거냐 있는 그대로 보여줄거냐 하는게 escapeXml
    데이터를 출력할때 사용하는 태그
</pre>
그대로 출력 (escape true): <c:out value="<b>태그로출력하기</b>" escapeXml="true"/><br>
태그로 해석되어 출력 (escape false): <c:out value="<b>태그로출력하기</b>" escapeXml="false"/><br>

기본값 출력 : <c:out value="${result}" default="없음"/>
<hr>
<h3>2. 조건문 - if(c:if test="조건식")</h3>
<pre>
    - JAVA의 if문과 비슷한 역할을 하는 태그
    - 조건식 test라는 속성의 값으로 작성
        이 때 조건식 반드시 EL형식으로 기술해야한다.
    - 트루일때만 실행
</pre>
<c:if test="${!(num1 > num2)}">
    num1이 큽니다<br>
</c:if>
<c:if test="${num1 <=num2}">
    num2가 큽니다<br>
</c:if>
<hr>
<h3>3. 조건문 - choose(c:choose c:when , c:otherwise)</h3>
<pre>
    - JAVA에서의 if-else if문 또는 switch문과 비슷한 역할을 한다.
    - 각 조건들은 c:when 태그를 이용해서 작성(default 값으로는 c:otherwise)
</pre>
<c:set var="no" value=""/>
<c:choose>
    <c:when test="${no eq 3}">
        ${no}처음 뵙겠습니다<br>
    </c:when>
    <c:when test="${no eq 0}">
        ${no} 다시 뵙게되어 반갑습니다<br>
    </c:when>
    <c:otherwise>
        ${no} otherwise입니다<br>
    </c:otherwise>
</c:choose>
<hr>
<h3>4. 반복문 - forEach(c:forEach var="" begin="" end="" step="" items="" varStatus="")</h3>
<pre>
    - JAVA의 for문과 같은 기능을 제공
    var     : 현재 반복횟수에 해당하는 변수의 이름 int i
    begin   : 반복이 시작할 요소의 번호 (0,,,n)
    end     : 반복이 끝나는 요소의 번호(0,,,n)
    step    : 반복시 증가할 수
    items   : 반복할 객체명 (배열, Collection 객체)
    varStatus : 현재 반복에 해당하는 객체의 요소정보

</pre>
<%--<% for(int i=1; i<=10; i++) {%>--%>
<%--<%}%>--%>

<c:forEach var="i" begin="1" end="10">
    반복확인 : ${i}<br>
</c:forEach>
<c:forEach var="i" begin="1" end="6">
    <h${i}>태그 안에서도 el 사용이 가능하다</h${i}>
</c:forEach>
<c:forEach var="i" begin="1" end="10" step="2">
    반복확인 : ${i}<br>
</c:forEach>
<c:forEach var="color" items="${arr}">
    <font color="${color}">${color}</font><br><br>
</c:forEach>

<%
    ArrayList<Person> list = new ArrayList<>();
    list.add(new Person("홍길동", 20, '남'));
    list.add(new Person("김순희", 21, '여'));
    list.add(new Person("김철수", 33, '남'));
    pageContext.setAttribute("list", list);
%>
<c:set var="arr">
    토끼, 사자, 호랑이, 당근, 51234, 기린, 하마
</c:set>
<c:forEach var="i" items="${arr}">
    ${i} <br><br>
</c:forEach>
<table border="1">
    <tr>
        <th>번호</th>
        <th>순번</th>
        <th>이름</th>
        <th>나이</th>
        <th>성별</th>
    </tr>
    <%--    <%  %>--%>
    <c:forEach var="p" items="${list}" varStatus="status">
        <tr>
            <td>${status.index}</td><!-- 0부터 시작-->
            <td>${status.count}</td><!-- 1부터 시작-->
            <td>${p.name}</td>
            <td>${p.age}</td>
            <td>${p.gender}</td>
        </tr>
    </c:forEach>
    <%--    %>--%>
</table>
<hr>
<h3>5. forTokens(c:forTokens var="" items="" delims="")</h3>
<pre>
    - 문자열에 포함된 구분자를 이용해서 토큰을 분리하여 반복처리
    - String.split() 또는 StringTokenizer와 비슷한 기능
    - items 속성에는 토큰을 포함하는 문자열을 지정하고,
        delims 속성에는 토큰을 분리하는데 사용할 구분자를 기술(여러개 기술 가능)
</pre>
<c:set var="device">
    컴퓨터,핸드폰.TV/에어컨,냉장고.세탁기
</c:set>
<ul>
    <c:forTokens var="d" items="${device}" delims=",./">
        <li>${d}</li>
    </c:forTokens>
</ul>
<h3>6.url(c:url var="" value="")</h3>
<pre>
    &lt;c:url var="" value="" &gt;
        &lt;c:param name="" value="" /&gt;
        &lt;c:param name="" value="" /&gt;
    &lt;/c:url&gt;

    - url 경로를 생성하고 해당 url의 param 속성을 선언하여 쿼리스트링을 정의할 수 있는 태그
</pre>

<c:url var="url" value="testPage.jsp">
    <c:param name="pName" value="LG그램"/>
    <c:param name="price" value="1900000"/>
    <c:param name="option" value="ssd512G"/>
    <c:param name="option" value="ram16G"/>
</c:url>
<%--url = "testPage.jsp?pName=LG그램&preice=1900000&option=SSD512G&option=ram16G"--%>
<a href="${url}">testPage</a>
</body>
</html>
