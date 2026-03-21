const form = document.getElementById("doglogEditForm");

const editTitle = document.getElementById("editTitle");
const editContent = document.getElementById("editContent");
const logPostHidden = document.getElementById("logPostHidden");

const editImg = document.getElementById("editImg");
const editPreviewImg = document.getElementById("editPreviewImg");
const imgPlaceholder = document.querySelector(".img-placeholder");

const existingImageList = document.getElementById("existingImageList");
const deleteImageIdsInput = document.getElementById("deleteImageIds");

const btnBackToDetail = document.getElementById("btnBackToDetail");
const btnEditSave = document.getElementById("btnEditSave");

let uploadedImages = [];
let deletedExistingImageIds = [];

if (
  !form ||
  !editTitle ||
  !editContent ||
  !logPostHidden ||
  !editImg ||
  !editPreviewImg ||
  !deleteImageIdsInput ||
  !btnBackToDetail ||
  !btnEditSave
) {
  throw new Error("필요한 요소를 찾을 수 없습니다.");
}

/* =========================
   초기 실행
========================= */
init();

/* =========================
   초기 설정
========================= */
function init() {
  bindEvents();
  syncEditorToHidden();
  syncPreviewFromExisting();

  // 수정 모드에서 기존 본문을 hidden에도 넣어둠
  logPostHidden.value = editContent.innerHTML.trim();
}

/* =========================
   이벤트 바인딩
========================= */
function bindEvents() {
  if (editImg) {
    editImg.addEventListener("change", handleImageUpload);
  }

  if (existingImageList) {
    existingImageList.addEventListener("click", handleExistingImageDelete);
  }

  if (editContent) {
    editContent.addEventListener("input", syncEditorToHidden);
  }

  if (btnBackToDetail) {
    btnBackToDetail.addEventListener("click", handleCancel);
  }

  if (btnEditSave) {
    btnEditSave.addEventListener("click", handleSubmit);
  }
}

/* =========================
   본문 동기화
========================= */
function syncEditorToHidden() {
  logPostHidden.value = editContent.innerHTML.trim();
}

/* =========================
   기존 이미지 삭제
========================= */
function handleExistingImageDelete(event) {
  const deleteButton = event.target.closest('[data-action="delete-existing-image"]');
  if (!deleteButton) return;

  const imageItem = deleteButton.closest(".existing-image-item");
  if (!imageItem) return;

  const imageId = imageItem.dataset.imageId;
  if (!imageId) return;

  deletedExistingImageIds.push(imageId);
  updateDeletedImageIdsInput();

  imageItem.remove();
  syncPreviewFromExisting();
}

function updateDeletedImageIdsInput() {
  deleteImageIdsInput.value = deletedExistingImageIds.join(",");
}

/* =========================
   새 이미지 업로드
========================= */
function handleImageUpload(event) {
  const files = Array.from(event.target.files || []);
  const imageFiles = files.filter((file) => file.type.startsWith("image/"));

  if (!imageFiles.length) {
    alert("이미지 파일만 첨부할 수 있습니다.");
    editImg.value = "";
    return;
  }

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
        renderPreview();
      }
    };

    reader.readAsDataURL(file);
  });

  editImg.value = "";
}

/* =========================
   대표 이미지 미리보기
========================= */
function syncPreviewFromExisting() {
  if (uploadedImages.length > 0) {
    renderPreview();
    return;
  }

  // JSP에서 이미 대표 이미지가 세팅되어 있으면 유지
  if (editPreviewImg && editPreviewImg.getAttribute("src")) {
    editPreviewImg.style.display = "block";
    if (imgPlaceholder) {
      imgPlaceholder.style.display = "none";
    }
    return;
  }

  clearPreview();
}

function renderPreview() {
  if (uploadedImages.length > 0) {
    editPreviewImg.src = uploadedImages[0].src;
    editPreviewImg.style.display = "block";
    if (imgPlaceholder) {
      imgPlaceholder.style.display = "none";
    }
    return;
  }

  syncPreviewFromExisting();
}

function clearPreview() {
  editPreviewImg.src = "";
  editPreviewImg.style.display = "none";
  if (imgPlaceholder) {
    imgPlaceholder.style.display = "block";
  }
}

/* =========================
   취소
========================= */
function handleCancel(event) {
  event.preventDefault();
  const isConfirmed = confirm("수정을 취소하시겠습니까?");
  if (!isConfirmed) return;

  location.href = btnBackToDetail.href;
}

/* =========================
   수정 완료
========================= */
function handleSubmit(event) {
  event.preventDefault();

  const titleValue = editTitle.value.trim();
  const contentText = editContent.textContent.trim();

  syncEditorToHidden();
  updateDeletedImageIdsInput();

  if (!titleValue) {
    alert("제목을 입력해주세요.");
    editTitle.focus();
    return;
  }

  if (!contentText) {
    alert("내용을 입력해주세요.");
    editContent.focus();
    return;
  }

  // 기존 이미지 + 새 이미지 합쳐서 최소 1장 검증
  const existingImageCount = existingImageList
    ? existingImageList.querySelectorAll(".existing-image-item").length
    : 0;

  const totalImageCount = existingImageCount + uploadedImages.length;

  if (totalImageCount < 1) {
    alert("이미지는 최소 1장 이상 있어야 합니다.");
    return;
  }

  alert("수정 완료되었습니다.");
  form.submit();
}