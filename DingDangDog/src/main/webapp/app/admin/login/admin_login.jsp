<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자 로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/login/admin_login.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/admin/admin_login.js"></script>
</head>
<body>
	<main class="admin-login-main">
		<div class="login-container admin-box-shadow">
			<header class="site-name">
				<span>Ding Dong DOG !</span>
			</header>

			<div class="login-content">
				<div class="admin-login-title">
					<span>관리자 로그인</span>
				</div>

				<form
					action="${pageContext.request.contextPath}/admin/adminLoginOk.ad"
					method="post" class="login-form">
					<div>
						<input type="text" class="admin-login-input" name="adminId"
							placeholder="아이디" />
					</div>

					<div>
						<input type="password" class="admin-login-input"
							name="adminPassword" placeholder="비밀번호" />
					</div>
					<div id="login-error-msg" class="error-message">
						<c:if test="${param.adminLogin == 'fail'}">
						아이디 혹은 비밀번호가 틀렸습니다
						</c:if>
					</div>
					<div class="login-btn-wrapper">
						<button type="submit" class="login-btn">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>
