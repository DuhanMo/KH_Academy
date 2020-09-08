<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-08
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>EL(Expression Language)</h1>
<p>
    EL은 표현언어라 하며<br>
    &lt;%=value%&gt;,out.print(value)와 같이 JSP화면에 <br>
    표현하고자 하는 코드를 \${value}의 형식으로 표현하며 작성하는 것
</p>
<ul>
    <li><a href="el.do">01_EL이란?</a></li>
    <!--<li><a href="views/01_el/02_elOperation.jsp">02_EL 연산자</a> </li>-->
    <li><a href="elOperation.do">02_EL 연산자</a></li>
</ul>
<hr>
<!--
  * JSP 구성인자
  1. 스크립팅 원소 : 스크립틀릿, 표현식, 선언식 등등 -> 자바코드를 직접 기술할 수 있게 하는 기능
  2. 지시자 : page 지시자 -> 페이지 정보 표현, include 지시자 -> 다른페이지 포함
            taglib 지시자 -> JSP 기능을 확장시키는 라이브러리 등록 시 사용
  3. JSP 액션태그
-->
<h1> * JSP Action tag</h1>
<p>

    JSP Action 태그는 XML 기술을 이용하여<br>
    기존의 JSP문법을 확장시키는 기술을 제공하는 태그
</p>
<h3>1. 표준 액션 (Standard Action)</h3>
<p>
    JSP 페이지에서 바로 사용 가능하고 태그 앞에 jsp: 접두어가 붙는다.
</p>
<a href="views/02_standardAction/01_include.jsp">01_include</a>
</body>

</html>
