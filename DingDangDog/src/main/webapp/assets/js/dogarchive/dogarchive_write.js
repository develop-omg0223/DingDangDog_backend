const getContextPath = () => {
    const path = window.location.pathname;
    const ctx = path.substring(0, path.indexOf('/', 1));
    if (ctx === "/archive" || ctx === "/app" || ctx === "/assets" || ctx === "/dogarchive") return "";
    return ctx;
};

const cp = getContextPath();

// 1. 요소 가져오기
const imageUpload = document.getElementById("imageUpload");
const thumbnailPreview = document.getElementById("thumbnailPreview");
const imgPlaceholder = document.querySelector(".img-placeholder");
const archiveContentEditor = document.getElementById("archiveContentEditor");
const btnSubmit = document.getElementById("btnEditSave");

const dogName = document.getElementById("dogName");
const dogGenderInput = document.getElementById("dogGender");
const genderBtns = document.querySelectorAll(".gender-btn");

// 2. 이벤트 연결
if (imageUpload) imageUpload.addEventListener("change", handleImageUpload);
if (btnSubmit) btnSubmit.addEventListener("click", handleSubmit);

// 성별 버튼 이벤트 (버튼 방식 사용 시)
genderBtns.forEach(btn => {
    btn.addEventListener("click", function() {
        genderBtns.forEach(b => b.classList.remove("active"));
        this.classList.add("active");
        dogGenderInput.value = this.getAttribute("data-value");
    });
});

// 3. 이미지 업로드 로직
let uploadedImageBase64 = ""; 

function handleImageUpload(event) {
    const file = event.target.files[0];
    if (!file) return;

    if (!file.type.startsWith("image/")) {
        alert("이미지 파일만 선택 가능합니다.");
        return;
    }

    const reader = new FileReader();
    reader.onload = function(e) {
        uploadedImageBase64 = e.target.result; 
        if (thumbnailPreview) {
            thumbnailPreview.src = e.target.result;
            thumbnailPreview.style.display = "block";
        }
        if (imgPlaceholder) imgPlaceholder.style.display = "none";
    };
    reader.readAsDataURL(file);
}

// 4. 데이터 전송
function handleSubmit() {
    // 필수 입력 검사
    if (!dogName.value.trim()) { 
        alert("강아지 이름을 입력해주세요."); 
        dogName.focus(); 
        return; 
    }
    
    const genderValue = document.getElementById("dogGender").value;
    if (!genderValue) {
        alert("성별을 입력해주세요. (M/F)");
        return;
    }

    // 전송용 가상 Form 생성
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = cp + '/archive/writeOk.ar'; 

    // 모든 데이터를 객체에 담기 (JSP의 id와 일치 확인)
    const params = {
        "dogName": dogName.value,
        "dogBreed": document.getElementById("dogBreed").value || "알 수 없음",
        "dogGender": genderValue,
        "dogAge": document.getElementById("dogAge").value || "0",
        "dogWeight": document.getElementById("dogWeight").value || "0",
        
        // ★ 추가: JSP에 생성한 shelterName input의 값을 가져옴
        "shelterName": document.getElementById("shelterName").value, 
        
        "dogRescueDate": document.getElementById("dogRescueDate").value || "", 
        "dogContent": archiveContentEditor.innerHTML, 
        
        // 점수 데이터
        "scoreActivity": document.getElementById("scoreActivity").value || "0",
        "scoreSocial": document.getElementById("scoreSocial").value || "0",
        "scoreIndependence": document.getElementById("scoreIndependence").value || "0",
        "scoreBark": document.getElementById("scoreBark").value || "0",
        "scoreGrooming": document.getElementById("scoreGrooming").value || "0",
        
        // 특징 텍스트 데이터
        "traitActivity": document.getElementById("traitActivity").value || "",
        "traitSocial": document.getElementById("traitSocial").value || "",
        "traitIndependence": document.getElementById("traitIndependence").value || "",
        "traitBark": document.getElementById("traitBark").value || "",
        "traitGrooming": document.getElementById("traitGrooming").value || "",
        
        "archiveImgPath": uploadedImageBase64 
    };

    // 가상 폼에 input 생성하여 추가
    for (const key in params) {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = key;
        input.value = params[key];
        form.appendChild(input);
    }

    document.body.appendChild(form);
    form.submit();
}