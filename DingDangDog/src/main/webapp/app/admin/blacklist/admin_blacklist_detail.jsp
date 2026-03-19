<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>블랙리스트 회원 정보</title>
    <link rel="stylesheet" href="../../../assets/css/admin/admin.css" />
    <link
      rel="stylesheet"
      href="../../../assets/css/admin/blacklist/admin_blacklist_detail.css"
    />
    <script defer src="../../../assets/js/admin/admin_blacklist.js"></script>
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
          <div class="admin-title">블랙리스트 회원 정보</div>
        </div>
        <!-- 페이지 컨텐츠 -->
        <div class="admin-main-content admin-box-shadow">
          <!-- 테이블등 정보 -->
          <div class="admin-detail-row">
            <div class="admin-detail-title">아이디</div>
            <div class="admin-detail-info">samks202</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">닉네임</div>
            <div class="admin-detail-info">steel202</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">이름</div>
            <div class="admin-detail-info">김철수</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">생년월일</div>
            <div class="admin-detail-info">1999.03.11</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">휴대폰번호</div>
            <div class="admin-detail-info">010-1232-1111</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">이메일주소</div>
            <div class="admin-detail-info">samks202@mail.com</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">사유</div>
            <div class="admin-detail-info">
              <div class="black-reason">노쇼</div>
            </div>
          </div>
        </div>
        <!-- 페이지 하단 (검색, 페이지네이션) -->
        <div class="admin-main-section-footer">
          <div class="btn-container">
            <button
              onclick="location.href = 'admin_blacklist.html'"
              class="return-btn admin-box-shadow"
            >
              목록으로
            </button>
            <button
              id="blacklist-cancel-btn"
              class="blacklist-cancel-btn admin-box-shadow"
            >
              블랙리스트 해제
            </button>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
