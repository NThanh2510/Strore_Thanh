<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- userInfo.jsp -->
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin người dùng</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-5">
        <h1 class="text-center mb-4">Thông tin của ${user.username}</h1>

        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Thông tin cá nhân</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Tên:</strong> ${user.customerName}</p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Email:</strong> ${user.email}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Địa chỉ:</strong> ${user.address}</p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Số điện thoại:</strong> ${user.phoneNumber}</p>
                    </div>
                </div>
            </div>
            <div class="card-footer text-center">
                <a href="/edit-profile" class="btn btn-primary">Chỉnh sửa thông tin</a>
                <a href="/logout" class="btn btn-danger">Đăng xuất</a>
            </div>
        </div>
        
         <h1 class="text-center mb-4">Đơn hàng gần đây</h1>

        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Thông tin cá nhân</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Tên:</strong> ${user.customerName}</p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Email:</strong> ${user.email}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Địa chỉ:</strong> ${user.address}</p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Số điện thoại:</strong> ${user.phoneNumber}</p>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

    <!-- Link Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
