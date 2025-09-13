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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
          $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
              const imgURL = URL.createObjectURL(e.target.files[0]);
              $("#avatarPreview").attr("src", imgURL);
              $("#avatarPreview").css({ "display": "block" });
            });
          });
        </script>
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
                <div class=" mt-5">
                  <div class="row">
                    <div class="col-md-6 col-12 mx-auto">
                      <h3>Create User</h3>
                      <hr class="my-4" />
                      <form:form action="/admin/user/create" method="post" modelAttribute="newUser" class="row g-3"
                        enctype="multipart/form-data">
                        <div class="mb-3 col-md-6 col-12">
                          <c:set var="errorEmail">
                            <form:errors path="email" cssClass="invalid-feedback" />
                          </c:set>
                          <label for="email" class="form-label">Email</label>
                          <form:input type="email" id="email"
                            class="form-control ${not empty errorEmail ? 'is-invalid':''}"
                            placeholder="name@example.com" path="email" />
                          ${errorEmail}
                        </div>
                        <div class="mb-3 col-md-6 col-12">
                          <c:set var="errorPassword">
                            <form:errors path="password" cssClass="invalid-feedback" />
                          </c:set>
                          <label for="password" class="form-label">Password</label>
                          <form:input type="password" id="password"
                            class="form-control ${not empty errorPassword ? 'is-invalid':''}" path="password" />
                          ${errorPassword}
                        </div>
                        <div class="mb-3 col-md-6 col-12">
                          <label for="phone" class="form-label">Phone number</label>
                          <form:input type="text" id="phone" class="form-control" path="phone" />
                        </div>
                        <div class="mb-3 col-md-6 col-12">
                          <c:set var="errorFullName">
                            <form:errors path="fullname" cssClass="invalid-feedback" />
                          </c:set>
                          <label for="fullname" class="form-label">Full name</label>
                          <form:input type="text" id="fullname"
                            class="form-control ${not empty errorFullName ? 'is-invalid':''}" path="fullname" />
                          ${errorFullName}
                        </div>
                        <div class="mb-3 col-12">
                          <label for="address" class="form-label">Address</label>
                          <form:input type="text" id="address" class="form-control" path="address" />
                        </div>
                        <div class="col-md-6 col-12">
                          <label for="form-select" class="form-label">Role</label>
                          <form:select class="form-select" aria-label="Default select example" id="form-select"
                            path="role.name">
                            <form:option value="ADMIN">ADMIN</form:option>
                            <form:option value="USER">USER</form:option>
                          </form:select>
                        </div>
                        <div class="mb-3 col-md-6 col-12">
                          <label for="avatarFile" class="form-label">Avatar</label>
                          <input class="form-control" type="file" id="avatarFile" name="phantungitFile"
                            accept=".png, .jpg, .jpeg">
                        </div>
                        <div class="col-12 mb-3">
                          <img style="max-height: 250px; display: none;" id="avatarPreview" alt="avatar preview">
                        </div>
                        <div class="col-12 mb-5">
                          <button type="submit" class="btn btn-primary ">Create</button>
                        </div>
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