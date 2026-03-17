<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>보호소 회원 정보</title>
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
				<div class="admin-title">보호소 회원 정보</div>
			</div>
			<!-- 페이지 컨텐츠 -->
			<div class="admin-main-content admin-box-shadow">
				<!-- 테이블등 정보 -->
				<div class="admin-detail-row">
					<div class="admin-detail-title">아이디</div>
					<div class="admin-detail-info">${user.userId}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">보호소명</div>
					<div class="admin-detail-info">${user.shelterName}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">닉네임</div>
					<div class="admin-detail-info">${user.userNickname}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">주소</div>
					<div class="admin-detail-info">${user.shelterAddress}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">사업자등록번호</div>
					<div class="admin-detail-info">${user.shelterBusinessNumber}</div>
				</div>
				<div class="admin-detail-row">
					<div class="admin-detail-title">첨부파일</div>
					<div class="admin-detail-info">
						<button class="download-btn">download</button>
						파일관련 추가예정
					</div>
				</div>
			</div>
			<!-- 페이지 하단 (검색, 페이지네이션) -->
			<div class="admin-main-section-footer">
				<div class="btn-container">
					<button
						onclick="location.href = '${pageContext.request.contextPath}/admin/userListOk.ad?userType=S'"
						class="return-btn admin-box-shadow">목록으로</button>
					<c:if test="${user.shelterCertification == 'N'}">
						<button id="confirm-btn" class="confirm-btn admin-box-shadow">
							보호소 인증</button>
					</c:if>
				</div>
			</div>
		</section>
	</main>
</body>
<script>
    confirmBtn = document.getElementById("confirm-btn");
    confirmBtn.addEventListener("click", () => {
    	if(confirm("인증을 승인하시겠습니까?")) {
            location.href = "${pageContext.request.contextPath}/admin/userShelterConfirmlOk.ad?userNumber=${user.userNumber}";
        }
    });
  </script>
</html>
