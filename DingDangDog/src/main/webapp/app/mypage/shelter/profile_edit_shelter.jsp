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
<script defer
	src="${pageContext.request.contextPath}/assets/js/mypage/common/profile_edit_common.js"></script>
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
					<a class="btn-side-link" href="./profile_edit_shelter.html">보호소
						정보 변경</a>
					<hr>
					<a class="btn-side-link" href="./care_list.html">멍! 케어 목록 및 현황</a>
					<hr>
					<a class="btn-side-link" href="./archive_list.html">멍! 카이브 등록
						정보</a>
					<hr>
					<a class="btn-side-link" href="./support_list_shelter.html">1 :
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

							<form id="edit-profile-form" method="post"
								action="${pageContext.request.contextPath}/mypage/profileEditSOk.mp"
								data-context-path="${pageContext.request.contextPath}">


								<div class="edit-form">
									<div class="edit-row">
										<div class="edit-label">아이디</div>
										<div class="edit-value">${user.userId }</div>
									</div>


									<div class="edit-row edit-row-top">
										<label class="edit-label" for="new-pw">변경 할 비밀번호</label>
										<div class="edit-control">
											<input type="password" id="new-pw" class="edit-input"
												name="userPassword">
											<p id="pw-guide" class="guide-text">영문, 숫자, 특수문자 포함 8자리
												이상</p>
										</div>
									</div>

									<div class="edit-row edit-row-top">
										<label class="edit-label" for="new-pw-check">비밀번호 재확인</label>
										<div class="edit-control">
											<input type="password" id="new-pw-check" class="edit-input"
												value="">
											<p id="pw-check-message" class="guide-text error-text">입력한
												비밀번호가 틀립니다.</p>
										</div>
									</div>

									<div class="edit-row">
										<div class="edit-label">보호소명</div>
										<div class="edit-value">${user.shelterName }</div>
									</div>

									<div class="edit-row">
										<div class="edit-label">보호소 인증</div>
										<div class="file-upload-wrap">
											<input type="file" id="shelter-file-input" class="file-input"
												accept=".pdf,.jpg,.jpeg,.png">
											<button type="button" id="shelter-file-btn"
												class="action-btn">파일등록</button>
											<div id="shelter-file-name" class="file-name-box">첨부파일</div>
										</div>
									</div>



									<div class="edit-row">
										<label class="edit-label" for="nickname">닉네임</label>
										<div class="edit-inline">
											<div class="edit-control">
												<input type="text" id="nickname" class="edit-input"
													name="userNickname" value="${user.userNickname }">
												<p id="nickname-success" class="guide-text info-text">사용
													가능한 닉네임 입니다.</p>
												<p id="nickname-error" class="guide-text error-text">사용
													불가능한 닉네임 입니다.</p>
											</div>
											<button type="button" id="nickname-check-btn"
												class="action-btn">중복확인</button>
										</div>
									</div>

									<div class="edit-row">
										<div class="edit-label">이메일 주소</div>
										<div class="edit-value">${user.userEmail }</div>
									</div>

									<div class="edit-row">
										<label class="edit-label" for="phone">핸드폰 번호</label>
										<div class="edit-inline">
											<div class="edit-control">
												<input type="text" id="phone" class="edit-input"
													name="userPhone" value="${user.userPhone }">
											</div>
											<button type="button" id="send-code-btn" class="action-btn">인증
												번호 전송</button>
										</div>
									</div>

									<div class="edit-row">
										<label class="edit-label" for="verify-code">인증 번호</label>
										<div class="edit-inline">
											<div class="edit-control">
												<input type="text" id="verify-code" class="edit-input"
													value="">
												<p id="verify-message" class="guide-text info-text">번호가
													일치 합니다.</p>
											</div>
											<button type="button" id="verify-code-btn" class="action-btn">인증
												번호 확인</button>
										</div>
									</div>

									<div class="edit-bottom">
										<button type="button" id="complete-btn" class="complete-btn">변경
											완료</button>
									</div>

								</div>
							</form>
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