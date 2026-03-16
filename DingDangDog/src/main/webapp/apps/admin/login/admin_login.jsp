<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 로그인</title>
    <link rel="stylesheet" href="/assets/css/admin/admin.css" />
    <link rel="stylesheet" href="/assets/css/admin/login/admin_login.css" />
    <script defer src="../../../assets/js/admin/admin_login.js"></script>
  </head>
  <body>
    <main class="admin-login-main">
      <div class="login-container admin-box-shadow">
        <header class="site-name">
          <span>Ding Dong DOG !</span>
        </header>

        <div class="login-content">
          <div class="admin-login-title"><span>관리자 로그인</span></div>

          <form
            action="../dashboard/admin_dashboard.html"
            method=""
            class="login-form"
          >
            <div>
              <input
                type="text"
                class="admin-login-input"
                placeholder="아이디"
              />
            </div>

            <div>
              <input
                type="password"
                class="admin-login-input"
                placeholder="비밀번호"
              />
            </div>
            <div id="login-error-msg" class="error-message">
              아이디 혹은 비밀번호가 틀렸습니다.
            </div>
            <div class="login-btn-wrapper">
              <button type="submit" class="login-btn">로그인</button>
            </div>
          </form>
          <!-- test -->
          <button type="button" id="js-test">js test</button>
          <!-- test -->
        </div>
      </div>
    </main>
  </body>
  <!-- <script>
    const testBtn = document.getElementById("js-test");
    const errorMsg = document.getElementById("login-error-msg");
    testBtn.addEventListener("click", () => {
      errorMsg.style.display = "block";
    });
  </script> -->
</html>
