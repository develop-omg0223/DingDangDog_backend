document.addEventListener("DOMContentLoaded", function() {
	const cancelBtn = document.getElementById("blacklist-cancel-btn");

	if (cancelBtn) {
		cancelBtn.addEventListener("click", function() {
			const contextPath = this.getAttribute("data-context-path");
			const userNumber = this.getAttribute("data-user-number");
			if (confirm("블랙리스트를 해제합니다")) {
				location.href = contextPath + "/admin/blackListRemoveOk.ad?userNumber=" + userNumber;
			}
		});
	}
});