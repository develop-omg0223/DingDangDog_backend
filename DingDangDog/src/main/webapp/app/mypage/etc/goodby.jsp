<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/mypage/etc/goodby.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />
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
	<main class="goodby-main">
		<div class="container">
			<div class="container-header">
				<div class="title">
					<h2 class="title-name">회원 탈퇴</h2>
					<hr>
				</div>
			</div>

			<div class="container-body">
				<div class="goodby">
					<h2 class="goodby-message">
						지금까지 저희 사이트를 이용해주셔서 감사합니다.<br> 계정은 삭제되며 정보는 다시 복구되지 않습니다.
					</h2>
				</div>

				<div class="backtomain">
					<a href="${pageContext.request.contextPath}/main.html">메인으로 가기</a>
				</div>
			</div>
		</div>
	</main>
	<!-- footer -->
	<div id="footer-container">
		<%@ include file="/app/footer.jsp"%>
	</div>

</body>

</html>