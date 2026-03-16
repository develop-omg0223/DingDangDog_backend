<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>대시보드</title>
    <link rel="stylesheet" href="../../../assets/css/admin/admin.css" />
    <link
      rel="stylesheet"
      href="../../../assets/css/admin/dashboard/admin_dashboard.css"
    />
  </head>
  <body>
    <!-- 전체화면 -->
    <main class="admin-main-container">
      <!-- 사이드바 -->
      <aside class="admin-sidebar">
        <div class="admin-sidebar-header">
          <!-- 관리자 대시보드 페이지로 이동 -->
          <a href="./admin_dashboard.html">Ding Dong DOG !</a>
        </div>
        <div class="admin-info-section">
          <span class="admin-login-info">admin01</span>
          <button class="admin-logout-btn">로그아웃</button>
        </div>
        <nav class="admin-nav-menu">
          <ul>
            <li class="admin-nav-list">
              <!-- 회원목록 페이지로 이동 -->
              <a href="../userlist/admin_user_list_common.html"> 회원목록</a>
            </li>
            <li class="admin-nav-list">
              <!-- 블랙리스트 페이지로 이동 -->
              <a href="../blacklist/admin_blacklist.html"> 블랙리스트</a>
            </li>
            <li class="admin-nav-list">
              <!-- 멍! 카이브 목록 페이지로 이동 -->
              <a href="../dogarchaive/admin_dogarchaive_list.html">
                멍! 카이브 목록</a
              >
            </li>
            <li class="admin-nav-list">
              <!-- 멍! 케어 목록 페이지로 이동 -->
              <a href="../dogcare/admin_dogcare_list.html"> 멍! 케어 목록</a>
            </li>
            <li class="admin-nav-list">
              <!-- 멍! 로그 목록 페이지로 이동 -->
              <a href="../doglog/admin_doglog_list.html"> 멍! 로그 목록</a>
            </li>
            <li class="admin-nav-list">
              <!-- 문의사항 페이지로 이동 -->
              <a href="../inquiry/admin_inquiry.html"> 문의목록</a>
            </li>
          </ul>
        </nav>
        <div class="admin-sidebar-footer">
          <!-- 임시 -->
          <div class="site-logo">로고</div>
        </div>
      </aside>
      <!-- 메인 화면 -->
      <section class="admin-main-section">
        <!-- 페이지 상단 (제목, 버튼) -->
        <div class="admin-main-section-header">
          <div class="admin-title">대시보드</div>
        </div>
        <!-- 페이지 컨텐츠 -->
        <div class="admin-main-content">
          <!-- 테이블등 정보 -->
          <ul class="dashboard-row">
            <li>
              <article class="dashboard-box admin-box-shadow">
                <div class="box-header">
                  <span class="box-title">회원 목록</span>
                  <button id="user-link-btn" class="link-btn">+</button>
                </div>
                <div class="box-content">
                  <div class="dashboard-list-row userlist">
                    <div class="user-number">번호</div>
                    <div class="user-id">아이디</div>
                    <div class="user-name">이름</div>
                    <div class="user-nickname">닉네임</div>
                  </div>

                  <div class="dashboard-list-row userlist">
                    <div class="user-number">50</div>
                    <div class="user-id">Zzang12</div>
                    <div class="user-name">짱구</div>
                    <div class="user-nickname">z123z</div>
                  </div>

                  <div class="dashboard-list-row userlist">
                    <div class="user-number">50</div>
                    <div class="user-id">Zzang12</div>
                    <div class="user-name">짱구</div>
                    <div class="user-nickname">z123z</div>
                  </div>

                  <div class="dashboard-list-row userlist">
                    <div class="user-number">50</div>
                    <div class="user-id">Zzang12</div>
                    <div class="user-name">짱구</div>
                    <div class="user-nickname">z123z</div>
                  </div>

                  <div class="dashboard-list-row userlist">
                    <div class="user-number">50</div>
                    <div class="user-id">Zzang12</div>
                    <div class="user-name">짱구</div>
                    <div class="user-nickname">z123z</div>
                  </div>

                  <div class="dashboard-list-row userlist">
                    <div class="user-number">50</div>
                    <div class="user-id">Zzang12</div>
                    <div class="user-name">짱구</div>
                    <div class="user-nickname">z123z</div>
                  </div>
                </div>
              </article>
            </li>
            <li>
              <article class="dashboard-box admin-box-shadow">
                <div class="box-header">
                  <span class="box-title">블랙리스트</span>
                  <button id="black-link-btn" class="link-btn">+</button>
                </div>
                <div class="box-content">
                  <div class="dashboard-list-row blacklist">
                    <div class="black-user-number">번호</div>
                    <div class="black-user-id">아이디</div>
                    <div class="black-user-name">이름</div>
                    <div class="black-user-nickname">닉네임</div>
                    <div class="black-reason">사유</div>
                  </div>

                  <div class="dashboard-list-row blacklist">
                    <div class="black-user-number">23</div>
                    <div class="black-user-id">samks202</div>
                    <div class="black-user-name">김철수</div>
                    <div class="black-user-nickname">steel202</div>
                    <div class="black-reason">노쇼</div>
                  </div>
                  <div class="dashboard-list-row blacklist">
                    <div class="black-user-number">23</div>
                    <div class="black-user-id">samks202</div>
                    <div class="black-user-name">김철수</div>
                    <div class="black-user-nickname">steel202</div>
                    <div class="black-reason">노쇼</div>
                  </div>
                  <div class="dashboard-list-row blacklist">
                    <div class="black-user-number">23</div>
                    <div class="black-user-id">samks202</div>
                    <div class="black-user-name">김철수</div>
                    <div class="black-user-nickname">steel202</div>
                    <div class="black-reason">노쇼</div>
                  </div>
                  <div class="dashboard-list-row blacklist">
                    <div class="black-user-number">23</div>
                    <div class="black-user-id">samks202</div>
                    <div class="black-user-name">김철수</div>
                    <div class="black-user-nickname">steel202</div>
                    <div class="black-reason">노쇼</div>
                  </div>
                  <div class="dashboard-list-row blacklist">
                    <div class="black-user-number">23</div>
                    <div class="black-user-id">samks202</div>
                    <div class="black-user-name">김철수</div>
                    <div class="black-user-nickname">steel202</div>
                    <div class="black-reason">노쇼</div>
                  </div>
                </div>
              </article>
            </li>
          </ul>
          <ul class="dashboard-row">
            <li>
              <article class="dashboard-box admin-box-shadow">
                <div class="box-header">
                  <span class="box-title">멍! 카이브 목록</span>
                  <button id="archive-link-btn" class="link-btn">+</button>
                </div>
                <div class="box-content">
                  <div class="dashboard-list-row dogarchive">
                    <div class="dogarchive-number">번호</div>
                    <div class="dogarchive-name">이름</div>
                    <div class="dogarchive-age">나이</div>
                    <div class="dogarchive-type">견종</div>
                    <div class="dogarchaive-shelter">등록 보호소</div>
                    <div class="dogarchaive-date">보호 날짜</div>
                  </div>
                  <div class="dashboard-list-row dogarchive">
                    <div class="dogarchive-number">4</div>
                    <div class="dogarchive-name">흰둥이</div>
                    <div class="dogarchive-age">5 살</div>
                    <div class="dogarchive-type">푸들</div>
                    <div class="dogarchaive-shelter">희망 보호소</div>
                    <div class="dogarchaive-date">2025-12-14</div>
                  </div>
                  <div class="dashboard-list-row dogarchive">
                    <div class="dogarchive-number">4</div>
                    <div class="dogarchive-name">흰둥이</div>
                    <div class="dogarchive-age">5 살</div>
                    <div class="dogarchive-type">푸들</div>
                    <div class="dogarchaive-shelter">희망 보호소</div>
                    <div class="dogarchaive-date">2025-12-14</div>
                  </div>
                  <div class="dashboard-list-row dogarchive">
                    <div class="dogarchive-number">4</div>
                    <div class="dogarchive-name">흰둥이</div>
                    <div class="dogarchive-age">5 살</div>
                    <div class="dogarchive-type">푸들</div>
                    <div class="dogarchaive-shelter">희망 보호소</div>
                    <div class="dogarchaive-date">2025-12-14</div>
                  </div>
                  <div class="dashboard-list-row dogarchive">
                    <div class="dogarchive-number">4</div>
                    <div class="dogarchive-name">흰둥이</div>
                    <div class="dogarchive-age">5 살</div>
                    <div class="dogarchive-type">푸들</div>
                    <div class="dogarchaive-shelter">희망 보호소</div>
                    <div class="dogarchaive-date">2025-12-14</div>
                  </div>
                  <div class="dashboard-list-row dogarchive">
                    <div class="dogarchive-number">4</div>
                    <div class="dogarchive-name">흰둥이</div>
                    <div class="dogarchive-age">5 살</div>
                    <div class="dogarchive-type">푸들</div>
                    <div class="dogarchaive-shelter">희망 보호소</div>
                    <div class="dogarchaive-date">2025-12-14</div>
                  </div>
                </div>
              </article>
            </li>
            <li>
              <article class="dashboard-box admin-box-shadow">
                <div class="box-header">
                  <span class="box-title">멍! 케어 목록</span>
                  <button id="care-link-btn" class="link-btn">+</button>
                </div>
                <div class="box-content">
                  <div class="dashboard-list-row dogcare">
                    <div class="dogcare-number">번호</div>
                    <div class="dogcare-title first-row">제목</div>
                    <div class="dogcare-id">봉사 날짜</div>
                    <div class="dogcare-nickname">작성자</div>
                    <div class="dogcare-date">작성 날짜</div>
                  </div>

                  <div class="dashboard-list-row dogcare">
                    <div class="dogcare-number">1</div>
                    <div class="dogcare-title">봉사활동 모집</div>
                    <div class="dogcare-id">2026-03-20</div>
                    <div class="dogcare-nickname">hop123</div>
                    <div class="dogcare-date">2026-03-01</div>
                  </div>
                  <div class="dashboard-list-row dogcare">
                    <div class="dogcare-number">1</div>
                    <div class="dogcare-title">봉사활동 모집</div>
                    <div class="dogcare-id">2026-03-20</div>
                    <div class="dogcare-nickname">hop123</div>
                    <div class="dogcare-date">2026-03-01</div>
                  </div>
                  <div class="dashboard-list-row dogcare">
                    <div class="dogcare-number">1</div>
                    <div class="dogcare-title">봉사활동 모집</div>
                    <div class="dogcare-id">2026-03-20</div>
                    <div class="dogcare-nickname">hop123</div>
                    <div class="dogcare-date">2026-03-01</div>
                  </div>
                  <div class="dashboard-list-row dogcare">
                    <div class="dogcare-number">1</div>
                    <div class="dogcare-title">봉사활동 모집</div>
                    <div class="dogcare-id">2026-03-20</div>
                    <div class="dogcare-nickname">hop123</div>
                    <div class="dogcare-date">2026-03-01</div>
                  </div>
                  <div class="dashboard-list-row dogcare">
                    <div class="dogcare-number">1</div>
                    <div class="dogcare-title">봉사활동 모집</div>
                    <div class="dogcare-id">2026-03-20</div>
                    <div class="dogcare-nickname">hop123</div>
                    <div class="dogcare-date">2026-03-01</div>
                  </div>
                </div>
              </article>
            </li>
          </ul>

          <ul class="dashboard-row">
            <li>
              <article class="dashboard-box admin-box-shadow">
                <div class="box-header">
                  <span class="box-title">멍! 로그 목록</span>
                  <button id="log-link-btn" class="link-btn">+</button>
                </div>
                <div class="box-content">
                  <div class="dashboard-list-row doglog">
                    <div class="doglog-number">번호</div>
                    <div class="doglog-title first-row">제목</div>
                    <div class="doglog-nickname">작성자</div>
                    <div class="doglog-date">작성 날짜</div>
                  </div>

                  <div class="dashboard-list-row doglog">
                    <div class="doglog-number">5</div>
                    <div class="doglog-title">저희 강아지 구경하고 가세요!</div>
                    <div class="doglog-nickname">z123z</div>
                    <div class="doglog-date">2026-03-07</div>
                  </div>
                  <div class="dashboard-list-row doglog">
                    <div class="doglog-number">5</div>
                    <div class="doglog-title">저희 강아지 구경하고 가세요!</div>
                    <div class="doglog-nickname">z123z</div>
                    <div class="doglog-date">2026-03-07</div>
                  </div>
                  <div class="dashboard-list-row doglog">
                    <div class="doglog-number">5</div>
                    <div class="doglog-title">저희 강아지 구경하고 가세요!</div>
                    <div class="doglog-nickname">z123z</div>
                    <div class="doglog-date">2026-03-07</div>
                  </div>
                  <div class="dashboard-list-row doglog">
                    <div class="doglog-number">5</div>
                    <div class="doglog-title">저희 강아지 구경하고 가세요!</div>
                    <div class="doglog-nickname">z123z</div>
                    <div class="doglog-date">2026-03-07</div>
                  </div>
                  <div class="dashboard-list-row doglog">
                    <div class="doglog-number">5</div>
                    <div class="doglog-title">저희 강아지 구경하고 가세요!</div>
                    <div class="doglog-nickname">z123z</div>
                    <div class="doglog-date">2026-03-07</div>
                  </div>
                </div>
              </article>
            </li>
            <li>
              <article class="dashboard-box admin-box-shadow">
                <div class="box-header">
                  <span class="box-title">문의 목록</span>
                  <button id="inquiry-link-btn" class="link-btn">+</button>
                </div>
                <div class="box-content">
                  <div class="dashboard-list-row inquiry">
                    <div class="inquiry-number">번호</div>
                    <div class="inquiry-title first-row">제목</div>
                    <div class="inquiry-nickname">작성자</div>
                    <div class="inquiry-response">답변상태</div>
                  </div>

                  <div class="dashboard-list-row inquiry">
                    <div class="inquiry-number">33</div>
                    <div class="inquiry-title">글이 안 써집니다</div>
                    <div class="inquiry-nickname">z123z</div>
                    <div class="inquiry-response response-wait">답변대기</div>
                  </div>
                  <div class="dashboard-list-row inquiry">
                    <div class="inquiry-number">33</div>
                    <div class="inquiry-title">글이 안 써집니다</div>
                    <div class="inquiry-nickname">z123z</div>
                    <div class="inquiry-response response-wait">답변대기</div>
                  </div>
                  <div class="dashboard-list-row inquiry">
                    <div class="inquiry-number">33</div>
                    <div class="inquiry-title">글이 안 써집니다</div>
                    <div class="inquiry-nickname">z123z</div>
                    <div class="inquiry-response response-wait">답변대기</div>
                  </div>
                  <div class="dashboard-list-row inquiry">
                    <div class="inquiry-number">24</div>
                    <div class="inquiry-title">문의드리고싶은게 있습니다</div>
                    <div class="inquiry-nickname">drking</div>
                    <div class="inquiry-response response-wait">답변대기</div>
                  </div>
                  <div class="dashboard-list-row inquiry">
                    <div class="inquiry-number">25</div>
                    <div class="inquiry-title">사진이 안올라가요</div>
                    <div class="inquiry-nickname">rals212</div>
                    <div class="inquiry-response">
                      <span class="response-complete"> 답변완료 </span>
                    </div>
                  </div>
                </div>
              </article>
            </li>
          </ul>
        </div>
        <!-- 페이지 하단 (검색, 페이지네이션) -->
        <div class="admin-main-section-footer"></div>
      </section>
    </main>
  </body>
  <script>
    const userLinkBtn = document.getElementById("user-link-btn");
    const blackLinkBtn = document.getElementById("black-link-btn");
    const archiveLinkBtn = document.getElementById("archive-link-btn");
    const careLinkBtn = document.getElementById("care-link-btn");
    const logLinkBtn = document.getElementById("log-link-btn");
    const inquiryLinkBtn = document.getElementById("inquiry-link-btn");

    userLinkBtn.addEventListener("click", () => {
      location.href = "/html/admin/userlist/admin_user_list_common.html";
    });

    blackLinkBtn.addEventListener("click", () => {
      location.href = "/html/admin/blacklist/admin_blacklist.html";
    });

    archiveLinkBtn.addEventListener("click", () => {
      location.href = "/html/admin/dogarchaive/admin_dogarchaive_list.html";
    });

    careLinkBtn.addEventListener("click", () => {
      location.href = "/html/admin/dogcare/admin_dogcare_list.html";
    });

    logLinkBtn.addEventListener("click", () => {
      location.href = "/html/admin/doglog/admin_doglog_list.html";
    });

    inquiryLinkBtn.addEventListener("click", () => {
      location.href = "/html/admin/inquiry/admin_inquiry.html";
    });
  </script>
</html>
