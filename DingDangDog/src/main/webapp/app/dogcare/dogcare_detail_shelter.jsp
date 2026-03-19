<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>멍! 케어 상세페이지-보호소회원</title>
  <link rel="stylesheet" href="../../assets/css/dogcare/dogcare_detail.css" />
  <link rel="stylesheet" href="../../assets/css/dogcare/dogcare_list_shelter.css">
  <script defer src="../../assets/js/dogcare/report_modal.js"></script>
  <script defer src="../../assets/js/dogcare/dogcare_detail_shelter.js"></script>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>
  <main>
    <div class="dogcare-main-container">
      <div class="main-container-header">
        <div class="main-header-title">멍! 케어</div>
      </div>
      <div class="dogcare-detail-container">
        <div class="detail-title">
          산책 봉사 하러 오세요!!!
        </div>
        <div class="detail-info-container">
          <div>작성자 : 행복보호소</div>
          <div class="info-right">
            <div>봉사날짜 : 2026-03-20</div>
            <div>작성일자 : 2026-03-06</div>
          </div>
        </div>
        <div class="detail-main-container">
          <div class="detail-main-post">
            게시글 내용이 들어가는 영역입니다.
          </div>
        </div>
      </div>
    </div>
    <div class="detail-footer-container">
      <button class="btn-list" id="listBtn">
        목록으로
      </button>
      <div class="footer-right">
        <div class="apply-status" id="applyStatusBtn">
          신청 현황 <span id="applyCount">12</span>/15
        </div>
        <button class="btn-apply" id="applyBtn">
          신청하기
        </button>
      </div>
    </div>
  </main>
  <!-- footer -->
  <div id="footer-container"></div>
  <!-- js -->
  <script src="/assets/js/header-footer.js"></script>

  <!-- 신고 모달창 -->
  <div id="applyModal" class="modal">

    <div class="modal-content">

      <div class="modal-header">
        <span>신청자 목록</span>
        <button id="modalClose" class="modal-close">X</button>
      </div>

      <div class="modal-body">
        <div class="apply-header">
          <div>닉네임</div>
          <div>이름</div>
          <div>휴대폰 번호</div>
          <div>신고 사유</div>
          <div>신고</div>
        </div>

        <div class="apply-row">
          <div>happyDog</div>
          <div>김철수</div>
          <div>010-0000-0000</div>
          <div class="report-reason">
            <label><input type="radio" name="report1" value="노쇼">노쇼</label>
            <label><input type="radio" name="report1" value="태도불량">매너불량</label>
            <label><input type="radio" name="report1" value="기타">기타</label>
            <input type="text" class="etc-input" placeholder="사유 입력" disabled>
          </div>
          <div>
            <button class="report-btn">신고</button>
          </div>
        </div>

        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
          <div class="report-reason">
            <label><input type="radio" name="report2" value="노쇼">노쇼</label>
            <label><input type="radio" name="report2" value="태도불량">태도불량</label>
            <label><input type="radio" name="report2" value="기타">기타</label>
            <input type="text" class="etc-input" placeholder="사유 입력" disabled>
          </div>
          <div>
            <button class="report-btn">신고</button>
          </div>
        </div>
      </div>

    </div>
  </div>

</body>

</html>