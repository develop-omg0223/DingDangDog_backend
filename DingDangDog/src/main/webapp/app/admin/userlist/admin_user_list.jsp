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
		<aside class="admin-sidebar"></aside>
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
						</div>

						<c:forEach var="user" items="${userList}">
							<a
								href="${pageContext.request.contextPath}/admin/userDetailOk.ad?userNumber=${user.userNumber}&userType=C"
								class="admin-list-row">
								<div class="user-number">${user.userNumber}</div>
								<div class="user-id">${user.userId}</div>
								<div class="user-name">${user.userName}</div>
								<div class="user-nickname">${user.userNickname}</div>
								<div class="user-phone">${user.userPhone}</div>
								<div class="user-email">${user.userEmail}</div>
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
								href="${pageContext.request.contextPath}/admin/userDetailOk.ad?userNumber=${user.userNumber}&userType=S"
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
				<div class="search-box">
					<select class="search-select admin-box-shadow">
						<option>아이디</option>
						<option>닉네임</option>
					</select> <input type="text" class="search-input admin-box-shadow" />
					<button class="btn-search admin-box-shadow">검색</button>
				</div>

				<!-- 페이지네이션 -->
				<!-- 페이지네이션 정리 -->
				<!-- 
				<div class="pagination">
					<ul class="page-list">
						<li>
							<button class="prev-btn">
								<span>&lt;</span>
							</button>
						</li>
						<li>
							<button class="page-item current-page">1</button>
						</li>
						<li>
							<button class="page-item">2</button>
						</li>
						<li>
							<button class="page-item">3</button>
						</li>
						<li>
							<button class="page-item">4</button>
						</li>
						<li>
							<button class="page-item">5</button>
						</li>
						<li>
							<button class="next-btn">
								<span>&gt;</span>
							</button>
						</li>
					</ul>
				</div> -->

				<div class="pagination">
					<ul>
						<c:if test="${prev}">
							<li><a
								href="${pageContext.request.contextPath}/admin/userListOk.ad?page=${startPage - 1}&userType=${userType}"
								class="prev">&lt;</a></li>
						</c:if>

						<c:set var="realStartPage"
							value="${startPage < 0 ? 0 : startPage}" />

						<c:forEach var="i" begin="${realStartPage}" end="${endPage}">
							<c:choose>
								<c:when test="${!(i == page)}">
									<li><a
										href="${pageContext.request.contextPath}/admin/userListOk.ad?page=${i}&userType=${userType}">
											<c:out value="${i}" />
									</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#" class="active"> <c:out value="${i}" />
									</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${next}">
							<li><a
								href="${pageContext.request.contextPath}/admin/userListOk.ad?page=${endPage + 1}&userType=${userType}"
								class="next">&gt;</a></li>
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