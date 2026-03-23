function applyClick(careNumber) {
	// 세션에서 userNumber 값 가져오기
	var userNumber = '<c:out value="${sessionScope.userNumber}" />';

	console.log("applyClick 실행됨");
	console.log("careNumber: " + careNumber);
	console.log("userNumber: " + userNumber); // 확인용 로그

	// userNumber가 비어있으면 로그인하지 않은 상태
	if (!userNumber || userNumber === '') {
		alert("로그인이 필요한 서비스입니다.");
		// 로그인 페이지로 리다이렉트
		window.location.href = "${pageContext.request.contextPath}/login.jsp";
	} else {
		console.log("로그인된 사용자: 신청 처리 페이지로 리다이렉트");
		// 신청 처리 URL로 리다이렉트 (careNumber와 userNumber 함께 전달)
		window.location.href = "${pageContext.request.contextPath}/care/apply.ca?careNumber="
			+ careNumber + "&userNumber=" + userNumber;
	}
}
function confirmDelete(careNumber) {
    if (confirm("정말 삭제하시겠습니까?")) {
        alert("삭제되었습니다.");
        // 확인 클릭 시 해당 경로로 이동
        location.href = window.location.origin + "/care/delete.ca?careNumber=" + careNumber;
    } else {
        alert("취소되었습니다.");
    }
}