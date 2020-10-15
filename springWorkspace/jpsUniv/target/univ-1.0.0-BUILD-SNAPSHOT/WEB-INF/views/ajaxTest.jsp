<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/vendor/jquery/jquery.min.js"></script>
</head>
<body>
<button type="button" id="test" value="TEST">테스트 !</button>
<script type="text/javascript">
$(function() {
	selectList();
});

function selectList() {
	$.ajax({
		url: "test3.do",
		dataType: "json",
		success : function (data) {
			console.log(data);
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n"
					+ "message : " + request.responseText
					+ "\n" + "error : " + error);
		}
	});
}


</script>
</body>
</html>