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
                <title>user</title>
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
                                    <li class="breadcrumb-item active">user</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a User</h3>
                                            <hr class="my-4" />
                                            <form:form action="/admin/user/update" method="post"
                                                modelAttribute="newUser">
                                                <div class="mb-3" style="display: none;">
                                                    <label for="id" class="form-label">Id</label>
                                                    <form:input type="text" id="id" class="form-control" path="id" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="email" class="form-label">Email</label>
                                                    <form:input type="email" id="email" class="form-control"
                                                        placeholder="name@example.com" path="email" disabled="true" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="phone" class="form-label">Phone number</label>
                                                    <form:input type="text" id="phone" class="form-control"
                                                        path="phone" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="fullname" class="form-label">Full name</label>
                                                    <form:input type="text" id="fullname" class="form-control"
                                                        path="fullname" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="address" class="form-label">Address</label>
                                                    <form:input type="text" id="address" class="form-control"
                                                        path="address" />
                                                </div>
                                                <button type="submit" class="btn btn-warning">Update</button>
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