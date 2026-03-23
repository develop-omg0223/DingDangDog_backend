<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>대시보드</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin/dashboard/admin_dashboard.css" />
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
				<div class="admin-title">대시보드</div>
			</div>
			<!-- 페이지 컨텐츠 -->
			<div class="admin-main-content">
				<!-- 테이블등 정보 -->
				<ul class="dashboard-row">
					<li>
						<article class="dashboard-box admin-box-shadow">
							<div class="box-header">
								<span class="box-title">회원 목록</span> <a
									href="${pageContext.request.contextPath}/admin/userListOk.ad"
									class="link-btn">+</a>
							</div>
							<div class="box-content">
								<div class="dashboard-list-row userlist">
									<div class="user-number">번호</div>
									<div class="user-id">아이디</div>
									<div class="user-shelter-name">보호소명</div>
									<div class="user-confirm-check">인증상태</div>
								</div>
								<c:forEach var="user" items="${userList}">
									<div class="dashboard-list-row userlist">
										<div class="user-number">${user.userNumber}</div>
										<div class="user-id">${user.userId}</div>
										<div class="user-shelter-name">${user.shelterName}</div>
										<c:if test="${user.shelterCertification == 'N'}">
											<div class="user-confirm-check confirm-wait">인증대기</div>
										</c:if>
										<c:if test="${user.shelterCertification == 'Y'}">
											<div class="user-confirm-check">인증완료</div>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</article>
					</li>
					<li>
						<article class="dashboard-box admin-box-shadow">
							<div class="box-header">
								<span class="box-title">블랙리스트</span> <a
									href="${pageContext.request.contextPath}/admin/blackListOk.ad"
									class="link-btn">+</a>
							</div>
							<div class="box-content">
								<div class="dashboard-list-row blacklist">
									<div class="black-user-number">번호</div>
									<div class="black-user-id">아이디</div>
									<div class="black-user-name">이름</div>
									<div class="black-user-nickname">닉네임</div>
									<div class="black-user-email">이메일</div>
								</div>
								<c:choose>
									<c:when test="${not empty blackList}">
										<c:forEach var="black" items="${blackList}">
											<div class="dashboard-list-row blacklist">
												<div class="black-user-number">${black.userNumber}</div>
												<div class="black-user-id">${black.userId}</div>
												<div class="black-user-name">${black.userName}</div>
												<div class="black-user-nickname">${black.userNickname}</div>
												<div class="black-user-email">${black.userEmail }</div>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="dashboard-list-row no-data">
											<div>현재 블랙리스트로 등록된 회원이 없습니다</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</article>
					</li>
				</ul>
				<ul class="dashboard-row">
					<li>
						<article class="dashboard-box admin-box-shadow">
							<div class="box-header">
								<span class="box-title">멍! 카이브 목록</span> <a
									href="${pageContext.request.contextPath}/admin/"
									class="link-btn">+</a>
							</div>
							<div class="box-content">
								<div class="dashboard-list-row dogarchive">
									<div class="dogarchive-number">번호</div>
									<div class="dogarchive-name">이름</div>
									<div class="dogarchive-age">나이</div>
									<div class="dogarchive-type">견종</div>
									<div class="dogarchaive-shelter">등록 보호소</div>
									<div class="dogarchaive-date">보호 날짜</div>
								</div>
								<div class="dashboard-list-row dogarchive">
									<div class="dogarchive-number">4</div>
									<div class="dogarchive-name">흰둥이</div>
									<div class="dogarchive-age">5 살</div>
									<div class="dogarchive-type">푸들</div>
									<div class="dogarchaive-shelter">희망 보호소</div>
									<div class="dogarchaive-date">2025-12-14</div>
								</div>
								<div class="dashboard-list-row dogarchive">
									<div class="dogarchive-number">4</div>
									<div class="dogarchive-name">흰둥이</div>
									<div class="dogarchive-age">5 살</div>
									<div class="dogarchive-type">푸들</div>
									<div class="dogarchaive-shelter">희망 보호소</div>
									<div class="dogarchaive-date">2025-12-14</div>
								</div>
								<div class="dashboard-list-row dogarchive">
									<div class="dogarchive-number">4</div>
									<div class="dogarchive-name">흰둥이</div>
									<div class="dogarchive-age">5 살</div>
									<div class="dogarchive-type">푸들</div>
									<div class="dogarchaive-shelter">희망 보호소</div>
									<div class="dogarchaive-date">2025-12-14</div>
								</div>
								<div class="dashboard-list-row dogarchive">
									<div class="dogarchive-number">4</div>
									<div class="dogarchive-name">흰둥이</div>
									<div class="dogarchive-age">5 살</div>
									<div class="dogarchive-type">푸들</div>
									<div class="dogarchaive-shelter">희망 보호소</div>
									<div class="dogarchaive-date">2025-12-14</div>
								</div>
								<div class="dashboard-list-row dogarchive">
									<div class="dogarchive-number">4</div>
									<div class="dogarchive-name">흰둥이</div>
									<div class="dogarchive-age">5 살</div>
									<div class="dogarchive-type">푸들</div>
									<div class="dogarchaive-shelter">희망 보호소</div>
									<div class="dogarchaive-date">2025-12-14</div>
								</div>
							</div>
						</article>
					</li>
					<li>
						<article class="dashboard-box admin-box-shadow">
							<div class="box-header">
								<span class="box-title">멍! 케어 목록</span> <a
									href="
									${pageContext.request.contextPath}/admin/adminCareListOk.ad"
									class="link-btn">+</a>
							</div>
							<div class="box-content">
								<div class="dashboard-list-row dogcare">
									<div class="dogcare-number">번호</div>
									<div class="dogcare-title first-row">제목</div>
									<div class="dogcare-id">봉사 날짜</div>
									<div class="dogcare-nickname">작성자</div>
									<div class="dogcare-date">작성 날짜</div>
								</div>

								<div class="dashboard-list-row dogcare">
									<div class="dogcare-number">1</div>
									<div class="dogcare-title">봉사활동 모집</div>
									<div class="dogcare-id">2026-03-20</div>
									<div class="dogcare-nickname">hop123</div>
									<div class="dogcare-date">2026-03-01</div>
								</div>
								<div class="dashboard-list-row dogcare">
									<div class="dogcare-number">1</div>
									<div class="dogcare-title">봉사활동 모집</div>
									<div class="dogcare-id">2026-03-20</div>
									<div class="dogcare-nickname">hop123</div>
									<div class="dogcare-date">2026-03-01</div>
								</div>
								<div class="dashboard-list-row dogcare">
									<div class="dogcare-number">1</div>
									<div class="dogcare-title">봉사활동 모집</div>
									<div class="dogcare-id">2026-03-20</div>
									<div class="dogcare-nickname">hop123</div>
									<div class="dogcare-date">2026-03-01</div>
								</div>
								<div class="dashboard-list-row dogcare">
									<div class="dogcare-number">1</div>
									<div class="dogcare-title">봉사활동 모집</div>
									<div class="dogcare-id">2026-03-20</div>
									<div class="dogcare-nickname">hop123</div>
									<div class="dogcare-date">2026-03-01</div>
								</div>
								<div class="dashboard-list-row dogcare">
									<div class="dogcare-number">1</div>
									<div class="dogcare-title">봉사활동 모집</div>
									<div class="dogcare-id">2026-03-20</div>
									<div class="dogcare-nickname">hop123</div>
									<div class="dogcare-date">2026-03-01</div>
								</div>
							</div>
						</article>
					</li>
				</ul>

				<ul class="dashboard-row">
					<li>
						<article class="dashboard-box admin-box-shadow">
							<div class="box-header">
								<span class="box-title">멍! 로그 목록</span> <a
									href="${pageContext.request.contextPath}/admin/adminLogListOk.ad"
									class="link-btn">+</a>
							</div>
							<div class="box-content">
								<div class="dashboard-list-row doglog">
									<div class="doglog-number">번호</div>
									<div class="doglog-title first-row">제목</div>
									<div class="doglog-nickname">작성자</div>
									<div class="doglog-date">작성 날짜</div>
								</div>

								<c:choose>
									<c:when test="${not empty logList}">
										<c:forEach var="log" items="${logList}">
											<div class="dashboard-list-row doglog">
												<div class="doglog-number">${log.logNumber }</div>
												<div class="doglog-title">${log.logTitle }</div>
												<div class="doglog-nickname">${log.userNickname }</div>
												<div class="doglog-date">${log.logDate }</div>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="dashboard-list-row no-data">
											<div style="width: 100%; text-align: center;">작성된 로그가
												없습니다.</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</article>
					</li>
					<li>
						<article class="dashboard-box admin-box-shadow">
							<div class="box-header">
								<span class="box-title">문의 목록</span> <a
									href="${pageContext.request.contextPath}/admin/InquiryListOk.ad"
									class="link-btn">+</a>
							</div>
							<div class="box-content">
								<div class="dashboard-list-row inquiry">
									<div class="inquiry-number">번호</div>
									<div class="inquiry-title first-row">제목</div>
									<div class="inquiry-nickname">작성자</div>
									<div class="inquiry-response">답변상태</div>
								</div>


								<c:choose>
									<c:when test="${not empty inquiryList}">
										<c:forEach var="inq" items="${inquiryList}">
											<div class="dashboard-list-row inquiry">
												<div class="inquiry-number">${inq.inquiryNumber}</div>
												<div class="inquiry-title">${inq.inquiryTitle}</div>
												<div class="inquiry-nickname">${inq.userNickname}</div>

												<c:choose>
													<c:when test="${inq.answerStatus eq 'N'}">
														<div class="inquiry-response response-wait">답변대기</div>
													</c:when>
													<c:otherwise>
														<div class="inquiry-response">답변완료</div>
													</c:otherwise>
												</c:choose>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="dashboard-list-row no-data">
											<div>접수된 문의사항이 없습니다.</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</article>
					</li>
				</ul>
			</div>
			<!-- 페이지 하단 (검색, 페이지네이션) -->
			<div class="admin-main-section-footer"></div>
		</section>
	</main>
</body>

</html>
