/*document.addEventListener("DOMContentLoaded", function () {

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
  const reviewTableBody = document.getElementById("reviewTableBody");
  



  function renderPage(page) {

    rows.forEach(row => row.style.display = "none");
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;
	const currentData =reviewData.slice(start,end);

    filteredRows.slice(start, end).forEach(row => {
      row.style.display = "grid";
    });
	
	reviewTableBody.innerHTML = "";
	
	currentData.forEach((review) => {
	  const row = document.createElement("div");
	  row.classList.add("review-table-row");
	  row.style.cursor = "pointer";

	  row.innerHTML = `
	    <div class="doglog-number">${review.id}</div>
	    <div class="doglog-title">${review.title || "제목 없음"}</div>
	    <div class="doglog-id">${review.userId}</div>
		<div class="doglog-nickname">${review.userNickName}
	    <div class="doglog-date">${review.date || ""}</div>
	  `;

	 
	  row.addEventListener("click", () => {
	    location.href = `${contextPath}/log/detail.lo?logNumber=${review.id}`;
	  });

	  reviewTableBody.appendChild(row);
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
        updatePage();
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
      updatePage();
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
   	updatePage();

  });

  function updatePage(){
	renderPage(currentPage);
	createPagination();
	
  }
 

});*/

document.addEventListener("DOMContentLoaded", function () {
  const rowsPerPage = 15;
  const pageCount = 5;

  let currentPage = 1;

  const pageList = document.querySelector(".page-list");
  const prevBtn = document.querySelector(".prev-btn");
  const nextBtn = document.querySelector(".next-btn");
  const searchBtn = document.querySelector(".btn-search");
  const searchInput = document.querySelector(".search-input");
  const searchSelect = document.querySelector(".search-select");
  const reviewTableBody = document.getElementById("reviewTableBody");

  const contextPath = window.contextPath || "";

  const reviewData = [
    { id: 101, title: "강아지 산책 기록", userId: "nova01", userNickName: "노바", date: "2026-03-01" },
    { id: 102, title: "오늘 병원 다녀왔어요", userId: "doglove22", userNickName: "멍집사", date: "2026-03-02" },
    { id: 103, title: "간식 추천 후기", userId: "happydog", userNickName: "행복이", date: "2026-03-03" },
    { id: 104, title: "미용 후 사진", userId: "puppy77", userNickName: "초코맘", date: "2026-03-04" },
    { id: 105, title: "우리집 강아지 첫 산책", userId: "walker11", userNickName: "산책왕", date: "2026-03-05" },
    { id: 106, title: "사료 바꿔본 후기", userId: "feed99", userNickName: "사료연구소", date: "2026-03-06" },
    { id: 107, title: "예방접종 완료", userId: "petday", userNickName: "멍멍", date: "2026-03-07" },
    { id: 108, title: "장난감 리뷰", userId: "toyzone", userNickName: "토이맘", date: "2026-03-08" },
    { id: 109, title: "강아지 목욕시켰어요", userId: "bath01", userNickName: "뽀송", date: "2026-03-09" },
    { id: 110, title: "새 집 적응기", userId: "newhome", userNickName: "집사A", date: "2026-03-10" },
    { id: 111, title: "주말 나들이 기록", userId: "weekend7", userNickName: "여행멍", date: "2026-03-11" },
    { id: 112, title: "반려견 훈련 일지", userId: "trainer3", userNickName: "훈련사", date: "2026-03-12" },
    { id: 113, title: "애견카페 방문", userId: "cafe88", userNickName: "카페러버", date: "2026-03-13" },
    { id: 114, title: "하네스 구매 후기", userId: "shopdog", userNickName: "쇼핑멍", date: "2026-03-14" },
    { id: 115, title: "강아지가 좋아하는 간식", userId: "snack7", userNickName: "간식짱", date: "2026-03-15" },
    { id: 116, title: "오늘의 멍로그", userId: "dailylog", userNickName: "데일리", date: "2026-03-16" },
    { id: 117, title: "반려견과 공원 산책", userId: "parkman", userNickName: "공원러", date: "2026-03-17" },
    { id: 118, title: "알러지 검사 후기", userId: "health12", userNickName: "건강지킴이", date: "2026-03-18" }
  ];

  let filteredData = [...reviewData];

  function renderPage(page) {
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    const currentData = filteredData.slice(start, end);

    reviewTableBody.innerHTML = "";

    if (currentData.length === 0) {
      reviewTableBody.innerHTML = `<div class="empty-row">조회된 게시글이 없습니다.</div>`;
      return;
    }

    currentData.forEach((review) => {
      const row = document.createElement("div");
      row.classList.add("admin-doglog-list-row");
      row.style.cursor = "pointer";

      row.innerHTML = `
        <div class="doglog-number">${review.id}</div>
        <div class="doglog-title">${review.title || "제목 없음"}</div>
        <div class="doglog-id">${review.userId || ""}</div>
        <div class="doglog-nickname">${review.userNickName || ""}</div>
        <div class="doglog-date">${review.date || ""}</div>
      `;

      row.addEventListener("click", () => {
        location.href = `${contextPath}/log/detail.lo?logNumber=${review.id}`;
      });

      reviewTableBody.appendChild(row);
    });
  }

  function createPagination() {
    const totalPages = Math.ceil(filteredData.length / rowsPerPage);

    document.querySelectorAll(".page-item").forEach((btn) => {
      btn.parentElement.remove();
    });

    if (totalPages === 0) {
      return;
    }

    const pageGroup = Math.ceil(currentPage / pageCount);
    const startPage = (pageGroup - 1) * pageCount + 1;
    const endPage = Math.min(startPage + pageCount - 1, totalPages);

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
        updatePage();
      });

      li.appendChild(btn);
      pageList.insertBefore(li, nextBtn.parentElement);
    }
  }

  function updatePage() {
    renderPage(currentPage);
    createPagination();
  }

  prevBtn.addEventListener("click", () => {
    if (currentPage > 1) {
      currentPage--;
      updatePage();
    }
  });

  nextBtn.addEventListener("click", () => {
    const totalPages = Math.ceil(filteredData.length / rowsPerPage);

    if (currentPage < totalPages) {
      currentPage++;
      updatePage();
    }
  });

  searchBtn.addEventListener("click", () => {
    const keyword = searchInput.value.trim();
    const type = searchSelect.value;

    if (!keyword) {
      filteredData = [...reviewData];
    } else {
      filteredData = reviewData.filter((review) => {
        const id = review.userId || "";
        const nickname = review.userNickName || "";

        if (type === "아이디") return id.includes(keyword);
        if (type === "닉네임") return nickname.includes(keyword);
        return true;
      });
    }

    currentPage = 1;
    updatePage();
  });

  updatePage();
});