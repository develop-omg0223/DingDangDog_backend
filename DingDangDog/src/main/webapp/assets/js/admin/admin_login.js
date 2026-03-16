const testBtn = document.getElementById("js-test");
const errorMsg = document.getElementById("login-error-msg");
testBtn.addEventListener("click", () => {
  errorMsg.style.display = "block";
});
