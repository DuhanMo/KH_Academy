<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-08
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Standard Action - Include</title>
</head>
<body>
<h3>Include</h3>
<p>다른 페이지를 포함하고자 할 때 쓰이는 방식</p>
<h4> 1) Include 지시자 (정적 include 방식)</h4>
<pre>
    &lt;%@ include file="경로" %&gt;
    -> 부모 JSP 파일이 컴파일 되기 전에 페이지에 삽입되어진다.

    특징 : include 된 페이지에서 선언된 변수를 그대로 사용 가능
<%--    <%@include file="footer.jsp"%>--%>

    문제점 : 현재페이지와 include한 페이지의 변수명 중복이 생길 경우 오류(유지보수에 불편)
</pre>

<h4> 2) JSP Action Tag include(동적 include 방식)</h4>
<pre>
    &lt;jsp:include page="경로"/&gt;
    --> 부모 JSP 파일이 화면에 출력되는 시점(런타임)에 삽입되어진다.

    특징 1: include 된페이지와 변수를 공유하지 않아 유지보수에 편리하다.
    <jsp:include page="footer.jsp"/>
    <c:set var="year" value="2020000"/>
    <% String year="2020";%>
<%--    <%=year%>--%>
    이건 뭔가? ${year}

    특징 2: include 된 페이지로 값을 전달할 수 있다.
    <jsp:include page="footer.jsp">
        <jsp:param name="pName" value="Galaxy"/>
    </jsp:include>
</pre>
</body>
</html>
