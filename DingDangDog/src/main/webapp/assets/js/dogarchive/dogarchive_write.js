document.addEventListener('DOMContentLoaded', function() {
    const dogImage = document.getElementById('dogImage');
    const previewImage = document.getElementById('previewImage');
    const btnWriteSave = document.getElementById('btnWriteSave');
    const writeForm = document.getElementById('writeForm');
    const editor = document.getElementById('archiveContentEditor');
    const dogDetailHidden = document.getElementById('dogDetailHidden');

    // 1. 이미지 미리보기
    if (dogImage) {
        dogImage.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    previewImage.src = event.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    }

    // 2. 등록 버튼 클릭 이벤트
    if (btnWriteSave) {
        btnWriteSave.addEventListener('click', function() {
            // 유효성 검사
            const dogName = document.getElementById('dogName').value.trim();
            if (!dogName) {
                alert("강아지 이름을 입력해주세요!");
                return;
            }

            // contenteditable 에디터 내용을 히든 필드에 복사
            if (editor && dogDetailHidden) {
                // innerHTML로 가져와야 줄바꿈 태그(<br>) 등이 유지됩니다.
                dogDetailHidden.value = editor.innerHTML; 
            }

            // 폼 전송
            if (writeForm) {
                writeForm.submit();
            }
        });
    }

    // 3. 취소 버튼
    const btnCancel = document.getElementById('btnCancel');
    if (btnCancel) {
        btnCancel.addEventListener('click', function() {
            window.history.back();
        });
    }
});