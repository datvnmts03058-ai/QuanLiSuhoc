<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - Sử Môn</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <style>
        body {
            background: #0f172a;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial;
        }

        .login-box {
            width: 380px;
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
        }

        .title {
            text-align: center;
            font-weight: 700;
            margin-bottom: 20px;
            color: #dc3545;
        }

        .btn-login {
            background: #dc3545;
            color: white;
            width: 100%;
        }

        .btn-login:hover {
            background: #b02a37;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<jsp:include page="/common/header.jsp"/>

<div class="login-box">

    <div class="title">Sử Môn - Đăng nhập</div>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login">

        <div class="mb-3">
            <label>Tài khoản</label>
            <input type="text" name="username" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Mật khẩu</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-login">Đăng nhập</button>

    </form>

    <div class="text-center mt-3">
<a href="${pageContext.request.contextPath}/register">
    Chưa có tài khoản? Đăng ký
</a>
    </div>

</div>

</body>
</html>