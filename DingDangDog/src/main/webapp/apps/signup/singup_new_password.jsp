<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="/assets/css/signup/signup_new_password.css">
</head>
<body>
    <header></header>

    <main>
        <section>
            <div class="main-title"> Ding Dong Dong!</div>
            <div class="main-container">
                <div class="main-container-title">비밀번호 재설정</div>
                <div class="main-form-container">
                    <form action="">
                        <div class="main-container-password">
                            <div class="main-container-newpassword">
                                <div class="main-input-newpassword">
                                    <div class="main-newpassword-writing"><label for="user-password">새 비밀번호</label></div>
                                    <input type="password" id="user-password" name="user-password"><span class="eyes">눈</span>
                                </div>
                              <div class=" main-newpassword-message"><p>영문,숫자,특수 문자 포함 8자리이상</p></div>
                            </div>
                            <div class="main-container-checkpassword">
                                <div class="main-input-checkpassword">
                                   <div class="main-checkpassword-writing"><label for="user-checkpassword">비밀번호 재입력</label></div>
                                    <input type="password" id="user-checkpassword" name="user-checkpassword"> 
                                    <span>눈</span>
                                </div>
                            <div class="main-checkpassword-message"><p>비밀번호가 일치하지 않습니다</p></div>
                            </div>
                        </div>
                        <div class="main-form-button">
                            <input type="submit" value="확인">
                        </div>
                    </form>
                </div>
            </div>
        </section>



    </main>

    <footer></footer>
</body>
</html>