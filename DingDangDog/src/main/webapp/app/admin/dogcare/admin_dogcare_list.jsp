<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>멍! 케어 리스트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/dogcare/admin_dogcare_list.css" />
<script
	src="${pageContext.request.contextPath}/assets/js/admin/admin_dogcare_list.js"></script>
</head>

<body>
	<main class="admin-main-container">

		<!-- 사이드바 -->
		<aside class="admin-sidebar">
			<jsp:include page="/app/admin/admin_sidebar.jsp" />
		</aside>

		<!-- 메인 -->
		<section class="admin-main-section">

			<!-- 제목 -->
			<div class="admin-main-section-header">
				<div class="admin-title">멍! 케어 리스트</div>
			</div>

			<!-- 리스트 영역 -->
			<div class="admin-main-content admin-box-shadow">

				<!-- 헤더 -->
				<div class="admin-dogcare-list-header">
					<div class="dogcare-number">봉사 날짜</div>
					<div class="dogcare-title">제목</div>
					<div class="dogcare-id">신청 현황</div>
					<div class="dogcare-nickname">닉네임</div>
					<div class="dogcare-date">작성 날짜</div>
				</div>

				<!-- 리스트 출력 -->
				<c:forEach var="care" items="${careList}">
					<div class="admin-dogcare-list-row">

						<div class="dogcare-number">${care.careDate}</div>

						<div class="dogcare-title">
							<a
								href="${pageContext.request.contextPath}/admin/adminCareDetailOk.ad?careNumber=${care.careNumber}">
								${care.careTitle} </a>
						</div>

						<div class="dogcare-id">${care.applyStatus}</div>
						<div class="dogcare-nickname">${care.userNickname}</div>
						<div class="dogcare-date">${care.careWriteDate}</div>

					</div>
				</c:forEach>

			</div>
			<!-- 하단 -->
			<div class="admin-main-section-footer">

				<!-- 검색 -->
				<form method="get"
					action="${pageContext.request.contextPath}/admin/adminCareListOk.ad">
					<div class="search-box">
						<!-- 검색 유형을 선택하는 드롭다운 -->
						<select name="type" class="search-select admin-box-shadow">
							<option value="nickname"
								${param.type == 'nickname' ? 'selected' : ''}>닉네임</option>
							<option value="title" ${param.type == 'title' ? 'selected' : ''}>제목</option>
						</select>
						<!-- 검색어 입력 필드 -->
						<input type="text" name="keyword"
							class="search-input admin-box-shadow" value="${param.keyword}"
							placeholder="검색어를 입력하세요" />
						<button type="submit" class="btn-search admin-box-shadow">검색</button>
					</div>
				</form>

				<!-- 페이지네이션 -->
				<div class="pagination">
					<ul class="page-list">

						<!-- 이전 버튼 -->
						<c:if test="${prev}">
							<li><a
								href="${pageContext.request.contextPath}/admin/adminCareListOk.ad?page=${startPage - 1}&type=${type}&keyword=${keyword}">
									<button class="prev-btn">&lt;</button>
							</a></li>
						</c:if>

						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li><a
								href="${pageContext.request.contextPath}/admin/adminCareListOk.ad?page=${i}&type=${type}&keyword=${keyword}">
									<button class="page-item ${i == page ? 'current-page' : ''}">
										${i}</button>
							</a></li>
						</c:forEach>

						<!-- 다음 버튼 -->
						<c:if test="${next}">
							<li><a
								href="${pageContext.request.contextPath}/admin/adminCareListOk.ad?page=${endPage + 1}&type=${type}&keyword=${keyword}">
									<button class="next-btn">&gt;</button>
							</a></li>
						</c:if>

					</ul>
				</div>

			</div>
		</section>
	</main>
</body>
</html>
