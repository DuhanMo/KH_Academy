<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>진포상대학교</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>

    <style>
        .labelPadding{
            padding-top: 10px;
        }
    </style>
    <script>

        $(document).ready(function () {
            $('#searchBtn').click(function () {
                $.ajax({
                    url: 'test1.do',
                    method: 'post',
                    dataType: 'json',
                    success: function (data) {
                        $('#testTb').dataTable({
                            paging: false,
                            searching: false,
                            data: data,
                            columns: [
                                {'data': 'no'},
                                {'data': 'name'},
                                {'data': 'email'},
                                {'data': 'phone'}
                            ]
                        });
                    }, error: function () {
                        alert("에러 !")

                    }
                });
            });
        });


    </script>
</head>
<body id="page-top">

    <%--<c:import url="common/menubar.jsp" />--%>
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <c:import url="../common/sidebar.jsp"/>
        <!-- End of Sidebar -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <c:import url="../common/topbar.jsp"/>
                <!-- End of Topbar -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">수강신청</h1>


                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <div>
                                <div id="enrollCard" class="card left active" style="float: left; width: 50%; height: 100%; text-align: center;" >수강신청</div>
                                <div id="basketCard" class="card right" style="float: right; width: 50%; height: 100%;text-align: center;">장바구니</div>
                            </div>
                            <script>
                                $(document).ready(function(){
                                    $('#enrollCard').css({
                                        "background-color":"darkgray",
                                        "color":"white"
                                    });
                                    $('.show1').show();
                                    $('.show2').hide();
                                    $('#basketCard').click(function(){
                                        $('.show1').hide();
                                        $('.show2').show();
                                        $('#basketCard').css({
                                            "background-color":"darkgray",
                                            "color":"white"
                                        });
                                        $('#enrollCard').css({
                                            "background-color":"white",
                                            "color":"darkgray"
                                        });
                                        return false;
                                    });
                                    $('#enrollCard').click(function(){
                                        $('#enrollCard').css({
                                            "background-color":"darkgray",
                                            "color":"white"
                                        });
                                        $('#basketCard').css({
                                            "background-color":"white",
                                            "color":"darkgray"
                                        });
                                        $('.show1').show();
                                        $('.show2').hide();
                                        return false;
                                    });
                                });
                            </script>
                            <div class="show2" >
                                장바구니 클릭 !!
                            </div>
                            <div class="show1">
                                <table class="search_box">
                                    <tbody>
                                    <tr id="cond01">
                                        <th>
                                            <label class="labelPadding">교과구분</label>
                                        </th>
                                        <td>
                                            <select>

                                                <option>전체</option>
                                                <option value="A">교필</option>
                                                <option value="B">교필</option>
                                                <option value="C">전필</option>
                                                <option value="D">전선</option>
                                                <option value="E">일선</option>
                                            </select>
                                        </td>
                                        <th><label for="inputSubject" class="labelPadding">입력검색</label></th>
                                        <td><input  type="text" id="inputSubject" name="inputSubject" value="" placeholder="교과목명 입력">
                                            <button id="searchBtn" type="button" class="btn btn-primary btn-sm">테스트</button>
                                        </td>
                                    </tr>
                                    <tr id="cond02">
                                        <th>
                                            <label class="labelPadding">학부(과)</label>
                                        </th>
                                        <td>
                                            <select >
                                                <option value="">전체</option>
                                                <option value="">단대1</option>
                                                <option value="">단대2</option>
                                                <option value="">단대3</option>
                                                <option value="">단대4</option>
                                                <option value="">단대5</option>
                                                <option value="">단대6</option>
                                                <option value="">단대7</option>
                                            </select>
                                            <select >
                                                <option>전체</option>
                                            </select>
                                        </td>
                                        <th style="padding-left: 30px;">
                                            <label class="labelPadding">전공</label>
                                        </th>
                                        <td>
                                            <select>
                                                <option value="">-</option>
                                            </select>
                                        </td>
                                        <th>
                                            <label class="labelPadding">학년</label>
                                        </th>
                                        <td>
                                            <select>
                                                <option>-</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                                <option value="">3</option>
                                                <option value="">4</option>
                                            </select>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table-responsive">

                                    <table id="testTb" class="table table-striped table-bordered table-hover" width="50%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>장바구니</th>
                                            <th>학년</th>
                                            <th>코드</th>
<%--                                            <th>분반</th>--%>
<%--                                            <th>교과목명</th>--%>
<%--                                            <th>이수구분</th>--%>
<%--                                            <th>학점</th>--%>
<%--                                            <th>수업계획서</th>--%>
                                        </tr>
                                        </thead>
                                        <!-- tbody 태그 필요 없다. -->
                                    </table>
<%--                                    <table class="table table-bordered" id="testTb" width="100%" cellspacing="0">--%>
<%--                                        <thead>--%>
<%--                                        <tr>--%>
<%--                                            <th>No</th>--%>
<%--                                            <th>이름</th>--%>
<%--                                            <th>이메일</th>--%>
<%--                                            <th>핸드폰</th>--%>
<%--                                        </tr>--%>
<%--                                        </thead>--%>
<%--                                        <tbody>--%>

<%--                                        </tbody>--%>
<%--                                    </table>--%>


                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- Footer -->
                    <c:import url="../common/footer.jsp"/>
                    <!-- End of Footer -->
                </div>
                <!-- End of Content Wrapper -->
            </div>
            <!-- End of Page Wrapper -->
        </div>
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i></a>
        <!-- Logout Modal-->
        <c:import url="../common/logoutModal.jsp"/>
        <!-- Bootstrap core JavaScript-->
        <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
        <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${contextPath}/resources/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="${contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="${contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="${contextPath}/resources/js/demo/datatables-demo.js"></script>
</body>
</html>