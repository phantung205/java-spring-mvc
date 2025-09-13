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
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#productFile");
                        const orgImage = "${newProduct.image}";

                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#productPreview").attr("src", urlImage);
                            $("#productPreview").css({ "display": "block" });
                        }

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#productPreview").attr("src", imgURL);
                            $("#productPreview").css({ "display": "block" });
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
                                    <li class="breadcrumb-item active">product</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a product</h3>
                                            <hr class="my-4" />
                                            <form:form action="/admin/product/update" method="post"
                                                modelAttribute="newProduct" class="row g-3"
                                                enctype="multipart/form-data">
                                                <div class="mb-3 col-md-6 col-12">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="name" class="form-label">Name</label>
                                                    <form:input type="text" id="name"
                                                        class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                        path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <c:set var="errorPrice">
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="price" class="form-label">Price</label>
                                                    <form:input type="number" id="price"
                                                        class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                        path="price" placeholder="0.0" />
                                                    ${errorPrice}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <c:set var="errorDetailDesc">
                                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="detail-description" class="form-label">Detail
                                                        Description</label>
                                                    <form:textarea id="detail-description"
                                                        class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                        path="detailDesc"></form:textarea>
                                                    ${errorDetailDesc}
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <c:set var="errorShortdesc">
                                                        <form:errors path="shortdesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="short-description" class="form-label">Short
                                                        Description</label>
                                                    <form:input type="text" id="short-description"
                                                        class="form-control ${not empty errorShortdesc ?  'is-invalid' : ''}"
                                                        path="shortdesc" />
                                                    ${errorShortdesc}
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <c:set var="errorQuantity">
                                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="quantity" class="form-label">Quantity</label>
                                                    <form:input type="number" id="quantity"
                                                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                        path="quantity" placeholder="0" />
                                                    ${errorQuantity}
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <label for="form-select" class="form-label">Factory</label>
                                                    <form:select class="form-select" aria-label="Default select example"
                                                        id="form-select" path="factory">
                                                        <form:option value="APPLE">Apple (MaBook)</form:option>
                                                        <form:option value="ASUS">Asus</form:option>
                                                        <form:option value="LENOVO">Lenovo</form:option>
                                                        <form:option value="DELL">Dell</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="ACER">Acer</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <label for="form-select-target" class="form-label">Target:</label>
                                                    <form:select class="form-select" aria-label="Default select example"
                                                        id="form-select-target" path="target">
                                                        <form:option value="GAMING">Gaming</form:option>
                                                        <form:option value="SINHVIEN-VANPHONG">Sinh viên - văn phòng
                                                        </form:option>
                                                        <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                        </form:option>
                                                        <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                        <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <label for="image" class="form-label">Image</label>
                                                    <input class="form-control" type="file" id="productFile"
                                                        name="phantungitFile" accept=".png, .jpg, .jpeg">
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;" id="productPreview"
                                                        alt="product preview">
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

                <script src="js/scripts.js"></script>
            </body>

            </html>