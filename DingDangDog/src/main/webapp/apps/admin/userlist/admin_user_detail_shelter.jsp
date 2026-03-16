<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>보호소 회원 정보</title>
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
          <div class="admin-title">보호소 회원 정보</div>
        </div>
        <!-- 페이지 컨텐츠 -->
        <div class="admin-main-content admin-box-shadow">
          <!-- 테이블등 정보 -->
          <div class="admin-detail-row">
            <div class="admin-detail-title">아이디</div>
            <div class="admin-detail-info">hopeS1</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">보호소명</div>
            <div class="admin-detail-info">희망 보호소</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">닉네임</div>
            <div class="admin-detail-info">hop123</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">주소</div>
            <div class="admin-detail-info">
              경기도 파주시 법원읍 둔방이길 532-43
            </div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">사업자등록번호</div>
            <div class="admin-detail-info">123-22-1111</div>
          </div>
          <div class="admin-detail-row">
            <div class="admin-detail-title">첨부파일</div>
            <div class="admin-detail-info">
              <button class="download-btn">download</button>
              사업자등록증
            </div>
          </div>
        </div>
        <!-- 페이지 하단 (검색, 페이지네이션) -->
        <div class="admin-main-section-footer">
          <div class="btn-container">
            <button
              onclick="location.href = 'admin_user_list_shelter.html'"
              class="return-btn admin-box-shadow"
            >
              목록으로
            </button>
            <button id="confirm-btn" class="confirm-btn admin-box-shadow">
              보호소 인증
            </button>
          </div>
        </div>
      </section>
    </main>
  </body>
  <script>
    confirmBtn = document.getElementById("confirm-btn");
    confirmBtn.addEventListener("click", () => {
      alert("인증 완료되었습니다");
      location.href = "admin_user_list_shelter.html";
    });
  </script>
</html>
