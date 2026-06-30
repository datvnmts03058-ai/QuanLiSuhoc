<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c"
uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>

<title>Kết quả Quiz</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>
<jsp:include page="/common/header.jsp"/>

<div class="container mt-5">

<div class="card shadow p-4">

<h2>

Kết quả Quiz

</h2>

<h3>

${result.correctCount}
/
${result.totalQuestion}

</h3>

<h4>

${result.percentage}%

</h4>

<div class="progress mb-4">

<div
class="progress-bar bg-success"
style="width:${result.percentage}%">

</div>

</div>

<h4>

Các câu sai

</h4>

<c:forEach
items="${result.wrongQuestions}"
var="q">

<div class="card mb-3">

<div class="card-body">

<h6>

${q.questionText}

</h6>

<p class="text-danger">

Bạn chọn:
${q.userAnswer}

</p>

<p class="text-success">

Đáp án đúng:
${q.correctAnswer}

</p>

</div>

</div>

</c:forEach>

<a href="quiz"
class="btn btn-primary">

Làm lại

</a>

</div>

</div>

</body>
</html>