<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c"
uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>

<title>Quiz</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>
<jsp:include page="/common/header.jsp"/>
<jsp:include page="/common/header.jsp"/>
<div class="container mt-4">

<form action="quiz" method="post">

<c:forEach items="${questions}"
           var="q"
           varStatus="s">

<div class="card mb-4 shadow-sm">

<div class="card-body">

<h5>

Câu ${s.index+1}

</h5>

<p>

${q.questionText}

</p>

<c:if test="${not empty q.image}">

<img src="${q.image}"
     class="img-fluid rounded mb-3"
     style="max-height:250px">

</c:if>

<c:forEach items="${q.options}"
           var="op">

<div class="form-check">

<input
class="form-check-input"
type="radio"
name="q${q.id}"
value="${op}"
required>

<label class="form-check-label">

${op}

</label>

</div>

</c:forEach>

</div>

</div>

</c:forEach>

<button class="btn btn-success">

Nộp bài

</button>

</form>

</div>

</body>
</html>