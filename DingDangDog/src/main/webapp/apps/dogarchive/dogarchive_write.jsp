<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="./../../assets/css/dogarchive/dogarchive_write.css" />
  <script defer src="./../../assets/js/dogarchive/dogarchive_write.js"></script>
  <title>멍! 카이브 작성</title>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>


  <main class="archive-write">
    <div class="container">
      <div class="container-header">
        <h2 id="main-title">멍! 카이브 작성</h2>
      </div>

      <div class="container-body">
        <div class="archive-write-top">
          <div class="archive-image-section">
            <div class="archive-image-box">
              <img id="thumbnailPreview" src="" alt="대표 이미지 미리보기" />
              <span class="img-placeholder">대표 이미지 첨부하기</span>
            </div>

            <input type="file" id="imageUpload" accept="image/*" multiple hidden />

            <label for="imageUpload" class="btn btn-upload">이미지 첨부</label>
          </div>

          <div class="archive-info-section">
            <div class="dog-name-row">
              <label for="dogName" class="dog-name-label">이름 :</label>
              <input type="text" id="dogName" class="dog-name-input" />
            </div>

            <div class="dog-info-grid">
              <div class="info-item">
                <label for="dogBreed">품종 :</label>
                <input type="text" id="dogBreed" />
              </div>

              <div class="info-item">
                <label for="dogGender">성별 :</label>
                <input type="text" id="dogGender" />
              </div>

              <div class="info-item">
                <label for="dogAge">나이 :</label>
                <input type="text" id="dogAge" />
              </div>

              <div class="info-item">
                <label for="dogWeight">몸무게 :</label>
                <input type="text" id="dogWeight" />
              </div>

              <div class="info-item">
                <label for="dogRescueDate">보호소에 들어온 날 :</label>
                <input type="date" id="dogRescueDate" />
              </div>
            </div>

            <div class="dog-trait-list">
              <div class="trait-row">
                <label for="scoreActivity">활동성 :</label>
                <input type="text" id="traitActivity" class="trait-text-input" />
                <span class="trait-score-label">점수:</span>
                <select id="scoreActivity" class="trait-score-select">
                  <option value="">선택</option>
                  <option value="1">1점</option>
                  <option value="2">2점</option>
                  <option value="3">3점</option>
                  <option value="4">4점</option>
                  <option value="5">5점</option>
                </select>
              </div>

              <div class="trait-row">
                <label for="scoreSocial">사회성 :</label>
                <input type="text" id="traitSocial" class="trait-text-input" />
                <span class="trait-score-label">점수:</span>
                <select id="scoreSocial" class="trait-score-select">
                  <option value="">선택</option>
                  <option value="1">1점</option>
                  <option value="2">2점</option>
                  <option value="3">3점</option>
                  <option value="4">4점</option>
                  <option value="5">5점</option>
                </select>
              </div>

              <div class="trait-row">
                <label for="scoreIndependence">독립성 :</label>
                <input type="text" id="traitIndependence" class="trait-text-input" />
                <span class="trait-score-label">점수:</span>
                <select id="scoreIndependence" class="trait-score-select">
                  <option value="">선택</option>
                  <option value="1">1점</option>
                  <option value="2">2점</option>
                  <option value="3">3점</option>
                  <option value="4">4점</option>
                  <option value="5">5점</option>
                </select>
              </div>

              <div class="trait-row">
                <label for="scoreBark">짖음수준 :</label>
                <input type="text" id="traitBark" class="trait-text-input" />
                <span class="trait-score-label">점수:</span>
                <select id="scoreBark" class="trait-score-select">
                  <option value="">선택</option>
                  <option value="1">1점</option>
                  <option value="2">2점</option>
                  <option value="3">3점</option>
                  <option value="4">4점</option>
                  <option value="5">5점</option>
                </select>
              </div>

              <div class="trait-row">
                <label for="scoreGrooming">털관리 :</label>
                <input type="text" id="traitGrooming" class="trait-text-input" />
                <span class="trait-score-label">점수:</span>
                <select id="scoreGrooming" class="trait-score-select">
                  <option value="">선택</option>
                  <option value="1">1점</option>
                  <option value="2">2점</option>
                  <option value="3">3점</option>
                  <option value="4">4점</option>
                  <option value="5">5점</option>
                </select>
              </div>
            </div>
          </div>
        </div>

        <div class="archive-content-section">
          <div id="archiveContentEditor" class="archive-content-editor" contenteditable="true"
            data-placeholder="보호소가 자유롭게 작성 가능한 텍스트란"></div>
        </div>
      </div>

      <div class="container-footer">
        <div class="footer-btn-wrap">
          <button type="button" class="btn btn-submit" id="btnSubmit">등록</button>
          <a href="./dogarchive_detail.html" class="btn btn-cancel" id="btnCancle">취소</a>
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