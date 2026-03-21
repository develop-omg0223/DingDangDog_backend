const form = document.getElementById("doglogWriteForm");
const imageUpload = document.getElementById("imageUpload");
const thumbnailPreview = document.getElementById("thumbnailPreview");
const writeContentEditor = document.getElementById("writeContentEditor");
const imgPlaceholder = document.querySelector(".img-placeholder");
const titleInput = document.querySelector(".write-title input");
const hiddenPostInput = document.getElementById("logPostHidden");
console.log("doglog_write.js 최신본 실행됨");
let uploadedImages = [];

if (
  !form ||
  !imageUpload ||
  !thumbnailPreview ||
  !writeContentEditor ||
  !imgPlaceholder ||
  !titleInput ||
  !hiddenPostInput
) {
  throw new Error("필요한 요소를 찾을 수 없습니다.");
}

init();

function init() {
  bindEvents();
  syncEditorToHidden();
}

function bindEvents() {
  imageUpload.addEventListener("change", handleImageUpload);
  form.addEventListener("submit", handleSubmit);
}

function handleImageUpload(event) {
  const files = Array.from(event.target.files || []);
  const imageFiles = files.filter((file) => file.type.startsWith("image/"));

  if (!imageFiles.length) {
    alert("이미지 파일만 첨부할 수 있습니다.");
    imageUpload.value = "";
    return;
  }

  uploadedImages = [];

  let loadedCount = 0;

  imageFiles.forEach((file) => {
    const reader = new FileReader();

    reader.onload = (e) => {
      uploadedImages.push({
        id: Date.now() + Math.random(),
        src: e.target.result,
        file: file
      });

      loadedCount += 1;

      if (loadedCount === imageFiles.length) {
        renderThumbnail();
        syncEditorToHidden();
      }
    };

    reader.readAsDataURL(file);
  });
}

function renderThumbnail() {
  if (!uploadedImages.length) {
    thumbnailPreview.src = "";
    thumbnailPreview.style.display = "none";
    imgPlaceholder.style.display = "block";
    return;
  }

  thumbnailPreview.src = uploadedImages[0].src;
  thumbnailPreview.style.display = "block";
  imgPlaceholder.style.display = "none";
}

function handleSubmit(event) {
  const titleValue = titleInput.value.trim();
  const contentText = writeContentEditor.textContent.trim();

  syncEditorToHidden();

  if (!uploadedImages.length) {
    event.preventDefault();
    alert("이미지는 최소 1장 이상 첨부해야 합니다.");
    return;
  }

  if (!titleValue) {
    event.preventDefault();
    alert("제목을 입력해주세요.");
    titleInput.focus();
    return;
  }

  if (!contentText) {
    event.preventDefault();
    alert("내용을 입력해주세요.");
    writeContentEditor.focus();
    return;
  }

  console.log("전송 직전 file 개수 =", imageUpload.files.length);

  const submitData = {
    title: titleValue,
    thumbnail: uploadedImages.length > 0 ? uploadedImages[0].src : "",
    content: hiddenPostInput.value,
    imageCount: uploadedImages.length
  };

  console.log("등록 데이터", submitData);
}

function syncEditorToHidden() {
  hiddenPostInput.value = writeContentEditor.innerHTML.trim();
}