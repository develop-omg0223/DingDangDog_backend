// 신청하기 로직
let applied = false;

const applyBtn = document.getElementById("applyBtn");
const applyCount = document.getElementById("applyCount");

applyBtn.addEventListener("click", function () {

  // 이미 신청했으면 실행 안함
  if (applied) {
    return;
  }

  // 신청 알림
  alert("신청되었습니다");

  // 신청 인원 증가
  let count = parseInt(applyCount.innerText);
  count++;
  applyCount.innerText = count;

  // 버튼 비활성화
  applyBtn.disabled = true;
  applyBtn.innerText = "신청완료";

  applied = true;
});

// 목록으로
listBtn.addEventListener("click", function () {
location.href = "./dogcare_list_common.html";
});