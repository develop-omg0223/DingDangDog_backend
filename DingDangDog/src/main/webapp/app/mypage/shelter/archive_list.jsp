<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지 메인(보호소회원)</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage/shelter/archive_list.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />
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

    <main class="archive-list">
        <div class="container">
            <jsp:include page="/app/mypage/sidebar.jsp" />

            <section class="content">
                <div class="content-box">
                    <article class="panel panel-center">
                        <div class="panel-head">
                            <h2 class="panel-title">멍! 카이브 등록 정보</h2>
                        </div>

                        <div class="panel-body">
                            <div class="card-grid" id="archiveList">
                                </div>

                            <c:if test="${empty archiveList}">
                                <div class="no-data-msg">
                                    <p>아직 등록한 유기견이 없습니다.</p>
                                </div>
                            </c:if>
                        </div>

                        <div class="panel-footer">
                            <div class="pagination">
                                <ul class="page-list" id="pagination"></ul>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
        </div>
    </main>

    <jsp:include page="/app/footer.jsp" />

    <script>
        // JS 파일에서 사용할 변수들 정의
        const contextPath = "${pageContext.request.contextPath}";
        
        // 서버에서 넘어온 archiveList를 JS 배열로 변환
        const archiveData = [
            <c:forEach var="item" items="${archiveList}" varStatus="status">
                {
                    dogNumber: "${item.dogNumber}",
                    dogName: "${item.dogName}",
                    dogBreed: "${item.dogBreed}",
                    dogGender: "${item.dogGender}",
                    archiveImgPath: "${item.archiveImgPath}"
                }${not status.last ? ',' : ''}
            </c:forEach>
        ];
    </script>

    <script src="${pageContext.request.contextPath}/assets/js/mypage/shelter/archive_list.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/header.js"></script>
    <script src="/assets/js/header-footer.js"></script>
</body>
</html>