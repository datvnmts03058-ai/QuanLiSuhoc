<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Dòng Thời Gian Việt Nam</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>

<jsp:include page="/common/header.jsp"/>

<!-- HERO -->
<section class="timeline-hero text-center">
    <div class="container">
        <h1>TÓM TẮT 4000 NĂM LỊCH SỬ VIỆT NAM</h1>
        <p>Hành trình hình thành và phát triển của dân tộc Việt Nam</p>
    </div>
</section>

<!-- TIMELINE CONTENT -->
<section class="container my-5">

    <div class="timeline">

        <!-- 1 -->
        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-content">
                <h4>2879 TCN – 179 TCN</h4>
                <h5>Thời kỳ dựng nước</h5>
                <p>
                    - Hùng Vương lập nước Văn Lang<br>
                    - Văn minh lúa nước hình thành<br>
                    - An Dương Vương lập Âu Lạc, thành Cổ Loa
                </p>
            </div>
        </div>

        <!-- 2 -->
        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-content">
                <h4>179 TCN – 938</h4>
                <h5>Thời kỳ Bắc thuộc</h5>
                <p>
                    - Hơn 1000 năm Bắc thuộc<br>
                    - Hai Bà Trưng (40)<br>
                    - Bà Triệu (248)<br>
                    - Lý Bí lập Vạn Xuân (542)<br>
                    - Mai Thúc Loan (722)<br>
                    - Khúc Thừa Dụ (905)
                </p>
            </div>
        </div>

        <!-- 3 -->
        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-content">
                <h4>938 – 1858</h4>
                <h5>Thời kỳ phong kiến độc lập</h5>
                <p>
                    - 938: Bạch Đằng (Ngô Quyền)<br>
                    - 1010: Dời đô Thăng Long<br>
                    - 1075–1077: Lý Thường Kiệt<br>
                    - 1258–1288: 3 lần chống Nguyên Mông<br>
                    - 1428: Lê Lợi lập Hậu Lê<br>
                    - 1789: Quang Trung đại phá Thanh<br>
                    - 1802: Nhà Nguyễn
                </p>
            </div>
        </div>

        <!-- 4 -->
        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-content">
                <h4>1858 – 1945</h4>
                <h5>Thời kỳ Pháp thuộc</h5>
                <p>
                    - 1858: Pháp xâm lược<br>
                    - 1884: Thuộc địa hóa<br>
                    - Phong trào Cần Vương, Đông Du<br>
                    - 1930: Thành lập Đảng Cộng sản VN<br>
                    - 1945: Cách mạng Tháng Tám
                </p>
            </div>
        </div>

        <!-- 5 -->
        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-content">
                <h4>1945 – 1975</h4>
                <h5>Kháng chiến chống ngoại xâm</h5>
                <p>
                    - 02/09/1945: Tuyên ngôn độc lập<br>
                    - 1946–1954: Kháng chiến chống Pháp<br>
                    - 1954: Điện Biên Phủ<br>
                    - 1955–1975: Kháng chiến chống Mỹ<br>
                    - 30/04/1975: Thống nhất đất nước
                </p>
            </div>
        </div>

        <!-- 6 -->
        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-content">
                <h4>1975 – Nay</h4>
                <h5>Thời kỳ Đổi mới</h5>
                <p>
                    - 1976: Thành lập nước CHXHCN VN<br>
                    - 1986: Đổi mới kinh tế<br>
                    - 2007: Gia nhập WTO<br>
                    - Hiện đại hóa và hội nhập quốc tế
                </p>
            </div>
        </div>

    </div>

</section>

<!-- HIGHLIGHT -->
<section class="container mb-5">

    <h2 class="text-center fw-bold mb-4">CÁC MỐC QUAN TRỌNG NHẤT</h2>

    <div class="row g-3">

        <div class="col-md-4"><div class="stat-card">Văn Lang ra đời</div></div>
        <div class="col-md-4"><div class="stat-card">Cổ Loa – Âu Lạc</div></div>
        <div class="col-md-4"><div class="stat-card">Hai Bà Trưng</div></div>
        <div class="col-md-4"><div class="stat-card">Bạch Đằng 938</div></div>
        <div class="col-md-4"><div class="stat-card">Thăng Long 1010</div></div>
        <div class="col-md-4"><div class="stat-card">3 lần chống Nguyên Mông</div></div>
        <div class="col-md-4"><div class="stat-card">Lam Sơn</div></div>
        <div class="col-md-4"><div class="stat-card">Quang Trung 1789</div></div>
        <div class="col-md-4"><div class="stat-card">Cách mạng 1945</div></div>
        <div class="col-md-4"><div class="stat-card">Điện Biên Phủ</div></div>
        <div class="col-md-4"><div class="stat-card">Thống nhất 1975</div></div>
        <div class="col-md-4"><div class="stat-card">Đổi mới 1986</div></div>

    </div>

</section>

<jsp:include page="/common/footer.jsp"/>

</body>
</html>