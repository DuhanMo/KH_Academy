<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-14
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .login-area {
            height: 100px;
        }

        .btn-login {
            height: 50px;
        }

        .login-area a {
            text-decoration: none;
            color: black;
            font-size: 0.8em;
        }

        .nav-area {
            background: black;
            height: 50px;
        }

        .menu {
            display: table-cell;
            width: 250px;
            height: 50px;
            text-align: center;
            vertical-align: middle;
            font-size: 20px;
            background: black;
            color: white;
        }

        .menu:hover {
            cursor: pointer;
            background: orangered;
        }
    </style>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1 align="center">Welcome to MyBatis Word!</h1>
<br>
<!-- 회원 관리 서비스-->
<div class="login-area">
    <c:if test="${empty sessionScope.loginUser}">
        <%--        로그인 폼 만들기--%>
        <form action="${contextPath}/login.me" method="post">
            <table align="center">
                <tr>
                    <td>아이디 &nbsp;&nbsp; :</td>
                    <td><input type="text" name="userId"></td>
                    <td rowspan="2">
                        <button id="login-btn" class="btn btn-login">로그인</button>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 : </td>
                    <td><input type="password" name="userPwd"> </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <a href="${contextPath}/insertForm.me">회원가입</a>&nbsp;&nbsp;&nbsp;
                        <a href="#">아이디/비밀번호 찾기</a>
                    </td>
                </tr>
            </table>
        </form>
    </c:if>
    <c:if test="${!empty sessionScope.loginUser}">
        <table align="right">
            <tr>
                <td colspan=2"">
                    <h3>${loginUser.userName}님 환영합니다.</h3>
                </td>
            </tr>
            <tr>
                <td><button>회원정보 수정</button></td>
                <td><button onclick="location.href='${contextPath}/logout.me';">로그아웃</button> </td>
            </tr>
        </table>
    </c:if>
</div>

<!-- 게시물 관련 서비스-->
<div class="nav-area" align="center">
    <div class="menu" onclick="location.href='${contextPath}';">HOME</div>
    <div class="menu">공지사항</div>
    <div class="menu" onclick="location.href='${contextPath}/list.bo';">게시판</div>
    <div class="menu">etc</div>
</div>
</body>
</html>
