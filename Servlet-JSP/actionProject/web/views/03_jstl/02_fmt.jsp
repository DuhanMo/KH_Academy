<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-09
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>JSTL Formatting Library</title>
</head>
<body>
<h3> 1. fmt: formatNumber value=""</h3>
<pre>
    숫자의 데이터 포맷 지정
    - 표현하고자 하는 숫자의 형식을 통화기호, %등 원하는 쓰임에 맞게 지정하는 태그
</pre>
<%--groupingUserd 속성 : 속성 단위의 구분자(,) 표시 여부 지정하고, 속성을 생략시 기본값은 true--%>
숫자 그대로 출력 : <fmt:formatNumber value="123456789" groupingUsed="false"/> <br>
세자리마다 구분하여 출력 : <fmt:formatNumber value="123456789" groupingUsed="true"/><br>

<br>
<%-- type 속성 : 백분율(%-percent) 통화기호 (currency, currencySymbol)지정--%>
percent     : <fmt:formatNumber value="0.75" type="percent"/><br>
currency    : <fmt:formatNumber value="60000" type="currency" /><br>
currency    : <fmt:formatNumber value="50000" type="currency" currencySymbol="₩"/><br>
<br>
<hr>
<h3>2. fmt:formatDate</h3>
<c:set var="current" value="<%=new java.util.Date()%>"/>
<ul>
    <li>오늘 날짜 : <fmt:formatDate value="${current}" type="date"/></li>
    <li>현재 시간 : <fmt:formatDate value="${current}" type="time"/> </li>
    <li>둘다 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   : <fmt:formatDate value="${current}" type="both"/> </li>
    <li>FULL : <fmt:formatDate value="${current}" type="both" dateStyle="full" timeStyle="full"/> </li>
    <li>Long : <fmt:formatDate value="${current}" type="both" dateStyle="long" timeStyle="long"/> </li>
    <li>Medium : <fmt:formatDate value="${current}" type="both" dateStyle="medium" timeStyle="medium" /> </li>
    <li>short : <fmt:formatDate value="${current}" type="both" dateStyle="short" timeStyle="short" /> </li>
    <li>내 타입 : </li>
</ul>
</body>
</html>
