<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>product delete</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
            </head>

            <body class="sb-nav-fixed">
                <!-- reuse code block -->
                <jsp:include page="../layout/header.jsp" />
                <!--  -->
                <div id="layoutSidenav">
                    <!-- reuse code block -->
                    <jsp:include page="../layout/sidebar.jsp" />
                    <!--  -->
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">product</li>
                                </ol>
                                <div class=" mt-5">
                                    <div class="row">
                                        <div class=" col-12 mx-auto">
                                            <h3>Delete a product ${id}</h3>
                                            <hr class="my-4" />
                                            <div class="alert alert-danger mt-3" role="alert">
                                                Are you sure delete product ?
                                            </div>
                                            <form:form action="/admin/product/delete" method="post"
                                                modelAttribute="newProduct">
                                                <div class="mb-3" style="display: none;">
                                                    <label for="id" class="form-label">Id</label>
                                                    <form:input type="text" id="id" class="form-control" path="id"
                                                        value="${id}" />
                                                </div>
                                                <button class="btn btn-danger">confirm</button>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <!-- reuse code block -->
                        <jsp:include page="../layout/footer.jsp" />
                        <!--  -->
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>