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
let imageSequence = 0;
let existingImages = [];

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

init();

function init() {
  collectExistingImages();
  decorateExistingEditorImages();
  bindEvents();
  syncPreview();
  syncEditorToHidden();
}

function bindEvents() {
  editImg.addEventListener("change", handleImageUpload);
  existingImageList.addEventListener("click", handleExistingImageDelete);
  editContent.addEventListener("input", handleEditorInput);
  editContent.addEventListener("click", handleEditorClick);
  editContent.addEventListener("paste", handleEditorPaste);
  editContent.addEventListener("drop", handleEditorDrop);
  editContent.addEventListener("dragover", handleEditorDragOver);
  btnBackToDetail.addEventListener("click", handleCancel);
  form.addEventListener("submit", handleSubmit);
}

function collectExistingImages() {
  const items = Array.from(existingImageList.querySelectorAll(".existing-image-item"));

  existingImages = items.map((item) => {
    return {
      imageId: item.dataset.imageId,
      imagePath: item.dataset.imagePath,
      isDeleted: false
    };
  });
}

function decorateExistingEditorImages() {
  const images = Array.from(editContent.querySelectorAll("img"));

  images.forEach((img) => {
    const src = img.getAttribute("src") || "";
    const match = findExistingImageBySrc(src);

    if (!match) return;
    if (img.closest(".editor-image-item")) return;

    const wrapper = document.createElement("div");
    wrapper.className = "editor-image-item existing-editor-image";
    wrapper.setAttribute("contenteditable", "false");
    wrapper.dataset.imageType = "existing";
    wrapper.dataset.imageId = match.imageId;
    wrapper.dataset.imagePath = match.imagePath;

    img.classList.add("editor-body-image");

    const removeButton = document.createElement("button");
    removeButton.type = "button";
    removeButton.className = "editor-image-remove";
    removeButton.dataset.action = "delete-existing-image";
    removeButton.dataset.imageId = match.imageId;
    removeButton.dataset.imagePath = match.imagePath;
    removeButton.textContent = "×";

    img.parentNode.insertBefore(wrapper, img);
    wrapper.appendChild(img);
    wrapper.appendChild(removeButton);

    const next = wrapper.nextSibling;
    if (!next || !(next.nodeType === Node.ELEMENT_NODE && next.tagName === "P")) {
      const paragraph = document.createElement("p");
      paragraph.innerHTML = "<br>";
      wrapper.parentNode.insertBefore(paragraph, wrapper.nextSibling);
    }
  });
}

function findExistingImageBySrc(src) {
  return existingImages.find((image) => {
    return src.endsWith(image.imagePath);
  });
}

function handleImageUpload(event) {
  const files = Array.from(event.target.files || []);
  const imageFiles = files.filter((file) => file.type.startsWith("image/"));

  if (!imageFiles.length) {
    alert("이미지 파일만 첨부할 수 있습니다.");
    editImg.value = "";
    syncInputFiles();
    return;
  }

  const newImages = imageFiles.map((file) => {
    const marker = `[[IMG_${imageSequence}]]`;
    imageSequence += 1;

    return {
      marker: marker,
      file: file,
      previewUrl: URL.createObjectURL(file)
    };
  });

  uploadedImages = [...uploadedImages, ...newImages];

  syncInputFiles();
  insertNewImagesToEditor(newImages);
  syncPreview();
  syncEditorToHidden();

  editImg.value = "";
}

function insertNewImagesToEditor(images) {
  images.forEach((image) => {
    const wrapper = document.createElement("div");
    wrapper.className = "editor-image-item new-editor-image";
    wrapper.setAttribute("contenteditable", "false");
    wrapper.dataset.imageType = "new";
    wrapper.dataset.marker = image.marker;

    const img = document.createElement("img");
    img.src = image.previewUrl;
    img.alt = "본문 이미지";
    img.className = "editor-body-image";
    img.dataset.marker = image.marker;

    const removeButton = document.createElement("button");
    removeButton.type = "button";
    removeButton.className = "editor-image-remove";
    removeButton.dataset.action = "delete-new-image";
    removeButton.dataset.marker = image.marker;
    removeButton.textContent = "×";

    wrapper.appendChild(img);
    wrapper.appendChild(removeButton);
    editContent.appendChild(wrapper);

    const paragraph = document.createElement("p");
    paragraph.innerHTML = "<br>";
    editContent.appendChild(paragraph);
  });

  placeCaretToEnd(editContent);
}

