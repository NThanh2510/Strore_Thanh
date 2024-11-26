<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
/* Định dạng popup */
dialog {
	border: none;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	padding: 20px;
	max-width: 400px;
	width: 90%;
}

dialog::backdrop {
	background: rgba(0, 0, 0, 0.5);
}

/* Tiêu đề */
.dialog-header {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

/* Nút trong popup */
.dialog-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.dialog-buttons button {
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
}

.btn-confirm {
	background-color: #007bff;
	color: white;
}

.btn-confirm:hover {
	background-color: #0056b3;
}

.btn-cancel {
	background-color: #6c757d;
	color: white;
}

.btn-cancel:hover {
	background-color: #5a6268;
}
</style>
</head>
<body>
	<div class="mt-5">
		<h1 class="text-center mb-4">Chi tiết sản phẩm: ${product.name}</h1>

		<div class="row">
			<!-- Hình ảnh sản phẩm -->
			<div class="col-md-4 text-center">
				<img src="${product.img}" alt="${product.name}" class="img-fluid"
					style="max-width: 100%; height: auto;">
			</div>

			<!-- Thông tin sản phẩm -->
			<div class="col-md-8">
				<div class="row">
					<!-- Bảng 1 -->
					<div class="col-md-5">
						<table class="table table-bordered">
							
							<tr>
								<th>Hãng</th>
								<td>${product.brand}</td>
							</tr>
							<tr>
								<th>Xuất xứ</th>
								<td>${product.manufacture}</td>
							</tr>
							<tr>
								<th>Tên sản phẩm</th>
								<td>${product.name}</td>
							</tr>
							<tr>
								<th>Giá bán</th>
								<td><fmt:formatNumber value="${product.sellingPrice}"
										type="number" pattern="#,##0" />₫</td>
							</tr>
							<tr>
								<th>Giá nhập</th>
								<td><fmt:formatNumber value="${product.importPrice}"
										type="number" pattern="#,##0" />₫</td>
							</tr>
							<tr>
								<th>Số lượng trong kho</th>
								<td>${product.stock}</td>
							</tr>
							<tr>
								<th>Mô tả</th>
								<td>${product.description}</td>
							</tr>
							<tr>
								<th>Tặng kèm</th>
								<td>${product.gift}</td>
							</tr>
							<tr>
								<th>Chính sách đổi trả</th>
								<td>${product.policy}</td>
							</tr>
						</table>
					</div>

					<!-- Bảng 2 -->
					<div class="col-md-5">
						<table class="table table-bordered">
							<tr>
								<th>Màn hình</th>
								<td>${product.screen}</td>
							</tr>
							<tr>
								<th>Hệ đề hành</th>
								<td>${product.os}</td>
							</tr>
							<tr>
								<th>Camera sau</th>
								<td>${product.rearCamera}</td>
							</tr>

							<tr>
								<th>Camera trước</th>
								<td>${product.frontCamera}</td>
							</tr>
							<tr>
								<th>CPU</th>
								<td>${product.cpu}</td>
							</tr>
							<tr>
								<th>Ram</th>
								<td>${product.ram}</td>
							</tr>
							<tr>
								<th>Bộ nhớ</th>
								<td>${product.storage}</td>
							</tr>
							<tr>
								<th>Dung lượng pin</th>
								<td>${product.batteryCapacity	}</td>
							</tr>
						</table>
					</div>
				</div>

				<!-- Nút thao tác -->
				<div class="mt-4">
					<button type="button" class="btn btn-primary"
						onclick="document.getElementById('editDialog').showModal();">
						Cập nhật</button>
					<a href="/admin/listproducts" class="btn btn-secondary">Quay
						lại</a>
				</div>

				<!-- Dialog để xác nhận -->
				<dialog id="editDialog">
				<div class="dialog-header">Chỉnh sửa thông tin sản phẩm</div>
				<form  action="/admin/productInfo/update" method="post">
					<input type="hidden" name="productId" value="${product.productId}" />
					<label for="name">Tên sản phẩm</label> 
						<input type="text" id="name"
						name="name" class="form-control" value="${product.name}" /> 
					<label
						for="sellingPrice">Giá bán</label> 
						<input type="number"
						id="sellingPrice" name="sellingPrice" class="form-control"
						value="${product.sellingPrice}" /> 
					<label for="stock">Mô tả</label> 
						<input type="text" id="description" name="description"
						class="form-control" value="${product.description}" />
					<label for="stock">Quà tặng kèm</label> 
						<input type="text" id="gift" name="gift"
						class="form-control" value="${product.gift}" />
					<label for="stock">Chính sách đổi trả</label> 
						<input type="text" id="policy" name="policy"
						class="form-control" value="${product.policy}" />
					<div class="dialog-buttons">
						<button type="submit" class="btn-primary">Lưu</button>
						<button type="button" class="btn-cancel"
							onclick="document.getElementById('editDialog').close();">
							Hủy</button>
					</div>
				</form>
				</dialog>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
