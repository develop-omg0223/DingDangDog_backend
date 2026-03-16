document.addEventListener("DOMContentLoaded", function(){

  const applyBtn = document.getElementById("applyStatusBtn");
  const modal = document.getElementById("applyModal");
  const closeBtn = document.getElementById("modalClose");

  // 신청현황 클릭
  applyBtn.addEventListener("click", function(){
    modal.style.display = "block";
  });

  // 닫기
  closeBtn.addEventListener("click", function(){
    modal.style.display = "none";
  });

  // 배경 클릭 닫기
  window.addEventListener("click", function(e){
    if(e.target === modal){
      modal.style.display = "none";
    }
  });

  // 기타 선택 시 입력창 활성화
  const reportReasons = document.querySelectorAll(".report-reason");

  reportReasons.forEach(function (reasonBox) {
    const radios = reasonBox.querySelectorAll("input[type='radio']");
    const etcInput = reasonBox.querySelector(".etc-input");

    radios.forEach(function (radio) {
      radio.addEventListener("change", function () {
        if (radio.value === "기타" && radio.checked) {
          etcInput.disabled = false;
          etcInput.focus();
        } else if (radio.checked) {
          etcInput.disabled = true;
          etcInput.value = "";
        }
      });
    });
  });

  // 신고 버튼
  const reportBtns = document.querySelectorAll(".report-btn");

  reportBtns.forEach(function (btn) {
    btn.addEventListener("click", function () {
      const row = btn.closest(".apply-row");
      const checkedRadio = row.querySelector("input[type='radio']:checked");
      const etcInput = row.querySelector(".etc-input");

      if (!checkedRadio) {
        alert("신고 사유를 선택해주세요.");
        return;
      }

      if (checkedRadio.value === "기타" && etcInput.value.trim() === "") {
        alert("기타 사유를 입력해주세요.");
        etcInput.focus();
        return;
      }

      alert("신고되었습니다.");
    });
  });
});

