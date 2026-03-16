<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 사이드바</title>
    <link rel="stylesheet" href="/assets/css/admin/admin.css" />
  </head>
  <body>
    <aside class="admin-sidebar">
      <div class="admin-sidebar-header">
        <!-- 관리자 대시보드 페이지로 이동 -->
        <a href="dashboard/admin_dashboard.html">Ding Dong DOG !</a>
      </div>
      <div class="admin-info-section">
        <span class="admin-login-info">admin01</span>
        <button class="admin-logout-btn">로그아웃</button>
      </div>
      <nav class="admin-nav-menu">
        <ul>
          <li class="admin-nav-list">
            <!-- 회원목록 페이지로 이동 -->
            <a href="userlist/admin_user_list_common.html"> 회원목록</a>
          </li>
          <li class="admin-nav-list">
            <!-- 블랙리스트 페이지로 이동 -->
            <a href="blacklist/admin_blacklist.html"> 블랙리스트</a>
          </li>
          <li class="admin-nav-list">
            <!-- 멍! 카이브 목록 페이지로 이동 -->
            <a href="dogarchaive/admin_dogarchaive_list.html">
              멍! 카이브 목록</a
            >
          </li>
          <li class="admin-nav-list">
            <!-- 멍! 케어 목록 페이지로 이동 -->
            <a href="dogcare/admin_dogcare_list.html"> 멍! 케어 목록</a>
          </li>
          <li class="admin-nav-list">
            <!-- 멍! 로그 목록 페이지로 이동 -->
            <a href="doglog/admin_doglog_list.html"> 멍! 로그 목록</a>
          </li>
          <li class="admin-nav-list">
            <!-- 문의사항 페이지로 이동 -->
            <a href="inquiry/admin_inquiry.html"> 문의목록</a>
          </li>
        </ul>
      </nav>
      <div class="admin-sidebar-footer">
        <!-- 임시 -->
        <div class="site-logo">로고</div>
      </div>
    </aside>
  </body>
</html>
