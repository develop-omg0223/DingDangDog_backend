
// =========================
// 요소 선택
// =========================
const newPwInput = document.getElementById("new-pw");
const newPwCheckInput = document.getElementById("new-pw-check");
const pwGuide = document.getElementById("pw-guide");
const pwCheckMessage = document.getElementById("pw-check-message");

const nicknameInput = document.getElementById("nickname");
const nicknameCheckBtn = document.getElementById("nickname-check-btn");
const nicknameSuccess = document.getElementById("nickname-success");
const nicknameError = document.getElementById("nickname-error");

const phoneInput = document.getElementById("phone");
const sendCodeBtn = document.getElementById("send-code-btn");
const verifyCodeInput = document.getElementById("verify-code");
const verifyCodeBtn = document.getElementById("verify-code-btn");
const verifyMessage = document.getElementById("verify-message");

const withdrawOpenBtn = document.getElementById("withdraw-open-btn");
const withdrawModal = document.getElementById("withdraw-modal");
const withdrawCloseBtn = document.getElementById("withdraw-close-btn");
const withdrawConfirmInput = document.getElementById("withdraw-confirm-input");
const withdrawSubmitBtn = document.getElementById("withdraw-submit-btn");


const passwordCheckModal = document.getElementById("password-check-modal");
const passwordCheckCloseBtn = document.getElementById("password-check-close-btn");
const passwordCheckInput = document.getElementById("password-check-input");
const passwordCheckSubmitBtn = document.getElementById("password-check-submit-btn");
const passwordCheckError = document.getElementById("password-check-error");

// =========================
// 상태값
// =========================
const usedNicknames = ["admin", "test123", "guest", "lucas1144", "manager"]; //이미 존재하는 닉네임들 하드코딩
const verificationCode = "12345"; // 인증번호 하드코딩
const withdrawConfirmText = "네 탈퇴하겠습니다"; // 탈퇴 확인 문구 고정
const correctPassword = "1234"; // 현재 비밀번호 하드코딩

let isNicknameChecked = false;
let isNicknameAvailable = false;
let isPhoneVerified = false;
let isCodeSent = false;

// =========================
// 초기 상태
// =========================
hideElement(pwCheckMessage);
hideElement(nicknameSuccess);
hideElement(nicknameError);
hideElement(verifyMessage);

// =========================
// 공통 함수
// =========================
function showElement(element) {
  if (!element) return;
  element.style.display = "block";
}

function hideElement(element) {
  if (!element) return;
  element.style.display = "none";
}

function setGuideState(element, text, type = "default") {
  if (!element) return;

  element.textContent = text;
  element.classList.remove("error-text", "info-text");

  if (type === "error") {
    element.classList.add("error-text");
  } else if (type === "info") {
    element.classList.add("info-text");
  }

  showElement(element);
}

