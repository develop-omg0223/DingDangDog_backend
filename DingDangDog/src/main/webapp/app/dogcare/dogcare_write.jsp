<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>멍! 케어 일정 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogcare/dogcare_write.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/dogcare/dogcare_write.js"></script>
</head>
<!-- 유저 번호 확인 존재시 로그인 헤더 -->
	<c:choose>
	  <c:when test="${not empty sessionScope.userNumber}">
	    <jsp:include page="/app/header_login.jsp" />
	  </c:when>
	  <c:otherwise>
	    <jsp:include page="/app/header_logout.jsp" />
	  </c:otherwise>
	</c:choose>
<body>

	<main>
		<div class="dogcare-main-container">
			<div class="main-header">
				<div class="main-header-title">멍! 케어</div>
			</div>
			<div class="main-content">
				<div class="content-header">멍! 케어 일정 등록</div>
				<!-- form 시작 -->
				<form action="${pageContext.request.contextPath}/care/writeOk.ca"
					method="post">
					<div class="dogcare-write-container">
						<!-- 제목 -->
						<div class="write-title">제목</div>
						<div class="write-box-container">
							<input class="title-write-box" type="text" name="careTitle"
								placeholder="제목을 입력하세요" required>
							<!-- 모집 인원 -->
							<div class="dogcare-number">
								<label>모집 인원</label> <input type="number" name="careRecruit"
									placeholder="모집 인원" min="1" required />
							</div>
							<!-- 날짜 -->
							<div class="dogcare-date">
								<label>일정</label> <input type="date" name="careDate" required />
							</div>
						</div>
						<!-- 내용 -->
						<div class="write-main-container">
							<div class="write-main">상세 내용</div>
							<div class="input-main">
								<textarea class="input-detail" name="carePost"
									placeholder="내용을 입력하세요" required></textarea>
							</div>
						</div>
						<!-- 버튼 -->
						<div class="detail-footer-container">
							<div>
								<button type="submit" class="btn-dogcare-post">멍! 케어 등록</button>
							</div>
						</div>
					</div>
				</form>
				<!-- form 끝 -->
			</div>
		</div>
	</main>

</body>
</html>