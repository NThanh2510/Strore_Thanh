<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	border: 0px solid rgb(65, 63, 63);
	border-radius: 15px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
}

.product-small {
	border-radius: 15px;
	/* Bo tròn góc */
	overflow: hidden;
	/* Đảm bảo các phần tử con không vượt ra ngoài góc bo tròn */
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	width: 30px;
	/* Giảm kích thước icon */
	height: 30px;
	/* Giảm kích thước icon */
	filter: invert(100%) sepia(100%) saturate(5) hue-rotate(180deg);
}

.carousel-control-prev, .carousel-control-next {
	width: 60px;
	/* Giảm kích thước vùng bấm nút */
}

.banner {
	background: linear-gradient(to right, rgb(20, 53, 195), rgb(20, 53, 195));
	/* Màu nền đỏ gradient */
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
	/* Bo góc */
	padding: 20px;
	text-align: center;
	position: relative;
	overflow: hidden;
}

.banner h1 {
	color: white;
	/* Màu chữ trắng */
	font-size: 30px;
	font-weight: bold;
	text-transform: uppercase;
	/* Chữ in hoa */
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
	/* Tạo hiệu ứng đổ bóng cho chữ */
	position: relative;
	z-index: 2;
}

.banner::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: url('path-to-your-confetti-image.png');
	/* Thêm hiệu ứng confetti (nếu có) */
	opacity: 0.5;
	z-index: 1;
}

.banner::after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100px;
	height: 100px;
	z-index: 0;
	opacity: 0.6;
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
}

