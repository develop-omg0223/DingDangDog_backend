<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>로그인 페이지</title>
  <link rel="stylesheet" href="/assets/css/login/login.css" />

</head>

<body>
  <!-- header -->
  <div id="header-container"></div>


  <main>
    <section>
      <div class="login-header-title">Ding Dong Dog !</div>
      <div class="login-container">
        <div class="login-main">
          <div class="login-main-title">로그인</div>
          <div class="form-container">
            <form action="">
              <div class="login-main-member">
                <div class="login-main-common-choice">일반 회원</div>
                <div class="login-main-shelter-choice">보호소 회원</div>
              </div>
              <div class=" login-main-container-input">
                <div class="login-main-container-id">
                  <label for="user-id" class="login-main-idwriting">아이디</label>
                  <input type="text" id="user-id" name="user-id" placeholder="아이디">
                </div>
                <div class="login-main-container-password">
                  <label for="user-pw" class="login-main-passwordwriting">비밀번호</label>
                  <div class="login-main-input-password"><input type="password" id="user-pw" name="user-pw"
                      placeholder="비밀번호" >
                    <span>눈</span>
                  </div>
                </div>
                <div class="login-main-input-msg"><span>아이디 또는 비밀번호가 틀렸습니다.</span></div>
                <div class="login-btn">
                  <input type="submit" value="로그인">
                </div>
              </div>

            </form>
            <div class="login-footer">
              <div class="signup-btn"><input type=submit value="회원가입"></div>
              <div class="find-pw"><input type=submit value="비밀번호 찾기"></div>
            </div>
          </div>



    </section>
  </main>
  <!-- footer -->
  <div id="footer-container"></div>
  <!-- js -->
  <script src="/assets/js/header-footer.js"></script>
</body>

</html>