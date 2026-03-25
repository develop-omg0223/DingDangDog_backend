<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogarchive/dogarchive_write.css?v=1.1" />
<%-- 파일명 dogarchive_edit.js 로 정확히 연결 --%>
<script defer src="${pageContext.request.contextPath}/assets/js/dogarchive/dogarchive_edit.js?v=1.2"></script>
<title>멍! 카이브 수정</title>
</head>

<body>
    <jsp:include page="${not empty sessionScope.userNumber ? '/app/header_login.jsp' : '/app/header_logout.jsp'}" />

    <main class="archive-write">
        <form id="editForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/archive/updateOk.ar">
            <input type="hidden" name="dogNumber" value="${archive.dogNumber}">

            <div class="container">
                <div class="container-header">
                    <h2 id="main-title">멍! 카이브 수정</h2>
                </div>

                <div class="container-body">
                    <div class="archive-write-top">
                        <div class="archive-image-section">
                            <div class="archive-image-box">
                                <img id="previewImage" src="${not empty archive.archiveImgPath ? archive.archiveImgPath : pageContext.request.contextPath.concat('/assets/img/dogarchive/default_dog.png')}" alt="대표 이미지" />
                            </div>
                            <input type="file" id="dogImage" name="archiveImg" accept="image/*" hidden />
                            <label for="dogImage" class="btn btn-upload">이미지 변경</label>
                        </div>

                        <div class="archive-info-section">
                            <div class="dog-name-row">
                                <label for="dogName" class="dog-name-label">이름 :</label> 
                                <input type="text" id="dogName" name="dogName" class="dog-name-input" value="${archive.dogName}" required />
                            </div>

                            <div class="dog-info-grid">
                                <div class="info-item"><label>품종 :</label> <input type="text" name="dogBreed" value="${archive.dogBreed}" /></div>
                                <div class="info-item">
                                    <span class="info-label">성별 :</span> 
                                    <select name="dogGender" class="info-input">
                                        <option value="M" ${archive.dogGender == 'M' ? 'selected' : ''}>M</option>
                                        <option value="F" ${archive.dogGender == 'F' ? 'selected' : ''}>F</option>
                                    </select>
                                </div>
                                <div class="info-item"><label>나이 :</label> <input type="text" name="dogAge" value="${archive.dogAge}" /></div>
                                <div class="info-item"><label>몸무게 :</label> <input type="text" name="dogWeight" value="${archive.dogWeight}" /></div>
                                <%-- [수정 핵심] substring(0, 10)을 써서 날짜 입력창이 인식할 수 있는 10자리(yyyy-MM-dd)로 만듭니다. --%>
                                <div class="info-item"><label>보호 시작일 :</label> <input type="date" name="dogSafeDate" value="${archive.dogSafeDate.substring(0, 10)}" class="info-input" /></div>
                            </div>

                            <div class="dog-trait-list">
                                <div class="trait-row">
                                    <label>활동성 :</label> 
                                    <input type="text" id="input_dogActivityDetail" name="dogActivityDetail" class="trait-text-input" value="${archive.dogActivityDetail}" /> 
                                    <span class="trait-score-label">점수:</span>
                                    <select name="dogActivity" class="trait-score-select">
                                        <c:forEach var="i" begin="1" end="5"><option value="${i}" ${archive.dogActivity == i ? 'selected' : ''}>${i}점</option></c:forEach>
                                    </select>
                                </div>
                                <div class="trait-row">
                                    <label>사회성 :</label> 
                                    <input type="text" id="input_dogSocialityDetail" name="dogSocialityDetail" class="trait-text-input" value="${archive.dogSocialityDetail}" /> 
                                    <span class="trait-score-label">점수:</span>
                                    <select name="dogSociality" class="trait-score-select">
                                        <c:forEach var="i" begin="1" end="5"><option value="${i}" ${archive.dogSociality == i ? 'selected' : ''}>${i}점</option></c:forEach>
                                    </select>
                                </div>
                                <div class="trait-row">
                                    <label>독립성 :</label> 
                                    <input type="text" id="input_dogIndependenceDetail" name="dogIndependenceDetail" class="trait-text-input" value="${archive.dogIndependenceDetail}" /> 
                                    <span class="trait-score-label">점수:</span>
                                    <select name="dogIndependence" class="trait-score-select">
                                        <c:forEach var="i" begin="1" end="5"><option value="${i}" ${archive.dogIndependence == i ? 'selected' : ''}>${i}점</option></c:forEach>
                                    </select>
                                </div>
                                <div class="trait-row">
                                    <label>짖음수준 :</label> 
                                    <input type="text" id="input_dogBarkingDetail" name="dogBarkingDetail" class="trait-text-input" value="${archive.dogBarkingDetail}" /> 
                                    <span class="trait-score-label">점수:</span>
                                    <select name="dogBarking" class="trait-score-select">
                                        <c:forEach var="i" begin="1" end="5"><option value="${i}" ${archive.dogBarking == i ? 'selected' : ''}>${i}점</option></c:forEach>
                                    </select>
                                </div>
                                <div class="trait-row">
                                    <label>털관리 :</label> 
                                    <input type="text" id="input_dogGroomingDetail" name="dogGroomingDetail" class="trait-text-input" value="${archive.dogGroomingDetail}" /> 
                                    <span class="trait-score-label">점수:</span>
                                    <select name="dogGrooming" class="trait-score-select">
                                        <c:forEach var="i" begin="1" end="5"><option value="${i}" ${archive.dogGrooming == i ? 'selected' : ''}>${i}점</option></c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="archive-content-section">
                        <textarea id="input_dogDetail" name="dogDetail" class="archive-content-editor" placeholder="상세 내용을 입력하세요">${archive.dogDetail}</textarea>
                    </div>
                </div>

                <div class="container-footer">
                    <div class="footer-btn-wrap">
                        <button type="submit" class="btn btn-save">수정 완료</button>
                        <button type="button" class="btn btn-cancel" onclick="history.back();">취소</button>
                    </div>
                </div>
            </div>
        </form>
    </main>

    <jsp:include page="/app/footer.jsp" />
    <script src="${pageContext.request.contextPath}/assets/js/header-footer.js"></script>
</body>
</html>