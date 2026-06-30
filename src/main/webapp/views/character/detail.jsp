<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${character.name}</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.tc-tab-btn {
    cursor: pointer;
    padding: 10px 15px;
    margin-right: 10px;
    border-radius: 8px;
    background: #eee;
    display: inline-block;
    transition: 0.2s;
}

.tc-tab-btn:hover {
    background: #ddd;
}

.tc-tab-btn.active {
    background: #000;
    color: #ddd;
}

.tc-tab-header {
    position: sticky;
    top: 80px;
    background: white;
    z-index: 10;
    border-bottom: 2px solid #eee;
    margin-bottom: 10px;
    padding-top: 10px;
}

.tc-tab-panel {
    display: none;
    opacity: 0;
    transform: translateY(10px);
    transition: all 0.25s ease;
    margin-top: 20px;
}

.tc-tab-panel.active {
    display: block;
    opacity: 1;
    transform: translateY(0);
}

.tc-tab-indicator {
    position: absolute;
    bottom: 0;
    left: 0;
    height: 3px;
    width: 90px;
    background: black;
    transition: all 0.3s ease;
}

.app-header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 70px;
    z-index: 1000;
    background: white;
}

.app-content {
    padding-top: 70px;
}

/* ⭐ rating */
.star{
    font-size:32px;
    cursor:pointer;
    color:#ccc;
    transition:.2s;
}

.star.active{
    color:#ffc107;
}

.star:hover{
    transform:scale(1.2);
}

/* 💡 fun fact */
.fun-fact-card{
    margin-top: 15px;
    padding: 15px;
    border-left: 4px solid #ffc107;
    background: #fff8e6;
    border-radius: 8px;
}

/* 🖼️ IMAGE FIX */
.tc-character-img{
    width: 100%;
    height: 420px;
    object-fit: cover;
    border-radius: 12px;
}

/* 📜 INFO SCROLL (CHỈ DÙNG 1 CLASS DUY NHẤT) */
.info-scroll{
    max-height: 420px;
    overflow-y: auto;
    padding-right: 10px;
}

/* scrollbar đẹp */
.info-scroll::-webkit-scrollbar{
    width: 6px;
}

.info-scroll::-webkit-scrollbar-thumb{
    background: #ccc;
    border-radius: 10px;
}

.info-scroll::-webkit-scrollbar-thumb:hover{
    background: #999;
}
.tc-character-card{
    display: flex;
    align-items: stretch;
}

/* ROW phải full height */
.tc-character-row{
    display: flex;
    align-items: stretch;
}

/* CỘT ẢNH */
.tc-character-img{
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 12px 0 0 12px;
}

/* wrapper ảnh để full height */
.tc-image-box{
    height: 100%;
}

/* cột nội dung */
.tc-character-content{
    height: 100%;
    display: flex;
    flex-direction: column;
}

/* tab content scroll */
.info-scroll{
    flex: 1;
    max-height: 520px;
    overflow-y: auto;
    padding-right: 10px;
}
.tc-tab-panel{
    min-height: 520px;
}
</style>

</head>

<body>

<header class="app-header">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <jsp:include page="/common/header.jsp"/>
</header>

<main class="app-content">

