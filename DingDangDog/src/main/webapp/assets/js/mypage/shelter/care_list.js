const careData = [
  { number: 21, title: "주말 산책 봉사 모집", date: "2026-03-08", member: "5/20" },
  { number: 20, title: "견사 청소 봉사자 구합니다", date: "2026-03-07", member: "8/20" },
  { number: 19, title: "사료 배급 도와주세요", date: "2026-03-06", member: "12/20" },
  { number: 18, title: "중형견 산책 봉사 모집", date: "2026-03-05", member: "7/15" },
  { number: 17, title: "입양 행사 보조 인원 모집", date: "2026-03-04", member: "4/10" },
  { number: 16, title: "목욕 봉사 참여자 모집", date: "2026-03-03", member: "6/12" },
  { number: 15, title: "주중 보호소 정리 봉사", date: "2026-03-02", member: "9/20" },
  { number: 14, title: "강아지 놀이 봉사 모집", date: "2026-03-01", member: "10/20" },
  { number: 13, title: "보호견 케어 지원 요청", date: "2026-02-28", member: "3/10" },
  { number: 12, title: "주말 케어 봉사 신청", date: "2026-02-27", member: "11/20" },
  { number: 11, title: "산책 봉사 추가 모집", date: "2026-02-26", member: "14/20" },
  { number: 10, title: "청소 및 정리 봉사", date: "2026-02-25", member: "6/15" },
  { number: 9, title: "입양센터 현장 지원", date: "2026-02-24", member: "2/8" },
  { number: 8, title: "소형견 돌봄 봉사 모집", date: "2026-02-23", member: "5/10" },
  { number: 7, title: "봉사자 추가 신청 받습니다", date: "2026-02-22", member: "13/20" },
  { number: 6, title: "보호소 주말 활동 모집", date: "2026-02-21", member: "8/12" },
  { number: 5, title: "유기견 교감 봉사", date: "2026-02-20", member: "7/10" },
  { number: 4, title: "사료/물 갈아주기 봉사", date: "2026-02-19", member: "9/15" },
  { number: 3, title: "강아지 건강 체크 보조", date: "2026-02-18", member: "1/6" },
  { number: 2, title: "입양 행사 진행 보조", date: "2026-02-17", member: "4/8" },
  { number: 1, title: "보호소 운영 도우미 모집", date: "2026-02-16", member: "15/20" }
];

const careTableBody = document.getElementById("careTableBody");
const pagination = document.getElementById("pagination");

function renderTable(page) {
  const start = (page - 1) * rowsPerPage;
  const end = start + rowsPerPage;
  const currentData = careData.slice(start, end);

  careTableBody.innerHTML = "";

  currentData.forEach((item) => {
    const row = document.createElement("div");
    row.classList.add("review-table-row");

    row.innerHTML = `
      <div class="col-number">${item.number}</div>
      <div class="col-title"><a href="#">${item.title}</a></div>
      <div class="col-date">${item.date}</div>
      <div class="col-member">${item.member}</div>
    `;

    careTableBody.appendChild(row);
  });
}

//페이지네이션 동작 코드
//reviewData 부분만 맞춰서 수정하면 됨
const rowsPerPage = 10; //페이지당 보여줄 정보 개수
let currentPage = 1;
const maxVisiblePages = 5; //페이지네이션 버튼 개수

function renderPagination() {
  const totalPages = Math.ceil(careData.length / rowsPerPage);
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