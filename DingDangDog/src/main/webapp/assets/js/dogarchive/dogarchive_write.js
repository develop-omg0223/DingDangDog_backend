const imageUpload = document.getElementById("imageUpload");
const thumbnailPreview = document.getElementById("thumbnailPreview");
const imgPlaceholder = document.querySelector(".img-placeholder");
const archiveContentEditor = document.getElementById("archiveContentEditor");
const btnSubmit = document.getElementById("btnSubmit");

const dogName = document.getElementById("dogName");
const scoreActivity = document.getElementById("scoreActivity");
const scoreSocial = document.getElementById("scoreSocial");
const scoreIndependence = document.getElementById("scoreIndependence");
const scoreBark = document.getElementById("scoreBark");
const scoreGrooming = document.getElementById("scoreGrooming");

let uploadedImages = [];

if (
    !imageUpload ||
    !thumbnailPreview ||
    !imgPlaceholder ||
    !archiveContentEditor ||
    !btnSubmit ||
    !dogName ||
    !scoreActivity ||
    !scoreSocial ||
    !scoreIndependence ||
    !scoreBark ||
    !scoreGrooming
) {
    throw new Error("필요한 요소를 찾을 수 없습니다.");
}

imageUpload.addEventListener("change", handleImageUpload);
archiveContentEditor.addEventListener("click", handleEditorClick);
btnSubmit.addEventListener("click", handleSubmit);

function handleImageUpload(event) {
    const files = Array.from(event.target.files || []);
    const imageFiles = files.filter((file) => file.type.startsWith("image/"));

    if (!imageFiles.length) {
        imageUpload.value = "";
        return;
    }

    let loadedCount = 0;

    imageFiles.forEach((file) => {
        const reader = new FileReader();

        reader.onload = (e) => {
            uploadedImages.push({
                id: Date.now() + Math.random(),
                src: e.target.result
            });

            loadedCount += 1;

            if (loadedCount === imageFiles.length) {
                renderThumbnail();
                appendImagesToEditor(imageFiles.length);
            }
        };

        reader.readAsDataURL(file);
    });

    imageUpload.value = "";
}

function appendImagesToEditor(newImageCount) {
    const newImages = uploadedImages.slice(-newImageCount);

    newImages.forEach((image) => {
        const wrapper = createImageWrapper(image);
        archiveContentEditor.appendChild(wrapper);
    });
}

function createImageWrapper(image) {
    const wrapper = document.createElement("div");
    wrapper.className = "editor-image-item";
    wrapper.dataset.imageId = image.id;
    wrapper.contentEditable = "false";

    const deleteButton = document.createElement("button");
    deleteButton.type = "button";
    deleteButton.className = "btn-editor-image-delete";
    deleteButton.dataset.action = "delete-image";
    deleteButton.textContent = "×";

    const img = document.createElement("img");
    img.src = image.src;
    img.alt = "첨부 이미지";

    wrapper.appendChild(deleteButton);
    wrapper.appendChild(img);

    return wrapper;
}

function handleEditorClick(event) {
    const deleteButton = event.target.closest('[data-action="delete-image"]');
    if (!deleteButton) return;

    const imageItem = deleteButton.closest(".editor-image-item");
    if (!imageItem) return;

    const imageId = Number(imageItem.dataset.imageId);
    removeImage(imageId, imageItem);
}

function removeImage(imageId, imageElement) {
    uploadedImages = uploadedImages.filter((image) => image.id !== imageId);
    imageElement.remove();
    renderThumbnail();
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

function handleSubmit() {
    const nameValue = dogName.value.trim();

    if (!uploadedImages.length) {
        alert("이미지는 최소 1장 이상 첨부해야 합니다.");
        return;
    }

    if (!nameValue) {
        alert("이름을 입력해주세요.");
        dogName.focus();
        return;
    }

    if (!scoreActivity.value) {
        alert("활동성 점수를 선택해주세요.");
        scoreActivity.focus();
        return;
    }

    if (!scoreSocial.value) {
        alert("사회성 점수를 선택해주세요.");
        scoreSocial.focus();
        return;
    }

    if (!scoreIndependence.value) {
        alert("독립성 점수를 선택해주세요.");
        scoreIndependence.focus();
        return;
    }

    if (!scoreBark.value) {
        alert("짖음수준 점수를 선택해주세요.");
        scoreBark.focus();
        return;
    }

    if (!scoreGrooming.value) {
        alert("털관리 점수를 선택해주세요.");
        scoreGrooming.focus();
        return;
    }

    const submitData = {
        name: dogName.value.trim(),
        breed: document.getElementById("dogBreed").value.trim(),
        gender: document.getElementById("dogGender").value.trim(),
        age: document.getElementById("dogAge").value.trim(),
        weight: document.getElementById("dogWeight").value.trim(),
        rescueDate: document.getElementById("dogRescueDate").value,
        activityText: document.getElementById("traitActivity").value.trim(),
        socialText: document.getElementById("traitSocial").value.trim(),
        independenceText: document.getElementById("traitIndependence").value.trim(),
        barkText: document.getElementById("traitBark").value.trim(),
        groomingText: document.getElementById("traitGrooming").value.trim(),
        activityScore: scoreActivity.value,
        socialScore: scoreSocial.value,
        independenceScore: scoreIndependence.value,
        barkScore: scoreBark.value,
        groomingScore: scoreGrooming.value,
        thumbnail: uploadedImages[0] ? uploadedImages[0].src : "",
        content: archiveContentEditor.innerHTML,
        imageCount: uploadedImages.length
    };

    console.log("등록 데이터", submitData);
    alert("등록 가능 상태입니다.");
}
btnCancle.addEventListener("click", function() {
    alert("수정취소되었습니다.");
    location.href = "./dogarchive_detail.jsp";
});