<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping cart information</title>
<link rel="stylesheet" href="/views/css/cart.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<style>
@charset "UTF-8";


body {
	background: #ddd;
	min-height: 100vh;
	vertical-align: middle;
	
	font-family: sans-serif;
	font-size: 0.8rem;
	font-weight: bold;
}

.title {
	margin-bottom: 5vh;
}

.card {
	margin: auto;
	max-width: 950px;
	width: 90%;
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-radius: 1rem;
	border: transparent;
}

@media ( max-width :767px) {
	.card {
		margin: 3vh auto;
	}
}

.cart {
	background-color: #fff;
	padding: 4vh 5vh;
	border-bottom-left-radius: 1rem;
	border-top-left-radius: 1rem;
}

@media ( max-width :767px) {
	.cart {
		padding: 4vh;
		border-bottom-left-radius: unset;
		border-top-right-radius: 1rem;
	}
}

.summary {
	background-color: #ddd;
	border-top-right-radius: 1rem;
	border-bottom-right-radius: 1rem;
	padding: 4vh;
	color: rgb(65, 65, 65);
}

@media ( max-width :767px) {
	.summary {
		border-top-right-radius: unset;
		border-bottom-left-radius: 1rem;
	}
}

.summary .col-2 {
	padding: 0;
}

.summary .col-10 {
	padding: 0;
}

.row {
	margin: 0;
}

.title b {
	font-size: 1.5rem;
}

.main {
	margin: 0;
	padding: 2vh 0;
	width: 100%;
}

.col-2, .col {
	padding: 0 1vh;
}

a {
	padding: 0 1vh;
}

.close {
	margin-left: auto;
	font-size: 0.7rem;
}

img {
	width: 3.5rem;
}

.back-to-shop {
	margin-top: 4.5rem;
}

h5 {
	margin-top: 4vh;
}

hr {
	margin-top: 1.25rem;
}

form {
	padding: 2vh 0;
}

select {
	border: 1px solid rgba(0, 0, 0, 0.137);
	padding: 1.5vh 1vh;
	margin-bottom: 4vh;
	outline: none;
	width: 100%;
	background-color: rgb(247, 247, 247);
}

input {
	border: 1px solid rgba(0, 0, 0, 0.137);
	padding: 1vh;
	margin-bottom: 4vh;
	outline: none;
	width: 100%;
	background-color: rgb(247, 247, 247);
}

input:focus::-webkit-input-placeholder {
	color: transparent;
}

.btn {
	background-color: #000;
	border-color: #000;
	color: white;
	width: 100%;
	font-size: 0.7rem;
	margin-top: 4vh;
	padding: 1vh;
	border-radius: 0;
}

.btn:focus {
	box-shadow: none;
	outline: none;
	box-shadow: none;
	color: white;
	-webkit-box-shadow: none;
	-webkit-user-select: none;
	transition: none;
}

.btn:hover {
	color: white;
}

a {
	color: black;
}

a:hover {
	color: black;
	text-decoration: none;
}

#code {
	background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253),
		rgba(255, 255, 255, 0.185)),
		url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
	background-repeat: no-repeat;
	background-position-x: 95%;
	background-position-y: center;
}
</style>
</head>



<body>



<header>
<div class=" d-flex justify-content-center align-items-center"
			style="background-color: rgb(20, 53, 195); height: 100px; padding-top: 15px;">



			<nav class="navbar navbar-expand-lg  ">
				<div class="container-fluid ">

					<a class="navbar-brand  " href="TrangChu.html"> <img
						src="/img/logocellphones.jpg" alt="Bootstrap" width="190"
						height="50px">
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
									<li><a class="dropdown-item " href="#">Action</a></li>
									<li><a class="dropdown-item " href="#">Another action</a></li>
								</ul></li>
							<li>
								<div class="search-bar d-flex">
									<input type="search" class="form-control"
										placeholder="Tìm kiếm sản phẩm" aria-label="Search">
									<button class="btn" type="button">
										<i style="color: white" class="fas fa-search"></i>
									</button>
								</div>
							</li>
							<li class="nav-item"><a style="color: white"
								class="nav-link fw-bold " href="tourNB.html">Tin tức</a></li>
							<li class="nav-item"><a style="color: white"
								class="nav-link fw-bold" href="lienhe.html">Liên Hệ</a></li>
							<li class="nav-item"><a style="color: white"
								class="nav-link fw-bold  " href="tourVN.html">Giỏ hàng</a></li>
							<li class="nav-item"><a style="color: white"
								class="nav-link fw-bold"
								href="${not empty sessionScope.loggedInUser ? '#' : '/trangchu/login'}">
									<c:choose>
										<c:when test="${not empty sessionScope.loggedInUser}">
							                ${sessionScope.loggedInUser.username}
							            </c:when>
										<c:otherwise>
							                Đăng nhập <!-- Hiển thị nếu chưa đăng nhập -->
										</c:otherwise>
									</c:choose>
							</a></li>

						</ul>

					</div>
				</div>
			</nav>

		</div>
</header>

   
        <form action="/createbill" method="post">
        
        <div class="card">
		<div class="row">
			<div class="col-md-8 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4>
								<b>Giỏ Hàng</b>
							</h4>
						</div>
						<div class="col align-self-center text-right text-muted">${Count}
							items</div>
					</div>
				</div>
				<c:forEach var="items" items="${cart.items}">
					<form action="">
						<input type="hidden" name="id" value="${items.productId}">
						<div class="row border-top border-bottom">
							<div class="row main align-items-center">
								<div class="col-2">
									<img class="img-fluid" src="${items.img}">
								</div>
								<div class="col">
									
									<div class="row">${items.name}
										<fmt:formatNumber value="${items.sellingPrice}"
											type="number" pattern="#,##0" />
										₫
									</div>
								</div>
								<div class="col">
									<a href="/cart/update/${items.productId}/minus">-</a><a
										href="#" class="border" name="qty">${items.stock}</a> <a
										href="/cart/update/${items.productId}/plus">+</a>
								</div>
								<div class="col">
								<fmt:formatNumber value="${items.sellingPrice *items.stock} "
											type="number" pattern="#,##0" />₫
									<a
										href="/cart/remove/${items.productId}"><span class="close">&#10005;</span></a>
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
				<div class="back-to-shop">
					<a href="/trangchu/index">&leftarrow;<span class="text-muted"> Mua thêm</span></a> <a href="/cart/clear" style="color: #606060;"> Xóa tất cả </a>
				</div>
			</div>
			<div class="col-md-4 summary">
				<div>
					<h5>
						<b>Summary</b>
					</h5>
				</div>
				
				<form>
					<p>NHẬN HÀNG</p>
					<select><option class="text-muted">Nhận hàng tại của hàng</option></select>
					<p>MÃ GIẢM GIÁ (Không khả dụng)</p>
					<input id="code" placeholder="Enter your code">
				</form>
				<div class="row"
					style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
					<div class="col">TỔNG TIỀN</div>
					<div class="col text-right"><fmt:formatNumber value="${Amount}" type="number" pattern="#,##0" />₫</div>
				</div>
				<button formaction="/createbill" type="submit" class="btn">THANH TOÁN</button>
			</div>
		</div>
	</div>
            </form>
</body>

</html>