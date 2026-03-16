<!doctype html>

<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>보호소 회원 회원가입</title>
<link rel="stylesheet" href="/assets/css/signup/signup_shelter.css">
</head>
<body>
<header></header>
<main>
<div class="main-shelter-title">보호소회원</div>
<form action="">
<div class="main-shelter-container">

      <div class="main-form-shelter-id">
        <div class="main-container-shelter-id">
          <div class="main-input-shelter-id">
            <div class="main-input-id-shelter-writing"><label for="user-shelter-id">아이디</label></div>
            <input type="text" id="user-shelter-id" name="user-shelter-id"> 
          </div>
          <div class="id-shelter-btn"><button type="button">중복확인</button></div>
        </div>
        <div class="main-form-id-shelter-message"><p>회원님의 아이디가 중복 되었습니다</p></div>   
      </div>

      <div class="main-form-shelter-pw">
        <div class="main-container-shelter-pw">
          <div class="main-input-shelter-pw">
            <div class="main-input-pw-shelter-writing"><label for="user-shelter-pw">비밀번호</label></div>
            <input type="password" id="user-shelter-pw" name="user-shelter-pw">
            <span>눈</span>
          </div>
          <div class="main-form-pw-shelter-message"><p>영문,숫자,특수문자 포함 8자리이상 입력 </p></div>
        </div>
      </div>

      <div class="main-form-shelter-checkpw">
        <div class="main-container-shelter-checkpw">
          <div class="main-input-shelter-checkpw">
            <div class="main-input-checkpw-shelter-writing"><label for="user-pw-shelter-check">비밀번호 재입력</label></div>
            <input type="password" id="user-pw-shelter-check" name="user-pw-shelter-check">
            <span>눈</span>
          </div> 
        </div>
        <div class="main-form-checkpw-shelter-message"><p>비밀번호가 일치하지 않습니다</p></div>
      </div>

      <div class="main-form-sheltername">
        <div class="main-input-sheltername"><label for="sheltername">보호소명</label></div>
        <input type="text" id="sheltername" name="user-sheltername">
      </div>

      <div class="main-form-shelter-nickname">
        <div class="main-container-shelter-nickname">
          <div class="main-input-shelter-nickname">
            <div class="main-input-nickname-shelter-writing"><label for="user-shelter-nickname">닉네임</label></div>
            <input type="text" id="user-shelter-nickname" name="user-shelter-nickname"> 
          </div>
          <div class="nickname-shelter-btn"><button type="button">중복확인</button></div>
        </div>
        <div class="main-form-nickname-shelter-message"><p>회원님의 닉네임이 중복 되었습니다</p></div>
      </div>

      <div class="main-form-shelter-name">
        <div class="main-container-shelter-name">
          <div class="main-name-shelter-writing"><label for="user-shelter-name">이름</label></div>
          <input type="text" id="user-shelter-name" name="user-shelter-name">
        </div>
        <div class="user-gender-shelter-container">
          <div class="user-gender-container-shelter-male">
            <span class="user-gender-shelter-male">남</span>
            <input type="radio" id="user-shelter-male" name="user-shelter-gender" value="남">
          </div>
          <div class="user-gender-container-shelter-female">
            <label for="user-shelter-female">여</label>
            <input type="radio" id="user-shelter-female" name="user-shelter-gender" value="여">
          </div>
        </div>
      </div>

      <div class="main-form-shelter-birth">
        <div class="main-form-shelter-container">
          <div class="main-birth-shelter-writing"><label for="user-shelter-birth">생년월일</label></div>
          <input type="text" id="user-shelter-birth" name="user-shelter-birth">
        </div>
        <div class="main-birth-shelter-message">ex&#41;2000-00-00</div>
      </div>

      <div class="main-form-shelter-address">
        <div class="main-container-shelter-address">
          <div class="main-address-shelter-writing"><label for="user-shelter-address">주소</label></div>
          <input type="text" id="user-shelter-address" name="user-shelter-address">
        </div>
        <div class="address-shelter-btn"><button type="button">우편번호 찾기</button></div>
      </div>

      <div class="main-form-shelter-business">
        <div class="main-container-shelter-business">
          <div class="main-input-shelter-business">
            <div class="main-business-shelter-writing"><label for="user-shelter-business">사업자 등록번호</label></div>
            <input type="text" id="user-shelter-business" name="user-shelter-business">
          </div>
          <div class="user-business-shelter-message"><p>사업자 등록번호 10자리를 정확히 입력해주세요</p></div>
        </div>
      </div>

      <div class="main-form-shelter-phone">
        <div class="main-container-shelter-phone">
          <div class="main-phone-shelter-writing"><label for="user-shelter-phone">휴대폰 번호</label></div>
          <input type="text" id="user-shelter-phone" name="user-shelter-phone">
          <div class="phone-shelter-btn"><button type="button">인증번호 전송</button></div>
        </div>
        <div class="main-phone-shelter-message"><p>인증번호 발송에 실패했습니다. 정보를 다시 확인해주세요.</p></div>
      </div>

      <div class="main-form-shelter-verification">
        <div class="main-container-shelter-verification">
          <div class="main-input-shelter-verification">
            <div class="main-verification-shelter-writing"><label for="user-shelter-verification">인증번호</label></div>
            <input type="text" id="user-shelter-verification" name="user-shelter-verification">  
          </div>
          <div class="verification-shelter-btn"><button type="button">인증번호 확인</button></div>
        </div>
        <div class="main-verification-shelter-message"><p>인증번호가 일치하지 않습니다</p></div>
      </div>

      <div class="main-form-shelter-emailAddress">
        <div class="main-container-shelter-emailAddress">
          <div class="main-emailAddress-shelter-writing"><label for="email-shelter-user">이메일 주소</label></div>
          <input type="text" id="email-shelter-user" name="email-shelter-user">
        </div>
      </div> 
      <div class="signup-shelter-btn"><button type="submit">회원가입</button></div>
    </div>

  </form>
</main>
<footer></footer>