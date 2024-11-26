<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
 <div class="container mt-5">
    <h1 class="text-center mb-4">Danh sách sản phẩm</h1>
    <div class="mb-3">
        <a href="/admin/products/add" class="btn btn-primary">Thêm sản phẩm</a>
    </div>
    <table class="table table-striped table-hover">
        <thead class="thead-dark">
            <tr>
                <th>Ảnh</th>
                <th>Hãng</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Hành động</th> <!-- Thêm cột Hành động -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td><img src="${product.img}" alt="Ảnh sản phẩm" class="img-fluid" style="width: 50px; height: 50px;"></td>
                    <td>${product.brand}</td>
                    <td>${product.name}</td>
                    <td><fmt:formatNumber value="${product.sellingPrice}" type="number" pattern="#,##0" />₫</td>
                    <td>${product.stock}</td>
                    <td>
                        <a href="/admin/products/delete?id=" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">Thêm số lượng</a>
                   		 <a href="/admin/productInfo/${product.productId}" class="btn btn-warning btn-sm" >Thông tin</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

    <!-- Thêm JavaScript của Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
