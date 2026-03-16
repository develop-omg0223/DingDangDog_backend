const archiveData = [
  { id: 1, name: "콩이", info: "믹스견 | 2살 | 수컷" },
  { id: 2, name: "보리", info: "푸들 | 3살 | 암컷" },
  { id: 3, name: "초코", info: "말티즈 | 1살 | 수컷" }
  // { id: 4, name: "멈뭄", info: "시츄 | 2살 | 수컷" }
];

const recentArchiveList = document.getElementById("recentArchiveList");

function renderRecentArchives() {
  if (!recentArchiveList) return;

  recentArchiveList.innerHTML = "";

  for (let i = 0; i < 4; i++) {
    const item = archiveData[i];
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
            <h3></h3>
            <h4></h4>
          </div>
        </div>
      `;
    }

    recentArchiveList.appendChild(li);
  }
}

renderRecentArchives();