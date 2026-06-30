<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<title>Quiz Lịch Sử</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>
<jsp:include page="/common/header.jsp"/>

<div class="container mt-5">

    <div class="card shadow p-5 text-center">

        <h1 class="mb-4">
            Quiz Lịch Sử Việt Nam
        </h1>

        <p>
            Hệ thống sẽ tạo ngẫu nhiên
            10 câu hỏi từ dữ liệu nhân vật.
        </p>

        <a href="quiz?action=start"
           class="btn btn-primary btn-lg">

            Bắt đầu Quiz

        </a>

    </div>

</div>

</body>
</html>