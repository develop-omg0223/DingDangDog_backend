<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>멍! 케어 신청확인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/mypage/common/volunteer_status_list_common.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/mypage/common/volunteer_status_list_common.js"></script>
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
	<main class="volunteer_status_list_common">
		<div class="container">
			<!-- 사이드바 -->
			<jsp:include page="/app/mypage/sidebar.jsp" />

			<section class="content">
				<div class="content-box">
					<div class="panel">
						<div class="panel-head">
							<h2 class="panel-title">멍! 케어 신청 확인</h2>
						</div>

						<div class="panel-body">
							<div class="volunteer-table">
								<div class="volunteer-table-head">
									<div class="col-date">봉사 날짜</div>
									<div class="col-title">제목</div>
									<div class="col-name">보호소 명</div>
									<div class="col-cancel">신청 취소</div>
								</div>
								<div id="volunteerTableBody"></div>
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
    // 1. Context Path 전역 변수 설정
    const contextPath = "${pageContext.request.contextPath}";

    // 2. Java의 리스트를 JavaScript 배열로 변환
    const volunteerData = [
        <c:forEach var="care" items="${applyList}" varStatus="status">
            {
                id: ${care.applyNumber},          
                careNumber: ${care.careNumber},   
                date: "${care.careDate}",         
                title: "${care.careTitle}",       
                shelter: "${care.shelterName}"    
            }${!status.last ? ',' : ''}           
        </c:forEach>
    ];
</script>

</html>