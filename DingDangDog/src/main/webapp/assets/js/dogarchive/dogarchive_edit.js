/**
 * 딩동독 멍!카이브 수정 페이지 전용 JS
 */
document.addEventListener("DOMContentLoaded", function () {
    console.log("=== 딩동독 수정 페이지 로직 가동! ===");

    // 1. 이미지 미리보기 로직
    const imageInput = document.getElementById("dogImage");
    const previewImg = document.getElementById("previewImage");

    if (imageInput && previewImg) {
        imageInput.onchange = function (e) {
            const file = e.target.files[0];
            if (file) {
                // 이미지 파일인지 확인
                if(!file.type.match('image.*')){
                    alert("이미지 파일만 업로드 가능합니다.");
                    return;
                }

                const reader = new FileReader();
                reader.onload = function (event) {
                    previewImg.src = event.target.result;
                };
                reader.readAsDataURL(file);
            }
        };
    }

    // 2. 수정 버튼 클릭 시 확인 알림
    const editForm = document.getElementById("editForm");
    if (editForm) {
        editForm.onsubmit = function() {
            // 필수 값 체크 (이름 등)
            const dogName = document.getElementById("dogName").value;
            if(!dogName.trim()){
                alert("강아지 이름을 입력해주세요!");
                return false;
            }
            return confirm("입력한 내용으로 수정하시겠습니까?");
        };
    }

    console.log("페이지 준비 완료.");
});