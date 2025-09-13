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
                <title>Product</title>
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
                                    <li class="breadcrumb-item active">Product</li>
                                </ol>
                                <div class=" mt-5">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="header d-flex justify-content-between">
                                                <h2 class="title d-inline"> product detail with id = ${id}</h2>
                                            </div>
                                            <hr>
                                            <div class="card" style="width: 60%;">
                                                <img src="/images/product/${product.image}" alt="image"
                                                    class="card-img-top">
                                                <div class="card-header">
                                                    product imformation
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">id: ${product.id}</li>
                                                    <li class="list-group-item">name: ${product.name}</li>
                                                    <li class="list-group-item">giá: ${product.price}</li>
                                                </ul>
                                            </div>
                                            <a href="/admin/product" class="btn btn-success mt-5">Back</a>
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