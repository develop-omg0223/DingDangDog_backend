<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/login/login.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/login/login.js"></script>
</head>

<body>
	<!-- header -->
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
			<div class="login-header-title">Ding Dong Dog !</div>
			<div class="login-container">
				<div class="login-main">
					<div class="login-main-title">로그인</div>
					<div class="form-container">
						<form action="${pageContext.request.contextPath}/user/loginOk.us"
							method="post">
							<div class="login-main-member">
								<div class="login-main-common-choice" id="commonLogin">일반
									회원</div>
								<div class="login-main-shelter-choice" id="shelterLogin">보호소
									회원</div>
							</div>
							<div class="login-main-container-input">
								<div class="login-main-container-id">
									<input type="hidden" id="userType" name="userType" value="C">
									<label for="user-id" class="login-main-idwriting">아이디</label> <input
										type="text" id="user-id" name="userId" placeholder="아이디" />
								</div>
								<div class="login-main-container-password">
									<label for="user-pw" class="login-main-passwordwriting">비밀번호</label>
									<div class="login-main-input-password">
										<input type="password" id="user-pw" name="userPassword"
											placeholder="비밀번호" />
									</div>
								</div>
								<div class="login-main-input-msg">
									<c:if test="${param.login == 'fail'}">
										<span>아이디 또는 비밀번호가 틀렸습니다.</span>
									</c:if>
								</div>
								<div class="login-btn">
									<input type="submit" value="로그인" />
								</div>
							</div>
						</form>
					</div>
					<div class="login-footer">
						<div class="signup-btn">
							<input type="submit" value="회원가입"
								onclick="window.location.href='${pageContext.request.contextPath}/user/signupChoice.us'" />
						</div>
						<div class="find-pw">
							<input type="submit" value="비밀번호 찾기"
								onclick="window.location.href='${pageContext.request.contextPath}/user/findPw.us'" />
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- footer -->
	<%@ include file="/app/footer.jsp"%>
	<script>
        // 페이지가 로드될 때 URL의 파라미터를 확인합니다.
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const loginStatus = urlParams.get('login');

            if (loginStatus === 'black') {
                alert("⚠️ 해당 계정은 신고 누적으로 인해 활동이 정지되었습니다.\n관리자에게 문의하세요.");
            }
        };
    </script>
</body>
</html>