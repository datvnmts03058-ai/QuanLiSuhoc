<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    entity.User u = (entity.User) session.getAttribute("user");
    if (u == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }


%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hồ sơ người dùng</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #0f172a;
            color: white;
        }

        .profile-box {
            max-width: 600px;
            margin: 80px auto;
            background: white;
            color: black;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
        }

        .avatar {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: #dc3545;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 32px;
            font-weight: bold;
            margin: auto;
            overflow: hidden;
        }

        .avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .title {
            text-align: center;
            margin-top: 10px;
            font-weight: 700;
            color: #dc3545;
        }

        .info {
            margin-top: 20px;
        }

        .btn-logout {
            background: #dc3545;
            color: white;
            width: 100%;
            margin-top: 20px;
        }

        .btn-back {
            width: 100%;
            margin-top: 10px;
        }
        .avatar-img{
		    width:180px;
		    height:180px;
		    border-radius:50%;
		    object-fit:cover;
		    cursor:pointer;
		    border:4px solid #fff;
		    box-shadow:0 10px 30px rgba(0,0,0,.2);
		    transition:.3s;
		    display:block;
		    margin:auto;
		}
		
		.avatar-img:hover{
		    transform:scale(1.05);
		}
    </style>
</head>

<body>

<jsp:include page="/common/header.jsp"/>

<div class="profile-box">

    <!-- AVATAR -->
<!-- AVATAR -->
<form id="avatarForm"action="${pageContext.request.contextPath}/profile"method="post"
		enctype="multipart/form-data"style="text-align:center;">
    <input type="file"id="avatarInput"name="avatar"accept="image/*" hidden>
    <c:choose>
        <c:when test="${not empty sessionScope.user.avatar}">
            <img id="avatarPreview"
                 src="${pageContext.request.contextPath}/uploads/${sessionScope.user.avatar}"
                 class="avatar-img"
                 title="Nhấn để đổi avatar">
        </c:when>
        <c:otherwise>
            <img id="avatarPreview"
                 src="${pageContext.request.contextPath}/images/default-avatar.png"
                 class="avatar-img"
                 title="Nhấn để tải avatar">
        </c:otherwise>
    </c:choose>
	</form>


   

    <div class="info mt-4">

        <p><b>ID:</b> <%= u.getId() %></p>
        <p><b>Họ tên:</b> <%= u.getFullname() %></p>
        <p><b>Tài khoản:</b> <%= u.getUsername() %></p>
        <p><b>Vai trò:</b> <%= (u.getRole() == null ? "USER" : u.getRole()) %></p>

    </div>

    <!-- UPLOAD AVATAR -->


    <!-- BACK BUTTON -->
    <a href="${pageContext.request.contextPath}/"
       class="btn btn-secondary btn-back">
        ← Quay lại
    </a>

    <!-- LOGOUT -->
    <a href="${pageContext.request.contextPath}/logout"
       class="btn btn-logout">
        Đăng xuất
    </a>

</div>
<script>

const avatarPreview = document.getElementById("avatarPreview");
const avatarInput = document.getElementById("avatarInput");
const avatarForm = document.getElementById("avatarForm");

avatarPreview.addEventListener("click", () => {
    avatarInput.click();
});

avatarInput.addEventListener("change", function(){

    if(this.files.length > 0){

        const reader = new FileReader();

        reader.onload = function(e){
            avatarPreview.src = e.target.result;
        }

        reader.readAsDataURL(this.files[0]);

        setTimeout(() => {
            avatarForm.submit();
        }, 300);
    }

});

</script>
</body>
</html>