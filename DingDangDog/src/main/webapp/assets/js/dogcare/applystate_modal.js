document.addEventListener("DOMContentLoaded", function () {

  const applyBtn = document.getElementById("applyStatusBtn");
  const modal = document.getElementById("applyModal");
  const closeBtn = document.getElementById("modalClose");

  // 신청현황 클릭
  applyBtn.addEventListener("click", function () {
    modal.style.display = "block";
  });

  // 닫기
  closeBtn.addEventListener("click", function () {
    modal.style.display = "none";
  });

  // 배경 클릭 닫기
  window.addEventListener("click", function (e) {
    if (e.target === modal) {
      modal.style.display = "none";
    }
  });
});