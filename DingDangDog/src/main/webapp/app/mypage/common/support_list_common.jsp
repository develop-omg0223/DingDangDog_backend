<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>1:1 문의 리스트(일반회원)</title>
  <link rel="stylesheet" href="./../../../assets/css/mypage/common/support_list_common.css" />
  <script defer src="./../../../assets/js/mypage/common/support_list_common.js"></script>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>
  <main class="support-list-common">
    <div class="container">
      <aside class="sidebar">
        <nav class="side-menu">
          <a class="btn-side-link" href="./profile_edit_common.html">내 정보 변경</a>
          <hr>
          <a class="btn-side-link" href="./volunteer_status_list_common.html">멍! 케어 신청 확인</a>
          <hr>
          <a class="btn-side-link" href="./review_list.html">내가 작성한 멍! 로그 목록</a>
          <hr>
          <a class="btn-side-link" href="./support_list_common.html">1 : 1 문의</a>
        </nav>
      </aside>

      <section class="content">
        <div class="content-box">
          <div class="panel">
            <div class="panel-head">
              <h2 class="panel-title">1:1 문의</h2>
            </div>

            <div class="panel-body">
              <div class="support-table">
                <div class="support-table-head">
                  <div class="col-status">답변상태</div>
                  <div class="col-number">문의글 번호</div>
                  <div class="col-title">제목</div>
                  <div class="col-date">작성일자</div>
                </div>

                <div id="supportTableBody"></div>
              </div>

              <div class="panel-footer">
                <div class="pagination">
                  <ul class="page-list" id="pagination"></ul>
                </div>
                <a class="btn-outline" href="./support_write_common.html">문의글 작성</a>
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