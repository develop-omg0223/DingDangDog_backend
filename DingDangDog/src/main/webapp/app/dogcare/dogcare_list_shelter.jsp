<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>멍! 케어 리스트(보호소회원)</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogcare/dogcare_list.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogcare/dogcare_list_shelter.css">
    <script defer src="${pageContext.request.contextPath}/assets/js/dogcare/dogcare_list.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />
</head>

<body>

    <!-- 유저 번호 확인 존재시 로그인 헤더 -->
    <c:choose>
        <c:when test="${not empty sessionScope.userNumber}">
            <jsp:include page="/app/header_login.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="/app/header_logout.jsp" />
        </c:otherwise>
    </c:choose>

    <main>
        <div class="dogcare-main-container">
            <div class="main-container-header">
                <div class="main-header-title">멍! 케어</div>
            </div>

            <!-- 페이지 컨텐츠 -->
            <div class="dogcare-list-container">
                <div class="dogcare-list-title">멍! 케어 목록</div>

                <!-- 테이블 등 정보 -->
                <div class="dogcare-list-header">
                    <div class="dogcare-number">게시글 번호</div>
                    <div class="dogcare-title">제목</div>
                    <div class="dogcare-date">봉사 날짜</div>
                    <div class="dogcare-nickname">닉네임</div>
                    <div class="dogcare-registdate">작성 날짜</div>
                </div>

                <!-- 게시글 목록 -->
                <c:forEach var="care" items="${careList}">
                    <div class="dogcare-list-row">
                        <div class="dogcare-number">${care.careNumber}</div>
                        <div class="dogcare-title">
                            <a href="${pageContext.request.contextPath}/care/detail.ca?careNumber=${care.careNumber}">
                                ${care.careTitle}
                            </a>
                        </div>
                        <div class="dogcare-date">${care.careDate}</div>
                        <div class="dogcare-nickname">${care.userNickname}</div>
                        <div class="dogcare-registdate">${care.careWriteDate}</div>
                    </div>
                </c:forEach>

                <!-- 검색 폼 -->
                <form action="${pageContext.request.contextPath}/care/list.ca" method="get">
                    <div class="search-box">
                        <select name="type" class="search-select box-shadow">
                            <option value="shelter">보호소명</option>
                            <option value="title">제목</option>
                        </select>
                        <input type="text" name="keyword" class="search-input box-shadow" value="${keyword}" />
                        <button class="btn-search box-shadow">검색</button>
                    </div>
                </form>

                <!-- 페이지네이션 -->
                <div class="main-container-footer">
                    <div class="pagination">
                        <ul class="page-list">
                            <!-- 이전 버튼 -->
                            <c:if test="${prev}">
                                <li>
                                    <button class="prev-btn" onclick="location.href='${pageContext.request.contextPath}/care/list.ca?page=${startpage - 1}&keyword=${keyword}'">&lt;</button>
                                </li>
                            </c:if>

                            <!-- 페이지 번호 출력 -->
                            <c:forEach var="i" begin="${startpage}" end="${endpage}">
                                <li>
                                    <button class="page-item <c:if test='${i == page}'>current-page</c:if>"
                                        onclick="location.href='${pageContext.request.contextPath}/care/list.ca?page=${i}&keyword=${keyword}'">
                                        ${i}
                                    </button>
                                </li>
                            </c:forEach>

                            <!-- 다음 버튼 -->
                            <c:if test="${next}">
                                <li>
                                    <button class="next-btn" onclick="location.href='${pageContext.request.contextPath}/care/list.ca?page=${endpage + 1}&keyword=${keyword}'">&gt;</button>
                                </li>
                            </c:if>
                        </ul>
                    </div>

                    <!-- 봉사 등록 버튼 -->
                    <div>
                        <button class="btn-register" onclick="location.href='${pageContext.request.contextPath}/care/write.ca'">봉사등록</button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- footer -->
    <jsp:include page="/app/footer.jsp" />
    <!-- js -->
    <script src="/assets/js/header-footer.js"></script>

</body>
</html>