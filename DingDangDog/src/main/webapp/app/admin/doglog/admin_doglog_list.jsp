<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>멍! 로그 리스트</title>
    <link
      rel="stylesheet"
      href="${contextPath}/assets/css/admin/doglog/admin_doglog_list.css"
    />
    <link rel="stylesheet" href="${contextPath}/assets/css/admin/admin.css" />
    <script defer src="${contextPath}/assets/js/admin/admin_doglog_list.js"></script>
  </head>

  <body>
    <!-- 전체화면 -->
    <main class="admin-main-container">
      <!-- 사이드바 -->
      <aside class="admin-sidebar"><jsp:include page="/app/admin/admin_sidebar.jsp" /></aside>
      <!-- 메인 화면 -->
      <section class="admin-main-section">
        <!-- 페이지 상단 (제목, 버튼) -->
        <div class="admin-main-section-header">
          <div class="admin-title">멍! 로그 리스트</div>
        </div>
        <!-- 페이지 컨텐츠 -->
        <div class="admin-main-content">
          <!-- 테이블등 정보 -->
          <div class="admin-doglog-list-header">
            <div class="doglog-number">게시글 번호</div>
            <div class="doglog-title">제목</div>
            <div class="doglog-id">아이디</div>
            <div class="doglog-nickname">닉네임</div>
            <div class="doglog-date">작성 일자</div>
          </div>
          <div id="reviewTableBody"></div>
<!--           <div class="admin-doglog-list-row">
            <div class="doglog-number">1</div>
            <div class="doglog-title"><a href="/html/admin/doglog/admin_doglog_detail.html">제목</a></div>
            <div class="doglog-id">아이디</div>
            <div class="doglog-nickname">닉네임</div>
            <div class="doglog-date">2026-03-06</div>
          </div> -->
        </div>
        <!-- 페이지 하단 (검색, 페이지네이션) -->
        <div class="admin-main-section-footer">
          <!-- 검색 -->
          <div class="admin-main-section-footer">
            <div class="search-box">
              <select class="search-select admin-box-shadow">
                <option>아이디</option>
                <option>닉네임</option>
              </select>
              <input type="text" class="search-input admin-box-shadow" />
              <button class="btn-search admin-box-shadow">검색</button>
            </div>

            <!-- 페이지네이션 -->

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
                  <button class="next-btn"><span>&gt;</span></button>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
