const detailTitle = document.getElementById("detailTitle");
const detailWriter = document.getElementById("detailWriter");
const detailDate = document.getElementById("detailDate");
const detailMainImg = document.getElementById("detailMainImg");
const detailMainPost = document.getElementById("detailMainPost");

const commentList = document.getElementById("commentList");
const commentWriteContainer = document.getElementById("commentWriteContainer");
const commentWriteInput = document.getElementById("commentWriteInput");
const btnCommentWrite = document.getElementById("btnCommentWrite");

const btnBackToList = document.getElementById("btnBackToList");
const btnDetailEdit = document.getElementById("btnDetailEdit");
const btnDetailDelete = document.getElementById("btnDetailDelete");

/* =========================
   초기 실행
========================= */
bindEvents();

/* =========================
   이벤트
========================= */
function bindEvents() {
  btnCommentWrite?.addEventListener("click", handleCommentWrite);
  btnDetailDelete?.addEventListener("click", handlePostDelete);
  commentList?.addEventListener("click", handleCommentAction);
}

/* =========================
   댓글 작성
========================= */
function handleCommentWrite(event) {
  const commentForm = btnCommentWrite?.closest("form");
  if (!commentForm) return;

  const commentText = commentWriteInput?.value.trim();

  if (!commentText) {
    event.preventDefault();
    alert("댓글 내용을 입력해주세요.");
    commentWriteInput?.focus();
    return;
  }

  // 정상 입력이면 form submit 진행
}

/* =========================
   댓글 삭제
   - 댓글 삭제 버튼/링크에 data-action="delete-comment" 속성이 있어야 동작
========================= */
function handleCommentAction(event) {
  const deleteTarget = event.target.closest('[data-action="delete-comment"]');
  if (!deleteTarget) return;

  const isConfirmed = confirm("댓글을 삭제하시겠습니까?");
  if (!isConfirmed) {
    event.preventDefault();
  }
}

/* =========================
   게시글 삭제
   - 삭제 버튼에 data-delete-url이 있으면 그 주소로 이동
   - 아니면 a 태그 href 사용
========================= */
function handlePostDelete(event) {
  const isConfirmed = confirm("게시글을 삭제하시겠습니까?");
  if (!isConfirmed) {
    event.preventDefault();
    return;
  }

  const deleteUrl = btnDetailDelete?.dataset.deleteUrl;

  if (deleteUrl) {
    location.href = deleteUrl;
    return;
  }

  // a 태그가 아니라 button이면 기본동작이 없으므로
  // data-delete-url이 없는 경우는 따로 이동 안 함
}

/* =========================
   공통 유틸
========================= */
function escapeHtml(value) {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#39;");
}