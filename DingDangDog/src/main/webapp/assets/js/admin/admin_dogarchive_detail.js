document.addEventListener("DOMContentLoaded", function () {

  const dogName = document.getElementById("dogName");
  const dogImage = document.getElementById("dogImage");
  const dogAge = document.getElementById("dogAge");
  const dogWeight = document.getElementById("dogWeight");
  const shelterName = document.getElementById("shelterName");
  const dogSafeDate = document.getElementById("dogSafeDate");

  const backToListBtn = document.getElementById("backToListBtn");
  const removeBtn = document.getElementById("removeBtn");

  renderDetail();
  bindEvents();

  function renderDetail() {
    dogName.textContent = archiveDetail.dogName || "";
    dogAge.textContent = archiveDetail.dogAge || "";
    dogWeight.textContent = archiveDetail.dogWeight ? `${archiveDetail.dogWeight}kg` : "";
    shelterName.textContent = archiveDetail.shelterName || "";
    dogSafeDate.textContent = archiveDetail.dogSafeDate || "";

    if (archiveDetail.archiveImgPath) {
      dogImage.src = `${contextPath}${archiveDetail.archiveImgPath}`;
      dogImage.style.display = "block";
    } else {
      dogImage.style.display = "none";
    }
  }

  function bindEvents() {
    backToListBtn.addEventListener("click", function () {
      location.href = `${contextPath}/admin/adminArchiveListOk.ad`;
    });

    removeBtn.addEventListener("click", function () {
      const isConfirmed = confirm("정말 삭제하시겠습니까?");
      if (!isConfirmed) return;

      location.href = `${contextPath}/admin/adminArchiveDeleteOk.ad?dogNumber=${archiveDetail.dogNumber}`;
    });
  }

});