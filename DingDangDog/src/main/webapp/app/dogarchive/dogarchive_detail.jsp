<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogarchive/dogarchive_write.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogarchive/dogarchive_detail.css?v=final_fix" />
<title>멍! 카이브 상세보기</title>
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
		<div class="container">
			<div class="container-header">
				<h2 id="main-title">멍! 카이브 상세보기</h2>
			</div>

			<div class="container-body">
				<div class="archive-write-top">
					<div class="archive-image-section">
						<div class="archive-image-box">
							<%-- [수정] DB에 이미 contextPath가 포함되어 저장되므로 중복 제거 --%>
							<img id="previewImage" src="${archive.archiveImgPath}" alt="대표 이미지" />
						</div>
					</div>

					<div class="archive-info-section">
						<div class="dog-name-row">
							<label class="dog-name-label">이름 :</label> 
							<input type="text" class="dog-name-input" value="${archive.dogName}" readonly />
						</div>

						<div class="dog-info-grid">
							<div class="info-item">
								<label>품종 :</label> 
								<input type="text" value="${archive.dogBreed}" readonly />
							</div>
							<div class="info-item">
								<span class="info-label">성별 :</span> 
								<input type="text" value="${archive.dogGender == 'M' ? '남아(M)' : '여아(F)'}" readonly />
							</div>
							<div class="info-item">
								<label>나이 :</label> 
								<input type="text" value="${archive.dogAge}" readonly />
							</div>
							<div class="info-item">
								<label>몸무게 :</label> 
								<input type="text" value="${archive.dogWeight} kg" readonly />
							</div>
							<div class="info-item">
								<label>보호소 들어온 날 :</label> 
								<%-- 날짜가 2026-03-25 00:00:00 처럼 올 경우 대비해 substring 처리 --%>
								<input type="date" value="${archive.dogSafeDate.length() >= 10 ? archive.dogSafeDate.substring(0, 10) : archive.dogSafeDate}" readonly />
							</div>
						</div>

						<div class="dog-trait-list">
							<%-- 활동성 --%>
							<div class="trait-row">
								<label>활동성 :</label> 
								<input type="text" class="trait-text-input" value="${archive.dogActivityDetail}" readonly /> 
								<div class="trait-score-container">
									<div class="trait-stars">
										<c:forEach var="i" begin="1" end="5">
											<span class="${i <= archive.dogActivity ? 'star-filled' : 'star-empty'}">★</span>
										</c:forEach>
									</div>
									<span class="score-text">${archive.dogActivity}점</span>
								</div>
							</div>
							
							<%-- 사회성 --%>
							<div class="trait-row">
								<label>사회성 :</label> 
								<input type="text" class="trait-text-input" value="${archive.dogSocialityDetail}" readonly /> 
								<div class="trait-score-container">
									<div class="trait-stars">
										<c:forEach var="i" begin="1" end="5">
											<span class="${i <= archive.dogSociality ? 'star-filled' : 'star-empty'}">★</span>
										</c:forEach>
									</div>
									<span class="score-text">${archive.dogSociality}점</span>
								</div>
							</div>

							<%-- 독립성 --%>
							<div class="trait-row">
								<label>독립성 :</label> 
								<input type="text" class="trait-text-input" value="${archive.dogIndependenceDetail}" readonly /> 
								<div class="trait-score-container">
									<div class="trait-stars">
										<c:forEach var="i" begin="1" end="5">
											<span class="${i <= archive.dogIndependence ? 'star-filled' : 'star-empty'}">★</span>
										</c:forEach>
									</div>
									<span class="score-text">${archive.dogIndependence}점</span>
								</div>
							</div>

							<%-- 짖음수준 --%>
							<div class="trait-row">
								<label>짖음수준 :</label> 
								<input type="text" class="trait-text-input" value="${archive.dogBarkingDetail}" readonly /> 
								<div class="trait-score-container">
									<div class="trait-stars">
										<c:forEach var="i" begin="1" end="5">
											<span class="${i <= archive.dogBarking ? 'star-filled' : 'star-empty'}">★</span>
										</c:forEach>
									</div>
									<span class="score-text">${archive.dogBarking}점</span>
								</div>
							</div>

							<%-- 털관리 --%>
							<div class="trait-row">
								<label>털관리 :</label> 
								<input type="text" class="trait-text-input" value="${archive.dogGroomingDetail}" readonly /> 
								<div class="trait-score-container">
									<div class="trait-stars">
										<c:forEach var="i" begin="1" end="5">
											<span class="${i <= archive.dogGrooming ? 'star-filled' : 'star-empty'}">★</span>
										</c:forEach>
									</div>
									<span class="score-text">${archive.dogGrooming}점</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="archive-content-section">
					<textarea class="archive-content-editor" readonly>${archive.dogDetail}</textarea>
				</div>
			</div>

			<div class="container-footer">
				<div class="footer-btn-wrap">
					<%-- 본인 글일 때만 수정/삭제 버튼 노출 --%>
					<c:if test="${sessionScope.userNumber == archive.userNumber}">
						<a href="${pageContext.request.contextPath}/archive/update.ar?dogNumber=${archive.dogNumber}" class="btn">수정하기</a>
						<button type="button" class="btn btn-delete" onclick="deletePost(${archive.dogNumber})">삭제</button>
					</c:if>
					<a href="${pageContext.request.contextPath}/archive/list.ar" class="btn">목록으로</a>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="/app/footer.jsp" />
    <script>
        function deletePost(dogNumber) {
            if(confirm("정말 이 게시글을 삭제하시겠습니까?")) {
                location.href = "${pageContext.request.contextPath}/archive/deleteOk.ar?dogNumber=" + dogNumber;
            }
        }
    </script>
</body>
</html>