document.addEventListener("DOMContentLoaded", function() {
  const recentArchiveList = document.getElementById("recentArchiveList");

  function renderRecentArchives() {
    if (!recentArchiveList) return;

    recentArchiveList.innerHTML = "";

    // JSP에서 전달받은 contextPath가 없다면 빈 문자열 처리
    const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2)) || "";
    const defaultImg = contextPath + "/assets/img/dogarchive/default_dog.png";

    for (let i = 0; i < 4; i++) {
      const item = (typeof serverArchiveData !== 'undefined') ? serverArchiveData[i] : null;
      const li = document.createElement("li");
      li.classList.add("archive-card");

	  if (item) {
	          // 상세 페이지 이동 경로 (ContextPath가 포함되어 있지 않다면 앞에 붙여주세요)
	          const detailLink = `/archive/read.ar?dogNumber=${item.dogNumber}`;
	          
	          // 이미지 경로가 없을 경우를 대비한 기본 이미지
	          const defaultImg = `${contextPath}/assets/img/dogarchive/default_dog.png`;

	          li.innerHTML = `
	            <a href="${detailLink}" class="archive-card-link">
	              <div class="archive-card-img" style="width:100%; overflow:hidden;">
	                <img src="${item.imagePath}" 
	                     alt="${item.name}" 
	                     style="width: 100%; height: 100%; object-fit: cover;"
	                     onerror="this.onerror=null; this.src='${defaultImg}';">
	              </div>
	              <div class="archive-card-info">
	                <h3>${item.name}</h3>
	                <h4>${item.info}</h4>
	              </div>
	            </a>
	          `;
      } else {
        li.classList.add("archive-card-empty");
        li.innerHTML = `
          <div class="archive-card-link empty-card">
            <div class="archive-card-img"></div>
            <div class="archive-card-info">
              <h3>기록 없음</h3>
              <h4>새로운 친구를 등록해주세요</h4>
            </div>
          </div>
        `;
      }
      recentArchiveList.appendChild(li);
    }
  }

  renderRecentArchives();
});