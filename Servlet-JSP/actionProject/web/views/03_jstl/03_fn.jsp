<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-09
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL Functions</title>
</head>
<body>
    <c:set var="str" value="How are you?"/>
    str : ${str}<br>
    모두 대문자로 출력 : ${fn:toUpperCase(str)}<br>
    모두 소문자로 출력 : ${fn:toLowerCase(str)}<br>
    문자열의 길이 : ${str.length()}<br>
    문자열의 길이 : ${fn:length(str)}<br>
    are의 시작위치 : ${fn:indexOf(str, 'are')}<br>
    are -> were : ${fn:replace(str, 'are','were')}<br>

    <c:set var="strArr">
        How,are,you,duhan?
    </c:set>
    <c:forTokens var="d" delims="," items="strArr">
    <ul>
        <li>${d}</li>
    </ul>

    </c:forTokens>
</body>
</html>