function handleExistingImageDelete(event) {
  const deleteButton = event.target.closest('[data-action="delete-existing-image"]');
  if (!deleteButton) return;

  const imageId = deleteButton.dataset.imageId;
  const imagePath = deleteButton.dataset.imagePath;

  if (!imageId) return;

  if (!deletedExistingImageIds.includes(imageId)) {
    deletedExistingImageIds.push(imageId);
  }

  existingImages = existingImages.map((image) => {
    if (String(image.imageId) === String(imageId)) {
      return { ...image, isDeleted: true };
    }
    return image;
  });

  updateDeletedImageIdsInput();
  removeExistingSidebarItem(imageId);
  removeExistingEditorImage(imageId, imagePath);
  syncPreview();
  syncEditorToHidden();
}

function handleEditorClick(event) {
  const existingDeleteButton = event.target.closest('[data-action="delete-existing-image"]');
  if (existingDeleteButton) {
    handleExistingImageDelete(event);
    return;
  }

  const newDeleteButton = event.target.closest('[data-action="delete-new-image"]');
  if (!newDeleteButton) return;

  const marker = newDeleteButton.dataset.marker;
  if (!marker) return;

  removeNewImage(marker);
}

function removeExistingSidebarItem(imageId) {
  const sidebarItem = existingImageList.querySelector(
    `.existing-image-item[data-image-id="${cssEscape(imageId)}"]`
  );

  if (sidebarItem) {
    sidebarItem.remove();
  }
}

function removeExistingEditorImage(imageId, imagePath) {
  const wrappers = Array.from(editContent.querySelectorAll('.editor-image-item[data-image-type="existing"]'));

  wrappers.forEach((wrapper) => {
    const wrapperImageId = wrapper.dataset.imageId;
    const img = wrapper.querySelector("img");
    const src = img ? img.getAttribute("src") || "" : "";

    if (String(wrapperImageId) === String(imageId) || src.endsWith(imagePath)) {
      const next = wrapper.nextElementSibling;
      wrapper.remove();

      if (next && next.tagName === "P" && next.innerHTML.trim().toLowerCase() === "<br>") {
        next.remove();
      }
    }
  });
}

function removeNewImage(marker) {
  const target = uploadedImages.find((image) => image.marker === marker);

  if (target && target.previewUrl) {
    URL.revokeObjectURL(target.previewUrl);
  }

  uploadedImages = uploadedImages.filter((image) => image.marker !== marker);

  const wrapper = editContent.querySelector(
    `.editor-image-item[data-image-type="new"][data-marker="${cssEscape(marker)}"]`
  );

  if (wrapper) {
    const next = wrapper.nextElementSibling;
    wrapper.remove();

    if (next && next.tagName === "P" && next.innerHTML.trim().toLowerCase() === "<br>") {
      next.remove();
    }
  }

  syncInputFiles();
  syncPreview();
  syncEditorToHidden();
}

function syncInputFiles() {
  const dataTransfer = new DataTransfer();

  uploadedImages.forEach((image) => {
    dataTransfer.items.add(image.file);
  });

  editImg.files = dataTransfer.files;
}

function updateDeletedImageIdsInput() {
  deleteImageIdsInput.value = deletedExistingImageIds.join(",");
}

function syncPreview() {

  const firstExisting = existingImages.find((image) => !image.isDeleted);

  if (firstExisting) {
    editPreviewImg.src = contextPath + firstExisting.imagePath;
    editPreviewImg.style.display = "block";
    imgPlaceholder.style.display = "none";
    return;
  }

  if (uploadedImages.length > 0) {
    editPreviewImg.src = uploadedImages[0].previewUrl;
    editPreviewImg.style.display = "block";
    imgPlaceholder.style.display = "none";
    return;
  }
  editPreviewImg.src = "";
  editPreviewImg.style.display = "none";
  imgPlaceholder.style.display = "block";
}

function handleEditorInput() {
  syncEditorToHidden();
}

function handleEditorPaste(event) {
  const items = Array.from(event.clipboardData?.items || []);
  const hasImage = items.some((item) => item.type && item.type.startsWith("image/"));

  if (hasImage) {
    event.preventDefault();
    alert("본문에는 이미지 붙여넣기를 할 수 없습니다. 이미지 첨부 버튼을 사용해주세요.");
  }
}

function handleEditorDrop(event) {
  const files = Array.from(event.dataTransfer?.files || []);
  const hasImage = files.some((file) => file.type && file.type.startsWith("image/"));

  if (hasImage) {
    event.preventDefault();
    alert("본문에는 이미지를 직접 드래그할 수 없습니다. 이미지 첨부 버튼을 사용해주세요.");
  }
}

function handleEditorDragOver(event) {
  event.preventDefault();
}

function handleCancel(event) {
  event.preventDefault();

  const isConfirmed = confirm("수정을 취소하시겠습니까?");
  if (!isConfirmed) return;

  location.href = btnBackToDetail.href;
}