<div class="container mt-4 tc-character-container">

    <div class="card p-3 shadow tc-character-card">

        <div class="row tc-character-row">

            <!-- IMAGE -->
            <div class="col-md-4">
                <img class="img-fluid rounded tc-character-img"
     					src="${pageContext.request.contextPath}/assets/images/characters/${character.image}">
            </div>

            <!-- CONTENT -->
            <div class="col-md-8 tc-character-content">

                <h2 class="tc-character-name">${character.name}</h2>
                <h5 class="text-muted tc-character-dynasty">${character.dynasty}</h5>

                <hr>

                <!-- TAB HEADER -->
                <div class="tc-tab-header">
                    <div class="tc-tab-indicator"></div>

                    <span class="tc-tab-btn active" onclick="openTab(event,'info')">
                        Thông tin
                    </span>
                    <span class="tc-tab-btn" onclick="openTab(event,'achievement')">
					    Thành tựu
					</span>

                    <span class="tc-tab-btn" onclick="openTab(event,'video')">
                        Video
                    </span>

                    <span class="tc-tab-btn" onclick="openTab(event,'map')">
                        Bản đồ
                    </span>
                </div>

                <!-- INFO -->
               <div id="info" class="tc-tab-panel active info-scroll">

				    <!-- 📜 TIỂU SỬ -->
				    <h5>📜 Tiểu sử</h5>
				
				    <p>${character.description}</p>
				    <p>${character.biography}</p>
				
				    <hr>
				
				    <!-- ⭐ (5) GÓC THÚ VỊ -->
					<div class="fun-fact-card">

					    <h5 id="factTitle">
					        🧠 ${funFact.title}
					    </h5>
					
					    <p id="factContent">
					        ${funFact.content}
					    </p>
					
					    <button class="btn btn-sm btn-outline-warning"
					            onclick="loadFact()">
					        🔄 Xem thêm
					    </button>
					
					</div>
				
				</div>
				<!-- ACHIEVEMENT -->
				<div id="achievement" class="tc-tab-panel info-scroll">
				
				    <h5>🏆 Thành tựu</h5>
				
				    <p>${character.achievement}</p>
				
				</div>

                <!-- VIDEO -->
                <div id="video" class="tc-tab-panel info-scroll">
                    <div id="videoBox"></div>

                    <button class="btn btn-dark mt-2" onclick="loadVideo()">
                        ▶ Xem video
                    </button>
                </div>

                <!-- MAP -->
                <div id="map" class="tc-tab-panel info-scroll">

                    <h6>Nơi sinh: ${character.birthPlace}</h6>
                    <h6>Di tích: ${character.historical_site}</h6>

                    <iframe width="100%" height="300"
                        src="https://www.google.com/maps?q=${fn:escapeXml(character.historical_site)}&output=embed">
                    </iframe>

                </div>
                </div>
                </div>
                </div>
				
				<!-- ================= COMMENT FORM ================= -->
				
				<div class="card mt-4 shadow-sm border-0 p-4">
				
				    <h4 class="mb-3">💬 Bình luận & Đánh giá</h4>
				
				    <form method="post"action="${pageContext.request.contextPath}/comment">
				
				        <!-- USER -->
				        <input type="hidden"name="uid"value="1">
				
				        <!-- CHARACTER -->
				        <input type="hidden"name="cid"value="${character.id}">
				
				        <!-- SCORE -->
				        <input type="hidden"name="score"id="scoreInput"value="5">
				
				        <div class="mb-3">
				
				            <span class="star active" data-score="1">★</span>
				            <span class="star active" data-score="2">★</span>
				            <span class="star active" data-score="3">★</span>
				            <span class="star active" data-score="4">★</span>
				            <span class="star active" data-score="5">★</span>
				
				        </div>
				
				        <textarea class="form-control" rows="4"name="content"required 
				        placeholder="Viết cảm nhận của bạn..."></textarea>
				
				        <button class="btn btn-primary mt-3">Gửi đánh giá </button>
				
				    </form>
				
				</div>
				
				<!-- ================= COMMENT LIST ================= -->
				
				<div class="card mt-4 shadow-sm border-0 p-4">
				
				    <h4 class="mb-4">Tất cả bình luận</h4>
				
				    <c:forEach items="${comments}" var="cm">
				
				        <div class="border-bottom pb-3 mb-3">
				
				            <h6 class="fw-bold">User#${cm.id}</h6>
				
				            <div class="text-warning mb-2">
				
				                <c:forEach begin="1" end="5" var="i">
				
				                    <c:choose>
				
				                        <c:when test="${i <= cm.score}">
				                            ★
				                        </c:when>
				
				                        <c:otherwise>
				                            ☆
				                        </c:otherwise>
				
				                    </c:choose>
				
				                </c:forEach>
				
				            </div>
				
				            <p>${cm.content}</p>
				
				            <small class="text-muted">${cm.createdAt}</small>
				
				        </div>
				
				    </c:forEach>
				
				</div>
				</div>
				
				
        


</main>

<script>
function openTab(event, id){

    document.querySelectorAll(".tc-tab-panel")
        .forEach(t => t.classList.remove("active"));

    document.querySelectorAll(".tc-tab-btn")
        .forEach(b => b.classList.remove("active"));

    document.getElementById(id).classList.add("active");

    event.currentTarget.classList.add("active");

    moveLine(event.currentTarget);
}

function moveLine(el){
    const line = document.querySelector(".tc-tab-indicator");
    line.style.width = el.offsetWidth + "px";
    line.style.left = el.offsetLeft + "px";
}



function loadVideo() {

    document.getElementById("videoBox").innerHTML = `
        <iframe
            width="100%"
            height="500"
            src="https://www.youtube.com/embed/${character.youtubeLink}"
            title="YouTube video"
            frameborder="0"
            allowfullscreen>
        </iframe>
    `;
}

window.addEventListener("scroll", () => {

    let sections = document.querySelectorAll(".tab-content");
    let tabs = document.querySelectorAll(".tab-btn");

    let scrollPos = window.scrollY + 100;

    sections.forEach((sec, i) => {
        if (scrollPos >= sec.offsetTop) {

            tabs.forEach(t => t.classList.remove("active"));
            tabs[i].classList.add("active");
        }
    });
});

const stars = document.querySelectorAll(".star");
const scoreInput = document.getElementById("scoreInput");

stars.forEach(star => {

    star.addEventListener("click", () => {

        let score = parseInt(star.dataset.score);

        scoreInput.value = score;

        stars.forEach(s => {

            let value = parseInt(s.dataset.score);

            if(value <= score){
                s.classList.add("active");
            }else{
                s.classList.remove("active");
            }

        });

    });

});


function loadFact() {

    fetch('${pageContext.request.contextPath}/random-fact?characterId=${character.id}')
        .then(response => response.json())
        .then(data => {

            document.getElementById("factTitle").innerHTML =
                "🧠 " + data.title;

            document.getElementById("factContent").innerHTML =
                data.content;
        })
        .catch(error => {
            console.error(error);
        });
}
</script>

<jsp:include page="/common/footer.jsp"/>

</body>
</html>