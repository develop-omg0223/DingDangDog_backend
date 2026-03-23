<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>등록한 멍! 케어 목록 현황</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/mypage/shelter/care_list.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/mypage/shelter/care_list.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />
</head>

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

	<main class="care-list">
		<div class="container">
			<!-- 사이드바 -->
			<jsp:include page="/app/mypage/sidebar.jsp" />

			<section class="content">
				<div class="content-box">
					<div class="panel">
						<div class="panel-head">
							<h2 class="panel-title">등록한 멍! 케어 목록 현황</h2>
						</div>

						<div class="panel-body">
							<div class="review-table">
								<div class="review-table-head">
									<div class="col-number">글 번호</div>
									<div class="col-title">제목</div>
									<div class="col-date">작성일자</div>
									<div class="col-member">신청 인원</div>
								</div>

								<div id="careTableBody"></div>
							</div>

							<div class="panel-footer">
								<div class="pagination">
									<ul class="page-list" id="pagination"></ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	<!-- footer -->
	<jsp:include page="/app/footer.jsp" />
	<!-- js -->
	<script src="/assets/js/header-footer.js"></script>
</body>
<script>

    // 1. 서버에서 보낸 careList를 JS가 쓸 수 있는 careData 배열로 변환
    const careData = [
        <c:forEach var="item" items="${careList}" varStatus="status">
        {
        	careNumber: ${item.careNumber},
        	careTitle: "${item.careTitle}",
        	careDate: "${item.careDate}", 
        	applyStatus: "${item.applyStatus}"
        }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    // 2. 데이터가 잘 들어왔는지 브라우저 콘솔(F12)에서 확인용
    console.log("보호소 등록 목록:", careData);

    // 3. 테이블 그리기 실행 (renderTable 함수가 포함된 updatePage 호출)
    if(careData.length > 0) {
        updatePage();
    } else {
        document.getElementById("careTableBody").innerHTML = 
            "<div class='review-table-row' style='justify-content:center;'>등록한 내역이 없습니다.</div>";
    }
</script>
</html>