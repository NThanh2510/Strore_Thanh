<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .list-group-item {
            border-bottom: 1px solid #ddd;
            /* Thêm đường phân cách */
        }

        .list-group-item:last-child {
            border-bottom: none;
            /* Bỏ đường phân cách cho mục cuối cùng */
        }

        .value {
            flex-grow: 1;
            /* Cho phép phần giá trị mở rộng */
            text-align: center;
            /* Căn giữa chữ "USA" */
        }

        .specs-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        .specs-container h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .specs-table {
            width: 100%;
            border-collapse: collapse;
        }

        .specs-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            color: #555;
        }


        .specs-table tr:last-child td {
            border-bottom: none;
        }

        .specs-table td:first-child {
            text-align: left;
            font-weight: bold;
            color: #000;
            width: 50%;
        }

        .specs-table td:last-child {
            text-align: left;
        }

        .buttonxemthem {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	color: rgb(20, 53, 195);
	text-decoration: none;
	border: 1px solid rgb(20, 53, 195);
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
    font-weight: bold;
}

.buttonxemthem:hover {
	background-color: rgb(20, 53, 195);
	color: white;
}
    </style>
</head>

<body class=" m-0 p-0" items="${product}" var="product">

    <!-- Example Code -->

    <header>

		<div class=" d-flex justify-content-center align-items-center"
			style="background-color: rgb(20, 53, 195); height: 100px; padding-top: 15px;">



			<nav class="navbar navbar-expand-lg  ">
				<div class="container-fluid ">

					<a class="navbar-brand  " href="/trangchu/index"> <img
						src="/img/logocellphones.jpg" alt="Logo" width="190" height="50px">
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item dropdown nav-link fw-bold  p-0"><a
								style="color: white" class="nav-link dropdown-toggle " href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Danh Mục </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item "
										href="${pageContext.request.contextPath}/trangchu/xemthem?type=Apple">Apple</a></li>
									<li><a class="dropdown-item "
										href="${pageContext.request.contextPath}/trangchu/xemthem?type=SamSung">SamSung</a></li>
								</ul></li>
							<li>
								<form action="/trangchu/search" method="get" class="d-flex">
									<input type="search" class="form-control" name="name"
										placeholder="Tìm kiếm sản phẩm" aria-label="Search">
									<button class="btn" type="submit">
										<i style="color: white" class="fas fa-search"></i>
									</button>
								</form>
							</li>
							<li class="nav-item"><a style="color: white"
								class="nav-link fw-bold " href="tourNB.html">Tin tức</a></li>
							<li class="nav-item"><a style="color: white"
								class="nav-link fw-bold" href="lienhe.html">Liên Hệ</a></li>
							<li class="nav-item"><a style="color: white"
								class="nav-link fw-bold"
								href="${not empty sessionScope.loggedInUser ? '/cart/view' : '/checkuserID'}">Giỏ
									hàng</a></li>
							
							<li>
								<div class="dropdown">
								   <a style="color: white"
									   class="nav-link fw-bold"
									   id="dropdownMenuButton1" 
									   href="${not empty sessionScope.loggedInUser ? '#' : '/trangchu/login'}"
									   <c:choose>
									       <c:when test="${not empty sessionScope.loggedInUser}">
									           data-bs-toggle="dropdown" aria-expanded="false" <!-- Chỉ thêm dropdown toggle khi đã đăng nhập -->
									       </c:when>
									       <c:otherwise>
									           <!-- Không thêm dropdown toggle nếu chưa đăng nhập -->
									       </c:otherwise>
									   </c:choose>
									   >
									    <c:choose>
									        <c:when test="${not empty sessionScope.loggedInUser}">
									            ${sessionScope.loggedInUser.customerName} <!-- Hiển thị tên người dùng nếu đã đăng nhập -->
									        </c:when>
									        <c:otherwise>
									            Đăng nhập <!-- Hiển thị "Đăng nhập" nếu chưa đăng nhập -->
									        </c:otherwise>
									    </c:choose>
									</a>

								   
								    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								        <c:choose>
								            <c:when test="${not empty sessionScope.loggedInUser}">
								                <li><a class="dropdown-item" href="/thong-tin">Thông Tin</a></li> <!-- Link đến trang thông tin cá nhân -->
								                <li><a class="dropdown-item" href="/doi-mat-khau">Đổi mật khẩu</a></li> <!-- Link đến trang đổi mật khẩu -->
								                <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li> <!-- Link đến chức năng đăng xuất -->
								            </c:when>
								            <c:otherwise>
								                <!-- Nếu chưa đăng nhập, không hiển thị dropdown-menu -->
								            </c:otherwise>
								        </c:choose>
								    </ul>
								</div>

								


							</li>

						</ul>

					</div>
				</div>
			</nav>

		</div>
		<div class="container">


			<!-- <div id="carouselExampleFade" class="carousel slide carousel-fade">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="https://lh3.googleusercontent.com/ydH0B2Q35v_F-DYq5O9pmf_6k-CGSpRhab4F_3Gizw7TMIu7hZb3KQkJSAjOSwCSHTTfgYB_q4mX4ggoFsjkRrAYzD5r4Bnv0Q=w1920-rw"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img
							src="https://lh3.googleusercontent.com/vVHMfr4FsOlgWYvJhRDO2v2Qd7lFD2OpT6UCK6ft2W11-dEmNiwlbWAJ3VZK3qYi50fG9jtAl1T5CU1BmMXmOeINPxNiA3QwOQ=w1920-rw"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img
							src="https://lh3.googleusercontent.com/cifETuOUkO9hMpmk7BUufq_ELF9TMYYCAFrlQW7_ysrJqW5KnAEFfQvpjt3pkpnkC1eorNC5k89EpEt1-MUEAGq2g32q5ls=w1920-rw"
							class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleFade" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleFade" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div> -->
	</header>

    <!-- main -->
    <div class="container  ">
        <div class="col-inner">
            <h1 class="fw-bold">${product.name}</h1>
            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div id="carouselExampleFade" class="carousel slide carousel-fade">
                        <div class="carousel-inner text-center">
                            <div class="carousel-item active">
                                <img src="${product.img}" class="d-block w-50 mx-auto" alt="..." >
                            </div>
                            <div class="carousel-item">
                                <img src="/img/banner2.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="/img/banner3.jpg" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    <div class=" ">
                        <div style="background-color: rgb(20, 53, 195); color: #000000;"
                            class="card-header  text-uppercase text-white p-3 text-center fw-bold ">
                            Danh mục
                        </div>
                        <ul class="list-group list-group-flush  font-weight-bold">
                            <li class="list-group-item"><span class="fw-bold">Nhãn Hàng : </span><span
                                    class="">${product.brand}</span></li>
                            <li class="list-group-item"><span class="fw-bold">Tên Sản Phẩm : </span><span
                                    class="">${product.name}</span></li>
                            <li class="list-group-item"><span class="fw-bold">Lựa chọn màu : </span>
                                <button>Xanh</button> <button>Tím</button>
                            </li>
                            <li class="list-group-item"><span class="fw-bold">Sản Xuất : </span><span
                                    class="">${product.manufacture}</span></li>

                        </ul>
                        <div class="text-center">

                            <span class="price fs-2 fw-bold"><span style="color: rgb(20, 53, 195);"><fmt:formatNumber value="${product.sellingPrice}"
																	type="number" pattern="#,##0" />₫</span></span>
                        </div>

                        <div class="cart  p-2">
                            <ul class="list-group list-group-flush  font-weight-bold">
                                <li class="list-group-item"><span class="fw-bold">Tặng kèm : </span><span class="">${product.gift}</span></li>
                                <li class="list-group-item"><span class="fw-bold">Bảo hành : </span><span class="">${product.policy}</span></li>

                                <li class="list-group-item"><span class="fw-bold">Chính sách : </span><span class="">${product.policy}</span></li>

                            </ul>
                            <div class="pt-4"></div>
                            <div class="text-center mt-3 mb-2">
                                <a href="/cart/add/${product.productId}" class="buttonxemthem">THÊM VÀO GIỎ HÀNG</a>
                            </div>
                        </div>
                        <!-- <button type="submit" name="add-to-cart" value="" class="btn btn-primary">Đặt Tour</button> -->
                    </div>
                </div>
            </div>





            <div class="row mt-3">
                <div class="col-lg-8 col-sm-12">
                    <h1 class="text-center">Giới thiệu sản phẩm</h1>
                    <span>Đang cập nhật</span>
                </div>
                <div class="col-lg-4 col-sm-12 ">
                    <div class=" ">
                        <div class="">

                            <div class="specs-container card-header p-3 text-center">
                                <h2>Thông số kỹ thuật</h2>
                                <table class="specs-table">
                                    <tr>
                                        <td>Màn Hình:</td>
                                        <td>${product.screen}</td>
                                    </tr>
                                    <tr>
                                        <td>Hệ điều hành:</td>
                                        <td>${product.os}</td>
                                    </tr>
                                    <tr>
                                        <td>Camera sau:</td>
                                        <td>${product.rearCamera}</td>
                                    </tr>
                                    <tr>
                                        <td>Camera trước:</td>
                                        <td>${product.frontCamera}</td>
                                    </tr>
                                    <tr>
                                        <td>CPU:</td>
                                        <td>${product.cpu}</td>
                                    </tr>
                                    <tr>
                                        <td>Ram:</td>
                                        <td>${product.ram}</td>
                                    </tr>
                                    <tr>
                                        <td>Bộ nhớ trong:</td>
                                        <td>${product.storage}</td>
                                    </tr>
                                    <tr>
                                        <td>Dung lượng pin:</td>
                                        <td>${product.batteryCapacity}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>





                    </div>
                </div>




            </div>
        </div>

    </div>
    <!-- Footer -->
    <footer class="text-center text-lg-start bg-body-tertiary text-muted">

        <div class="container py-2">
            <h2>Đối tác <span style="color: #ff0000;">của chúng tôi</span></h2>
            <ul class="list-unstyled d-flex justify-content-center">
                <li class="me-4">
                    <img src="/LabTaiNguyen/hktravel-1.png" style="max-width: 180px; height: auto;"
                        alt="Partner Logo 1">
                </li>
                <li class="me-4">
                    <img src="https://hktraveljapan.jp/wp-content/uploads/2024/04/hktravel-5.jpg"
                        style="max-width: 210px; height: auto;" alt="Partner Logo 2">
                </li>
                <li class="me-4">
                    <img src="https://hktraveljapan.jp/wp-content/uploads/2024/04/hktravel-22.jpg"
                        style="max-width: 130px; height: auto;" alt="Partner Logo 3">
                </li>
                <li class="me-4">
                    <img src="https://hktraveljapan.jp/wp-content/uploads/2024/04/hktravel-2.jpg"
                        style="max-width: 200px; height: auto;" alt="Partner Logo 4">
                </li>
            </ul>
        </div>


        <!-- Section: Social media -->
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social networks:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3"></i>HOANGKIMVIET.JSC
                        </h6>
                        <span class=" fw-bold mb-4">Tại Hà Nội</span>
                        <span>Số 136 Trần Vỹ, Phường Mai Dịch, Quận Cầu Giấy, Hà Nội, Việt Nam</span>
                        <p></p>

                        <span class=" fw-bold mb-4">Tại Tokyo:</span>
                        <span>Tòa nhà Takeuchi 3F, 1-1-8 Higashiueno, Taito-ku, Tokyo, Nhật Bản</span>
                        <p></p>


                        <span class=" fw-bold mb-4">Giấy phép kinh doanh quốc tế:</span>
                        <span> 01-1674/2022/TCDL-GPLHQT</span>
                        <p></p>


                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Liên kết
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Giới thiệu</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Liên hệ</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Tin tức</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Khảo sát tour</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Khám phá
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Tour Nhật Bản</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Tour Việt-Nhật</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Tour Đài loan</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">Tư vấn</h6>
                        <div class="mb-3">
                            <input class="form-control" aria-required="true" aria-invalid="false"
                                placeholder="Tên của bạn" value="" type="text" name="tenban">
                        </div>
                        <div class="mb-3">
                            <input class="form-control" aria-required="true" aria-invalid="false"
                                placeholder="Số điện thoại" value="" type="text" name="sodienthoai">
                        </div>
                        <button type="submit" class="btn btn-light">Yêu cầu tư vấn</button>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->

        <!-- Copyright -->
    </footer>
    <!-- Footer -->
    <!-- End Example Code -->
    <!-- End Example Code -->
</body>

</html>