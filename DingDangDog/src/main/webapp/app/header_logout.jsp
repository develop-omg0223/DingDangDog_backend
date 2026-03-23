<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="header">
  <div class="h-container">
    <div class="h-left-menu">
      <a href="${pageContext.request.contextPath}/mainpage/Main.main" class="h-logo-link">
        <img src="${pageContext.request.contextPath}/assets/img/header, footer_logo.svg" alt="DingDongDOG! logo" class="h-logo-img">
      </a>

      <div class="h-left-caption">
        <p class="h-slogan">멍! 매칭으로 찾는 나만의 반려견, 딩동독!</p>
      </div>
    </div>

    <nav class="h-centent-menu">
      <ul>
        <li><a href="${pageContext.request.contextPath}/mainpage/introduce.main" class="h-centent-menu-item">소개</a></li>
        <li><a href="${pageContext.request.contextPath}/matching/test.ma" class="h-centent-menu-item">멍! 매칭</a></li>
        <li><a href="${pageContext.request.contextPath}/log/list.lo" class="h-centent-menu-item">멍! 로그</a></li>
        <li><a href="${pageContext.request.contextPath}/care/list.ca" class="h-centent-menu-item">멍! 케어</a></li>
        <li><a href="${pageContext.request.contextPath}/archive/list.ar" class="h-centent-menu-item">멍! 카이브</a></li>
      </ul>
    </nav>

    <div class="h-right-menu">
      <a href="${pageContext.request.contextPath}/user/login.us" class="h-login-link">로그인</a>
    </div>
  </div>
</header>