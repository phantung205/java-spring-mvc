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
                                <h1 class="mt-4">Manager User</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">user</li>
                                </ol>
                                <div class=" mt-5">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="header d-flex justify-content-between">
                                                <h2 class="title d-inline">Table User</h2>
                                                <a class="btn btn-primary" href="/admin/user/create">Create a User</a>
                                            </div>
                                            <hr>
                                        </div>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Full Name</th>
                                                    <th scope="col">Role</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${users1}">
                                                    <tr>
                                                        <th>${user.id}</th>
                                                        <td>${user.email}</td>
                                                        <td>${user.fullname}</td>
                                                        <td>${user.role.name}</td>
                                                        <td>
                                                            <a href="/admin/user/${user.id}"
                                                                class="btn btn-success me-3">View</a>
                                                            <a href="/admin/user/update/${user.id}"
                                                                class="btn btn-warning me-3">Update</a>
                                                            <a href="/admin/user/delete/${user.id}"
                                                                class="btn btn-danger me-3">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

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