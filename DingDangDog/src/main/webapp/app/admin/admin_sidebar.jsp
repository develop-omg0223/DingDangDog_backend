<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="admin-sidebar">
	<div class="admin-sidebar-header">
		<!-- 관리자 대시보드 페이지로 이동 -->
		<a href="${pageContext.request.contextPath}/admin/dashboard.ad">Ding
			Dong DOG !</a>
	</div>
	<div class="admin-info-section">
		<span class="admin-login-info">admin01</span>
		<button class="admin-logout-btn">로그아웃</button>
	</div>
	<nav class="admin-nav-menu">
		<ul>
			<li class="admin-nav-list">
				<!-- 회원목록 페이지로 이동 --> <a
				href="${pageContext.request.contextPath}/admin/userListOk.ad?userType=C">
					회원목록</a>
			</li>
			<li class="admin-nav-list">
				<!-- 블랙리스트 페이지로 이동 --> <a
				href="${pageContext.request.contextPath}/admin/"> 블랙리스트</a>
			</li>
			<li class="admin-nav-list">
				<!-- 멍! 카이브 목록 페이지로 이동 --> <a
				href="${pageContext.request.contextPath}/admin/"> 멍! 카이브 목록</a>
			</li>
			<li class="admin-nav-list">
				<!-- 멍! 케어 목록 페이지로 이동 --> <a
				href="${pageContext.request.contextPath}/admin/"> 멍! 케어 목록</a>
			</li>
			<li class="admin-nav-list">
				<!-- 멍! 로그 목록 페이지로 이동 --> <a
				href="${pageContext.request.contextPath}/admin/"> 멍! 로그 목록</a>
			</li>
			<li class="admin-nav-list">
				<!-- 문의사항 페이지로 이동 --> <a
				href="${pageContext.request.contextPath}/admin/"> 문의목록</a>
			</li>
		</ul>
	</nav>
	<div class="admin-sidebar-footer">
		<div class="site-logo">
			<img alt="site_logo" class="logo-img"
				src="${pageContext.request.contextPath}/assets/img/header, footer_logo.svg">
		</div>
	</div>
</aside>
