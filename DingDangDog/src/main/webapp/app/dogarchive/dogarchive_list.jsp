<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>멍! 카이브 전체목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogarchive/dogarchive_list.css">
<script defer src="${pageContext.request.contextPath}/assets/js/dogarchive/dogarchive_list.js"></script>
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
		<div class="dogarchive-main-container">
			<div class="main-container-header">
				<div class="main-header-title">멍! 카이브</div>
			</div>

			<div class="dogarchive-list">
				<c:forEach var="dog" items="${archiveList}">
					<div class="dogarchive-card">
						<a href="${pageContext.request.contextPath}/archive/read.ar?dogNumber=${dog.dogNumber}" class="dogarchive-link">
							<div class="dogarchive-image">
								<%-- [수정] DB에 contextPath가 포함되어 있으므로 중복 제거 --%>
								<img src="${dog.archiveImgPath}"
									 alt="${dog.dogName}"
									 style="width: 100%; height: 100%; object-fit: cover;"
									 onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/img/dogarchive/default_dog.png';">
							</div>

							<div class="dogarchive-content">
								<div class="dogarchive-post-title">${dog.dogName}</div>
								<div class="dogarchive-meta">
									<span class="dogarchive-type">${dog.dogBreed}</span> 
									<span class="dogarchive-writer">${dog.shelterName}</span> 
									<span class="dogarchive-date"> 
										등록 날짜 : 
										<c:choose>
											<%-- 날짜 포맷팅 안전장치 --%>
											<c:when test="${not empty dog.dogSafeDate && dog.dogSafeDate.length() >= 10}">
												${dog.dogSafeDate.substring(0, 10)}
											</c:when>
											<c:otherwise>
												${not empty dog.dogSafeDate ? dog.dogSafeDate : '미등록'}
											</c:otherwise>
										</c:choose>
									</span>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>

			<div class="search-box">
				<select class="search-select">
					<option>보호소명</option>
					<option>견종</option>
				</select> 
				<input type="text" class="search-input">
				<button class="btn-search" id="searchBtn">검색</button>
			</div>
		</div>

		<div class="main-container-footer">
			<div class="pagination">
				<ul class="page-list">
					<li><button class="prev-btn"><span>&lt;</span></button></li>
					<li><button class="page-item current-page">1</button></li>
					<li><button class="page-item">2</button></li>
					<li><button class="page-item">3</button></li>
					<li><button class="page-item">4</button></li>
					<li><button class="page-item">5</button></li>
					<li><button class="next-btn"><span>&gt;</span></button></li>
				</ul>
			</div>

			<%-- 보호소 회원(S)인 경우에만 등록 버튼 노출 --%>
			<c:if test="${sessionScope.userType == 'S'}">
				<button type="button" class="btn-write"
					onclick="location.href='${pageContext.request.contextPath}/archive/write.ar'">
					유기견 등록하기</button>
			</c:if>
		</div>
	</main>

	<jsp:include page="/app/footer.jsp" />

	<script src="${pageContext.request.contextPath}/assets/js/header-footer.js"></script>
</body>
</html>