<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/assets/css/signup/signup_find_password.css">
  </head>
  <body>
    <header></header>

    <main>
      <section>
        <div class="password-header-title">Ding Dong Dong!</div>
        <div class="password-main-container">
          <div class="password-main-header">
            <div class="password-title">비밀번호 찾기</div>
            <div class="password-text">아이디를 입력해주세요</div>
          </div>
          <div class="form-container">
            <form action="" >
                <div class="password-main-id">
                    <div class="password-main-id-detail">
                       <div class="password-main-passwordwriting"><label for="user-id" >아이디</label></div>
                       <input type="text" id="user-id" name="user-id"> 
                    </div>
                    <div class="password-main-id-message"><p>존재하지 않는 아이디입니다.</p></div>
                </div>
                <div class="password-main-phoneNumber">
                    <div class="password-main-phoneNumber-input">
                        <div class="password-main-phoneNumber-detail">
                         <div class="password-main-phoneNumberwriting"> <label for="user-phoneNumber">휴대폰번호</label></div>
                            <input type="text" id="user-phoneNumber" name="user-phoneNumber">
                        </div>
                        <button type="button" class="btn-transfer">인증번호 전송</button>
                    </div>
                    <div class="password-main-phoneNumber-message"><p>인증번호 발송에 실패했습니다. 정보를 다시 확인해주세요. </p></div>
                </div>
                <div class=" password-main-verification">
                    <div class="password-main-verification-input">
                        <div class="password-main-verification-detail">
                            <div class="password-main-verificationwriting"><label for="user-verification">인증번호 입력</label></div>
                            <input id ="user-verification" name="user-verification" type="password">
                        </div>
                        <button type="button" class="btn-check">번호확인</button>
                    </div>
                    <div class="password-main-verification-message"><p>인증번호가 일치하지 않습니다</p></div>

                </div>
                <div class="btn-container"> 
                <button type="submit" class="btn-next">다음</button>
                </div>
            </form>
          </div>
        </div>
      </section>
    </main>

    <footer></footer>
  </body>
</html>
