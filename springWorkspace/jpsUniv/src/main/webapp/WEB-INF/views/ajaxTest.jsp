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
var test = document.getElementById('test');
test.addEventListener('click', function() {
	
	$.ajax({
		url: "test1.do",
		sucess : function () {
			alert("helloworld");
			console.log("sucess");
		},
		error : function() {
			console.log("fail");
		}
	});
});
function test() {
	$.ajax({
		type : "GET",
		url : "get.do",
		data : {
			kor : "${kor}",
			us : "${us}"
		},
		error : function(error) {
			console.log("error");
		},
		success : function(data) {
			console.log("success");

		}
	});
}
</script>
</body>
</html>