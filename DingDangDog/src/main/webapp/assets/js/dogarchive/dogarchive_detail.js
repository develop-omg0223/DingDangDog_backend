const detailMainImage = document.getElementById("detailMainImage");

const dogName = document.getElementById("dogName");
const dogBreed = document.getElementById("dogBreed");
const dogGender = document.getElementById("dogGender");
const dogAge = document.getElementById("dogAge");
const dogWeight = document.getElementById("dogWeight");
const dogRescueDate = document.getElementById("dogRescueDate");

const traitActivity = document.getElementById("traitActivity");
const traitSocial = document.getElementById("traitSocial");
const traitIndependence = document.getElementById("traitIndependence");
const traitBark = document.getElementById("traitBark");
const traitGrooming = document.getElementById("traitGrooming");

const scoreActivity = document.getElementById("scoreActivity");
const scoreSocial = document.getElementById("scoreSocial");
const scoreIndependence = document.getElementById("scoreIndependence");
const scoreBark = document.getElementById("scoreBark");
const scoreGrooming = document.getElementById("scoreGrooming");

const archiveContentViewer = document.getElementById("archiveContentViewer");

const btnShelterLink = document.getElementById("btnShelterLink");
const btnEdit = document.getElementById("btnEdit");
const btnDelete = document.getElementById("btnDelete");

/* =========================
   임시 사용자 정보
   role: "user" | "admin"
========================= */
const currentUser = {
  id: 1,
  nickname: "철수",
  role: "user"
};

/* =========================
   임시 상세 데이터
========================= */
const archiveDetailData = {
  id: 12,
  shelterId: 101,
  writerId: 1,
  writerNickname: "철수",
  image:
    "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTEwMzFfMTU2%2FMDAxNzYxOTEyMzUzODIy.JauIsGx3oY4yGHHaCzkNBKFphQnoYrlTDoFDjP0nXL0g.VyBolt5gEwBxPkbLzf5XE1nNG0Q5ZHlou2VGyUNNVN0g.JPEG%2FP20200101_100034852_82847168-F64B-4527-921D-98D1D04EDDA9.JPG&type=sc960_832",
  name: "초코",
  breed: "시츄",
  gender: "여아",
  age: "3살",
  weight: "5.2kg",
  rescueDate: "2026.03.01",
  activityText: "산책을 좋아하고 에너지가 많은 편이에요",
  socialText: "사람을 잘 따르고 다른 강아지와도 무난하게 어울려요",
  independenceText: "혼자 있는 시간도 비교적 잘 보내는 편이에요",
  barkText: "낯선 소리에는 반응하지만 계속 짖는 편은 아니에요",
  groomingText: "털이 길어서 빗질과 미용 관리가 자주 필요해요",
  activityScore: 5,
  socialScore: 3,
  independenceScore: 1,
  barkScore: 2,
  groomingScore: 5,
  content: `
이 아이는 사람 손을 잘 타고 순한 편입니다.
적응이 빠르고 산책을 정말 좋아해요.

실내에서도 얌전하게 쉬는 시간이 있고,
햇빛 드는 곳에서 편하게 누워있는 걸 좋아합니다.

추가 사진이나 보호소 문의는 '보호소 바로가기' 버튼을 통해 확인해주세요.
  `
};

/* =========================
   초기 실행
========================= */
renderArchiveDetail();
applyPermission();
bindEvents();

/* =========================
   렌더링
========================= */
function renderArchiveDetail() {
  renderMainImage(archiveDetailData.image);

  dogName.textContent = archiveDetailData.name;
  dogBreed.textContent = archiveDetailData.breed;
  dogGender.textContent = archiveDetailData.gender;
  dogAge.textContent = archiveDetailData.age;
  dogWeight.textContent = archiveDetailData.weight;
  dogRescueDate.textContent = archiveDetailData.rescueDate;

  traitActivity.textContent = archiveDetailData.activityText;
  traitSocial.textContent = archiveDetailData.socialText;
  traitIndependence.textContent = archiveDetailData.independenceText;
  traitBark.textContent = archiveDetailData.barkText;
  traitGrooming.textContent = archiveDetailData.groomingText;

  scoreActivity.textContent = getStarString(archiveDetailData.activityScore);
  scoreSocial.textContent = getStarString(archiveDetailData.socialScore);
  scoreIndependence.textContent = getStarString(archiveDetailData.independenceScore);
  scoreBark.textContent = getStarString(archiveDetailData.barkScore);
  scoreGrooming.textContent = getStarString(archiveDetailData.groomingScore);

  archiveContentViewer.textContent = archiveDetailData.content.trim();

  btnShelterLink.href = `./shelter_detail.html?id=${archiveDetailData.shelterId}`;
  btnEdit.href = `./dogarchive_edit.html?id=${archiveDetailData.id}`;
}

function renderMainImage(src) {
  if (!src) {
    detailMainImage.innerHTML = "";
    return;
  }

  detailMainImage.innerHTML = `<img src="${src}" alt="대표 이미지" />`;
}

function getStarString(score) {
  const safeScore = Math.max(0, Math.min(5, Number(score) || 0));
  return "★".repeat(safeScore) + "☆".repeat(5 - safeScore);
}

/* =========================
   권한 처리
========================= */
function applyPermission() {
  const canEdit = canEditArchive();
  const canDelete = canDeleteArchive();

  if (!canEdit && btnEdit) {
    btnEdit.style.display = "none";
  }

  if (!canDelete && btnDelete) {
    btnDelete.style.display = "none";
  }
}

function canEditArchive() {
  return !!currentUser && currentUser.id === archiveDetailData.writerId;
}

function canDeleteArchive() {
  return !!currentUser && (
    currentUser.id === archiveDetailData.writerId ||
    currentUser.role === "admin"
  );
}

/* =========================
   이벤트
========================= */
function bindEvents() {
  btnDelete?.addEventListener("click", handleDelete);
}

function handleDelete() {
  if (!canDeleteArchive()) {
    alert("삭제 권한이 없습니다.");
    return;
  }

  const isConfirmed = confirm("정말 삭제하시겠습니까?");
  if (!isConfirmed) return;

  alert("삭제 처리");
  location.href = "./dogarchive_list.html";
}