<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>마이페이지 메인(일반회원)</title>
  <link rel="stylesheet" href="./../../../assets/css/mypage/common/mypage_common.css" />
  <script defer src="./../../../assets/js/mypage/common/mypage_common.js"></script>
</head>
<body>
    <!-- header -->
  <div id="header-container"></div>
  <main class="mypage-common">

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

          <article class="panel panel-left">
            <div class="panel-head">
              <h2 class="panel-title">000님의 멍! 매칭 결과</h2>
            </div>

            <div class="panel-body">
              <ul class="match-list">
                <li class="match-row">
                  <div class="match-title"></div>
                  <div class="match-date"></div>
                </li>
                <li class="match-row">
                  <div class="match-title"></div>
                  <div class="match-date"></div>
                </li>
                <li class="match-row">
                  <div class="match-title"></div>
                  <div class="match-date"></div>
                </li>
                <li class="match-row">
                  <div class="match-title"></div>
                  <div class="match-date"></div>
                </li>
                <li class="match-row">
                  <div class="match-title"></div>
                  <div class="match-date"></div>
                </li>
              </ul>
              <div class="panel-footer">
                <a class="btn-outline" href="">멍! 매칭 하러가기</a>
              </div>
            </div>
          </article>

          <article class="panel panel-right">
            <div class="panel-head">
              <h2 class="panel-title">내 정보</h2>
            </div>

            <div class="panel-body">
              <dl class="info-table">
                <div class="info-row">
                  <dt>이름</dt>
                  <dd id="userName_common"></dd>
                </div>
                <div class="info-row">
                  <dt>닉네임</dt>
                  <dd id="userNickname_common"></dd>
                </div>
                <div class="info-row">
                  <dt>생년월일</dt>
                  <dd id="userBirth_common"></dd>
                </div>
                <div class="info-row">
                  <dt>핸드폰 번호</dt>
                  <dd id="userPhonenumber_common"></dd>
                </div>
                <div class="info-row">
                  <dt>이메일 주소</dt>
                  <dd id="userEmail_common"></dd>
                </div>
              </dl>

              <div class="panel-footer panel-footer-right">
                <a class="btn-outline" href="./profile_edit_common.html">내 정보 변경</a>
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