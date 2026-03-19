<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>내가 작성한 멍! 로그 목록</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage/common/review_list.css" />
  <script defer src="${pageContext.request.contextPath}/assets/js/mypage/common/review_list.js"></script>
  	<!--헤더 푸터용 css  -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />
	<!-- 사이드바용 css  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage/sidebar.css" />
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

  <main class="review-list">
    <div class="container">
    	<!-- 사이드바 -->
      <jsp:include page="/app/mypage/sidebar.jsp" />
      <section class="content">
        <div class="content-box">
          <div class="panel">
            <div class="panel-head">
              <h2 class="panel-title">내가 작성한 멍! 로그 목록</h2>
            </div>

            <div class="panel-body">
              <div class="review-table">
                <div class="review-table-head">
                  <div class="col-number">글 번호</div>
                  <div class="col-title">제목</div>
                  <div class="col-date">작성일자</div>
                </div>

                <div id="reviewTableBody"></div>
              </div>

              <div class="panel-footer">
                <div class="pagination">
                  <ul class="page-list" id="pagination"></ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </main>


  <!-- 서버 데이터 -->
  <script>
    const contextPath = "${pageContext.request.contextPath}";
    const reviewData = [
      <c:forEach var="log" items="${logList}" varStatus="status">
        {
          id: ${empty log.logNumber ? 0 : log.logNumber},
          title: "<c:out value='${log.logTitle}'/>",
          date: "<c:out value='${log.logDate}'/>"
        }<c:if test="${!status.last}">,</c:if>
      </c:forEach>
    ];
  </script>

  

	<!-- 푸터 jsp 적용  -->
	<jsp:include page="/app/footer.jsp" />
</body>
</html>