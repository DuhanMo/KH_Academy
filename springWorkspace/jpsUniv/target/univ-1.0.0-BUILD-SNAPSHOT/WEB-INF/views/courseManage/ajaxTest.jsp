<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/ui.jqgrid.css"/>
</head>
<body>
    <div class="tableWrap">
        <table id="mainGrid"></table>
        <div id="pager"></div>
    </div>

    <script>
        var searchResultColNames = ['번호', '이름', '이메일', '전화번호'];
        var searchResultColModel = [
                {name: 'no', index: 'no', align: 'center', width: '25%'},
                {name: 'name', index: 'name', align: 'left', width: '25%'},
                {name: 'email', index: 'email', align: 'center', width: '25%'},
                {name: 'phone', index: 'phone', align: 'center', width: '25%'}
            ];

        $(function () {
            var postData = objConvertJson($("#fieldSurvForm")); //form 데이터 json으로 변경
            $("#mainGrid").jqGrid({
                url: "test1.do",
                datatype: "JSON",
                postData: postData,
                mtype: "POST",
                colNames: searchResultColNames,
                colModel: searchResultColModel,
                rowNum: 10,
                pager: "#pager",
                height: 261,
                width: 1019,
                caption: "게시글 목록"
            });
        });
    </script>
    <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/i18n/grid.locale-kr.js"></script>
    <script src="${contextPath}resources/js/jquery.jqGrid.min.js"></script>
</body>
</html>