<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>멍! 케어 게시글</title>
  <link rel="stylesheet" href="../../../assets/css/admin/admin.css" />
  <link rel="stylesheet" href="/assets/css/admin/dogcare/admin_dogcare_detail.css" />
  <script defer src="/assets/js/dogcare/applystate_modal.js"></script>
</head>

<body>
  <!-- 전체화면 -->
  <main class="admin-main-container">
    <!-- 사이드바 -->
    <aside class="admin-sidebar"></aside>
    <!-- 메인 화면 -->
    <section class="admin-main-section">
      <!-- 페이지 상단 (제목, 버튼) -->
      <div class="admin-main-section-header">
        <div class="admin-title">멍! 케어 게시글</div>
      </div>
      <!-- 페이지 컨텐츠 -->
      <div class="admin-main-content">
        <div class="doglog-detail-container">
          <div class="detail-title">3/20 행복 보호소 봉사활동 모집</div>
          <div class="detail-info-container">
            <div class="detail-info-name">작성자 | 행복보호소</div>
            <div class="detail-info-caredate">봉사 날짜 | 2026.03.20</div>
            <div class="detail-info-date">작성일 | 2026.03.07</div>
          </div>
          <div class="detail-main-container">
            3월 20일 저희와 함께 봉사 해 주실 분을 찾습니다<br />
            위치는 경기도 파주에 위치한 행복보호소 입니다<br />
          </div>
          <div class="detail-footer-container">
            <button class="apply-status" id="applyStatusBtn">신청현황 12/15</button>
          </div>
        </div>
      </div>
      <!-- 페이지 하단 (검색, 페이지네이션) -->
      <div class="admin-main-section-footer">
        <div class="btn-container">
          <button class="btn-backlist btn" onclick="location.href = 'admin_dogcare_list.html'"
            class="return-btn admin-box-shadow">목록으로</button>
          <button class="btn-doglog-delete btn" id="btn-remove-detail">게시글 삭제</button>
        </div>
      </div>
    </section>
  </main>
  <!-- 신청자 목록 모달 -->
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
        </div>

        <div class="apply-row">
          <div>happyDog</div>
          <div>김철수</div>
          <div>010-0000-0000</div>
        </div>

        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
        <div class="apply-row">
          <div>dogFriend</div>
          <div>이영희</div>
          <div>010-2222-2222</div>
        </div>
      </div>

    </div>
  </div>
</body>

</html>