.buttonxemthem:hover {
	background-color: rgb(20, 53, 195);
	color: white;
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
								          
								                <a class="dropdown-item" href="/info/${sessionScope.loggedInUser.username}">Thông Tin</a>
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

	<!-- main -->
	<main>
		<div class="container ">

			<div>
				<!-- Test San pham moi nhat -->
				<div class="product border mt-3 pb-2">
					<div class="text after-title text-center">
						<div class="banner">
							<h1>TOP SẢN PHẨM NỔI BẬT</h1>
						</div>
					</div>
					<div id="carouselExampleNoiBat" class="carousel slide"
						data-bs-ride="carousel" data-bs-interval="5000">
						<div class="carousel-inner">
							<c:forEach items="${productsNoiBat}" var="product"
								varStatus="status">
								<c:if test="${status.index % 5 == 0}">
									<!-- Mỗi slide có 5 sản phẩm -->
									<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
										<div
											class="row large-columns-5 medium-columns-3 small-columns-2 row-small justify-content-center">
								</c:if>

								<div class="col-lg-2 col-md-3 col-sm-4 col-6 p-2 m-1">
									<div class="border product-small box p-2" style="height: 100%;">
										<div>
											<div class="box-image">
												<div class="image-fade_in_back mt-3">
													<a href="/trangchu/product/${product.productId}"
														aria-label="${product.name}"> <img width="180px"
														height="159px" src="${product.img}" alt="${product.name}" />
													</a>
												</div>
											</div>

											<div class="box-text box-text-products px-1 pb-2 mt-1">
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
													<a href="/checkuserID" class="buttonthemvaogio">Thêm
														vào giỏ</a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>

								<c:if test="${status.index % 5 == 4 || status.last}">
									<!-- Kết thúc slide -->
						</div>
						<!-- Kết thúc row -->
					</div>
					<!-- Kết thúc carousel-item -->
					</c:if>
					</c:forEach>

					<!-- Các nút điều khiển carousel -->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleNoiBat" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleNoiBat" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<div class="text-center mt-3 mb-2">
					<a
						href="${pageContext.request.contextPath}/trangchu/xemthem?type=moinhat"
						class="buttonxemthem">Xem thêm điện thoại</a>
				</div>


			</div>


		</div>



		<!-- Test San pham moi nhat -->
		<div class="product border mt-3 pb-2">
			<div class="text after-title text-center">
				<div class="banner">
					<h1>TOP SẢN PHẨM MỚI NHẤT</h1>
				</div>
			</div>

			<div id="carouselExampleMoiNhat" class="carousel slide"
				data-bs-ride="carousel" data-bs-interval="5000">
				<div class="carousel-inner">
					<c:forEach items="${productsMoiMat}" var="product"
						varStatus="status">
						<c:if test="${status.index % 5 == 0}">
							<!-- Mỗi slide có 5 sản phẩm -->
							<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
								<div
									class="row large-columns-5 medium-columns-3 small-columns-2 row-small justify-content-center">
						</c:if>

						<div class="col-lg-2 col-md-3 col-sm-4 col-6 p-2 m-1">
							<div class="border product-small box p-2" style="height: 100%;">
								<div>
									<div class="box-image">
										<div class="image-fade_in_back mt-3">
											<a href="/trangchu/product/${product.productId}"
												aria-label="${product.name}"> <img width="180px"
												height="159px" src="${product.img}" alt="${product.name}" />
											</a>
										</div>
									</div>

									<div class="box-text box-text-products px-1 pb-2">
										<div class="title-wrapper">
											<span class="name product-title "> <a
												href="/trangchu/product/${product.productId}"
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

						<c:if test="${status.index % 5 == 4 || status.last}">
							<!-- Kết thúc slide -->
				</div>
				<!-- Kết thúc row -->
			</div>
			<!-- Kết thúc carousel-item -->
			</c:if>
			</c:forEach>

			<!-- Các nút điều khiển carousel -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleMoiNhat" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleMoiNhat" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<div class="text-center mt-3 mb-2">
			<a
				href="${pageContext.request.contextPath}/trangchu/xemthem?type=moinhat"
				class="buttonxemthem">Xem thêm điện thoại</a>
		</div>
	</main>



	<!-- Footer -->
	<footer class="text-center text-lg-start text-muted">

		<div class="container py-2 pt-4">
			<h2>
				Đối tác <span style="color: #ff0000;">của chúng tôi</span>
			</h2>
			<ul class="list-unstyled d-flex justify-content-center">
				<li class="me-4"><img
					src="data:image/png;base64,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"
					style="max-width: 180px; height: 130px;" alt="Partner Logo 1">
				</li>
				<li class="me-4"><img
					src="data:image/png;base64,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"
					style="max-width: 180px; height: 130px;" alt="Partner Logo 2">
				</li>
				<li class="me-4"><img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQsAAAC9CAMAAACTb6i8AAAA6lBMVEX///+CuBz///7///z//f+Dtx3///qCuBiBuB6CtyCBuRr//f58swD9//+CuRb///h9tADm79C2zH////V9sACbvkza6Ludvlf///KFtxiFtiD6/+7v+dz5//WOtjfr9N18rg661YuvzXSozGyEryN+uxOzz37q9tOCtSn1/OWiwV3+/+uuzXjY5r3B1pPm79XR5K3G3Z+CryuUv0rQ4LPi8cLI3arX6LOxyoK50ZKavFTs9eOBrRXN4qbl8suPskCsw3OgylO/2KSevmK53YHv+9i92YmMvDnU48Sz0HKZw0e71YPX366ix1i4deCpAAAV9klEQVR4nO1ceV8aydPvOXvuGaQBmQEccEAggqAGE4Mkv83ummQf3//beap6QHsGOTT72b/6m11jDH1V113VIURCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJC4r+Hy7+qRFXzb9T1N++Fqr0yg/u80L6RqrCH/Fv1jdtRVfWtQwS4OlFNzVX5EVyXlKbhP9NU4h48yfMITdNUX0PwP5o4mmj42y74Puze9flI+JSr5tOo+aa0o04BS8CH+SA1/wJffVyXlM+0e+u+78OGTdirj99y0prP8Pk+fc0Mj6Y1H6JuptFwVj/UNH/3mXycP9TyHWyGc9LwHx2xZlgN4QD48XxsDhyvu6p2DDURwAlh1dR113XxC/6ocGr4uQt8o+tHzgc3YSKzPfMRvyeYhIQ7h8Ddwd/jL36f+dZhSR2uG6c74hSwP8192aXKTwYzkDA0D0vnZuvPJzdPT0ej0dlZ6+qq8ozWaHRa5Sc8bjo3lyatmozO8mmuzs5GSRjupkROi/wbHLZGCxbGQbp+xFn4IbRq9UNrM/xshDsHQhCg5+F984+YSWU2HfSebjpZtlymqVdEmi6zztPl/MdI24zYtZX1pKP6fPDUydKUsXwKxnCS2kldff7k89fNQO1DZda9vO/ABmAcBwy67jz1prNVqJXW2FpWhUN0z2+us+VmNAxPl7j1k0n1MCUIqera6I9H2HEUBZTCfwilCP6zIIATdQaTBKQPJbhEUhBUwhn7dDUfxzAfTKU8z0XXs3herWXqZn4BIEREV109NF1SvVh86yDdggD3oNDSyh57HNy2TFjCNX3V3DAJKGUTxZok9UE+XNj/ZlGYLe1UjqCFTu4yRi1DKRPgVThRlA0+am5Y5lgQH11zSfv2fMg8p+/snIF2Rmt2d10tNP2Q4EEuO6kHd7Fv5SDyWG0Bgqa5oIP5DD4qW9ARrYenJaPOzkVt2gw6yWFamHesHzeNYwgBMCwgB/t+BfJXmkbVtbAyyLzAchxni7Ne0I8+5faSwJF0uArz4iRLaeA4lm3vuRC4XsvqR9nnBJTHWr9pnLUucFXFtnbTX6GG480O06J9HVjKsaRQ4mazaQRR+rksf65vThqsb8dxM6BGHO+cwbE77VxGwKbo5ml9nPaRj40gcAx75zCYskmBzgHL7k7JWhGC0ahe9LKob9kwQbzzFNRQ7PThMC1mDLbBVzuWHsBzARufugVNpq7uWR8kTXEsy9o3WTNutrjRU11Q7/UbL6Jwo3CrdryHmxQFGNKygX8di51U10ypkep0GQVIQsvaLSIwlirel71kcMH9IefBM/Uo/x91lfM8sYO3bBhb6sSrmaDzdJgC3BiXjMbsKH0DtDBYC11QApautR71MhTFC24R92EhnAC4vzyFN9B0dEZ8ctGJQGoPwgrifm2/mwjmwE2yl43Ytm0oMQd+y1VwjFKxbVkUhZ2YPigNEwhCyENqWPuEXaSFwibgS8BQ/w+409LfxsMYKY8AYTQMvo3SZwKbgWU+BZ35sAyGe5npZV7vgIiAc+dOvOIg4IiA84Xj8Isx8H5oflnFD7IVKgkTvKrkifUD+0gZMxy2AI0ZktG9F9jlSxXWxjVoE/i/zPvUjr62VVC6XQaf2K0lxBFGnOznCxV2dBm9jADLbiBXRgg06egigd/RhyvfooXdvyQayJiuXXRA4o/g1DUtAqWLkr7KqBNY5VlBKl5Wh9+aTcUqTx0rFrCWr50w5OTdWlqghWX1yP6IBrSwGVtcQQRr73D4WBv3Bp/ni9nsro64XUx797a3xcxAi2wEkZOrfswMp59rm/IWaIAunLf+4uVeVN/oASlmYD3iorak4EEYj43L6WIxu729Xczm02/3MYuc0sxA+eaAqFPmgN+wX+GuEdjexD0QP7hu8pWlw87T+WX34bZy9SE5Dc1tXlKTVbcDjoPtCBQBub8joCvq6QsP2wZyuD004MRRlF7XzgfT2QIJOnuYTk96542bzpKlE43MGRDKsCm4QQEQAfwkyoaXi0pSioTD9sW8kUaOSA+Qn+aY3DGQ3eefOYFtU3Rs1u5++uzG85tIv53uDB3WpADF11qNkjX3aDvDWvBoPsyyAHyDlx0ZRjQHGfu4tF92BJIE/hI4GOCsdyetKp/45XDwRy1MWiOVzJdA2fUQ4HMgIvu5SrQtD447U369oxTkxLFoo5UZlnAzgR2AxmLL8XQCoeRZC8GDwovVZDK5/Zig1dkHcOZ5/GeGKobGpLhz4XMaeoirpRIIwhkr4ECSixi05ssmFTQmFsumZ8BeOs8aYPipahh5Y/CtYwxNHhiYSmN9CBgSsF4LQ0nV3LoNLaxWSfJVWAQ+bin/e4ps0YkBvRGxwceQYNInz2htHH3+Gyy6nxZo2Xj2BhM/e9IlqgmfUcFwBuLqSIvRVxD/wpaCJru5hdgEUzfVPC+zTsjwbJPvax/IRxSrjZzbYDuyOjrkcA9+6So0E8JT3QRBFHjACGwaAyNQUW0arNFan/k5EcQXNU2cQ9uEMLvggpCQPHFEnn9/9YPg7RI3iUVjQp3ok9mAezUEqbWM6HpW5WE9BmsuN9sE03s+T7rxnN8oC8DI0ZztKSiM4RWyz2sbUFVw5sArS9IXIbGQDoZtNAvWlF2GuuuGYZ5p3ZB+k/SEmz6YJcw1RE6LPclSdBNdvd0RZQT0xR9g4DeEAHNkNMEl/P4FPQ5ktQ2BySaBq+HfkFBrUCEgNQK6vBCTSUVaaKhlVHXECs6nsfmP/wG1FB375pa6Q+L/Xgr7FSCRQet1ip4l+/Na+DOYBMvyLs3q7jwg8qFJFp5TOFg6O7BftUrqbL//EmR/hfqRSbffBL9it8VsQWrBdhqCqjAguuqzLlH13XKJyom0skBUhI7X8w+Zft0cB7tpAYaIRifgkx+b3P09YNJW8z9F4oVSZG+BbW0khe/qe8oSKnip6pgNFXFg1jpg+UFKpmkw3EkLuBOaXqn/EVsgwg9/M8cR9UWMYiqQJqDfqybZV6JxQZ/XWSD6SAoEJ+GBfL/aBbvT3E0LizY7p6avHV28ObCcxnPXqPdR32GxBO0Tnz1Mzibzy6dro8SnBhWtqUGDThKCQ7NvS75evRGsTgzuUifRQ8Ga85KEyotFYItNE2zzX5fMUdbks2wwIpbdFy5BCYYOvSRHFVCOApZUTJMrfVAMWKJAvg1HF7fzb7WYsSgK9mTQ8h2xGdlfPtG0kNSFsNgxQFvMfV0s46Bt9fltgKKFnZit7lKIHukQgkD6WAxjYse7+7cIkdOCCFvSkrPVwz+NmyyngjO0Xwu9irSw7tFV3wcVqNEQtC8Eqf0s8VVXpAUvkvArgd9at9+ZJ8bsBuhd759fBRa1aJAekdc9Gtqas8Okcjfv9u6zFIkQADNwY4HfHEgTWGxFtpLjJejuKi3Qwo4G5NQUR/HKLW6oenXXvcfcuCXmdA1L8S5baSFZYlFaO7oodhTM1o/5z1oW8YRF4MDhMYEIwYIBeiHem6HO+eJe0w+ULFWTXPbFaZpDbwIENAvUMEdXkz9Oavw2wD21C9lFQ2EDMgcHRfiZY3jz39KbGpIfq7AETFF11T2/hjvwKE+crPNZim0fWTRBE88mMOcBs6YmsVg4gfA0CyEoDEMVxUdrA08Onq7T/DY4I9oWza8jQKfEAM0wJ+SXXUzcO2nlt+ypyx12kO/wbDGG1aly5LFfp4XiZAkxD3g7rjtjTUHQA4sO8Odh++zHYjAGTsjTPVvTN8GRM2Ij6EdfQRCTFNMeIi2y8EDgtR9Y9QZKtBeNNOr3LXs70f0GQNwIgk/Cg1X4J9D5wjDq/T35+7LxmHNCv++8ntbHeAN1t7fsnvqmW/dogRaG95Mc3VDwGkxdN83VYBk5lnWgMHEQYPIpisjB/SSxGNwpQwjL0giz/zzvDaKws9wDMtLHHIcLiqEXUaXAF+wOVdH7Ae5EZcyaSG4UxteS/sJGoija/ddAC4tmCcToh8LieiEBAm57oARGrGDKGWsAcP3xa4Uzywqi9PrvL6rphoScXitiHATbSxPzkKbaiVAD8Rh9WuL5YSvgzFmwns2jX9wW1kaMvDqA2cO08/RpMY1221RQscH33GPdvShE7GRQSICAxsWkFieKzXPVKCOW4gB9Yk4bBatkWM5Oe/UEoxbV9cMLphRIoTgN0NrvDM3BsXXDu6+emJBC9uBEsbFU1edJeZbd9LoPlVZbg6B5vocxaEy96YFFkVDmTZPau93XvEAEG8FMFy+bOQ6NMHP6I1HXLi3oyK2d9KdEfa/qBHUP0U7Qd8TcXIyFboc3SLCs8zSY1q9G1XCdNwRj2dlziCBGdbGfFHCp7oiBQdg9DS8e56K64cjsaTrBMihcXnUzT61UnaDeFXjr7+QLmHic2ph+eJnQwe6GNKudd+eTymjdKoUZpbzzTm8xa7dCAVqko4O00MjEo/buQrpCsVqWEyHrNC6nDyteDVYxXbkJvTQtScu06GA/xjvtiBpewqYKqjjw4vNF5SzRNjsPcXIt34ELRJ9Hzp76VEwf2/sdP/DxQ/LgWdvlt/WBsE7kpcsO3AZsZJRzgc6ThET3tU3vmk/uSjVPxRsQ83Ayc5sKJtFg/imzhD6koeOwm9tkk5NENnB5g6GGGX3wT1UIYO8DS0xdFHsKbIPem/tpgY4lGVCrUAKzAiPIpZLFtV53Ub9IXnrbsA8qD08gusU2wpym4MUXst9WH635WwnBp/JN3f94XTiYE6TdQ2HeaBmIbSJG8XoNh34/FBCAayd0N+QI0mX8a9wDqWy3jzyOqnX64tKx0Y/fGaO6QIv2TdS3BZ+mn87Inhwlxyy1aCG9VwDQoncoUMTszFORFvTXVes0FwYzVN1yyez1A1wxUeUrTTtovFdtgvTdscCymy/HAXO431MBwRlTuynSwrZpIaVFzw/yhe+WLQD9RTAOwMQ9prK2S2avYR4VtG/TOtRXsROuCUY+ADMuJNqyU13V99FW1ZJl3xbzjdavIRU0BrjwjX1NrAjN17f4otPWeR5LzRt9j7hfV31yxIiGGjRtvYUA4o40t8VoU3Syoj9AT+7uMAad52oT9tIoAarCiP8cikrQdujBhkHkizIt0haYbc4SvDv6iBcEZAQuqpjaoU7nvVEZkP5BZDIITr0VWJc9Lqwf6movEFYH6ah9ZMWeCLqsE626r5kf/YtxSc+wOXlrGFH3bEOgRRx4l2+cQdiR+k1wYZHRvdU+SkBgaOrJUGQCiM+nZwXXC+IKo/YBrOC+Bnbgi0HZjnSSY5q018CiLBlElkgLanv1409fnjAUFRimAShmr3frLdAwxdw10IJVtKXIFwHEm9Ggqpt7cr+upqsPJTepn54fTnm8bB07ZzoBjcVskL1Mjp+hCF1rF0ugwPJf/+IH3rOHQV+kBW12qua4GCAZ1PAaLbKPL0Jdq5RoASHd+QHfvbiTsAKeq6g7HTome/X+HrhaOxM2QzG3FH1FTezqr9l37u+dXour20FzoJmFEN5y7GZsRexkVW4G1lRRJYYQshd6Shw7zRYbagjLu/qzo1nYTbiIrKbodlrsQXsvLTQSdsoN6AZlP1fo96FVw1dO6zdK/DEDMszHQh9IHLCPvnvBjFJgAYF2lF6fz1df2qdVE42kGZph2G63k7NKZfIw7Q6+PdIhLYU1lC3H3VlllLTbVXwVZJpmtVptnyZJMrqq/Lh9eJhOP132vo/rxNfDRknjWOzsgPO/G2pIGlvhf9+yvU5vXr/4Ij51McP2aNS6mCw+3wfCDrBzJHG3fAWF26QAW/lZs/OrMf4+HjcajZubxzh9biALwMnbCs2whxE+kg4fb2r3DUSt1hkOY9565vFxEY2wod7UR2npHoMOLyu9lxZdVtpMHNuG4UT81crjzU3tqcbR6WRD3E/k9cXeTTsAfxvuYlKeJgBn1MKyIA2czSuUIH+QgoRysFslwE610jgKThxPnWCL7QaYWM+DR8z+g1z2WZ0UC5AcUZcc/46sBBjWSsv32QSXwcGcoxLk+Rye04HvedIttgrlfouyOxdbXHvlpktMSKH3YdjPzbz4M56u4/3U6HV/bZZpAR+wLcPIA2eLt/vi8uAQYis2z3WBd+lkH8D89vqlwWzFA513wQQF2cO+IrHsZGF0ESt52ZJfIj+SgV0ShtI0grV7gVUDo29kI534qj6KuaG3QU/kDGMAC2DmlDe358DS2xo2HpP+s1oC1xiiKeAfwSQ/Fis3p89X2yQWDNuxxhoYu6yQFAMWWyZEP+T974IbEv3DI2z/6I5l8QZha7YTjdcJtVUWOQ7ue6uneye8/yMz8Fib9G3Lg45iM9U1K4WnCDa4NWMw1e+mhanp5kUnssRkzrFAzyywIS7MzZ1/kUXYCRzsy9sVwVo6uUvt/p584WsApk2/wJrTqOBmgYM388M3eK4lWmArnfvlyQvowSaCLWBPL3gjbbJJMY1qngOmIdgyKTuAT76q5OImCnbXF15d2KI1XLHWF50TUMVslNeF3wXO3LqpPWTp22mBjGF/vdi01ZoqPuphzeGxbOGA1ndDjbTnWfSmtanFPiPpU1F1GqBlaigf76UFcIWmYaJ09HeHYWuDgkURrqo2tSjDEKpSOb1ypUppxK7/TNRw052GLwBH/8QeduzwQqgod4ZS7PHD/PJjgn2HOKo75Ktbz92/WEHcXn69rqNk+HSxXgiODceKptq7i0QFqpyuTobMi9CQ8y5uulb/yssDVSvfIJYQMUV9Pl2dbq+cPNSYh89OnPxEz8gJgpYFi6FRxC6FHEd70os9jxutGByIl2HC81je+oCPa1jtAqX7UyR2XYDNYsc8OT0Cug4O8tnkcyNDfyqK8DXRxv4FTv6aBZ1IlmL1bDG5amPTuFoOCnVsM0huB50lPvblo/t9B37x90H5oxwsvHTGiy+mkFQFby2sdM87vMIe5Q5WvjaMxHGBl++BLb8OZomug3h/gvkjAV7jX+pMMvPX40CQ0VllMe8OeufjBvqbje/n33snn6af5zN8fTDiz0l4e3WobSuqKkgdj06Tyo9F9+dT7aaT4xfMND4ffOpO55PKWWLyB6zi+vxJtjmqgJN/8nPt6/L1x+fnvcuTk+7nxe3kR+Xs1MRYTQNnIJl+6p08Y/Dp4Q0B/174PsGX0LuSzy+yADTDp7H4jwVgoWTrk5qpuc/tXjuAfrKriX0BvJWfv9NwSbFhYF2nIetn87iya6phqIVu4SU9Ptev/judvi5yBnazYH8+dpXreZSMwTLvsMz/TQ24c/5PSOD3oaZu8QVMgozhuqH5/A9VcORlJ/5un//MxKfWRerk86uqu36jwC2CvonX1/+QB94YvtjAqq6qCYwAvPJbDSgSEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhISEhIS/wH+H3Z2oAUSWUYvAAAAAElFTkSuQmCC"
					style="max-width: 180px; height: 130px;" alt="Partner Logo 3">
				</li>
				<li class="me-4"><img
					src="data:image/png;base64,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"
					style="max-width: 180px; height: 130px;" alt="Partner Logo 4">
				</li>
			</ul>
		</div>

		<!-- Section: Social media -->
		<section
			class="d-flex justify-content-center justify-content-lg-between p-4 container">
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
							<i class="fas fa-gem me-3"></i>ThanhStore
						</h6>
						<span class=" fw-bold mb-4">Tại Thành Phố Hồ Chí Minh:</span> <span>Quận
							12,TP HCM, Việt Nam</span>
						<p></p>

						<span class=" fw-bold mb-4">Tại Thành Phố Hồ Chí Minh:</span> <span>194
							Võ Thị Sáu, Quận 3, TP HCM, Việt Nam</span>
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

					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Khám phá</h6>
						<p>
							<a href="#!" class="text-reset">Apple</a>
						</p>
						<p>
							<a href="#!" class="text-reset">SamSung</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Intel</a>
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