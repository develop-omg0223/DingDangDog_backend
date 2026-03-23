<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지 메인(보호소회원)</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/mypage/shelter/mypage_shelter.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/mypage/shelter/mypage_shelter.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />

</head>
<script>
    // 보호소 정보 데이터
    const serverShelterData = {
        shelterName: "${user.shelterName}",
        userNickname: "${user.userNickname}",
        certification: "${user.shelterCertification}",
        userPhone: "${user.userPhone}",
        userEmail: "${user.userEmail}"
    };

    // 멍! 카이브 리스트 데이터
    const serverArchiveData = [
        <c:forEach var="archive" items="${archiveList}" varStatus="status">
            { 
                name: "${archive.dogName}", 
                info: "${archive.dogBreed} | ${archive.dogAge} | ${archive.dogGender}" 
            }${!status.last ? ',' : ''}
        </c:forEach>
    ];
</script>
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
	<main class="mypage-shleter">

		<div class="container">
			<!-- 사이드바 -->
			<jsp:include page="/app/mypage/sidebar.jsp" />


			<section class="content">

				<div class="content-box">

					<article class="panel panel-left">
						<div class="panel-head">
							<h2 class="panel-title">최근 등록한 멍! 카이브</h2>
						</div>
						<div class="panel-body">
							<ul class="archive-list" id="recentArchiveList"></ul>

							</ul>
						</div>
					</article>

					<article class="panel panel-right">
						<div class="panel-head">
							<h2 class="panel-title">보호소 정보</h2>
						</div>

						<div class="panel-body">
							<dl class="info-table">
								<div class="info-row">
									<dt>보호소 명</dt>
									<dd>${user.shelterName}</dd>
								</div>
								<div class="info-row">
									<dt>닉네임</dt>
									<dd>${user.userNickname}</dd>
								</div>
								<div class="info-row">
									<dt>보호소 인증</dt>
									<dd>${user.shelterCertification == 'Y' ? '인증 완료' : '인증 대기'}</dd>
								</div>
								<div class="info-row">
									<dt>보호소 번호</dt>
									<dd>${user.userPhone}</dd>
								</div>
								<div class="info-row">
									<dt>이메일 주소</dt>
									<dd>${user.userEmail}</dd>
								</div>
							</dl>
							<div class="panel-footer panel-footer-right">
								<a class="btn-outline"
									href="${pageContext.request.contextPath}/mypage/checkPw.mp">보호소
									정보 변경</a>
							</div>
						</div>
					</article>

				</div>
			</section>

		</div>
	</main>

	<!-- footer -->
	<jsp:include page="/app/footer.jsp" />
	<!-- js -->
	<script src="/assets/js/header-footer.js"></script>
</body>

</html>