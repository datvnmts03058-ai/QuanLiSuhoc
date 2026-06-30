<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    String active = (String) request.getAttribute("activePage");
    if (active == null) active = "";
%>

<style>
/* ===== NAVBAR STYLE ===== */
.navbar {
    background: #111;
    padding: 10px 0;
}

.navbar-brand span {
    font-weight: bold;
    color: #fff;
    letter-spacing: 1px;
}

.navbar .nav-link {
    color: #ddd !important;
    transition: 0.2s;
    margin: 0 5px;
}

.navbar .nav-link:hover {
    color: #ffc107 !important;
    transform: translateY(-1px);
}

.navbar .nav-link.active {
    color: #ffc107 !important;
    font-weight: bold;
}

/* USER AVATAR */
.user-avatar {
    width: 34px;
    height: 34px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #ffc107;
}

/* DROPDOWN */
.dropdown-menu {
    border-radius: 10px;
    border: none;
    padding: 8px;
}

/* AI BUTTON */
.ai-btn {
    background: #ffc107;
    color: #111 !important;
    border-radius: 8px;
    padding: 6px 12px;
    font-weight: bold;
    transition: 0.2s;
}

.ai-btn:hover {
    background: #ffdb4d;
}

/* FIX alignment */
.navbar-nav {
    align-items: center;
}
.dropdown-item:hover{
    background:#111827;
    color:#fff;
}
</style>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top shadow">

    <div class="container">

        <!-- LOGO -->
        <a class="navbar-brand d-flex align-items-center"
           href="${pageContext.request.contextPath}/">

            <img src="${pageContext.request.contextPath}/assets/images/logo-su-mon.png"
                 height="42" class="me-2">

            <span>Sử Môn</span>
        </a>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- MENU -->
        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link <%= "home".equals(active) ? "active" : "" %>"
                       href="${pageContext.request.contextPath}/">
                        Trang Chủ
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "timeline".equals(active) ? "active" : "" %>"
                       href="${pageContext.request.contextPath}/timeline">
                        Dòng Thời Gian
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "characters".equals(active) ? "active" : "" %>"
                       href="${pageContext.request.contextPath}/characters">
                        Nhân Vật
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "dynasty".equals(active) ? "active" : "" %>"
                       href="${pageContext.request.contextPath}/dynasties">
                        Triều Đại
                    </a>
                </li>

                <!-- AI BUTTON -->
                <li class="nav-item">
                    <a class="nav-link ai-btn"
                       href="#"
                       onclick="alert('AI đang phát triển'); return false;">
                        🤖 Sử Môn AI
                    </a>
                </li>
                <li class="nav-item">
                <a href="${pageContext.request.contextPath}/quiz">
				    Quiz Lịch Sử
				</a>
                </li>

                <!-- USER -->
				<c:choose>
				
				   <c:when test="${not empty sessionScope.user and activePage ne 'profile'}">
				
				        <li class="nav-item dropdown ms-3">
				
				            <a class="nav-link dropdown-toggle d-flex align-items-center"
				               href="#"
				               data-bs-toggle="dropdown">
				
				                <img
				                    src="${not empty sessionScope.user.avatar 
				                        ? pageContext.request.contextPath.concat('/uploads/').concat(sessionScope.user.avatar)
				                        : pageContext.request.contextPath.concat('/assets/images/default-avatar.png')}"
				                    class="user-avatar"
				                />
				
				                <span class="text-warning ms-2">
				                    ${sessionScope.user.fullname}
				                </span>
				
				            </a>
				
				            <ul class="dropdown-menu dropdown-menu-end shadow">
				
				                <li>
				                    <a class="dropdown-item" href="${pageContext.request.contextPath}/profile">
				                        👤 Hồ sơ
				                    </a>
				                </li>
				
				                <li>
				                    <a class="dropdown-item" href="${pageContext.request.contextPath}/favorites">
				                        ❤️ Yêu thích
				                    </a>
				                </li>
				                <li>
							        <a class="dropdown-item" href="${pageContext.request.contextPath}/library">
							            📚 Lịch sử xem
							        </a>
							    </li>
				
				                <li><hr class="dropdown-divider"></li>
				
				                <li>
				                    <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">
				                        🚪 Đăng xuất
				                    </a>
				                </li>
				
				            </ul>
				
				        </li>
				
				    </c:when>
				
				    <c:otherwise>
				
				        <li class="nav-item ms-3">
				            <a class="btn btn-warning px-4"
				               href="${pageContext.request.contextPath}/login">
				                Đăng Nhập
				            </a>
				        </li>
				
				    </c:otherwise>
				
				</c:choose>

            </ul>

        </div>

    </div>

</nav>