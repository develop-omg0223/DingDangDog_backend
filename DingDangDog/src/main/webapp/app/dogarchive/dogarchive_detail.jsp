<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="./../../assets/css/dogarchive/dogarchive_detail.css" />
  <script defer src="./../../assets/js/dogarchive/dogarchive_detail.js"></script>
  <title>멍! 카이브 상세</title>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>

  <main class="archive-detail">
    <div class="container">
      <div class="container-header">
        <h2 id="main-title">멍! 카이브</h2>
      </div>

      <div class="container-body">
        <div class="archive-detail-top">
          <!-- 왼쪽 대표 이미지 -->
          <div class="archive-image-section">
            <div class="archive-image-box" id="detailMainImage">
              <!-- JS에서 img 삽입 -->
            </div>
          </div>

          <!-- 오른쪽 정보 표시 -->
          <div class="archive-info-section">
            <div class="dog-name-row">
              <span class="dog-name-label">이름 :</span>
              <span class="dog-name-value" id="dogName"></span>
            </div>

            <div class="dog-info-grid">
              <div class="info-item">
                <span class="info-label">품종 :</span>
                <span class="info-value" id="dogBreed"></span>
              </div>

              <div class="info-item">
                <span class="info-label">성별 :</span>
                <span class="info-value" id="dogGender"></span>
              </div>

              <div class="info-item">
                <span class="info-label">나이 :</span>
                <span class="info-value" id="dogAge"></span>
              </div>

              <div class="info-item">
                <span class="info-label">몸무게 :</span>
                <span class="info-value" id="dogWeight"></span>
              </div>

              <div class="info-item">
                <span class="info-label">보호소에 들어온 날 :</span>
                <span class="info-value" id="dogRescueDate"></span>
              </div>
            </div>

            <div class="dog-trait-list">
              <div class="trait-row">
                <span class="trait-label">활동성 :</span>
                <span class="trait-text" id="traitActivity"></span>
                <span class="trait-score-label">점수:</span>
                <span class="trait-score-value" id="scoreActivity"></span>
              </div>

              <div class="trait-row">
                <span class="trait-label">사회성 :</span>
                <span class="trait-text" id="traitSocial"></span>
                <span class="trait-score-label">점수:</span>
                <span class="trait-score-value" id="scoreSocial"></span>
              </div>

              <div class="trait-row">
                <span class="trait-label">독립성 :</span>
                <span class="trait-text" id="traitIndependence"></span>
                <span class="trait-score-label">점수:</span>
                <span class="trait-score-value" id="scoreIndependence"></span>
              </div>

              <div class="trait-row">
                <span class="trait-label">짖음 수준 :</span>
                <span class="trait-text" id="traitBark"></span>
                <span class="trait-score-label">점수:</span>
                <span class="trait-score-value" id="scoreBark"></span>
              </div>

              <div class="trait-row">
                <span class="trait-label">털관리 :</span>
                <span class="trait-text" id="traitGrooming"></span>
                <span class="trait-score-label">점수:</span>
                <span class="trait-score-value" id="scoreGrooming"></span>
              </div>
            </div>
          </div>
        </div>

        <!-- 버튼 영역 -->
        <div class="archive-action-section">
          <a href="" class="btn btn-shelter-link" id="btnShelterLink">보호소 바로가기</a>
          <a href="" class="btn btn-edit" id="btnEdit">수정하기</a>
          <button type="button" class="btn btn-delete" id="btnDelete">삭제</button>
        </div>

        <!-- 하단 본문 -->
        <div class="archive-content-section">
          <div class="archive-content-viewer" id="archiveContentViewer">
            <!-- JS에서 본문 삽입 -->
          </div>
        </div>
      </div>
    </div>
  </main>
  <!-- footer -->
  <div id="footer-container"></div>
  <!-- js -->
  <script src="/assets/js/header-footer.js"></script>
</body>

</html>