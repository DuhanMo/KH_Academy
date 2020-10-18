<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <%--    <link type="text/css" href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.12/css/dataTables.checkboxes.css" rel="stylesheet" />--%>
    <style>
        .labelPadding {
            padding-top: 10px;
        }

        td.dt-body-center {
            text-align: center;
        }
    </style>
    <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>

</head>
<body>
    <h3><a href="http://www.gyrocode.com/articles/jquery-datatables-how-to-add-a-checkbox-column/">jQuery DataTables –
        How to add a checkbox column</a></h3>
    <a href="http://www.gyrocode.com/articles/jquery-datatables-how-to-add-a-checkbox-column/">See full article on
        Gyrocode.com</a>
    <hr>
    <br>

    <form id="frm-example" action="/path/to/your/script" method="POST">

        <table id="example" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th><input name="select_all" value="1" id="example-select-all" type="checkbox" /></th>
                <th>name</th>
                <th>email</th>
                <th>phone</th>
            </tr>
            </thead>
        </table>
        <hr>

        <p>Press <b>Submit</b> and check console for URL-encoded form data that would be submitted.</p>

        <p>
            <button>Submit</button>
        </p>

        <b>Data submitted to the server:</b><br>
        <pre id="example-console">
</pre>
    </form>
    <script>
        $(document).ready(function () {

            var table = $('#example').DataTable({
                'ajax': {
                    'url': 'test2.do',
                    'type': 'post',
                    'dataType' : 'json',
                    'dataSrc' : ''
                },
                'columns': [
                    {'data': 'no'},
                    {'data': 'name'},
                    {'data': 'email'},
                    {'data': 'phone'}
                ],
                'columnDefs': [{
                    'targets': 0,
                    'searchable':false,
                    'orderable':false,
                    'className': 'dt-body-center',
                    'render': function (data, type, full, meta){
                        return '<input type="checkbox" name="id[]" value="'
                            + $('<div/>').text(data).html() + '">';
                    }
                }],
                'order': [1, 'asc']
            });

            // Handle click on "Select all" control
            $('#example-select-all').on('click', function () {
                // Check/uncheck all checkboxes in the table
                var rows = table.rows({'search': 'applied'}).nodes();
                $('input[type="checkbox"]', rows).prop('checked', this.checked);
            });

            // Handle click on checkbox to set state of "Select all" control
            $('#example tbody').on('change', 'input[type="checkbox"]', function () {
                // If checkbox is not checked
                if (!this.checked) {
                    var el = $('#example-select-all').get(0);
                    // If "Select all" control is checked and has 'indeterminate' property
                    if (el && el.checked && ('indeterminate' in el)) {
                        // Set visual state of "Select all" control
                        // as 'indeterminate'
                        el.indeterminate = true;
                    }
                }
            });

            $('#frm-example').on('submit', function (e) {
                var form = this;

                // Iterate over all checkboxes in the table
                table.$('input[type="checkbox"]').each(function () {
                    // If checkbox doesn't exist in DOM
                    if (!$.contains(document, this)) {
                        // If checkbox is checked
                        if (this.checked) {
                            // Create a hidden element
                            $(form).append(
                                $('<input>')
                                    .attr('type', 'hidden')
                                    .attr('name', this.name)
                                    .val(this.value)
                            );
                        }
                    }
                });

                // FOR TESTING ONLY

                // Output form data to a console
                $('#example-console').text($(form).serialize());
                console.log("Form submission", $(form).serialize());

                // Prevent actual form submission
                e.preventDefault();
            });
        });
    </script>
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