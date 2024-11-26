<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin người dùng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<div class="container mt-5">
    <h2>Thông tin người dùng</h2>
    <!-- Hiển thị thông tin người dùng -->
    <c:if test="${not empty loggedInUser}">
        <div class="alert alert-info">
            <strong>Tên người dùng:</strong> ${loggedInUser.username}<br>
            <strong>Email:</strong> ${loggedInUser.email}<br>
            <!-- Thêm thông tin người dùng khác nếu cần -->
        </div>
        <a href="logout" class="btn btn-danger">Đăng xuất</a>
    </c:if>
    <c:if test="${empty loggedInUser}">
        <div class="alert alert-warning">
            Bạn chưa đăng nhập!
        </div>
        <a href="login" class="btn btn-primary">Đăng nhập</a>
    </c:if>
</div>

</body>
</html>
