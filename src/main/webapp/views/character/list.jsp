<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<title>Nhân Vật Lịch Sử</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<style>
.fav-icon{
    font-size:32px;
    cursor:pointer;
    user-select:none;
    color:white;
    -webkit-text-stroke: 2px #d32f2f;
    transition:all .25s ease;
    display:inline-block;
}

.fav-icon:hover{
    transform:scale(1.15);
}

.fav-icon.active{
    color:#e53935;
    -webkit-text-stroke:0;
    transform:scale(1.2);
}
.star {
    font-size: 28px;
    cursor: pointer;
    color: #ccc;
    transition: 0.2s;
}

.star.active {
    color: gold;
}
.fav-icon.loading {
    pointer-events: none;
    opacity: 0.6;
}
</style>
</head>

<body>

<jsp:include page="/common/header.jsp"/>

<div class="container mt-5">

    <h1 class="text-center mb-4 fw-bold">
        Nhân Vật Lịch Sử Việt Nam
    </h1>

    <!-- SEARCH -->
    <form class="row mb-4" method="get"
          action="${pageContext.request.contextPath}/characters">

        <div class="col-md-5">
            <input type="text"
                   name="keyword"
                   value="${keyword}"
                   class="form-control"
                   placeholder="🔍 Tìm nhân vật...">
        </div>

        <!-- FILTER DYNASTY -->
        <div class="col-md-4">
            <select name="dynasty" class="form-control">
                <option value="">-- Tất cả triều đại --</option>

                <option value="Văn Lang" ${dynasty == 'Văn Lang' ? 'selected' : ''}>Văn Lang</option>
                <option value="Âu Lạc" ${dynasty == 'Âu Lạc' ? 'selected' : ''}>Âu Lạc</option>

                <option value="Bắc thuộc" ${dynasty == 'Bắc thuộc' ? 'selected' : ''}>Bắc thuộc</option>
                <option value="Vạn Xuân" ${dynasty == 'Vạn Xuân' ? 'selected' : ''}>Vạn Xuân</option>
                <option value="Tự chủ" ${dynasty == 'Tự chủ' ? 'selected' : ''}>Tự chủ</option>

                <option value="Ngô" ${dynasty == 'Ngô' ? 'selected' : ''}>Ngô</option>
                <option value="Đinh" ${dynasty == 'Đinh' ? 'selected' : ''}>Đinh</option>

                <option value="Nhà Lý" ${dynasty == 'Nhà Lý' ? 'selected' : ''}>Nhà Lý</option>
                <option value="Nhà Trần" ${dynasty == 'Nhà Trần' ? 'selected' : ''}>Nhà Trần</option>
                <option value="Hậu Lê" ${dynasty == 'Hậu Lê' ? 'selected' : ''}>Hậu Lê</option>
                <option value="Tây Sơn" ${dynasty == 'Tây Sơn' ? 'selected' : ''}>Tây Sơn</option>
                <option value="Nhà Nguyễn" ${dynasty == 'Nhà Nguyễn' ? 'selected' : ''}>Nhà Nguyễn</option>

            </select>
        </div>

        <div class="col-md-3">
            <button class="btn btn-danger w-100">Tìm kiếm</button>
        </div>

    </form>

    <!-- LIST -->
    <div class="row g-4">
    <c:forEach items="${characters}" var="c">

        <div class="col-md-4 d-flex">

            <div class="card character-card w-100">

                <div class="card-img-wrapper">
                    <img class="character-img"
                         src="${pageContext.request.contextPath}/assets/images/characters/${c.image}"
                         alt="${c.name}">
                </div>

                <div class="card-body">

                    <h5>${c.name}</h5>

                    <p class="text-muted">${c.dynasty}</p>

                    <p>${c.description}</p>

                    <!-- FAVORITE CHECK -->
                    <c:set var="isFav" value="false"/>

                    <c:forEach items="${favIds}" var="fid">
                        <c:if test="${fid == c.id}">
                            <c:set var="isFav" value="true"/>
                        </c:if>
                    </c:forEach>
					<!-- ⭐ RATING -->
					<div class="mb-2 text-warning">
					
					    <c:forEach begin="1" end="5" var="i">
					
					        <c:choose>
					            <c:when test="${i <= c.avgRating}">
					                ★
					            </c:when>
					            <c:otherwise>
					                ☆
					            </c:otherwise>
					        </c:choose>
					
					    </c:forEach>
					
					    <small class="text-muted">
					        ${c.avgRating}
					    </small>

</div>
                    <!-- FAVORITE -->
                    <div class="mb-3">

                        <span class="fav-icon ${isFav ? 'active' : ''}"
						      data-id="${c.id}"
						      data-user="${sessionScope.user != null ? sessionScope.user.id : 0}">
						     ♥
						</span>

                    </div>

                    <a href="${pageContext.request.contextPath}/characters?id=${c.id}"
                       class="btn btn-outline-danger w-100">
                        Xem chi tiết
                    </a>

                </div>

            </div>

        </div>

    </c:forEach>

</div>
    <!-- PAGINATION -->
    <div class="text-center mt-4">

        <ul class="pagination justify-content-center">

            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                <a class="page-link"
                   href="?page=${currentPage - 1}&keyword=${keyword}&dynasty=${dynasty}">
                    ← Trước
                </a>
            </li>

            <c:forEach begin="1" end="${totalPages}" var="i">

                <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link"
                       href="?page=${i}&keyword=${keyword}&dynasty=${dynasty}">
                        ${i}
                    </a>
                </li>

            </c:forEach>

            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                <a class="page-link"
                   href="?page=${currentPage + 1}&keyword=${keyword}&dynasty=${dynasty}">
                    Sau →
                </a>
            </li>

        </ul>

    </div>

</div>

<jsp:include page="/common/footer.jsp"/>
<script>
document.querySelectorAll(".fav-icon").forEach(icon => {

    icon.addEventListener("click", function () {

        let cid = this.dataset.id;
        let uid = this.dataset.user;

        if (uid == 0) {
            alert("Bạn cần đăng nhập!");
            return;
        }

        fetch("${pageContext.request.contextPath}/favorite", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "uid=" + uid + "&cid=" + cid
        })
        .then(res => res.json())
        .then(data => {

            if (data.error) {
                console.log("Server error");
                return;
            }

            if (data.favorite) {
                this.classList.add("active");
            } else {
                this.classList.remove("active");
            }

        })
        .catch(err => {
            console.log("Fetch lỗi:", err);
        });

    });

});
</script>
</body>
</html>