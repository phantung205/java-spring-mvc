<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Table-user</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class="container mt-5">
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
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users1}">
                                    <tr>
                                        <th>${user.id}</th>
                                        <td>${user.email}</td>
                                        <td>${user.fullname}</td>
                                        <td>
                                            <a href="/admin/user/${user.id}" class="btn btn-success me-3">View</a>
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
            </body>

            </html>