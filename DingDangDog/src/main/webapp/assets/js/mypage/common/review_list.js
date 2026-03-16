const reviewData = [
  { id: 23, title: "강아지와 함께한 첫 산책 후기", date: "2026-03-08" },
  { id: 22, title: "입양 후 적응 과정 기록", date: "2026-03-07" },
  { id: 21, title: "병원 검진 다녀온 후기", date: "2026-03-06" },
  { id: 20, title: "사료 바꿔본 후기", date: "2026-03-05" },
  { id: 19, title: "주말에 다녀온 애견카페", date: "2026-03-04" },
  { id: 18, title: "목욕시킨 날 기록", date: "2026-03-03" },
  { id: 17, title: "산책 코스 추천 후기", date: "2026-03-02" },
  { id: 16, title: "장난감 반응 후기", date: "2026-03-01" },
  { id: 15, title: "훈련 시작 1일차", date: "2026-02-28" },
  { id: 14, title: "간식 테스트 후기", date: "2026-02-27" },
  { id: 13, title: "겨울 산책 준비물 정리", date: "2026-02-26" },
  { id: 12, title: "반려견과 첫 여행", date: "2026-02-25" },
  { id: 11, title: "하네스 착용 후기", date: "2026-02-24" },
  { id: 10, title: "유기견 봉사 다녀온 후기", date: "2026-02-23" },
  { id: 9, title: "보호소 방문 기록", date: "2026-02-22" },
  { id: 8, title: "입양 상담 후기", date: "2026-02-21" },
  { id: 7, title: "처음 집에 온 날", date: "2026-02-20" },
  { id: 6, title: "배변 훈련 기록", date: "2026-02-19" },
  { id: 5, title: "건강검진 결과 정리", date: "2026-02-18" },
  { id: 4, title: "하루 일과 기록", date: "2026-02-17" },
  { id: 3, title: "처음 목줄 적응", date: "2026-02-16" },
  { id: 2, title: "애착 장난감 찾기", date: "2026-02-15" },
  { id: 1, title: "첫 후기 작성", date: "2026-02-14" }
];



const reviewTableBody = document.getElementById("reviewTableBody");
const pagination = document.getElementById("pagination");

function renderTable(page) {
  const start = (page - 1) * rowsPerPage;
  const end = start + rowsPerPage;
  const currentData = reviewData.slice(start, end);

  reviewTableBody.innerHTML = "";

  currentData.forEach((review) => {
    const row = document.createElement("div");
    row.classList.add("review-table-row");

    row.innerHTML = `
      <div class="col-number">${review.id}</div>
      <div class="col-title">${review.title}</div>
      <div class="col-date">${review.date}</div>
    `;

    reviewTableBody.appendChild(row);
  });
}


//페이지네이션 동작 코드
//reviewData 부분만 맞춰서 수정하면 됨
const rowsPerPage = 10; //페이지당 보여줄 정보 개수
let currentPage = 1;
const maxVisiblePages = 5; //페이지네이션 버튼 개수

function renderPagination() {
  const totalPages = Math.ceil(reviewData.length / rowsPerPage);
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