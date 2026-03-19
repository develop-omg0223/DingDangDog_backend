<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>문의글 작성(보호소회원)</title>
  <link rel="stylesheet" href="./../../../assets/css/mypage/shelter/support_write_shelter.css" />
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>
  <main class="support-write-shleter">
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
          <div class="panel">
            <div class="panel-head">
              <h2 class="panel-title">문의글 작성</h2>
            </div>

            <div class="input-title">
              <h2>문의 제목</h2>
              <input type="text" name="title-text" id="title-text">
            </div>
            <div class="info">
              <h2>문의 내용</h2>
            </div>
            <div class="input-main">
              <textarea id="main-text" name="main-text"></textarea>
            </div>

            <div class="panel-body">

              <div class="panel-footer">
                <a class="btn-back" href="./support_list_shelter.html">목록으로</a>
                <a class="btn-add" href="./support_list_shelter.html">문의글 등록</a>
              </div>
            </div>
          </div>
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