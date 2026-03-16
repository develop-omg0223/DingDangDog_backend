const volunteerData = [
  { id: 21, date: "2026-03-20", title: "주말 산책 봉사 인원 모집", shelter: "행복 보호소" },
  { id: 20, date: "2026-03-19", title: "유기견 목욕 봉사 도와주세요", shelter: "다정 보호소" },
  { id: 19, date: "2026-03-18", title: "견사 청소 봉사 신청", shelter: "희망 보호소" },
  { id: 18, date: "2026-03-17", title: "사료 배급 봉사 참여", shelter: "행복 보호소" },
  { id: 17, date: "2026-03-16", title: "산책 및 놀이 봉사", shelter: "해피독 보호소" },
  { id: 16, date: "2026-03-15", title: "주말 보호소 정리 봉사", shelter: "다정 보호소" },
  { id: 15, date: "2026-03-14", title: "입양 행사 보조 봉사", shelter: "희망 보호소" },
  { id: 14, date: "2026-03-13", title: "강아지 케어 도우미 모집", shelter: "사랑 보호소" },
  { id: 13, date: "2026-03-12", title: "산책 봉사 신청 내역", shelter: "행복 보호소" },
  { id: 12, date: "2026-03-11", title: "보호소 청소 봉사", shelter: "해피독 보호소" },
  { id: 11, date: "2026-03-10", title: "간식 배부 봉사", shelter: "사랑 보호소" },
  { id: 10, date: "2026-03-09", title: "주중 케어 봉사 모집", shelter: "다정 보호소" },
  { id: 9, date: "2026-03-08", title: "유기견 놀이 봉사", shelter: "희망 보호소" },
  { id: 8, date: "2026-03-07", title: "보호소 환경 정리", shelter: "행복 보호소" },
  { id: 7, date: "2026-03-06", title: "건강검진 이동 보조", shelter: "사랑 보호소" },
  { id: 6, date: "2026-03-05", title: "중형견 산책 봉사", shelter: "해피독 보호소" },
  { id: 5, date: "2026-03-04", title: "목욕 및 미용 보조", shelter: "희망 보호소" },
  { id: 4, date: "2026-03-03", title: "사료 정리 및 배분", shelter: "다정 보호소" },
  { id: 3, date: "2026-03-02", title: "주말 봉사 신청", shelter: "행복 보호소" },
  { id: 2, date: "2026-03-01", title: "입양 행사 현장 지원", shelter: "사랑 보호소" },
  { id: 1, date: "2026-02-28", title: "보호견 돌봄 활동", shelter: "희망 보호소" }
];



const volunteerTableBody = document.getElementById("volunteerTableBody");
const pagination = document.getElementById("pagination");

function renderTable(page) {
  const start = (page - 1) * rowsPerPage;
  const end = start + rowsPerPage;
  const currentData = volunteerData.slice(start, end);

  volunteerTableBody.innerHTML = "";

  currentData.forEach((item) => {
    const row = document.createElement("div");
    row.classList.add("volunteer-table-row");

    row.innerHTML = `
      <div class="col-date">${item.date}</div>
      <div class="col-title"><a href="#">${item.title}</a></div>
      <div class="col-name">${item.shelter}</div>
      <div class="col-cancel">
        <button class="btn-cancel" data-id="${item.id}">취소</button>
      </div>
    `;

    volunteerTableBody.appendChild(row);
  });

  bindCancelButtons();
}

function bindCancelButtons() {
  const cancelButtons = document.querySelectorAll(".btn-cancel");

  cancelButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const volunteerId = Number(this.dataset.id);
      const targetIndex = volunteerData.findIndex((item) => item.id === volunteerId);

      if (targetIndex === -1) return;

      const targetItem = volunteerData[targetIndex];
      const isConfirmed = confirm(`[${targetItem.title}] 신청을 취소하시겠습니까?`);

      if (!isConfirmed) return;

      volunteerData.splice(targetIndex, 1);

      const totalPages = Math.ceil(volunteerData.length / rowsPerPage);

      if (currentPage > totalPages) {
        currentPage = totalPages || 1;
      }

      alert("신청이 취소되었습니다.");
      updatePage();
    });
  });
}

//페이지네이션 동작 코드
//reviewData 부분만 맞춰서 수정하면 됨
const rowsPerPage = 10; //페이지당 보여줄 정보 개수
let currentPage = 1;
const maxVisiblePages = 5; //페이지네이션 버튼 개수

function renderPagination() {
  const totalPages = Math.ceil(volunteerData.length / rowsPerPage);
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