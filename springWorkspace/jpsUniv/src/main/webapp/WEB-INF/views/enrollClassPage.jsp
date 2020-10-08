<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>진포상대학교</title>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<c:import url="common/sidebar.jsp" />
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<c:import url="common/topbar.jsp" />
				<!-- End of Topbar -->
					<div style="color: red; width: auto;">
						여기다가 컨텐츠 작성하면 됨<br><br><br><br>
						여기다가 컨텐츠 작성하면 됨<br><br><br><br>
						여기다가 컨텐츠 작성하면 됨<br><br><br><br>
						여기다가 컨텐츠 작성하면 됨<br><br><br><br>
					</div>
				<!-- Footer -->
				<c:import url="common/footer.jsp" />
				<!-- End of Footer -->
			</div>
			<!-- End of Content Wrapper -->
		</div>
		<!-- End of Page Wrapper -->
	</div>
		<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i></a>
	<!-- Logout Modal-->
	<c:import url="common/logoutModal.jsp"/>
</body>
</html>