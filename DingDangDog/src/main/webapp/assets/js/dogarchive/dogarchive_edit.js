/*
// 취소
btnCancle.addEventListener("click", function () {
  alert("수정 취소되었습니다.");
  location.href = "./dogarchive_detail.ar";
});
// 수정
btnEditSave.addEventListener("click", function () {
  alert("수정되었습니다.");
  location.href = "./dogarchive_detail.ar";
});*/









// 취소 버튼
btnCancle.addEventListener("click", function () {
  alert("수정 취소되었습니다.");
  // .jsp가 아니라 상세 조회 컨트롤러(.ar)로 보내야 합니다. 
  // dogNumber는 현재 페이지 URL에서 추출하거나 archiveDetailData.id를 사용하세요.
  location.href = "/DingDangDog/archive/read.ar?dogNumber=" + archiveDetailData.id;
});

// 수정 완료 버튼
btnEditSave.addEventListener("click", function () {
  alert("수정되었습니다.");
  // 실제로는 여기서 폼(form)을 전송(submit)하여 updateOk.ar을 타야 하지만, 
  // 일단 테스트를 위해 경로를 수정한다면:
  location.href = "/DingDangDog/archive/read.ar?dogNumber=" + archiveDetailData.id;
});