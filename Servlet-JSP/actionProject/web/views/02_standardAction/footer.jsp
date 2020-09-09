<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-08
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String year = String.format("%tY", new Date());
    String pName = request.getParameter("pName");
%>
<html>
<head>
    <title>footer</title>
</head>
<body>
copyrightⓒ2005 - <%=year%> 이 웹페이지의 저작권은 KH정보교육원 H오후반에 있습니다.<br>
<%=pName%>
</body>
</html>
