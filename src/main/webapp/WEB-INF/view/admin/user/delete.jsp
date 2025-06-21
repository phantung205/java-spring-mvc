<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Delete user</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class=" col-12 mx-auto">
                            <h3>Delete a User ${id}</h3>
                            <hr class="my-4" />
                            <div class="alert alert-danger mt-3" role="alert">
                                Are you sure delete user ?
                            </div>
                            <form:form action="/admin/user/delete" method="post" modelAttribute="newUser">
                                <div class="mb-3" style="display: none;">
                                    <label for="id" class="form-label">Id</label>
                                    <form:input type="text" id="id" class="form-control" path="id" value="${id}" />
                                </div>
                                <button class="btn btn-danger">confirm</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>