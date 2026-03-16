<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>멍! 케어 일정 등록</title>
  <link rel="stylesheet" href="../../assets/css/dogcare/dogcare_write.css" />
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>
  <main>
    <div class="dogcare-main-container">
      <div class="main-header">
        <div class="main-header-title">멍! 케어</div>
      </div>
      <!-- 페이지 컨텐츠 -->
      <div class="main-content">
        <div class="content-header">멍! 케어 일정 등록</div>
        <div class="dogcare-write-container">
          <div class="write-title">제목</div>
          <div class="write-box-container">
            <input class="title-write-box" type="text" id="dogcare-title" placeholder="제목을 입력하세요">
            <div class="dogcare-number">
              <label for="dogcare-number">모집 인원</label>
              <input type="number" id="dagcare-number" placeholder="모집 인원" />
            </div>
            <div class="dogcare-date">
              <label for="dogcare-date">일정</label>
              <input type="date" id="dagcare-date" data-placeholder="날짜 선택" />
            </div>
          </div>
          <div class="write-main-container">
            <div class="write-main">상세 내용</div>
            <div class="input-main">
              <input type="text" class="input-detail" placeholder="내용을 입력하세요">
            </div>
          </div>
          <div class="detail-footer-container">
            <div>
              <a class="btn-dogcare-post" href="#">멍! 케어 등록</a>
            </div>
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