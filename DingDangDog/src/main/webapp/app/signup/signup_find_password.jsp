<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>비밀번호 찾기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/signup/signup_find_password.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/signup/signup_phone_check.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.userNumber}">
			<jsp:include page="/app/header_login.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="/app/header_logout.jsp" />
		</c:otherwise>
	</c:choose>

	<main>
		<section>
			<div class="password-header-title">Ding Dong Dong!</div>
			<div class="password-main-container">
				<div class="password-main-header">
					<div class="password-title">비밀번호 찾기</div>
					<div class="password-text">아이디를 입력해주세요</div>
				</div>
				<div class="form-container">
					<form id="find-pw-form"
						action="${pageContext.request.contextPath}/user/findPwOk.us"
						method="post"
						data-context-path="${pageContext.request.contextPath}">

						<div class="password-main-id">
							<div class="password-main-id-detail">
								<div class="password-main-passwordwriting">
									<label for="user-id">아이디</label>
								</div>
								<input type="text" id="user-id" name="userId">
							</div>
							<div class="password-main-id-message">
								<c:if test="${param.find == 'fail'}">
									<span>일치하는 회원 정보가 없습니다</span>
								</c:if>
							</div>
						</div>

						<div class="password-main-phoneNumber">
							<div class="password-main-phoneNumber-input">
								<div class="password-main-phoneNumber-detail">
									<div class="password-main-phoneNumberwriting">
										<label for="user-common-phone">휴대폰번호</label>
									</div>
									<input type="text" id="user-common-phone" name="userPhone">
								</div>
								<div class="phone-common-btn">
									<button type="button" class="btn-transfer">인증번호 전송</button>
								</div>
							</div>
							<div class="main-phone-common-message">
								<p></p>
							</div>
						</div>

						<div class="password-main-verification">
							<div class="password-main-verification-input">
								<div class="password-main-verification-detail">
									<div class="password-main-verificationwriting">
										<label for="user-common-verification">인증번호 입력</label>
									</div>
									<input id="user-common-verification" name="user-verification"
										type="text" disabled>
								</div>
								<div class="verification-common-btn">
									<button type="button" class="btn-check">번호확인</button>
								</div>
							</div>
							<div class="main-verification-common-message">
								<p></p>
							</div>
						</div>

						<div class="btn-container">
							<button type="submit" class="btn-next">다음</button>
						</div>
					</form>
				</div>
			</div>
		</section>
	</main>


	<%@ include file="/app/footer.jsp"%>
</body>
</html>
