<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>일반 회원 정보</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/userlist/admin_userlist_detail.css" />
</head>
<body>
	<!-- 전체화면 -->
	<main class="admin-main-container">
		<!-- 사이드바 -->
		<%@ include file="/app/admin/admin_sidebar.jsp"%>
		<!-- 메인 화면 -->
		<section class="admin-main-section">
			<!-- 페이지 상단 (제목, 버튼) -->
			<div class="admin-main-section-header">
				<div class="admin-title">일반 회원 정보</div>
			</div>
			<!-- 페이지 컨텐츠 -->
			<div class="admin-main-content admin-box-shadow">
				<!-- 테이블등 정보 -->
				<div class="admin-detail-row">
					<div class="admin-detail-title">아이디</div>
					<div class="admin-detail-info">${user.userId}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">닉네임</div>
					<div class="admin-detail-info">${user.userNickname}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">이름</div>
					<div class="admin-detail-info">${user.userName}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">생년월일</div>
					<div class="admin-detail-info">${user.userBirth}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">휴대폰번호</div>
					<div class="admin-detail-info">${user.userPhone}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">이메일주소</div>
					<div class="admin-detail-info">${user.userEmail}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">신고횟수</div>
					<div class="admin-detail-info">${user.commonReportCount}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">계정상태</div>
					<c:if test="${user.userStatus eq 'kind'}">
						<div class="admin-detail-info">활성 계정</div>
					</c:if>
					<c:if test="${user.userStatus eq 'withdraw'}">
						<div class="admin-detail-info withdraw-user">탈퇴 계정</div>
					</c:if>

				</div>
			</div>
			<!-- 페이지 하단 (검색, 페이지네이션) -->
			<div class="admin-main-section-footer">
				<div class="btn-container">
					<button
						onclick="location.href = '${pageContext.request.contextPath}/admin/userListOk.ad?userType=C'"
						class="return-btn admin-box-shadow">목록으로</button>
				</div>
			</div>
		</section>
	</main>
</body>
</html>
