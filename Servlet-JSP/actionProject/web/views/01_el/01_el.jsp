<%@ page import="com.kh.model.vo.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-08
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //1. request, session 객체에 저장된 값 변수에 기록
//    String classRoom = (String) request.getAttribute("classRoom");
//    Person student = (Person) request.getAttribute("student");
//
//    String academy = (String) session.getAttribute("academy");
//    Person teacher = (Person) session.getAttribute("teacher");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>1. 기존에 하던 방식대로 스크립트릿을 이용하여 각 객체에 담겨있는 값 뽑아서 화면 출력</h3>

<%--학원명 : <%= academy %><br>--%>
<%--강의장 : <%= classRoom %><br>--%>
<%--강사 : <%= teacher.getName() %>, <%= teacher.getAge() %>, <%= teacher.getGender() %><br>--%>

<%--<br><br>--%>
<%--수강생 정보--%>
<%--<ul>--%>
<%--    <li>이름 : <%= student.getName() %>--%>
<%--    </li>--%>
<%--    <li>나이 : <%= student.getAge() %>--%>
<%--    </li>--%>
<%--    <li>성별 : <%= student.getGender() %>--%>
<%--    </li>--%>
<%--</ul>--%>
<hr>
<h3>2. EL을 이용하여 request, session 객체에 담겨있는 값 화면에 출력</h3>
학원명 : ${academy}<br>
강의장 : ${classRoom}<br>
강사 : ${teacher.name}, ${teacher.age}, ${teacher.gender}<br>

<br><br>
수강생 정보
<ul>
    <li>이름 : ${student.name}
    </li>
    <li>나이 : ${student.age}
    </li>
    <li>성별 : ${student.gender}
    </li>
</ul>
<!--
1) 스크립트릿 주석안하고 진행하는 경우
-> 스크립트릿에서 선언한 변수에 접근하는 방식

2) 스크립트릿 주석하고 진행하는 경우
-> 사실상 JSP 내장 객체에 담겨있는 값 빼내어 변수에 기록해둘 필요 X
    직접 속성명을 통해 접근 가능
    ** EL은 JSP 내장 객체를 구분하지 않고 자동으로 입력된 속성명(키값)을 검색하여 존재하는 경우 값을 가져온다
-->

<hr>
<h3> 3. EL 사용시 내장 객체에 저장된 속성명이 동일한 경우 </h3>
scope : ${ scope }

<!--
EL은 pageScope -> requestScope -> sessionScope -> applicationScope 순으로
해당 속성을 찾는다.
-->
<hr>
<h3>4. 특정 내장 객체에 저장된 속성 다루기</h3>
<%
    // pageScope
    pageContext.setAttribute("scope", "page 영역");

%>
pageScope : ${pageScope.scope} <br>
requestScope : ${requestScope.scope}<br>
sessionScope : ${sessionScope.scope}<br>
applicationScope : ${applicationScope.scope}<br>
</body>
</html>
