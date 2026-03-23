<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 소개</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/introduce.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />
</head>
<body>
	<header>
		<c:choose>
			<c:when test="${not empty sessionScope.userNumber}">
				<jsp:include page="/app/header_login.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="/app/header_logout.jsp" />
			</c:otherwise>
		</c:choose>
	</header>

	<main>

		<div class=img-container>
			<img
				src="${pageContext.request.contextPath}/assets/img/banner_Image.png"
				alt="딩댕동 프로젝트 메인 배너" class="introduce-img">
		</div>
		<section class="intro-section">
			<div class="intro-container">
				<div class="intro-text-container">
					<div class="slogan-box">
						<h2 class="sub-title">"가족을 기다리는 발소리, 딩댕동에서 시작됩니다."</h2>
						<p class="highlight-text">사지 말고, 딩댕동 하세요.</p>
					</div>

					<div class="description-box">

						딩댕동은 단순히 갈 곳 없는 강아지들을 보호하는 공간을 넘어, <br> 아이들이 다시 세상 밖으로 나가
						누군가의 소중한 <strong>'가족'</strong>이 되는 기적 같은 연결을 꿈꾸는 <strong>유기견
							매칭 서비스</strong>입니다.<br> 우리는 모든 아이들이 저마다의 고유한 멜로디를 가지고 있다고 믿습니다. <br>
						그 멜로디가 당신의 일상에 행복한 '딩댕동' 소리로 울려 퍼지길 바랍니다. <br> 유기견 매칭 시스템을 통해
						당신과 꼭 맞는 소중한 인연을 찾아보세요.

					</div>
				</div>
				<hr class="divider">

				<div class="value-list">
					<div class="value-item">
						<h3>📍 데이터 기반의 정확한 매칭</h3>
						<p>아이들의 성격과 입양자의 생활 패턴을 세밀하게 분석하여 최적의 가족을 연결합니다.</p>
					</div>

					<div class="value-item">
						<h3>📍 투명하고 신속한 소통</h3>
						<p>1:1 문의를 통해 입양 전후의 모든 과정을 보호소와 직접 소통하며 정보를 확인하세요.</p>
					</div>

					<div class="value-item">
						<h3>📍 평생을 약속하는 동행</h3>
						<p>단순한 입양이 아닌, 한 생명의 평생이 행복할 수 있도록 딩댕동이 끝까지 응원합니다.</p>
					</div>

					<div class="value-item">
						<h3>📍 커뮤니티 '멍!카이브'</h3>
						<p>입양 후의 소중한 일상을 공유하고 다른 반려 가족들과 정보를 나누는 소통의 장입니다.</p>
					</div>
				</div>

			</div>
		</section>
	</main>




	<jsp:include page="/app/footer.jsp" />
</body>
</html>