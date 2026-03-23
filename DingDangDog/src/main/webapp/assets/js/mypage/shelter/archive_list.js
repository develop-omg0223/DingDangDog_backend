const itemsPerPage = 8; 
let currentPage = 1;

function renderCards(page) {
    const archiveList = document.getElementById("archiveList");
    if (!archiveList) return;

    // 리스트 비우기
    archiveList.innerHTML = ""; 

    const start = (page - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const currentItems = archiveData.slice(start, end);

    currentItems.forEach((item) => {
        const cardLink = document.createElement("a");
        cardLink.href = `${contextPath}/archive/read.ar?dogNumber=${item.dogNumber}`;
        cardLink.className = "card-link";

        // 이미지 경로 처리
        const imgTag = item.archiveImgPath 
            ? `<img src="${contextPath}/upload/${item.archiveImgPath}" alt="강아지 이미지">`
            : `<span class="no-image">이미지 없음</span>`;

        cardLink.innerHTML = `
            <div class="card-item">
                <div class="card-image-wrapper">
                    ${imgTag}
                </div>
                <div class="card-info">
                    <p><strong>${item.dogName}</strong></p>
                    <p>${item.dogBreed} | ${item.dogGender}</p>
                </div>
            </div>
        `;
        archiveList.appendChild(cardLink);
    });
}


function renderPagination() {
    const pagination = document.getElementById("pagination");
    if (!pagination) return;
    
    pagination.innerHTML = "";
    const totalPages = Math.ceil(archiveData.length / itemsPerPage);

    for (let i = 1; i <= totalPages; i++) {
        const li = document.createElement("li");
        const btn = document.createElement("button");
        btn.textContent = i;
        btn.className = (i === currentPage) ? "page-item current-page" : "page-item";
        btn.onclick = () => {
            currentPage = i;
            updatePage();
        };
        li.appendChild(btn);
        pagination.appendChild(li);
    }
}

function updatePage() {
    renderCards(currentPage);
    renderPagination();
}

document.addEventListener("DOMContentLoaded", updatePage);