document.addEventListener("DOMContentLoaded", function () {

  const rowsPerPage = 15;
  const pageCount = 5;

  let currentPage = 1;
  let filteredData = [...archiveData];

  const pageList = document.querySelector(".page-list");
  const prevBtn = document.querySelector(".prev-btn");
  const nextBtn = document.querySelector(".next-btn");
  const archiveTableBody = document.getElementById("archiveTableBody");

  if (!pageList || !prevBtn || !nextBtn || !archiveTableBody) {
    return;
  }

  function renderPage(page) {
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    const currentData = filteredData.slice(start, end);

    archiveTableBody.innerHTML = "";

    if (currentData.length === 0) {
      archiveTableBody.innerHTML = `<div class="admin-dogarchive-empty">조회된 게시글이 없습니다.</div>`;
      return;
    }

    currentData.forEach((archive) => {
      const row = document.createElement("div");
      row.classList.add("admin-dogarchive-list-row");
      row.style.cursor = "pointer";

      row.innerHTML = `
        <div class="dogarchive-number">${archive.dogNumber || ""}</div>
        <div class="dogarchive-name">${archive.dogName || ""}</div>
        <div class="dogarchive-age">${archive.dogAge || ""}</div>
        <div class="dogarchive-weight">${archive.dogWeight || ""}</div>
        <div class="dogarchive-type">${archive.dogBreed || ""}</div>
        <div class="dogarchive-shelter">${archive.shelterName || ""}</div>
        <div class="dogarchive-date">${archive.dogSafeDate || ""}</div>
      `;

      row.addEventListener("click", () => {
        location.href = `${contextPath}/admin/adminArchiveDetailOk.ad?dogNumber=${archive.dogNumber}`;
      });

      archiveTableBody.appendChild(row);
    });
  }

  function createPagination() {
    const totalPages = Math.ceil(filteredData.length / rowsPerPage);

    const pageGroup = Math.ceil(currentPage / pageCount);
    const startPage = (pageGroup - 1) * pageCount + 1;
    const endPage = Math.min(startPage + pageCount - 1, totalPages);

    const oldBtns = document.querySelectorAll(".page-item");
    oldBtns.forEach((btn) => btn.parentElement.remove());

    for (let i = startPage; i <= endPage; i++) {
      const li = document.createElement("li");
      const btn = document.createElement("button");

      btn.className = "page-item";
      btn.type = "button";
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

      if (nextBtn.parentElement) {
        pageList.insertBefore(li, nextBtn.parentElement);
      }
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
    const totalPages = Math.ceil(filteredData.length / rowsPerPage);

    if (currentPage < totalPages) {
      currentPage++;
      renderPage(currentPage);
      createPagination();
    }
  });

  renderPage(currentPage);
  createPagination();

});