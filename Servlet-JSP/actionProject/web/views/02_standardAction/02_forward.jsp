<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-08
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    alert("HELLO");
</script>
<%-- 스크립트 실행되지 않고 바로 포워드 페이지로 넘어간다.--%>
<jsp:forward page="forwardPage.jsp"/>
<!-- url 변경이 이루어지지 않는다. 전달하는 페이지에 내부적으로 request, response 객체 같이 전달된다.-->
</body>
</html>
