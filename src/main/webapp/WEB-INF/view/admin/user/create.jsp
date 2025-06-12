<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  </head>
  <body>
    <div class="container mt-5">
      <div class="row">
        <div class="col-md-6 col-12 mx-auto">
          <h3>Create User</h3>
          <hr class="my-4" />
          <form:form
            action="/admin/user/create"
            method="post"
            modelAttribute="newUser"
          >
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <form:input
                type="email"
                id="email"
                class="form-control"
                placeholder="name@example.com"
                path="email"
              />
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <form:input
                type="password"
                id="password"
                class="form-control"
                path="password"
              />
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">Phone number</label>
              <form:input
                type="text"
                id="phone"
                class="form-control"
                path="phone"
              />
            </div>
            <div class="mb-3">
              <label for="fullname" class="form-label">Full name</label>
              <form:input
                type="text"
                id="fullname"
                class="form-control"
                path="fullname"
              />
            </div>
            <div class="mb-3">
              <label for="address" class="form-label">Address</label>
              <form:input
                type="text"
                id="address"
                class="form-control"
                path="address"
              />
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form:form>
        </div>
      </div>
    </div>
  </body>
</html>
