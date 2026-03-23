document.addEventListener("DOMContentLoaded", function() {
  const recentArchiveList = document.getElementById("recentArchiveList");

  function renderRecentArchives() {
    if (!recentArchiveList) return;

    recentArchiveList.innerHTML = "";

    // 최대 4개의 카드를 생성 (데이터가 없으면 빈 카드 노출)
    for (let i = 0; i < 4; i++) {
      const item = (typeof serverArchiveData !== 'undefined') ? serverArchiveData[i] : null;
      const li = document.createElement("li");
      li.classList.add("archive-card");

      if (item) {
        li.innerHTML = `
          <a href="#" class="archive-card-link">
            <div class="archive-card-img">이미지칸</div>
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