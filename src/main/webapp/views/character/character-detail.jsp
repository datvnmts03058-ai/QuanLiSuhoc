<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<title>${character.name}</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>

<jsp:include page="/common/header.jsp"/>

<!-- HERO HEADER -->
<div class="detail-hero text-white text-center py-5"
     style="background:linear-gradient(135deg,#0F172A,#1E3A8A);">

    <h1 class="fw-bold">${character.name}</h1>
    <p class="text-warning">${character.dynasty}</p>

</div>

<!-- CONTENT -->
<div class="container my-5">

    <div class="row g-4">

        <!-- IMAGE -->
        <div class="col-md-4">

            <div class="card shadow-sm border-0">

                <img src="${pageContext.request.contextPath}/assets/images/characters/${character.image}"
                     class="img-fluid rounded">

            </div>

        </div>

        <!-- INFO -->
        <div class="col-md-8">

            <div class="card shadow-sm border-0 p-4">

                <h3 class="fw-bold mb-3">
                    Tiểu sử
                </h3>

                <p style="line-height:1.8;">
                    ${character.description}
                </p>

                <hr>

                <a href="${pageContext.request.contextPath}/characters"
                   class="btn btn-secondary mt-3">
                    ← Quay lại danh sách
                </a>

            </div>

        </div>

    </div>

</div>

<jsp:include page="/common/footer.jsp"/>

</body>
</html>