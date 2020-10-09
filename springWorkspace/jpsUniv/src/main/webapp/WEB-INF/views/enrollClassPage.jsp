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
<c:import url="common/menubar.jsp" />
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
		 <div class="container-fluid">

              <!-- Page Heading -->
              <h1 class="h3 mb-2 text-gray-800">수강신청</h1>
              <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
    
					 <!-- DataTales Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                   
                    <table id="userTable" class="table table-striped table-bordered table-hover" >
                      <thead>
                          <tr>
                              <th>Email</th>
                              <th>Name</th>
                              <th>User Status</th>
                              <th>Super User</th>
                          </tr>
                      </thead>
                      <!-- tbody 태그 필요 없다. -->
                  </table>
                  <script>
                    $(document).ready(function(){
                            $('#userTable').dataTable({
                                pageLength: 3,
                                bPaginate: true,
                                bLengthChange: true,
                                lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
                                bAutoWidth: false,
                                processing: true,
                                ordering: true,
                                serverSide: false,
                                searching: true,
                                ajax : {
                                    "url":"/getUserList.do",
                                    "type":"POST",
                                    "data": function (d) {
                                        d.userStatCd = "NR";
                                    }
                                },
                                columns : [
                                    {data: "email"},
                                    {data: "fullNmKr"},
                                    {data: "userStatCd"},
                                    {data: "superUser"}
                                ]
                 
                            });
                 
                    });
                    </script>
                  </div>
                </div>
              </div>
    
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