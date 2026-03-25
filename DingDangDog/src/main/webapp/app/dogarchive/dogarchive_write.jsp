<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogarchive/dogarchive_write.css?v=1.2" />
<script defer src="${pageContext.request.contextPath}/assets/js/dogarchive/dogarchive_write.js?v=1.2"></script>
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
		<form id="writeForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/archive/writeOk.ar">
			<div class="container">
				<div class="container-header">
					<h2 id="main-title">멍! 카이브 작성</h2>
				</div>

				<div class="container-body">
					<div class="archive-write-top">
						<div class="archive-image-section">
							<div class="archive-image-box">
								<img id="previewImage" src="${pageContext.request.contextPath}/assets/img/dogarchive/default_dog.png" alt="대표 이미지" />
							</div>
							<input type="file" id="dogImage" name="dogImage" accept="image/*" hidden /> 
							<label for="dogImage" class="btn btn-upload">이미지 첨부</label>
						</div>

						<div class="archive-info-section">
							<div class="dog-name-row">
								<label for="dogName" class="dog-name-label">이름 :</label> 
								<input type="text" id="dogName" name="dogName" class="dog-name-input" placeholder="강아지 이름 입력" />
							</div>

							<div class="dog-info-grid">
								<div class="info-item">
									<label for="dogBreed">품종 :</label> 
									<input type="text" id="dogBreed" name="dogBreed" placeholder="품종 입력" />
								</div>
								<div class="info-item">
									<span class="info-label">성별 :</span> 
									<select class="info-input" id="dogGender" name="dogGender">
										<option value="M">M</option>
										<option value="F">F</option>
									</select>
								</div>
								<div class="info-item">
									<label for="dogAge">나이 :</label> 
									<input type="text" id="dogAge" name="dogAge" placeholder="나이(숫자만) 입력" />
								</div>
								<div class="info-item">
									<label for="dogWeight">몸무게 :</label> 
									<input type="text" id="dogWeight" name="dogWeight" placeholder="몸무게(kg) 입력" />
								</div>
								<div class="info-item">
									<label for="dogSafeDate">보호소 들어온 날 :</label> 
									<input type="date" id="dogSafeDate" name="dogSafeDate" />
								</div>
							</div>

							<div class="dog-trait-list">
								<div class="trait-row">
									<label for="dogActivityDetail">활동성 :</label> 
									<input type="text" id="dogActivityDetail" name="dogActivityDetail" class="trait-text-input" placeholder="활동성 설명 입력" /> 
									<span class="trait-score-label">점수:</span>
									<select name="dogActivity" class="trait-score-select">
										<option value="1">1점</option><option value="2">2점</option><option value="3" selected>3점</option><option value="4">4점</option><option value="5">5점</option>
									</select>
								</div>
								<div class="trait-row">
									<label for="dogSocialityDetail">사회성 :</label> 
									<input type="text" id="dogSocialityDetail" name="dogSocialityDetail" class="trait-text-input" placeholder="사회성 설명 입력" /> 
									<span class="trait-score-label">점수:</span>
									<select name="dogSociality" class="trait-score-select">
										<option value="1">1점</option><option value="2">2점</option><option value="3" selected>3점</option><option value="4">4점</option><option value="5">5점</option>
									</select>
								</div>
								<div class="trait-row">
									<label for="dogIndependenceDetail">독립성 :</label> 
									<input type="text" id="dogIndependenceDetail" name="dogIndependenceDetail" class="trait-text-input" placeholder="독립성 설명 입력" /> 
									<span class="trait-score-label">점수:</span>
									<select name="dogIndependence" class="trait-score-select">
										<option value="1">1점</option><option value="2">2점</option><option value="3" selected>3점</option><option value="4">4점</option><option value="5">5점</option>
									</select>
								</div>
								<div class="trait-row">
									<label for="dogBarkingDetail">짖음수준 :</label> 
									<input type="text" id="dogBarkingDetail" name="dogBarkingDetail" class="trait-text-input" placeholder="짖음수준 설명 입력" /> 
									<span class="trait-score-label">점수:</span>
									<select name="dogBarking" class="trait-score-select">
										<option value="1">1점</option><option value="2">2점</option><option value="3" selected>3점</option><option value="4">4점</option><option value="5">5점</option>
									</select>
								</div>
								<div class="trait-row">
									<label for="dogGroomingDetail">털관리 :</label> 
									<input type="text" id="dogGroomingDetail" name="dogGroomingDetail" class="trait-text-input" placeholder="털관리 설명 입력" /> 
									<span class="trait-score-label">점수:</span>
									<select name="dogGrooming" class="trait-score-select">
										<option value="1">1점</option><option value="2">2점</option><option value="3" selected>3점</option><option value="4">4점</option><option value="5">5점</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="archive-content-section">
						<input type="hidden" id="dogDetailHidden" name="dogDetail" />
						<div class="archive-content-editor" id="archiveContentEditor" contenteditable="true" placeholder="상세 내용을 입력하세요"></div>
					</div>
				</div>

				<div class="container-footer">
					<div class="footer-btn-wrap">
						<button type="button" class="btn btn-save" id="btnWriteSave">등록</button>
						<button type="button" class="btn btn-cancel" id="btnCancel">취소</button>
					</div>
				</div>
			</div>
		</form>
	</main>

	<jsp:include page="/app/footer.jsp" />
	<script src="${pageContext.request.contextPath}/assets/js/header-footer.js"></script>
</body>
</html>