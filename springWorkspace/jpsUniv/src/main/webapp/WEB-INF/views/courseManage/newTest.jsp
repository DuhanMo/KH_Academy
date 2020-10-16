<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-10-16
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>

    <script>

        $(document).ready(function () {
            $.ajax({
                url: 'test1.do',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    $('#testTb').dataTable({
                        data: data,
                        columns: [
                            {'data': 'no'},
                            {'data': 'name'},
                            {'data': 'email'},
                            {'data': 'phone'}
                        ]
                    });
                    alert(data);
                }, error: function () {
                    alert("에러 !")

                }
            });
        });

    </script>
</head>
<body>
    <table id="testTb" class="table table-bordered">
        <thead>
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
        </thead>
    </table>

    <!-- Bootstrap core JavaScript-->


    <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${contextPath}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${contextPath}/resources/js/demo/chart-pie-demo.js"></script>
</body>
</html>
