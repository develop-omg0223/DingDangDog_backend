<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="./../../assets/css/dogarchive/dogarchive_edit.css" />
  <script defer src="./../../assets/js/dogarchive/dogarchive_edit.js"></script>
  <title>멍! 카이브 수정</title>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>


  <main class="archive-detail">

    <div class="container">

      <div class="container-header">
        <h2 id="main-title">멍! 카이브 수정</h2>
      </div>

      <div class="container-body">

        <div class="archive-detail-top">

          <!-- 왼쪽 이미지 -->
          <div class="archive-image-section">

            <div class="archive-image-box">
              <img id="previewImage">
            </div>

            <input type="file" id="editImage" accept="image/*" />

          </div>

          <!-- 오른쪽 정보 입력 -->
          <div class="archive-info-section">

            <div class="dog-name-row">
              <span class="dog-name-label">이름 :</span>
              <input type="text" class="dog-name-input" id="dogName" />
            </div>

            <div class="dog-info-grid">
              <div class="info-item">
                <span class="info-label">품종 :</span>
                <input type="text" class="info-input" id="dogBreed">
              </div>

              <div class="info-item">
                <span class="info-label">성별 :</span>
                <select class="info-input" id="dogGender">
                  <option value="수컷">수컷</option>
                  <option value="암컷">암컷</option>
                </select>
              </div>

              <div class="info-item">
                <span class="info-label">나이 :</span>
                <input type="text" class="info-input" id="dogAge">
              </div>

              <div class="info-item">
                <span class="info-label">몸무게 :</span>
                <input type="text" class="info-input" id="dogWeight">
              </div>

              <div class="info-item">
                <span class="info-label">보호소에 들어온 날 :</span>
                <input type="date" class="info-input" id="dogRescueDate">
              </div>
            </div>

            <!-- 성향 -->
            <div class="dog-trait-list">
              <div class="trait-row">
                <span class="trait-label">활동성 :</span>
                <input type="text" class="trait-input" id="traitActivity">
                <span class="trait-score-label">점수:</span>
                <input type="number" class="trait-score-input" id="scoreActivity" min="1" max="5">
              </div>

              <div class="trait-row">
                <span class="trait-label">사회성 :</span>
                <input type="text" class="trait-input" id="traitSocial">
                <span class="trait-score-label">점수:</span>
                <input type="number" class="trait-score-input" id="scoreSocial" min="1" max="5">
              </div>

              <div class="trait-row">
                <span class="trait-label">독립성 :</span>
                <input type="text" class="trait-input" id="traitIndependence">
                <span class="trait-score-label">점수:</span>
                <input type="number" class="trait-score-input" id="scoreIndependence" min="1" max="5">
              </div>

              <div class="trait-row">
                <span class="trait-label">짖음 수준 :</span>
                <input type="text" class="trait-input" id="traitBark">
                <span class="trait-score-label">점수:</span>
                <input type="number" class="trait-score-input" id="scoreBark" min="1" max="5">
              </div>

              <div class="trait-row">
                <span class="trait-label">털관리 :</span>
                <input type="text" class="trait-input" id="traitGrooming">
                <span class="trait-score-label">점수:</span>
                <input type="number" class="trait-score-input" id="scoreGrooming" min="1" max="5">
              </div>
            </div>
          </div>
        </div>

        <!-- 버튼 -->
        <div class="archive-action-section">
          <button type="button" class="btn btn-save" id="btnEditSave">수정 완료</button>
          <button type="button" class="btn btn-cancel" id="btnCancle">취소</button>
        </div>

        <!-- 본문 -->
        <div class="archive-content-section">
          <textarea class="archive-content-editor" id="archiveContentEditor" placeholder="내용을 입력하세요"></textarea>
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