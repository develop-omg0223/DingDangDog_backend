document.addEventListener("DOMContentLoaded", function () {

  const cards = Array.from(document.querySelectorAll(".dogarchive-card"));
  const cardsPerPage = 20;   // 한 페이지 카드 수
  const pageCount = 5;       // 페이지 버튼 개수

  let currentPage = 1;
  let filteredCards = [...cards];

  const pageList = document.querySelector(".page-list");
  const prevBtn = document.querySelector(".prev-btn");
  const nextBtn = document.querySelector(".next-btn");
  const searchBtn = document.querySelector(".btn-search");
  const searchInput = document.querySelector(".search-input");
  const searchSelect = document.querySelector(".search-select");

  function renderPage(page){
    cards.forEach(card => card.style.display = "none");
    const start = (page - 1) * cardsPerPage;
    const end = start + cardsPerPage;
    filteredCards.slice(start, end).forEach(card => {
      card.style.display = "block";
    });
  }

  function createPagination(){

    const totalPages = Math.ceil(filteredCards.length / cardsPerPage);
    const pageGroup = Math.ceil(currentPage / pageCount);
    const startPage = (pageGroup - 1) * pageCount + 1;
    const endPage = Math.min(startPage + pageCount - 1, totalPages);
    const oldBtns = document.querySelectorAll(".page-item");
    oldBtns.forEach(btn => btn.parentElement.remove());

    for(let i = startPage; i <= endPage; i++){

      const li = document.createElement("li");
      const btn = document.createElement("button");
      btn.className = "page-item";
      btn.textContent = i;

      if(i === currentPage){
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

    if(currentPage > 1){
      currentPage--;
      renderPage(currentPage);
      createPagination();
    }
  });

  nextBtn.addEventListener("click", () => {
    const totalPages = Math.ceil(filteredCards.length / cardsPerPage);
    if(currentPage < totalPages){
      currentPage++;
      renderPage(currentPage);
      createPagination();
    }
  });

  searchBtn.addEventListener("click", () =>{
    const keyword = searchInput.value.trim();
    const type = searchSelect.value;
    filteredCards = cards.filter(card => {

      const writer = card.querySelector(".dogarchive-writer").textContent;
      const title = card.querySelector(".dogarchive-type").textContent;
      
      if (type === "보호소명") return writer.includes(keyword);
      if (type === "견종") return title.includes(keyword);
      return true;
    });

    currentPage = 1;
    renderPage(currentPage);
    createPagination();
  });
  renderPage(currentPage);
  createPagination();
});