<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sử Môn AI</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>

<jsp:include page="/common/header.jsp"/>

<div class="container mt-5">

    <h2>🤖 Sử Môn AI</h2>

    <div class="ai-box">

        <div id="aiMessages" class="ai-messages"></div>

        <input type="text" id="aiInput" placeholder="Hỏi lịch sử...">

        <button onclick="sendMessage()">Gửi</button>

    </div>

</div>

<script>
function sendMessage() {
    let input = document.getElementById("aiInput");
    let msg = input.value.trim();
    if (!msg) return;

    addMsg("Bạn: " + msg);
    input.value = "";

    setTimeout(() => {
        addMsg("AI: " + fakeAI(msg));
    }, 500);
}

function addMsg(text) {
    let box = document.getElementById("aiMessages");
    let div = document.createElement("div");
    div.innerText = text;
    box.appendChild(div);
}

function fakeAI(msg) {
    msg = msg.toLowerCase();

    if (msg.includes("trần hưng đạo"))
        return "Danh tướng nhà Trần.";

    if (msg.includes("quang trung"))
        return "Vua Quang Trung đại phá quân Thanh.";

    return "Mình đang học thêm lịch sử Việt Nam 🇻🇳";
}
</script>

</body>
</html>