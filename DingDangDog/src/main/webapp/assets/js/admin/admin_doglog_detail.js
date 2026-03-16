// 게시글 삭제
cancelBtn = document.getElementById("btn-remove-detail");
    cancelBtn.addEventListener("click", () => {
      const isConfirmed = confirm("정말로 삭제하시겠습니까?");
      if (!isConfirmed) return;
      alert("삭제되었습니다.")
      location.href = "admin_doglog_list.html";
    });
