<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>내 정보 변경</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/mypage/common/profile_edit_common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />
<style type="text/css">
.edit-form {
	margin-top: 200px;
}

.password-check-modal-box {
	margin: 0 auto;
}
</style>
</head>

<body>
	<!-- header -->
	<div id="header-container">
		<c:choose>
			<c:when test="${not empty sessionScope.userNumber}">
				<jsp:include page="/app/header_login.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="/app/header_logout.jsp" />
			</c:otherwise>
		</c:choose>

	</div>
	<main class="profile-edit">
		<div class="container">
			<aside class="sidebar">
				<nav class="side-menu">
					<a class="btn-side-link" href="./profile_edit_common.html">내 정보
						변경</a>
					<hr>
					<a class="btn-side-link" href="./volunteer_status_list_common.html">멍!
						케어 신청 확인</a>
					<hr>
					<a class="btn-side-link" href="./review_list.html">내가 작성한 멍! 로그
						목록</a>
					<hr>
					<a class="btn-side-link" href="./support_list_common.html">1 :
						1 문의</a>
				</nav>
			</aside>

			<section class="content">
				<div class="content-box">
					<div class="panel">
						<div class="panel-head">
							<h2 class="panel-title">내 정보 변경</h2>
						</div>
						<div class="panel-body">
							<div class="edit-form">

								<div class="password-check-modal-box">

									<div class="password-check-modal-body">
										<p class="password-check-title">비밀번호 입력</p>

										<div class="password-check-input-row">
											<form
												action="${pageContext.request.contextPath}/mypage/checkPwOk.mp">
												<input type="password" id="password-check-input"
													name="checkPassword" class="password-check-input"
													placeholder="비밀번호를 입력하세요">
												<button type="submit" id="password-check-submit-btn"
													class="password-check-submit-btn">입력</button>
											</form>
										</div>

										<c:if test="${param.checkPw == 'fail'}">
											<p id="password-check-error" class="password-check-error">비밀번호가
												틀렸습니다</p>
										</c:if>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</section>

		</div>




	</main>
	<!-- footer -->
	<div id="footer-container">
		<jsp:include page="/app/footer.jsp" />
	</div>
</body>

</html>