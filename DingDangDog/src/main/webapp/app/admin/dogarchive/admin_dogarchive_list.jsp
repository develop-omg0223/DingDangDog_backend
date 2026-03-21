<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>멍! 카이브 리스트</title>

  <link rel="stylesheet" href="${contextPath}/assets/css/admin/admin.css">
  <link rel="stylesheet" href="${contextPath}/assets/css/admin/dogarchive/admin_dogarchive_list.css">

  <script>
    const contextPath = "${contextPath}";
    const archiveData = [
      <c:forEach var="archive" items="${archiveList}" varStatus="status">
        {
          dogNumber: ${archive.dogNumber},
          dogName: "<c:out value='${archive.dogName}'/>",
          dogAge: "<c:out value='${archive.dogAge}'/>",
          dogWeight: "${archive.dogWeight}",
          dogBreed: "<c:out value='${archive.dogBreed}'/>",
          shelterName: "<c:out value='${archive.shelterName}'/>",
          dogSafeDate: "${archive.dogSafeDate}"
        }<c:if test="${!status.last}">,</c:if>
      </c:forEach>
    ];
  </script>

  <script defer src="${contextPath}/assets/js/admin/admin_dogarchive_list.js"></script>
</head>

<body>
  <main class="admin-main-container">
    <aside class="admin-sidebar"><jsp:include page="/app/admin/admin_sidebar.jsp" /></aside>

    <section class="admin-main-section">
      <div class="admin-main-section-header">
        <div class="admin-title">멍! 카이브 리스트</div>
      </div>

      <div class="admin-main-content">
        <div class="admin-dogarchive-list-header">
          <div class="dogarchive-number">등록 번호</div>
          <div class="dogarchive-name">이름</div>
          <div class="dogarchive-age">나이</div>
          <div class="dogarchive-weight">몸무게</div>
          <div class="dogarchive-type">견종</div>
          <div class="dogarchive-shelter">등록 보호소</div>
          <div class="dogarchive-date">보호 날짜</div>
        </div>

        <div id="archiveTableBody"></div>
      </div>

      <div class="admin-main-section-footer">
        <form action="${contextPath}/admin/archiveSearch.ad" method="get" class="search-box">
          <select class="search-select" name="searchType">
            <option value="all" ${searchType == 'all' ? 'selected' : ''}>전체</option>
            <option value="breed" ${searchType == 'breed' ? 'selected' : ''}>견종</option>
            <option value="shelter" ${searchType == 'shelter' ? 'selected' : ''}>보호소명</option>
          </select>
          <input type="text" class="search-input" name="keyword" value="${keyword}">
          <button type="submit" class="btn-search">검색</button>
        </form>

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