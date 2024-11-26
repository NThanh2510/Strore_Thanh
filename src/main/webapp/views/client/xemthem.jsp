<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>Bootstrap Example</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-hash>" crossorigin="anonymous" />
<style>
body {
	background-color: #f5f5f5;
}

.carousel-item {
	transition: transform 0.5s ease;
	/* Thay đổi tốc độ và kiểu hiệu ứng */
}

.product-small {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.product-small:hover {
	transform: scale(1.01);
	/* Phóng to sản phẩm */
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	/* Thêm bóng đổ */
}

.box-text {
	transition: background-color 0.3s ease;
}

.product-small:hover .box-text {
	background-color: rgba(255, 255, 255, 0.8);
	/* Đổi màu nền khi hover */
}

.price {
	transition: color 0.3s ease;
}

.product-small:hover .price {
	color: #FF5722;
	/* Đổi màu giá khi hover */
}

.border {
	border-radius: 10px;
}

.product-small {
	border-radius: 10px;
	/* Bo tròn góc */
	overflow: hidden;
	/* Đảm bảo các phần tử con không vượt ra ngoài góc bo tròn */
}

.btn-modern {
	background: linear-gradient(to right, rgb(20, 53, 195), rgb(20, 53, 195));
	/* Màu gradient giống như nút trong ảnh */
	color: white;
	/* Màu chữ trắng */
	border: none;
	/* Không viền */
	width: 90%;
	height: 30px;
	padding: 10px 30px;
	/* Đệm trong cho nút */
	border-radius: 5px;
	/* Bo góc tròn cho nút */
	font-weight: bold;
	/* Chữ in đậm */
	font-size: 12px;
	/* Cỡ chữ */
	transition: background 0.3s ease;
	/* Hiệu ứng khi di chuột */
}

/* Căn chỉnh radio button và text cho đẹp hơn */
ul.flex {
	list-style-type: none;
	display: flex;
	/* Sử dụng flexbox để hiển thị ngang */
	gap: 20px;
	/* Khoảng cách giữa các tùy chọn */
	padding: 0;
}

ul.flex li {
	display: flex;
	align-items: center;
}

input[type="radio"] {
	width: 15px;
	height: 15px;
	cursor: pointer;
}

/* Tùy chỉnh label */
label {
	font-size: 16px;
	color: #333;
	cursor: pointer;
}
.buttonthemvaogio {
	display: inline-block;
	background-color: rgb(20, 53, 195);
	padding: 10px 30px;
	font-size: 13px;
	color: white;
	text-decoration: none;
	border: 1px solid rgb(20, 53, 195);
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
	font-weight: bold;
}

.buttonthemvaogio:hover {
	background-color: white;
	color: rgb(20, 53, 195);
}
</style>
</head>

<body class=" m-0 p-0">

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


			<div id="carouselExampleFade" class="carousel slide carousel-fade">
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
		</div>
	</header>


	<div class="container mt-3">
		<div class="mb-5 rounded-2 bg-white px-4 py-3">
			<div class="d-flex justify-content-between align-items-center">
				<!-- Sử dụng flexbox để căn chỉnh -->
				<ul class="flex gap-5 mb-0">
					<li>
						<div>
							<input type="radio" id="new-product" name="product" value="new">
							<label for="new-product">Sản phẩm mới</label>
						</div>
					</li>
					<li>
						<div>
							<input type="radio" id="old-product" name="product" value="old">
							<label for="old-product">Sản phẩm cũ</label>
						</div>
					</li>
				</ul>

				<!-- Tạo combobox tìm theo giá -->
				<div class="combobox-right">
					<label for="price-range" class="me-2">Tìm theo giá:</label>
					<!-- Thêm margin cho label -->
					<select id="price-range" class="form-select">
						<option value="all">Tất cả giá</option>
						<option value="below-5">Dưới 5 triệu</option>
						<option value="5-10">Từ 5 triệu đến 10 triệu</option>
						<option value="10-20">Từ 10 triệu đến 20 triệu</option>
						<option value="above-20">Trên 20 triệu</option>
					</select>
				</div>
			</div>
		</div>

		<!-- Vòng lặp hiển thị danh sách sản phẩm -->

		<div id="" class="col pb-2 small-12 large-12">
			<div class="col-inner">

				<div
					class="row large-columns-5 medium-columns-3 small-columns-1 row-small justify-content-center">
					<c:forEach items="${products}" var="product">
						<!-- Hiển thị từng sản phẩm -->
						<div
							class="card col-lg-2 col-md-3 col-sm-4 col-6 p-2 m-1 product-small">
							<div class="p-2 d-flex flex-column justify-content-between"
								style="height: 100%;">
								<div>
									<!-- Nội dung hình ảnh và thông tin sản phẩm -->
									<div class="box-image">
										<div class="image-fade_in_back mt-3">
											<a href="/trangchu/product/${product.productId}" aria-label="${product.name}"> <img
												width="180px" height="159px" src="${product.img}"
												alt="${product.name}">
											</a>
										</div>
									</div>

									<div class="box-text box-text-products px-1 pb-2">
										<div class="title-wrapper">
											<span class="name product-title "> <a
												href="${product.productId}"
												class="text-decoration-none text-uppercase"
												style="font-weight: bold; color: rgb(20, 53, 195); font-family: Roboto, sans-serif;">
													${product.brand} </a>
											</span>
											<div class="item mt-1">
												<span
													style="color: #2c2a2a; font-weight: 400; font-size: 16px; font-family: Roboto, sans-serif;">
													${product.name} </span>
											</div>
											<div class="item mt-3">
												<span
													style="color: #2c2a2a; font-weight: 400; font-size: 13px; font-family: Roboto, sans-serif;">
													${product.description} </span>
											</div>
											<div class="tour_course_list">
												<div class="item">
													<span
														style="color: #236aac; font-weight: bold; font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif; font-size: 20px;">
														<fmt:formatNumber value="${product.sellingPrice}"
															type="number" pattern="#,##0" />₫
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="text-center mt-3 mb-2">
									<c:choose>
										<c:when
											test="${not empty sessionScope.loggedInUser && not empty product.productId}">
											<a href="/cart/add/${product.productId}"
												class="buttonthemvaogio">Thêm vào giỏ</a>
										</c:when>
										<c:otherwise>
											<a href="/checkuserID" class="buttonthemvaogio">Thêm vào
												giỏ</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>


	<!-- test1 -->
	<div class="products">.</div>


	<!-- Footer -->
	<footer class="text-center text-lg-start bg-body-tertiary text-muted">

		<div class="container py-2">
			<h2>
				Đối tác <span style="color: #ff0000;">của chúng tôi</span>
			</h2>
			<ul class="list-unstyled d-flex justify-content-center">
				<li class="me-4"><img src="/LabTaiNguyen/hktravel-1.png"
					style="max-width: 180px; height: auto;" alt="Partner Logo 1">
				</li>
				<li class="me-4"><img
					src="https://hktraveljapan.jp/wp-content/uploads/2024/04/hktravel-5.jpg"
					style="max-width: 210px; height: auto;" alt="Partner Logo 2">
				</li>
				<li class="me-4"><img
					src="https://hktraveljapan.jp/wp-content/uploads/2024/04/hktravel-22.jpg"
					style="max-width: 130px; height: auto;" alt="Partner Logo 3">
				</li>
				<li class="me-4"><img
					src="https://hktraveljapan.jp/wp-content/uploads/2024/04/hktravel-2.jpg"
					style="max-width: 200px; height: auto;" alt="Partner Logo 4">
				</li>
			</ul>
		</div>

		<!-- Section: Social media -->
		<section
			class="d-flex justify-content-center justify-content-lg-between p-4 ">
			<!-- Left -->
			<div class="me-5 d-none d-lg-block">
				<span>Get connected with us on social networks:</span>
			</div>
			<!-- Left -->

			<!-- Right -->
			<div>
				<a href="" class="me-4 text-reset"> <i class="fab fa-facebook-f"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-twitter"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-google"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-instagram"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-linkedin"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-github"></i>
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
						<span class=" fw-bold mb-4">Tại Hà Nội</span> <span>Số 136
							Trần Vỹ, Phường Mai Dịch, Quận Cầu Giấy, Hà Nội, Việt Nam</span>
						<p></p>

						<span class=" fw-bold mb-4">Tại Tokyo:</span> <span>Tòa nhà
							Takeuchi 3F, 1-1-8 Higashiueno, Taito-ku, Tokyo, Nhật Bản</span>
						<p></p>


						<span class=" fw-bold mb-4">Giấy phép kinh doanh quốc tế:</span> <span>
							01-1674/2022/TCDL-GPLHQT</span>
						<p></p>


					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Liên kết</h6>
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
						<h6 class="text-uppercase fw-bold mb-4">Khám phá</h6>
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
							<input class="form-control" aria-required="true"
								aria-invalid="false" placeholder="Tên của bạn" value=""
								type="text" name="tenban">
						</div>
						<div class="mb-3">
							<input class="form-control" aria-required="true"
								aria-invalid="false" placeholder="Số điện thoại" value=""
								type="text" name="sodienthoai">
						</div>
						<button type="submit" class="btn btn-light">Yêu cầu tư
							vấn</button>
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