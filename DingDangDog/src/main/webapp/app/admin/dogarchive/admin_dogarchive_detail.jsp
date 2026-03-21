<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멍! 카이브 상세페이지</title>
    <link rel="stylesheet" href="${contextPath}/assets/css/admin/dogarchive/admin_dogarchive_detail.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/admin/admin.css">

    <script>
      const contextPath = "${contextPath}";
      const archiveDetail = {
        dogNumber: ${archive.dogNumber},
        dogName: "<c:out value='${archive.dogName}'/>",
        dogAge: "<c:out value='${archive.dogAge}'/>",
        dogWeight: "${archive.dogWeight}",
        shelterName: "<c:out value='${archive.shelterName}'/>",
        dogSafeDate: "${archive.dogSafeDate}",
        archiveImgPath: "<c:out value='${archive.archiveImgPath}'/>"
      };
    </script>
    <script defer src="${contextPath}/assets/js/admin/admin_dogarchive_detail.js"></script>
</head>
<body>
    <main class="admin-main-container">
      <aside class="admin-sidebar"><jsp:include page="/app/admin/admin_sidebar.jsp" /></aside>

      <section class="admin-main-section">
        <div class="admin-main-section-header">
          <div class="admin-title">멍! 카이브 상세페이지</div>
        </div>

        <div class="admin-main-content admin-box-shadow">
          <div class="admin-detail-row">
            <div class="admin-detail-title">이름</div>
            <div class="admin-detail-info" id="dogName"></div>
          </div>

          <div class="admin-detail-row">
            <div class="admin-detail-title">사진</div>
            <div class="admin-detail-info">
              <img class="info-img" id="dogImage" src="" alt="강아지 사진">
            </div>
          </div>

          <div class="admin-detail-row">
            <div class="admin-detail-title">나이</div>
            <div class="admin-detail-info" id="dogAge"></div>
          </div>

          <div class="admin-detail-row">
            <div class="admin-detail-title">몸무게</div>
            <div class="admin-detail-info" id="dogWeight"></div>
          </div>

          <div class="admin-detail-row">
            <div class="admin-detail-title">등록 보호소</div>
            <div class="admin-detail-info" id="shelterName"></div>
          </div>

          <div class="admin-detail-row">
            <div class="admin-detail-title">보호 날짜</div>
            <div class="admin-detail-info" id="dogSafeDate"></div>
          </div>
        </div>

        <div class="admin-main-section-footer">
          <div class="btn-container">
            <button type="button" class="btn-backlist return-btn admin-box-shadow" id="backToListBtn">
              목록으로
            </button>
            <button type="button" class="btn-remove" id="removeBtn">
              정보삭제
            </button>
          </div>
        </div>
      </section>
    </main>
</body>
</html>