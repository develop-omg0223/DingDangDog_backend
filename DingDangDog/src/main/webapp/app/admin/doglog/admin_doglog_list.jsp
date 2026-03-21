<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>멍! 로그 리스트</title>

    <link
      rel="stylesheet"
      href="${contextPath}/assets/css/admin/doglog/admin_doglog_list.css"
    />
    <link rel="stylesheet" href="${contextPath}/assets/css/admin/admin.css" />

    <!-- 서버 데이터 -->
	<script>
	  const contextPath = "${contextPath}";
	  const reviewData = [
	    <c:forEach var="log" items="${logList}" varStatus="status">
	      {
	        id: ${empty log.logNumber ? 0 : log.logNumber},
	        title: "<c:out value='${log.logTitle}'/>",
	        userId: "<c:out value='${log.userId}'/>",
	        userNickName: "<c:out value='${log.userNickname}'/>",
	        date: "${log.logDate}"
	      }<c:if test="${!status.last}">,</c:if>
	    </c:forEach>
	  ];
	</script>

    <script defer src="${contextPath}/assets/js/admin/admin_doglog_list.js"></script>
  </head>

  <body>
    <main class="admin-main-container">
      <aside class="admin-sidebar">
        <jsp:include page="/app/admin/admin_sidebar.jsp" />
      </aside>

      <section class="admin-main-section">
        <div class="admin-main-section-header">
          <div class="admin-title">멍! 로그 리스트</div>
        </div>

        <div class="admin-main-content admin-box-shadow">
          <div class="admin-doglog-list-header">
            <div class="doglog-number">게시글 번호</div>
            <div class="doglog-title">제목</div>
            <div class="doglog-id">아이디</div>
            <div class="doglog-nickname">닉네임</div>
            <div class="doglog-date">작성 일자</div>
          </div>

          <div id="reviewTableBody"></div>
        </div>

        <div class="admin-main-section-footer">
          <div class="search-box">
            <select class="search-select admin-box-shadow">
              <option>아이디</option>
              <option>닉네임</option>
            </select>
            <input type="text" class="search-input admin-box-shadow" />
            <button type="button" class="btn-search admin-box-shadow">검색</button>
          </div>

          <div class="pagination">
            <ul class="page-list">
              <li>
                <button type="button" class="prev-btn">
                  <span>&lt;</span>
                </button>
              </li>
              <li>
                <button type="button" class="next-btn">
                  <span>&gt;</span>
                </button>
              </li>
            </ul>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>