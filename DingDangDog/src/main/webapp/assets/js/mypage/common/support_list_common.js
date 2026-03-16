const supportData = [
  { status: "done", number: 21, title: "봉사 신청 일정 관련 문의", date: "2026-03-08" },
  { status: "done", number: 20, title: "후기 작성 수정 가능 여부", date: "2026-03-07" },
  { status: "progress", number: 19, title: "입양 상담 신청 확인 부탁드립니다", date: "2026-03-06" },
  { status: "progress", number: 18, title: "보호소 방문 예약 문의", date: "2026-03-05" },
  { status: "done", number: 17, title: "회원정보 변경 반영 시간 문의", date: "2026-03-04" },
  { status: "done", number: 16, title: "봉사 신청 취소 관련 문의", date: "2026-03-03" },
  { status: "progress", number: 15, title: "강아지 상세 정보 추가 요청", date: "2026-03-02" },
  { status: "done", number: 14, title: "문의글 삭제 가능 여부", date: "2026-03-01" },
  { status: "done", number: 13, title: "매칭 결과 오류 문의", date: "2026-02-28" },
  { status: "done", number: 12, title: "로그인 오류 관련 문의", date: "2026-02-27" },
  { status: "progress", number: 11, title: "봉사 활동 인증 처리 문의", date: "2026-02-26" },
  { status: "done", number: 10, title: "닉네임 변경 제한 문의", date: "2026-02-25" },
  { status: "done", number: 9, title: "문의 답변 알림 기능 요청", date: "2026-02-24" },
  { status: "progress", number: 8, title: "강아지 프로필 사진 누락 문의", date: "2026-02-23" },
  { status: "done", number: 7, title: "입양 절차 관련 추가 문의", date: "2026-02-22" },
  { status: "done", number: 6, title: "보호소 연락처 확인 문의", date: "2026-02-21" },
  { status: "done", number: 5, title: "이메일 변경 가능 여부", date: "2026-02-20" },
  { status: "progress", number: 4, title: "활동 내역 표시 오류 문의", date: "2026-02-19" },
  { status: "done", number: 3, title: "봉사 신청서 제출 확인", date: "2026-02-18" },
  { status: "done", number: 2, title: "계정 탈퇴 전 문의", date: "2026-02-17" },
  { status: "done", number: 1, title: "서비스 이용 방법 문의", date: "2026-02-16" },
    { status: "done", number: 10, title: "닉네임 변경 제한 문의", date: "2026-02-25" },
  { status: "done", number: 9, title: "문의 답변 알림 기능 요청", date: "2026-02-24" },
  { status: "progress", number: 8, title: "강아지 프로필 사진 누락 문의", date: "2026-02-23" },
  { status: "done", number: 7, title: "입양 절차 관련 추가 문의", date: "2026-02-22" },
  { status: "done", number: 6, title: "보호소 연락처 확인 문의", date: "2026-02-21" },
  { status: "done", number: 5, title: "이메일 변경 가능 여부", date: "2026-02-20" },
  { status: "progress", number: 4, title: "활동 내역 표시 오류 문의", date: "2026-02-19" },
  { status: "done", number: 3, title: "봉사 신청서 제출 확인", date: "2026-02-18" },
  { status: "done", number: 2, title: "계정 탈퇴 전 문의", date: "2026-02-17" },
  { status: "done", number: 1, title: "서비스 이용 방법 문의", date: "2026-02-16" }
];


const supportTableBody = document.getElementById("supportTableBody");
const pagination = document.getElementById("pagination");

function getStatusText(status) {
  return status === "done" ? "문의 완료" : "문의중";
}

function renderTable(page) {
  const start = (page - 1) * rowsPerPage;
  const end = start + rowsPerPage;
  const currentData = supportData.slice(start, end);

  supportTableBody.innerHTML = "";

  currentData.forEach((item) => {
    const row = document.createElement("div");
    row.classList.add("support-table-row");

    row.innerHTML = `
      <div class="col-status">
        <span class="status ${item.status}">${getStatusText(item.status)}</span>
      </div>
      <div class="col-number">${item.number}</div>
      <div class="col-title"><a href="#">${item.title}</a></div>
      <div class="col-date">${item.date}</div>
    `;

    supportTableBody.appendChild(row);
  });
}

//페이지네이션 동작 코드
//reviewData 부분만 맞춰서 수정하면 됨
const rowsPerPage = 10; //페이지당 보여줄 정보 개수
let currentPage = 1;
const maxVisiblePages = 5; //페이지네이션 버튼 개수

function renderPagination() {
  const totalPages = Math.ceil(supportData.length / rowsPerPage);
  pagination.innerHTML = "";

  const maxVisiblePages = 5;

  let startPage = currentPage - Math.floor(maxVisiblePages / 2);
  let endPage = currentPage + Math.floor(maxVisiblePages / 2);

  if (startPage < 1) {
    startPage = 1;
    endPage = Math.min(maxVisiblePages, totalPages);
  }

  if (endPage > totalPages) {
    endPage = totalPages;
    startPage = Math.max(1, totalPages - maxVisiblePages + 1);
  }

  const prevLi = document.createElement("li");
  const prevBtn = document.createElement("button");
  prevBtn.classList.add("prev-btn");
  prevBtn.innerHTML = "<span>&lt;</span>";
  prevBtn.disabled = currentPage === 1;

  prevBtn.addEventListener("click", () => {
    if (currentPage > 1) {
      currentPage--;
      updatePage();
    }
  });

  prevLi.appendChild(prevBtn);
  pagination.appendChild(prevLi);

  for (let i = startPage; i <= endPage; i++) {
    const li = document.createElement("li");
    const btn = document.createElement("button");

    btn.classList.add("page-item");
    if (i === currentPage) {
      btn.classList.add("current-page");
    }

    btn.textContent = i;

    btn.addEventListener("click", () => {
      currentPage = i;
      updatePage();
    });

    li.appendChild(btn);
    pagination.appendChild(li);
  }

  const nextLi = document.createElement("li");
  const nextBtn = document.createElement("button");
  nextBtn.classList.add("next-btn");
  nextBtn.innerHTML = "<span>&gt;</span>";
  nextBtn.disabled = currentPage === totalPages;

  nextBtn.addEventListener("click", () => {
    if (currentPage < totalPages) {
      currentPage++;
      updatePage();
    }
  });

  nextLi.appendChild(nextBtn);
  pagination.appendChild(nextLi);
}

function updatePage() {
  renderTable(currentPage);
  renderPagination();
}

updatePage();