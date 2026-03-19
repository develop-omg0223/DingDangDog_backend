document.addEventListener("DOMContentLoaded", () => {
	  renderArchiveCards();
	  renderCareList();
	});
	
	function renderArchiveCards() {
	  const cardList = document.getElementById("main-card-list");
	  if (!cardList || !Array.isArray(mainArchiveData)) return;
	
	  const visibleArchives = mainArchiveData.slice(0, 4);
	  cardList.innerHTML = "";
	
	  visibleArchives.forEach((dog) => {
	    const card = document.createElement("div");
	    card.className = "dog-card";
	
	    const imagePath = dog.archiveImgPath && dog.archiveImgPath.trim() !== ""
	      ? `${contextPath}${dog.archiveImgPath}`
	      : `${contextPath}/assets/img/1.png`; //디폴트 이미지
	
	    card.innerHTML = `
	      <a href="${contextPath}/archive/detail.ar?dogNumber=${dog.dogNumber}">
	        <img src="${imagePath}" alt="${escapeHtml(dog.dogName || "강아지")}">
	      </a>
	    `;
	
	    cardList.appendChild(card);
	  });
	}
	
	function renderCareList() {
	  const careList = document.getElementById("care-list");
	  if (!careList || !Array.isArray(mainCareData)) return;
	
	  const visibleCares = mainCareData.slice(0, 5);
	  careList.innerHTML = "";
	
	  visibleCares.forEach((care) => {
	    const li = document.createElement("li");
	
	    li.innerHTML = `
	      <a href="${contextPath}/care/detail.ca?careNumber=${care.careNumber}">
	        <span class="title">${escapeHtml(care.careTitle || "")}</span>
	        <span class="title">${formatDate(care.careDate)}</span>
	      </a>
	    `;
	
	    careList.appendChild(li);
	  });
	}
	
	function formatDate(dateValue) {
	  if (!dateValue) return "";
	
	  const date = new Date(dateValue);
	  if (Number.isNaN(date.getTime())) {
	    return String(dateValue).length >= 10
	      ? String(dateValue).substring(2, 10).replaceAll("-", "-")
	      : String(dateValue);
	  }
	
	  const yy = String(date.getFullYear()).slice(2);
	  const mm = String(date.getMonth() + 1).padStart(2, "0");
	  const dd = String(date.getDate()).padStart(2, "0");
	
	  return `${yy}-${mm}-${dd}`;
	}
	
	function escapeHtml(value) {
	  return String(value)
	    .replaceAll("&", "&amp;")
	    .replaceAll("<", "&lt;")
	    .replaceAll(">", "&gt;")
	    .replaceAll('"', "&quot;")
	    .replaceAll("'", "&#39;");
}