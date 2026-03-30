const itemsPerPage = 8; 
let currentPage = 1;

function renderCards(page) {
    const archiveList = document.getElementById("archiveList");
    if (!archiveList) return;

    archiveList.innerHTML = ""; 

    const start = (page - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const currentItems = archiveData.slice(start, end);

    // 기본 이미지 경로 (contextPath 변수 활용)
    const defaultImg = `${contextPath}/assets/img/dogarchive/default_dog.png`;

    currentItems.forEach((item) => {
        const cardLink = document.createElement("a");
        // 상세 페이지 이동 경로 (read.ar 사용)
        cardLink.href = `${contextPath}/archive/read.ar?dogNumber=${item.dogNumber}`;
        cardLink.className = "card-link";

        // ★ 핵심: DB에 담긴 전체 경로(archiveImgPath)를 그대로 사용합니다.
        // JSP 데이터 구조가 { archiveImgPath: "..." } 이므로 item.archiveImgPath로 접근합니다.
        const imgTag = `
            <img src="${item.archiveImgPath}" 
                 alt="${item.dogName}" 
                 style="width: 100%; height: 100%; object-fit: cover;"
                 onerror="this.onerror=null; this.src='${defaultImg}';">
        `;

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