function validatePassword(password) {
  // 영문, 숫자, 특수문자 포함 8자 이상
  const hasLetter = /[A-Za-z]/.test(password);
  const hasNumber = /\d/.test(password);
  const hasSpecial = /[!@#$%^&*(),.?":{}|<>_\-\\[\]/~`+=;'']/ .test(password);
  const hasMinLength = password.length >= 8;

  return hasLetter && hasNumber && hasSpecial && hasMinLength;
}

function checkPasswordRule() {
  const password = newPwInput.value.trim();

  if (password.length === 0) {
    pwGuide.textContent = "영문, 숫자, 특수문자 포함 8자리 이상";
    pwGuide.classList.remove("error-text", "info-text");
    return false;
  }

  if (validatePassword(password)) {
    pwGuide.textContent = "사용 가능한 비밀번호 형식입니다.";
    pwGuide.classList.remove("error-text");
    pwGuide.classList.add("info-text");
    return true;
  } else {
    pwGuide.textContent = "영문, 숫자, 특수문자 포함 8자리 이상";
    pwGuide.classList.remove("info-text");
    pwGuide.classList.add("error-text");
    return false;
  }
}

function checkPasswordMatch() {
  const password = newPwInput.value;
  const passwordCheck = newPwCheckInput.value;

  if (passwordCheck.length === 0) {
    hideElement(pwCheckMessage);
    return false;
  }

  if (password === passwordCheck) {
    setGuideState(pwCheckMessage, "비밀번호가 일치합니다.", "info");
    return true;
  } else {
    setGuideState(pwCheckMessage, "입력한 비밀번호가 틀립니다.", "error");
    return false;
  }
}

function resetNicknameCheckState() {
  isNicknameChecked = false;
  isNicknameAvailable = false;
  hideElement(nicknameSuccess);
  hideElement(nicknameError);
}

function resetPhoneVerifyState() {
  isPhoneVerified = false;
  hideElement(verifyMessage);
}

function openWithdrawModal() {
  withdrawModal.classList.add("show");
  withdrawConfirmInput.value = "";
  withdrawConfirmInput.focus();
}

function closeWithdrawModal() {
  withdrawModal.classList.remove("show");
  withdrawConfirmInput.value = "";
}

// =========================
// 비밀번호 실시간 검사
// =========================
if (newPwInput) {
  newPwInput.addEventListener("input", () => {
    checkPasswordRule();
    checkPasswordMatch();
  });
}

if (newPwCheckInput) {
  newPwCheckInput.addEventListener("input", () => {
    checkPasswordMatch();
  });
}




// =========================
// 닉네임 중복확인
// =========================
if (nicknameInput) {
  nicknameInput.addEventListener("input", () => {
    resetNicknameCheckState();
  });
}

if (nicknameCheckBtn) {
  nicknameCheckBtn.addEventListener("click", () => {
    const nickname = nicknameInput.value.trim();

    if (nickname.length === 0) {
      hideElement(nicknameSuccess);
      setGuideState(nicknameError, "닉네임을 입력해주세요.", "error");
      return;
    }

    isNicknameChecked = true;

    if (usedNicknames.includes(nickname)) {
      isNicknameAvailable = false;
      hideElement(nicknameSuccess);
      setGuideState(nicknameError, "사용 불가능한 닉네임 입니다.", "error");
    } else {
      isNicknameAvailable = true;
      hideElement(nicknameError);
      setGuideState(nicknameSuccess, "사용 가능한 닉네임 입니다.", "info");
    }
  });
}




// =========================
// 휴대폰 인증
// =========================
if (phoneInput) {
  phoneInput.addEventListener("input", () => {
    resetPhoneVerifyState();
    isCodeSent = false;
  });
}

if (sendCodeBtn) {
  sendCodeBtn.addEventListener("click", () => {
    const phone = phoneInput.value.trim();

    if (phone.length === 0) {
      setGuideState(verifyMessage, "핸드폰 번호를 입력해주세요.", "error");
      return;
    }

    isCodeSent = true;
    isPhoneVerified = false;
    setGuideState(verifyMessage, "인증번호가 전송되었습니다. (테스트용: 12345)", "info");
  });
}




if (verifyCodeBtn) {
  verifyCodeBtn.addEventListener("click", () => {
    const inputCode = verifyCodeInput.value.trim();

    if (!isCodeSent) {
      setGuideState(verifyMessage, "먼저 인증 번호를 전송해주세요.", "error");
      return;
    }

    if (inputCode === verificationCode) {
      isPhoneVerified = true;
      setGuideState(verifyMessage, "번호가 일치 합니다.", "info");
    } else {
      isPhoneVerified = false;
      setGuideState(verifyMessage, "인증 번호가 일치하지 않습니다.", "error");
    }
  });
}




// =========================
// 회원 탈퇴 모달
// =========================
if (withdrawOpenBtn) {
  withdrawOpenBtn.addEventListener("click", () => {
    openWithdrawModal();
  });
}

if (withdrawCloseBtn) {
  withdrawCloseBtn.addEventListener("click", () => {
    closeWithdrawModal();
  });
}

if (withdrawModal) {
  withdrawModal.addEventListener("click", (event) => {
    if (event.target === withdrawModal) {
      closeWithdrawModal();
    }
  });
}

if (withdrawSubmitBtn) {
  withdrawSubmitBtn.addEventListener("click", () => {
    const userInput = withdrawConfirmInput.value.trim();

    if (userInput === withdrawConfirmText) {

      //나중에 회원탈퇴 로직 처리후 아래 이어서 진행 
      window.location.href = "./../etc/goodby.html";
    } else {
      alert("입력 오류입니다!")
      closeWithdrawModal();
    }
  });
}

if (withdrawConfirmInput) {
  withdrawConfirmInput.addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
      withdrawSubmitBtn.click();
    }
  });
}



// =========================
// 진입시 비밀번호 확인 모달
// =========================
function openPasswordCheckModal() {
  passwordCheckModal.classList.add("show");
  passwordCheckInput.value = "";
  passwordCheckError.style.display = "none";
  setTimeout(() => {
    passwordCheckInput.focus();
  }, 0);
}

function closePasswordCheckModal() {
  passwordCheckModal.classList.remove("show");
  passwordCheckInput.value = "";
  passwordCheckError.style.display = "none";
}

function checkProfilePassword() {
  const inputValue = passwordCheckInput.value.trim();

  if (inputValue === correctPassword) {
    closePasswordCheckModal();
  } else {
    passwordCheckError.style.display = "block";
    passwordCheckInput.value = "";
    passwordCheckInput.focus();
  }
}

openPasswordCheckModal();

if (passwordCheckSubmitBtn) {
  passwordCheckSubmitBtn.addEventListener("click", checkProfilePassword);
}

if (passwordCheckInput) {
  passwordCheckInput.addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
      checkProfilePassword();
    }
  });
}

if (passwordCheckCloseBtn) {
  passwordCheckCloseBtn.addEventListener("click", () => {
    window.location.href = "./../common/mypage_common.html";
  });
}



//변경완료
const completeBtn = document.getElementById("complete-btn");

completeBtn.addEventListener("click", function () {
  alert("변경이 완료되었습니다.");
  window.location.href = "./mypage_common.html";
});
