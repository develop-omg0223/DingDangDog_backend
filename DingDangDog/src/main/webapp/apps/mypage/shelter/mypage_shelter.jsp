<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>마이페이지 메인(보호소회원)</title>
  <link rel="stylesheet" href="./../../../assets/css/mypage/shelter/mypage_shelter.css" />
  <script defer src="./../../../assets/js/mypage/shelter/mypage_shelter.js"></script>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>
  <main class="mypage-shleter">

    <div class="container">
      <aside class="sidebar">
        <nav class="side-menu">
          <a class="btn-side-link" href="./profile_edit_shelter.html">보호소 정보 변경</a>
          <hr>
          <a class="btn-side-link" href="./care_list.html">멍! 케어 목록 및 현황</a>
          <hr>
          <a class="btn-side-link" href="./archive_list.html">멍! 카이브 등록 정보</a>
          <hr>
          <a class="btn-side-link" href="./support_list_shelter.html">1 : 1 문의</a>
        </nav>
      </aside>

      <section class="content">

        <div class="content-box">

          <article class="panel panel-left">
            <div class="panel-head">
              <h2 class="panel-title">최근 등록한 멍! 카이브</h2>
            </div>
            <div class="panel-body">
              <ul class="archive-list" id="recentArchiveList"></ul>

              </ul>
            </div>
          </article>

          <article class="panel panel-right">
            <div class="panel-head">
              <h2 class="panel-title">보호소 정보</h2>
            </div>

            <div class="panel-body">
              <dl class="info-table">
                <div class="info-row">
                  <dt>보호소 명</dt>
                  <dd>행복 보호소</dd>
                </div>
                <div class="info-row">
                  <dt>닉네임</dt>
                  <dd>happy01</dd>
                </div>
                <div class="info-row">
                  <dt>보호소 인증</dt>
                  <dd>인증 안됨</dd>
                </div>
                <div class="info-row">
                  <dt>보호소 번호</dt>
                  <dd>010-xxxx-xxxx</dd>
                </div>
                <div class="info-row">
                  <dt>이메일 주소</dt>
                  <dd>lucas1144@naver.com</dd>
                </div>
              </dl>

              <div class="panel-footer panel-footer-right">
                <a class="btn-outline" href="./profile_edit_shelter.html">보호소 정보 변경</a>
              </div>
            </div>
          </article>

        </div>
      </section>

    </div>
  </main>

  <!-- footer -->
  <div id="footer-container"></div>
  <!-- js -->
  <script src="/assets/js/header-footer.js"></script>
</body>

</html>