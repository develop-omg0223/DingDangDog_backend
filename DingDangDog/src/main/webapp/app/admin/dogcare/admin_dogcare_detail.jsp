<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<title>멍! 케어 게시글</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/dogcare/admin_dogcare_detail.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/dogcare/applystate_modal.js"></script>
</head>

<body>
	<main class="admin-main-container">

		<!-- 사이드바 -->
		<aside class="admin-sidebar">
			<jsp:include page="/app/admin/admin_sidebar.jsp" />
		</aside>

		<section class="admin-main-section">

			<!-- 제목 -->
			<div class="admin-main-section-header">
				<div class="admin-title">멍! 케어 게시글</div>
			</div>

			<!-- 본문 -->
			<div class="admin-main-content">
				<div class="doglog-detail-container">

					<!-- 제목 -->
					<div class="detail-title">${Detail.careTitle}</div>

					<!-- 정보 -->
					<div class="detail-info-container">
						<div class="detail-info-name">작성자 : ${Detail.userNickname}</div>
						<div class="detail-info-caredate">봉사 날짜 : ${Detail.careDate}</div>
						<div class="detail-info-date">작성일 : ${Detail.careWriteDate}</div>
					</div>

					<!-- 내용 -->
					<div class="detail-main-container">${Detail.carePost}</div>

					<!-- 신청 현황 -->
					<div class="detail-footer-container">
						<button class="apply-status" id="applyStatusBtn">
							신청현황 <br> ${Status.applyStatus}
						</button>
					</div>

				</div>
			</div>

			<!-- 하단 버튼 -->
			<div class="admin-main-section-footer">
				<div class="btn-container">

					<!-- 목록 -->
					<button class="btn-backlist btn"
						onclick="location.href='${pageContext.request.contextPath}/admin/adminCareListOk.ad'">
						목록으로</button>

					<!-- 삭제 -->
					<button class="btn-doglog-delete btn" id="deleteBtn"
						onclick="location.href='${pageContext.request.contextPath}/admin/adminCareDeleteOk.ad?careNumber=${Detail.careNumber}'">
						게시글 삭제</button>

				</div>
			</div>

		</section>
	</main>

	<!-- 신청자 목록 모달 -->
	<div id="applyModal" class="modal">

		<div class="modal-content">

			<div class="modal-header">
				<span>신청자 목록</span>
				<button id="modalClose" class="modal-close">X</button>
			</div>

			<div class="modal-body">

				<!-- 헤더 -->
				<div class="apply-header">
					<div>닉네임</div>
					<div>이름</div>
					<div>휴대폰 번호</div>
				</div>

				<!-- 신청자 리스트 -->
				<c:forEach var="apply" items="${ApplyList}">
					<div class="apply-row">
						<div>${apply.userNickname}</div>
						<div>${apply.userName}</div>
						<div>${apply.userPhone}</div>
					</div>
				</c:forEach>

			</div>

		</div>
	</div>

</body>
</html>