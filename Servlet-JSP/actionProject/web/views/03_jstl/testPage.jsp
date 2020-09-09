

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
// String pName = request.getParameter("pName");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Test</title>
</head>
<body>
    상품명     : ${param.pName}<br>
    상품가격    : ${param.price}<br>
    옵션 1     : ${paramValues.option[0]}<br>
    옵션 2     : ${paramValues.option[1]}<br>
</body>

</html>