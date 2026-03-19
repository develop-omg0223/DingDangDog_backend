<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>마이페이지 메인(보호소회원)</title>
  <link rel="stylesheet" href="./../../../assets/css/mypage/shelter/../shelter/archive_list.css" />
  <script defer src="./../../../assets/js/mypage/shelter/archive_list.js"></script>
  <script defer src="../../../assets/js/header.js"></script>
</head>

<body>
  <!-- <header id="header-container">header</header> -->
  <!-- header -->
  <div id="header-container"></div>

  <main class="archive-list">

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
          <article class="panel panel-center">
            <div class="panel-head">
              <h2 class="panel-title">멍! 카이브 등록 정보</h2>
            </div>

            <div class="panel-body">
              <ul class="archive-list" id="archiveList"></ul>
            </div>

            <div class="panel-footer">
              <div class="pagination">
                <ul class="page-list" id="pagination"></ul>
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