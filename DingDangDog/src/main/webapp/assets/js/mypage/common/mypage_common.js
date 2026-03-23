document.addEventListener("DOMContentLoaded", function() {
    
    // 1. 내 정보 데이터 바인딩 (UserDTO 필드명 기준)
    if (serverUserData) {
        const nameElem = document.getElementById("userName_common");
        const nickElem = document.getElementById("userNickname_common");
        const birthElem = document.getElementById("userBirth_common");
        const phoneElem = document.getElementById("userPhonenumber_common");
        const emailElem = document.getElementById("userEmail_common");

        // serverUserData 객체에 담긴 값을 HTML에 주입
        if (nameElem) nameElem.textContent = serverUserData.userName || "정보 없음";
        if (nickElem) nickElem.textContent = serverUserData.userNickname || "정보 없음";
        if (birthElem) birthElem.textContent = serverUserData.userBirth || "정보 없음";
        if (phoneElem) phoneElem.textContent = serverUserData.userPhone || "정보 없음";
        if (emailElem) emailElem.textContent = serverUserData.userEmail || "정보 없음";
    }

    // 2. 매칭 결과 리스트 바인딩
    const rows = document.querySelectorAll(".match-row");
    
    if (rows.length > 0 && serverMatchData && serverMatchData.length > 0) {
        rows.forEach((row, index) => {
            const titleElem = row.querySelector(".match-title");
            const dateElem = row.querySelector(".match-date");

            if (serverMatchData[index]) {
                titleElem.textContent = serverMatchData[index].title;
                dateElem.textContent = serverMatchData[index].date;
            } else {
                row.style.display = "none"; 
            }
        });
    } else if (rows.length > 0) {
        // 데이터가 없을 경우 처리
        const firstRow = rows[0];
        firstRow.innerHTML = "<div style='padding:20px; color:#999; text-align:center; width:100%;'>최근 매칭 결과가 없습니다.</div>";
        for(let i=1; i<rows.length; i++) rows[i].style.display = "none";
    }
});