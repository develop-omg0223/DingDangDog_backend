<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/dogarchive/dogarchive_write.css" />
<script defer
	src="${pageContext.request.contextPath}/assets/js/dogarchive/dogarchive_write.js"></script>
<title>멍! 카이브 작성</title>
</head>

<body>
	<c:choose>
		<c:when test="${not empty sessionScope.userNumber}">
			<jsp:include page="/app/header_login.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="/app/header_logout.jsp" />
		</c:otherwise>
	</c:choose>

	<main class="archive-write">
		<form id="archiveForm"
			action="${pageContext.request.contextPath}/archive/writeOk.ar"
			method="post" enctype="multipart/form-data">
			<div class="container">
				<div class="container-header">
					<h2 id="main-title">멍! 카이브 작성</h2>
				</div>

				<div class="container-body">
					<div class="archive-write-top">
						<div class="archive-image-section">
							<div class="archive-image-box">
								<img id="thumbnailPreview" src="" alt="대표 이미지 미리보기" /> <span
									class="img-placeholder">대표 이미지 첨부하기</span>
							</div>

							<input type="file" id="imageUpload" name="dogImage"
								accept="image/*" multiple hidden /> <label for="imageUpload"
								class="btn btn-upload">이미지 첨부</label>
						</div>

						<div class="archive-info-section">
							<div class="dog-name-row">
								<label for="dogName" class="dog-name-label">이름 :</label> <input
									type="text" id="dogName" name="dogName" class="dog-name-input" />
							</div>

							<div class="dog-info-grid">
								<div class="info-item">
									<label for="dogBreed">품종 :</label> <input type="text"
										id="dogBreed" name="dogBreed" />
								</div>

								<div class="info-item">
									<label for="dogGender">성별 :</label> <input type="text"
										id="dogGender" name="dogGender" placeholder="M 또는 F를 입력해주세요"
										class="info-input" />
								</div>

								<div class="info-item">
									<label for="dogAge">나이 :</label> <input type="text" id="dogAge"
										name="dogAge" />
								</div>

								<div class="info-item">
									<label for="dogWeight">몸무게 :</label> <input type="text"
										id="dogWeight" name="dogWeight" />
								</div>
								<div class="info-item">
									<label for="shelterName">보호소 :</label> <input type="text"
										id="shelterName" name="shelterName"
										value="${sessionScope.shelterName}" readonly />
								</div>

								<div class="info-item">
									<label for="dogRescueDate">보호소에 들어온 날 :</label> <input
										type="date" id="dogRescueDate" name="dogRescueDate" />
								</div>
							</div>

							<div class="dog-trait-list">
								<div class="trait-row">
									<label for="scoreActivity">활동성 :</label> <input type="text"
										id="traitActivity" name="traitActivity"
										class="trait-text-input" /> <span class="trait-score-label">점수:</span>
									<select id="scoreActivity" name="scoreActivity"
										class="trait-score-select">
										<option value="">선택</option>
										<option value="1">1점</option>
										<option value="2">2점</option>
										<option value="3">3점</option>
										<option value="4">4점</option>
										<option value="5">5점</option>
									</select>
								</div>

								<div class="trait-row">
									<label for="scoreSocial">사회성 :</label> <input type="text"
										id="traitSocial" name="traitSocial" class="trait-text-input" />
									<span class="trait-score-label">점수:</span> <select
										id="scoreSocial" name="scoreSocial" class="trait-score-select">
										<option value="">선택</option>
										<option value="1">1점</option>
										<option value="2">2점</option>
										<option value="3">3점</option>
										<option value="4">4점</option>
										<option value="5">5점</option>
									</select>
								</div>

								<div class="trait-row">
									<label for="scoreIndependence">독립성 :</label> <input type="text"
										id="traitIndependence" name="traitIndependence"
										class="trait-text-input" /> <span class="trait-score-label">점수:</span>
									<select id="scoreIndependence" name="scoreIndependence"
										class="trait-score-select">
										<option value="">선택</option>
										<option value="1">1점</option>
										<option value="2">2점</option>
										<option value="3">3점</option>
										<option value="4">4점</option>
										<option value="5">5점</option>
									</select>
								</div>

								<div class="trait-row">
									<label for="scoreBark">짖음수준 :</label> <input type="text"
										id="traitBark" name="traitBark" class="trait-text-input" /> <span
										class="trait-score-label">점수:</span> <select id="scoreBark"
										name="scoreBark" class="trait-score-select">
										<option value="">선택</option>
										<option value="1">1점</option>
										<option value="2">2점</option>
										<option value="3">3점</option>
										<option value="4">4점</option>
										<option value="5">5점</option>
									</select>
								</div>

								<div class="trait-row">
									<label for="scoreGrooming">털관리 :</label> <input type="text"
										id="traitGrooming" name="traitGrooming"
										class="trait-text-input" /> <span class="trait-score-label">점수:</span>
									<select id="scoreGrooming" name="scoreGrooming"
										class="trait-score-select">
										<option value="">선택</option>
										<option value="1">1점</option>
										<option value="2">2점</option>
										<option value="3">3점</option>
										<option value="4">4점</option>
										<option value="5">5점</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="archive-content-section">
						<input type="hidden" name="dogContent" id="dogContentHidden">
						<div id="archiveContentEditor" class="archive-content-editor"
							contenteditable="true" data-placeholder="보호소가 자유롭게 작성 가능한 텍스트란"></div>
					</div>
				</div>

				<div class="container-footer">
					<div class="footer-btn-wrap">
						<button type="button" class="btn btn-save" id="btnEditSave">등록</button>
						<button type="button" class="btn btn-cancel" id="btnCancle"
							onclick="location.href='${pageContext.request.contextPath}/archive/list.ar'">
							취소</button>
					</div>
				</div>
			</div>
		</form>
	</main>

	<jsp:include page="/app/footer.jsp" />

	<script
		src="${pageContext.request.contextPath}/assets/js/header-footer.js"></script>
</body>

</html>