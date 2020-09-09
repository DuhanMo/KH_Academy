<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-09
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSTL</title>
</head>
<body>
<h1>JSTL 이란 ?</h1>
<p>
    JSP Standard Tag Library <br>
    JSP 에서 사용하는 대표적인 커스텀 액션 태그<br>
    공통적으로 사용하는 코드의 집합을 쉽게 태그화 하여 표준으로 제공

</p>
<!--
라이브러리 등록 방법
    1) https://tomcat.apache.org/download-taglibs.cgi
    2) Standard-1.2.5 -> jar files 4개 다 다운로드
    3) WEB-INF/lib 에 추가를 해준다
-->
<h3>* JSTL 선언 방법</h3>
<p>
    JSTL을 사용하고자 하는 JSP페이지의 상단<br>
    page지시자 아래에 taglib 지시자를 사용하여 선언해야 한다.
    &lt;%@ taglib prefix="사용하고자하는접두사" uri="tld 파일상의 uri"%&gt;
</p>
<hr>
<h4>1. JSTL core Library</h4>
변수와 조건문, 반복문, url 등의 로직과 관련된 JSTL 문법을 제공<br>
<a href="01_core.jsp">01_core</a>
</body>
</html>
