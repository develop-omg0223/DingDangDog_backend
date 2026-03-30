<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/userlist/admin_userlist_list.css" />
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
				<div class="admin-title">회원목록</div>
				<div class="section-header-btns">
					<button id="common-btn"
						class="${userType == 'C' ? 'selected' : ''} admin-box-shadow">일반회원</button>
					<button id="shelter-btn"
						class="${userType == 'S' ? 'selected' : ''} admin-box-shadow">보호소회원</button>
				</div>
			</div>
			<!-- 페이지 컨텐츠 -->
			<div class="admin-main-content admin-box-shadow">
				<!-- 테이블등 정보 -->
				<c:choose>
					<c:when test="${userType == 'C'}">
						<div class="admin-list-header">
							<div class="user-number">회원번호</div>
							<div class="user-id">아이디</div>
							<div class="user-name">이름</div>
							<div class="user-nickname">닉네임</div>
							<div class="user-phone">전화번호</div>
							<div class="user-email">이메일</div>
							<div class="user-status">상태</div>
						</div>

						<c:forEach var="user" items="${userList}">
							<a
								href="${pageContext.request.contextPath}/admin/userCDetailOk.ad?userNumber=${user.userNumber}"
								class="admin-list-row">
								<div class="user-number">${user.userNumber}</div>
								<div class="user-id">${user.userId}</div>
								<div class="user-name">${user.userName}</div>
								<div class="user-nickname">${user.userNickname}</div>
								<div class="user-phone">${user.userPhone}</div>
								<div class="user-email">${user.userEmail}</div> <c:if
									test="${user.userStatus eq 'kind'}">
									<div class="user-status">활성 계정</div>
								</c:if> <c:if test="${user.userStatus eq 'withdraw'}">
									<div class="user-status withdraw-user">탈퇴 계정</div>
								</c:if>
							</a>
						</c:forEach>
					</c:when>

					<c:when test="${userType == 'S'}">
						<div class="admin-list-header">
							<div class="user-number">회원번호</div>
							<div class="user-id">아이디</div>
							<div class="user-shelter-name">보호소명</div>
							<div class="user-phone">전화번호</div>
							<div class="user-email">이메일</div>
							<div class="user-confirm-check">인증상태</div>
						</div>

						<c:forEach var="user" items="${userList}">
							<a
								href="${pageContext.request.contextPath}/admin/userSDetailOk.ad?userNumber=${user.userNumber}"
								class="admin-list-row">
								<div class="user-number">${user.userNumber}</div>
								<div class="user-id">${user.userId}</div>
								<div class="user-shelter-name">${user.shelterName}</div>
								<div class="user-phone">${user.userPhone}</div>
								<div class="user-email">${user.userEmail}</div> <c:if
									test="${user.shelterCertification == 'N'}">
									<div class="user-confirm-check confirm-wait">인증대기</div>
								</c:if> <c:if test="${user.shelterCertification == 'Y'}">
									<div class="user-confirm-check">인증완료</div>
								</c:if>
							</a>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>


			<!-- 페이지 하단 (검색, 페이지네이션) -->
			<div class="admin-main-section-footer">
				<form
					action="${pageContext.request.contextPath}/admin/userListOk.ad"
					method="get">

					<input type="hidden" name="userType" value="${userType}">

					<div class="search-box">
						<select name="searchType" class="search-select admin-box-shadow">
							<option value="id" ${searchType == 'id' ? 'selected' : ''}>아이디</option>
							<c:choose>
								<c:when test="${userType == 'C'}">
									<option value="nickname"
										${searchType == 'nickname' ? 'selected' : ''}>닉네임</option>
								</c:when>
								<c:when test="${userType == 'S'}">
									<option value="shelterName"
										${searchType == 'nickname' ? 'selected' : ''}>보호소명</option>
								</c:when>
							</c:choose>

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
									onclick="location.href='${pageContext.request.contextPath}/admin/userListOk.ad?page=${startPage - 1}&userType=${userType}&searchType=${searchType}&keyword=${keyword}'">
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
											onclick="location.href='${pageContext.request.contextPath}/admin/userListOk.ad?page=${i}&userType=${userType}&searchType=${searchType}&keyword=${keyword}'">
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
									onclick="location.href='${pageContext.request.contextPath}/admin/userListOk.ad?page=${endPage + 1}&userType=${userType}&searchType=${searchType}&keyword=${keyword}'">
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
<script>
      const base = "${pageContext.request.contextPath}";
      const commonBtn = document.getElementById("common-btn");
      const shelterBtn = document.getElementById("shelter-btn");

      commonBtn.addEventListener("click", () => {
        location.href = base + "/admin/userListOk.ad?userType=C";
      });
      shelterBtn.addEventListener("click", () => {
        location.href = base + "/admin/userListOk.ad?userType=S";
      });
    </script>
</html>