function handleSubmit(event) {
  event.preventDefault();

  const titleValue = editTitle.value.trim();
  const contentText = getEditorPlainText().trim();

  normalizeNewImageMarkers();
  syncInputFiles();
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

  const existingCount = existingImages.filter((image) => !image.isDeleted).length;
  const totalImageCount = existingCount + uploadedImages.length;

  if (totalImageCount < 1) {
    alert("이미지는 최소 1장 이상 있어야 합니다.");
    return;
  }

  form.submit();
}

function syncEditorToHidden() {
  logPostHidden.value = buildSubmitHtml().trim();
}

function buildSubmitHtml() {
  const nodes = Array.from(editContent.childNodes);
  const htmlParts = [];

  nodes.forEach((node) => {
    if (node.nodeType === Node.TEXT_NODE) {
      const text = node.textContent.trim();
      if (text) {
        htmlParts.push(`<p>${escapeHtml(text)}</p>`);
      }
      return;
    }

    if (node.nodeType !== Node.ELEMENT_NODE) return;

    if (node.classList.contains("editor-image-item")) {
      if (node.dataset.imageType === "existing") {
        const img = node.querySelector("img");
        if (img) {
          const src = img.getAttribute("src") || "";
          htmlParts.push(`<p><img src="${escapeAttribute(src)}" alt="본문 이미지"></p>`);
        }
        return;
      }

      if (node.dataset.imageType === "new") {
        const marker = node.dataset.marker;
        if (marker) {
          htmlParts.push(`<p>${escapeHtml(marker)}</p>`);
        }
        return;
      }
    }

    if (node.tagName === "DIV" || node.tagName === "P") {
      const inner = buildTextHtmlFromNode(node);
      if (inner !== "") {
        htmlParts.push(`<p>${inner}</p>`);
      }
      return;
    }

    const text = node.textContent.trim();
    if (text) {
      htmlParts.push(`<p>${escapeHtml(text)}</p>`);
    }
  });

  return htmlParts.join("");
}

function buildTextHtmlFromNode(parentNode) {
  const parts = [];

  Array.from(parentNode.childNodes).forEach((child) => {
    if (child.nodeType === Node.TEXT_NODE) {
      if (child.textContent) {
        parts.push(escapeHtml(child.textContent));
      }
      return;
    }

    if (child.nodeType !== Node.ELEMENT_NODE) return;

    if (child.classList.contains("editor-image-item")) {
      if (child.dataset.imageType === "existing") {
        const img = child.querySelector("img");
        if (img) {
          const src = img.getAttribute("src") || "";
          parts.push(`<img src="${escapeAttribute(src)}" alt="본문 이미지">`);
        }
        return;
      }

      if (child.dataset.imageType === "new") {
        const marker = child.dataset.marker;
        if (marker) {
          parts.push(escapeHtml(marker));
        }
        return;
      }
    }

    if (child.tagName === "BR") {
      return;
    }

    const text = child.textContent;
    if (text) {
      parts.push(escapeHtml(text));
    }
  });

  return parts.join("").trim();
}

function getEditorPlainText() {
  const clone = editContent.cloneNode(true);

  clone.querySelectorAll(".editor-image-item").forEach((wrapper) => {
    const spacer = document.createTextNode(" ");
    wrapper.replaceWith(spacer);
  });

  return clone.textContent.replace(/\u00A0/g, " ").trim();
}

function escapeHtml(value) {
  return String(value)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

function escapeAttribute(value) {
  return String(value)
    .replace(/&/g, "&amp;")
    .replace(/"/g, "&quot;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}

function placeCaretToEnd(element) {
  element.focus();

  const selection = window.getSelection();
  const range = document.createRange();

  range.selectNodeContents(element);
  range.collapse(false);

  selection.removeAllRanges();
  selection.addRange(range);
}

function cssEscape(value) {
  if (window.CSS && typeof window.CSS.escape === "function") {
    return window.CSS.escape(value);
  }

  return String(value).replace(/[[\]"\\]/g, "\\$&");
}


function normalizeNewImageMarkers() {
  uploadedImages.forEach((image, index) => {
    const newMarker = `[[IMG_${index}]]`;
    const oldMarker = image.marker;

    if (oldMarker === newMarker) return;

    image.marker = newMarker;

    const wrapper = editContent.querySelector(
      `.editor-image-item[data-image-type="new"][data-marker="${cssEscape(oldMarker)}"]`
    );

    if (wrapper) {
      wrapper.dataset.marker = newMarker;

      const img = wrapper.querySelector("img");
      if (img) {
        img.dataset.marker = newMarker;
      }

      const removeButton = wrapper.querySelector(".editor-image-remove");
      if (removeButton) {
        removeButton.dataset.marker = newMarker;
      }
    }
  });
}