document.addEventListener("DOMContentLoaded", function () {
    const hiddenStore = document.getElementById("hiddenDetailStore");

    // [1] 데이터 배분: DB에 저장된 "A | B | C..." 문자열을 각 input 칸에 채움
    if (hiddenStore && hiddenStore.value) {
        const rawData = hiddenStore.value;
        if (rawData.includes(" | ")) {
            const parts = rawData.split(" | ");
            if (parts.length >= 6) {
                document.getElementById("input_dogActivityDetail").value = parts[0].trim();
                document.getElementById("input_dogSocialityDetail").value = parts[1].trim();
                document.getElementById("input_dogIndependenceDetail").value = parts[2].trim();
                document.getElementById("input_dogBarkingDetail").value = parts[3].trim();
                document.getElementById("input_dogGroomingDetail").value = parts[4].trim();
                document.getElementById("input_dogDetail").value = parts[5].trim();
            }
        } else {
            // 구분자 없는 데이터는 하단 큰 박스에만 노출
            document.getElementById("input_dogDetail").value = rawData;
        }
    }

    // [2] 이미지 미리보기
    const imageInput = document.getElementById("dogImage");
    const previewImg = document.getElementById("previewImage");
    if (imageInput && previewImg) {
        imageInput.onchange = function (e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (event) => { previewImg.src = event.target.result; };
                reader.readAsDataURL(file);
            }
        };
    }
});