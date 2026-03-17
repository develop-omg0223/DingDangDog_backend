<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>멍! 로그 전체목록</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/doglog/doglog_list.css">
  <script defer src="${pageContext.request.contextPath}/assets/js/doglog/doglog_list.js"></script>
</head>

<body>
  <div id="header-container"></div>

  <main>
    <div class="doglog-main-container">
      <div class="main-container-header">
        <div class="main-header-title">멍! 로그</div>
      </div>

      <div class="doglog-list">
        <c:choose>
          <c:when test="${not empty logList}">
            <c:forEach var="log" items="${logList}">
              <div class="doglog-card">
                <a href="${pageContext.request.contextPath}/log/detail.lo?logNumber=${log.logNumber}" class="doglog-link">
                  <div class="doglog-image">
                    <c:choose>
                      <c:when test="${not empty log.representativeImgPath}">
                        <img src="${pageContext.request.contextPath}${log.representativeImgPath}" alt="멍로그 대표 이미지">
                      </c:when>
                      <c:otherwise>
                        이미지
                      </c:otherwise>
                    </c:choose>
                  </div>

                  <div class="doglog-content">
                    <div class="doglog-post-title">
                      <c:choose>
                        <c:when test="${not empty log.logTitle}">
                          ${log.logTitle}
                        </c:when>
                        <c:otherwise>
                          제목 없음
                        </c:otherwise>
                      </c:choose>
                    </div>

                    <div class="doglog-meta">
                      <span class="doglog-writer">
                        <c:choose>
                          <c:when test="${not empty log.userNickname}">
                            ${log.userNickname}
                          </c:when>
                          <c:otherwise>
                            작성자명
                          </c:otherwise>
                        </c:choose>
                      </span>

                      <span class="doglog-date">
                        <c:if test="${not empty log.logDate}">
                          ${log.logDate}
                        </c:if>
                      </span>
                    </div>
                  </div>
                </a>
              </div>
            </c:forEach>
          </c:when>

          <c:otherwise>
            <div class="empty-box">
              등록된 멍! 로그가 없습니다.
            </div>
          </c:otherwise>
        </c:choose>
      </div>

      <form class="search-box" action="${pageContext.request.contextPath}/log/list.lo" method="get">
        <select class="search-select" name="searchType">
          <option value="writer">작성자명</option>
          <option value="title">제목</option>
        </select>
        <input type="text" class="search-input" name="keyword">
        <button type="submit" class="btn-search">검색</button>
      </form>
    </div>

    <div class="main-container-footer">
      <div class="pagination">
        <ul class="page-list">
          <li>
            <button type="button" class="prev-btn">
              <span>&lt;</span>
            </button>
          </li>
          <li>
            <button type="button" class="page-item current-page">1</button>
          </li>
          <li>
            <button type="button" class="page-item">2</button>
          </li>
          <li>
            <button type="button" class="page-item">3</button>
          </li>
          <li>
            <button type="button" class="page-item">4</button>
          </li>
          <li>
            <button type="button" class="page-item">5</button>
          </li>
          <li>
            <button type="button" class="next-btn">
              <span>&gt;</span>
            </button>
          </li>
        </ul>
      </div>

      <button type="button" class="btn-write"
              onclick="location.href='${pageContext.request.contextPath}/log/write.lo'">
        글 작성하기
      </button>
    </div>
  </main>

  <div id="footer-container"></div>

  <script src="${pageContext.request.contextPath}/assets/js/header-footer.js"></script>
</body>
</html>