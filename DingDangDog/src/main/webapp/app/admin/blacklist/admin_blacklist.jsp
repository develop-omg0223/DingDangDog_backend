<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>블랙리스트</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/blacklist/admin_blacklist_list.css" />
</head>
<body>
	<!-- 전체화면 -->
	<main class="admin-main-container">
		<!-- 사이드바 -->
		<%@ include file="/app/admin/admin_sidebar.jsp"%>
		<!-- 메인 화면 -->
		<section class="admin-main-section">
			<!-- 페이지 상단 (제목, 버튼) -->
			<div class="admin-main-section-header">
				<div class="admin-title">블랙리스트</div>
			</div>
			<!-- 페이지 컨텐츠 -->
			<div class="admin-main-content admin-box-shadow">
				<!-- 테이블등 정보 -->

				<div class="blacklist-list-row">
					<!-- <div class="admin-list-header"> -->
					<div class="black-user-number">회원번호</div>
					<div class="black-user-id">아이디</div>
					<div class="black-user-name">이름</div>
					<div class="black-user-nickname">닉네임</div>
					<div class="black-user-phone">휴대폰번호</div>
					<div class="black-user-email">이메일주소</div>
				</div>
				<c:choose>
					<c:when test="${not empty blackList}">
						<c:forEach var="black" items="${blackList}">
							<a class="blacklist-list-row"
								href="${pageContext.request.contextPath}/admin/blackListDetailOk.ad?userNumber=${black.userNumber}">
								<div class="black-user-number">${ black.userNumber}</div>
								<div class="black-user-id">${black.userId }</div>
								<div class="black-user-name">${ black.userName}</div>
								<div class="black-user-nickname">${black.userNickname }</div>
								<div class="black-user-phone">${black.userPhone }</div>
								<div class="black-user-email">${black.userEmail }</div>
							</a>

						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="blacklist-list-row no-data ">
							<div>현재 블랙리스트로 등록된 회원이 없습니다</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 페이지 하단 (검색, 페이지네이션) -->
			<div class="admin-main-section-footer">
				<form
					action="${pageContext.request.contextPath}/admin/blackListOk.ad"
					method="get">

					<div class="search-box">
						<select name="searchType" class="search-select admin-box-shadow">
							<option value="id" ${searchType == 'id' ? 'selected' : ''}>아이디</option>
							<option value="nickname"
								${searchType == 'nickname' ? 'selected' : ''}>닉네임</option>
						</select> <input type="text" name="keyword"
							class="search-input admin-box-shadow" value="${keyword}" />


						<button type="submit" class="btn-search admin-box-shadow">검색</button>
					</div>
				</form>

				<!-- 페이지네이션 -->

				<div class="pagination">
					<ul class="page-list">

						<c:if test="${prev}">
							<li>
								<button class="prev-btn"
									onclick="location.href='${pageContext.request.contextPath}/admin/blackListOk.ad?page=${startPage - 1}'">
									<span>&lt;</span>
								</button>
							</li>
						</c:if>

						<c:set var="realStartPage"
							value="${startPage < 0 ? 0 : startPage}" />
						<c:forEach var="i" begin="${realStartPage}" end="${endPage}">
							<c:choose>
								<c:when test="${!(i == page)}">
									<li>
										<button class="page-item"
											onclick="location.href='${pageContext.request.contextPath}/admin/blackListOk.ad?page=${i}&searchType=${searchType}&keyword=${keyword}'">
											<c:out value="${i}" />
										</button>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<button class="page-item current-page">
											<c:out value="${i}" />
										</button>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${next}">
							<li>
								<button class="next-btn"
									onclick="location.href='${pageContext.request.contextPath}/admin/blackListOk.ad?page=${endPage + 1}'">
									<span>&gt;</span>
								</button>
							</li>
						</c:if>
					</ul>
				</div>


			</div>
		</section>
	</main>
</body>
</html>
