<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지 메인(일반회원)</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/mypage/common/mypage_common.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/mypage/common/mypage_common.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />

</head>
<script>
    const serverUserData = {
        userName: "${user.userName}",
        userNickname: "${user.userNickname}",
        userBirth: "${user.userBirth}",
        userPhone: "${user.userPhone}",
        userEmail: "${user.userEmail}"
    };

    const serverMatchData = [
        <c:forEach var="match" items="${matchingList}" varStatus="status">
            { 
                // MatchingResultDTO의 실제 필드명 확인 필요 (예: matchingTitle, matchingDate)
                title: "${match.matchingTitle}", 
                date: "${match.matchingDate}" 
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
	<main class="mypage-common">
		<div class="container">
			<!-- 사이드바 -->
			<jsp:include page="/app/mypage/sidebar.jsp" />


			<section class="content">

				<div class="content-box">

					<article class="panel panel-left">
						<div class="panel-head">
							<h2 class="panel-title">${sessionScope.userName}님의멍!매칭 결과</h2>
						</div>

						<div class="panel-body">
							<ul class="match-list">
								<c:choose>
									<c:when test="${not empty matchingList}">
										<c:forEach var="match" items="${matchingList}">
											<li class="match-row">
												<div class="match-title">${match.title}</div>
												<div class="match-date">${match.date}</div>
											</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<li class="match-row">매칭 결과가 없습니다.</li>
									</c:otherwise>
								</c:choose>
							</ul>
							<div class="panel-footer">
								<a class="btn-outline"
									href="${pageContext.request.contextPath}/matching/main.mc">멍!
									매칭 하러가기</a>
							</div>
						</div>
					</article>

					<article class="panel panel-right">
						<div class="panel-head">
							<h2 class="panel-title">내 정보</h2>
						</div>

						<div class="panel-body">
							<dl class="info-table">
								<div class="info-row">
									<dt>이름</dt>
									<dd id="userName_common">${sessionScope.userName}</dd>
								</div>
								<div class="info-row">
									<dt>닉네임</dt>
									<dd id="userNickname_common">${sessionScope.userNickname}</dd>
								</div>
								<div class="info-row">
									<dt>생년월일</dt>
									<dd id="userBirth_common">${sessionScope.userBirth}</dd>
								</div>
								<div class="info-row">
									<dt>핸드폰 번호</dt>
									<dd id="userPhonenumber_common">${sessionScope.userPhone}</dd>
								</div>
								<div class="info-row">
									<dt>이메일 주소</dt>
									<dd id="userEmail_common">${sessionScope.userEmail}</dd>
								</div>
							</dl>

							<div class="panel-footer panel-footer-right">
								<a class="btn-outline"
									href="${pageContext.request.contextPath}/mypage/checkPw.mp">내
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