<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>멍! 케어 상세페이지-보호소회원</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/dogcare/dogcare_detail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/dogcare/dogcare_list_shelter.css">
<script defer
	src="${pageContext.request.contextPath}/assets/js/dogcare/report_modal.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />

</head>

<body>
	<!-- header -->
	<!-- 유저 번호 확인 존재시 로그인 헤더 -->
		<c:choose>
			<c:when test="${not empty sessionScope.userNumber}">
				<jsp:include page="/app/header_login.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="/app/header_logout.jsp" />
			</c:otherwise>
		</c:choose>
	<main>
		<div class="dogcare-main-container">
			<div class="main-container-header">
				<div class="main-header-title">멍! 케어</div>
			</div>
			<div class="dogcare-detail-container">
				<div class="detail-title">${care.careTitle}</div>
				<div class="detail-info-container">
					<div>작성자 : ${care.userNickname}</div>
					<div class="info-right">
						<div>봉사날짜 : ${care.careDate}</div>
						<div>작성일자 : ${care.careWriteDate}</div>
					</div>
				</div>
				<div class="detail-main-container">
					<div class="detail-main-post">${care.carePost}</div>
				</div>
			</div>
		</div>
		<div class="detail-footer-container">
			<button type="button" class="btn-list" id="btn-Alllist"
				onclick="location.href='${pageContext.request.contextPath}/care/list.ca'">
				목록으로</button>
			<div class="footer-right">
				<div class="apply-status" id="applyStatusBtn">
					신청 현황 <span id="applyCount">${care.applyStatus}</span>
				</div>
				<!-- 세션 값에 따라 수정/삭제 버튼을 보이거나 숨깁니다. -->
				<c:if
					test="${sessionScope.userNumber != null && sessionScope.userNumber == care.userNumber}">
					<form>
						<!-- 수정 버튼 -->
						<button type="button" class="btn-list" id="btn-update"
							onclick="location.href='${pageContext.request.contextPath}/care/update.ca?careNumber=${care.careNumber}'">
							수정하기</button>

						<!-- 삭제 버튼 -->
						<button type="button" class="btn-list" id="deleteBtn"
							onclick="location.href='${pageContext.request.contextPath}/care/delete.ca?careNumber=${care.careNumber}'">
							삭제</button>
					</form>
				</c:if>

			</div>
		</div>
	</main>
	<!-- footer -->
	<jsp:include page="/app/footer.jsp" />
	<!-- js -->
	<script src="/assets/js/header-footer.js"></script>

	<!-- 신고 모달창 -->
	<!-- 신청자 목록을 세션 값에 따라 표시 -->
	<c:if test="${sessionScope.userNumber != null}">
		<div id="applyModal" class="modal">

			<div class="modal-content">

				<div class="modal-header">
					<span>신청자 목록</span>
					<button id="modalClose" class="modal-close">X</button>
				</div>

				<div class="modal-body">

					<div class="apply-header">
						<div>닉네임</div>
						<div>이름</div>
						<div>휴대폰 번호</div>

						<c:if test="${care.careStatus eq 'close'}">
							<div>신고 사유</div>
						</c:if>
					</div>

					<!-- 신청자 목록 -->
					<c:forEach var="user" items="${applyList}" varStatus="status">

						<div class="apply-row">
							<div>${user.userNickname}</div>
							<div>${user.userName}</div>
							<div>${user.userPhone}</div>

							<!-- 신고 form -->
							<c:if test="${care.careStatus eq 'close'}">

								<form
									action="${pageContext.request.contextPath}/care/report.care"
									method="post">

									<!-- 신고 대상 -->
									<input type="hidden" name="userNumber"
										value="${user.userNumber}"> <input type="hidden"
										name="careNumber" value="${care.careNumber}">

									<div class="report-reason">

										<label> <input type="radio" name="reason" value="노쇼"
											required>노쇼
										</label> <label> <input type="radio" name="reason"
											value="태도불량">태도불량
										</label> <label> <input type="radio" name="reason" value="기타">기타
										</label> <input type="text" name="etcReason" placeholder="기타 사유 입력">

										<div>
											<button type="submit" class="report-btn"
												onclick="return confirm('신고하시겠습니까?')">신고</button>
										</div>

									</div>

								</form>

							</c:if>

						</div>

					</c:forEach>

				</div>

			</div>

		</div>
	</c:if>
</body>

</html>