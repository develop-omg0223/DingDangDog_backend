document.addEventListener("DOMContentLoaded", function () {

  const rows = Array.from(document.querySelectorAll(".admin-doglog-list-row"));
  const rowsPerPage = 15;   // 게시글 수
  const pageCount = 5;      // 페이지 버튼 수

  let currentPage = 1;
  let filteredRows = [...rows];

  const pageList = document.querySelector(".page-list");
  const prevBtn = document.querySelector(".prev-btn");
  const nextBtn = document.querySelector(".next-btn");
  const searchBtn = document.querySelector(".btn-search");
  const searchInput = document.querySelector(".search-input");
  const searchSelect = document.querySelector(".search-select");



  function renderPage(page) {

    rows.forEach(row => row.style.display = "none");
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;

    filteredRows.slice(start, end).forEach(row => {
      row.style.display = "grid";
    });
  }

  function createPagination() {

    const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
    const pageGroup = Math.ceil(currentPage / pageCount);
    const startPage = (pageGroup - 1) * pageCount + 1;
    const endPage = Math.min(startPage + pageCount - 1, totalPages);
    const oldBtns = document.querySelectorAll(".page-item");
    oldBtns.forEach(btn => btn.parentElement.remove());



    for (let i = startPage; i <= endPage; i++) {

      const li = document.createElement("li");
      const btn = document.createElement("button");
      btn.className = "page-item";
      btn.textContent = i;

      if (i === currentPage) {
        btn.classList.add("current-page");
      }
      btn.addEventListener("click", () => {
        currentPage = i;
        renderPage(currentPage);
        createPagination();
      });
      li.appendChild(btn);
      pageList.insertBefore(li, nextBtn.parentElement);
    }
  }

  prevBtn.addEventListener("click", () => {

    if (currentPage > 1) {
      currentPage--;
      renderPage(currentPage);
      createPagination();
    }
  });

  nextBtn.addEventListener("click", () => {

    const totalPages = Math.ceil(filteredRows.length / rowsPerPage);

    if (currentPage < totalPages) {
      currentPage++;
      renderPage(currentPage);
      createPagination();
    }
  });

  searchBtn.addEventListener("click", () => {

    const keyword = searchInput.value.trim();
    const type = searchSelect.value;
    filteredRows = rows.filter(row => {

      const id = row.querySelector(".doglog-id").textContent;
      const nickname = row.querySelector(".doglog-nickname").textContent;
      
      if (type === "아이디") return id.includes(keyword);
      if (type === "닉네임") return nickname.includes(keyword);
      return true;
    });

    currentPage = 1;
    renderPage(currentPage);
    createPagination();

  });

  renderPage(currentPage);
  createPagination();

});