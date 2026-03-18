<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <title>멍! 케어 상세페이지</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogcare/dogcare_detail.css" />
  <script defer src="${pageContext.request.contextPath}/assets/js/dogcare/dogcare_detail_common.js"></script>
</head>

<body>

<main>
  <div class="dogcare-main-container">

    <div class="main-container-header">
      <div class="main-header-title">멍! 케어</div>
    </div>

    <div class="dogcare-detail-container">

      <!-- 제목 -->
      <div class="detail-title">
        ${care.careTitle}
      </div>

      <!-- 정보 -->
      <div class="detail-info-container">

        <div>
          작성자 : ${care.userNickname}
        </div>

        <div class="info-right">
          <div>
            봉사날짜 : ${care.careDate}
          </div>
          <div>
            작성일자 : ${care.careWriteDate}
          </div>
        </div>

      </div>

      <!-- 내용 -->
      <div class="detail-main-container">
        <div class="detail-main-post">
          ${care.carePost}
        </div>
      </div>

    </div>
  </div>

  <!-- 하단 -->
  <div class="detail-footer-container">

    <!-- 목록 -->
    <button class="btn-list"
      onclick="location.href='${pageContext.request.contextPath}/care/list.care'">
      목록으로
    </button>

    <div class="footer-right">

      <!-- 신청 현황 -->
      <div class="apply-status">
        신청 현황 
        <span id="applyCount">${care.applyCount}</span>
        / ${care.careRecruit}
      </div>

      <!-- 신청 버튼 -->
      <button class="btn-apply"
        onclick="location.href='${pageContext.request.contextPath}/care/apply.care?careNumber=${care.careNumber}'">
        신청하기
      </button>

    </div>

  </div>

</main>

</body>
</html>