<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />

    <script defer src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</head>

<body>
    <!-- header -->
	<c:choose>
        <c:when test="${not empty sessionScope.userNumber}">
            <jsp:include page="/app/header_login.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="/app/header_logout.jsp" />
        </c:otherwise>
    </c:choose>

    <main>
        <!-- 최상단 배너 -->
        <section class="top-banner-section">
            <a href="${pageContext.request.contextPath}/dogmatching/main.dm">
                <img src="${pageContext.request.contextPath}/assets/img/1.png" alt="멍! 매칭 설문조사 바로가기" class="banner-img">
            </a>
        </section>

        <div class="main">
            <div class="content">
                <!-- 멍카이브 카드 영역 -->
                <section class="card-banner-section">
                    <div class="card-banner">
                        <button type="button" class="slide-btn-left">
                            <img src="${pageContext.request.contextPath}/assets/img/1.png" alt="이전">
                        </button>

                        <div class="card-list" id="main-card-list"></div>

                        <button type="button" class="slide-btn-right">
                            <img src="${pageContext.request.contextPath}/assets/img/1.png" alt="다음">
                        </button>
                    </div>
                </section>

                <!-- 모집중인 멍! 케어 -->
                <section class="list-section">
                    <div class="list-flex">
                        <div class="list-box">
                            <h3>모집중인 멍! 케어</h3>
                            <br>
                            <ul class="list-box-caption" id="care-list"></ul>
                        </div>

                        <!-- 옆 로고 -->
                        <div class="logo-box">
                            <img src="${pageContext.request.contextPath}/assets/img/HeaderFooterLogoText.svg" alt="listLogo">
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <!-- 플로팅 버튼 -->
        <div class="floating-btn">
            <a href="${pageContext.request.contextPath}/dogmatching/main.dm">
                <img src="${pageContext.request.contextPath}/assets/img/FloatingButton02.svg" alt="멍! 매칭 설문조사">
            </a>
        </div>
    </main>

    <!-- footer -->
	<jsp:include page="/app/footer.jsp" />

    <!-- 서버 데이터 -> JS -->
    <script>
        const contextPath = "${pageContext.request.contextPath}";

        const mainArchiveData = [
            <c:forEach var="archive" items="${archiveList}" varStatus="status">
                {
                    dogNumber: ${empty archive.dogNumber ? 0 : archive.dogNumber},
                    dogName: "<c:out value='${archive.dogName}'/>",
                    dogBreed: "<c:out value='${archive.dogBreed}'/>",
                    dogGender: "<c:out value='${archive.dogGender}'/>",
                    dogAge: "<c:out value='${archive.dogAge}'/>",
                    archiveImgPath: "<c:out value='${archive.archiveImgPath}'/>"
                }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

        const mainCareData = [
            <c:forEach var="care" items="${careList}" varStatus="status">
                {
                    careNumber: ${empty care.careNumber ? 0 : care.careNumber},
                    careTitle: "<c:out value='${care.careTitle}'/>",
                    careDate: "<c:out value='${care.careDate}'/>"
                }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];
    </script>
</body>

</html>