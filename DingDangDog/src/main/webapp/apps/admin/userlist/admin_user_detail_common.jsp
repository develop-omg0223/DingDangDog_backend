<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>일반 회원 정보</title>
    <link rel="stylesheet" href="/assets/css/admin/admin.css" />
    <link
      rel="stylesheet"
      href="/assets/css/admin/userlist/admin_userlist_detail.css"
    />
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
          <div class="admin-title">일반 회원 정보</div>
        </div>
        <!-- 페이지 컨텐츠 -->
        <div class="admin-main-content admin-box-shadow">
          <!-- 테이블등 정보 -->
          <div class="admin-detail-row">
            <div class="admin-detail-title">아이디</div>
            <div class="admin-detail-info">Zzang12</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">닉네임</div>
            <div class="admin-detail-info">z123z</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">이름</div>
            <div class="admin-detail-info">짱구</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">생년월일</div>
            <div class="admin-detail-info">2000.12.11</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">휴대폰번호</div>
            <div class="admin-detail-info">010-1212-4532</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">이메일주소</div>
            <div class="admin-detail-info">Zzang12@email.com</div>
          </div>
        </div>
        <!-- 페이지 하단 (검색, 페이지네이션) -->
        <div class="admin-main-section-footer">
          <div class="btn-container">
            <button
              onclick="location.href = 'admin_user_list_common.html'"
              class="return-btn admin-box-shadow"
            >
              목록으로
            </button>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
