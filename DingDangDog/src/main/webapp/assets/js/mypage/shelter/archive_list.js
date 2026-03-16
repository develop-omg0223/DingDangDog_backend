const archiveData = [
  { id: 1, name: "콩이", info: "믹스견 | 2살 | 수컷" },
  { id: 2, name: "보리", info: "푸들 | 3살 | 암컷" },
  { id: 3, name: "초코", info: "말티즈 | 1살 | 수컷" },
  { id: 4, name: "해피", info: "진도믹스 | 4살 | 암컷" },
  { id: 5, name: "두부", info: "포메라니안 | 2살 | 수컷" },
  { id: 6, name: "까미", info: "시츄 | 5살 | 암컷" },
  { id: 7, name: "몽이", info: "웰시코기 | 3살 | 수컷" },
  { id: 8, name: "사랑", info: "비숑 | 2살 | 암컷" },
  { id: 9, name: "별이", info: "믹스견 | 1살 | 암컷" },
  { id: 10, name: "탄이", info: "진도견 | 6살 | 수컷" },
  { id: 11, name: "구름", info: "사모예드 | 2살 | 수컷" },
  { id: 12, name: "밤이", info: "닥스훈트 | 4살 | 암컷" },
  { id: 13, name: "복실", info: "스피츠 | 3살 | 수컷" },
  { id: 14, name: "달이", info: "말티푸 | 1살 | 암컷" },
  { id: 15, name: "호두", info: "믹스견 | 5살 | 수컷" },
  { id: 16, name: "루비", info: "치와와 | 2살 | 암컷" }
];
const archiveList = document.getElementById("archiveList");
const pagination = document.getElementById("pagination");

function renderCards(page) {
  const start = (page - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  const currentItems = archiveData.slice(start, end);

  archiveList.innerHTML = "";

  currentItems.forEach((item) => {
    const li = document.createElement("li");
    li.classList.add("archive-card");

    li.innerHTML = `
      <a href="#" class="archive-card-link">
        <div class="archive-card-img">이미지칸</div>
        <div class="archive-card-info">
          <h3>${item.name}</h3>
          <h4>${item.info}</h4>
        </div>
      </a>
    `;

    archiveList.appendChild(li);
  });
}

//페이지네이션 동작 코드
//reviewData 부분만 맞춰서 수정하면 됨
const itemsPerPage = 8; //페이지당 보여줄 정보 개수
let currentPage = 1;
const maxVisiblePages = 5; //페이지네이션 버튼 개수

function renderPagination() {
  const totalPages = Math.ceil(archiveData.length / itemsPerPage);
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