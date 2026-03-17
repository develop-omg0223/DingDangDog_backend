<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ddd.app.doglog.dto.LogDTO" %>

<%
    List<LogDTO> logList = (List<LogDTO>) request.getAttribute("logList");
    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>멍! 로그 전체목록</title>
  <link rel="stylesheet" href="<%= contextPath %>/assets/css/doglog/doglog_list.css">
  <script defer src="<%= contextPath %>/assets/js/doglog/doglog_list.js"></script>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>

  <main>
    <div class="doglog-main-container">
      <div class="main-container-header">
        <div class="main-header-title">멍! 로그</div>
      </div>

      <!-- 카드 리스트 -->
      <div class="doglog-list">
        <%
          if (logList != null && !logList.isEmpty()) {
            for (LogDTO log : logList) {
        %>
          <div class="doglog-card">
            <a href="<%= contextPath %>/log/detail.lo?logNumber=<%= log.getLogNumber() %>" class="doglog-link">
              <div class="doglog-image">
                <%
                  if (log.getRepresentativeImgPath() != null && !log.getRepresentativeImgPath().trim().isEmpty()) {
                %>
                  <img src="<%= contextPath + log.getRepresentativeImgPath() %>" alt="멍로그 대표 이미지">
                <%
                  } else {
                %>
                  이미지
                <%
                  }
                %>
              </div>

              <div class="doglog-content">
                <div class="doglog-post-title">
                  <%= log.getLogTitle() != null ? log.getLogTitle() : "제목 없음" %>
                </div>

                <div class="doglog-meta">
                  <span class="doglog-writer">
                    <%= (log.getUserNickname() != null && !log.getUserNickname().trim().isEmpty())
                          ? log.getUserNickname()
                          : "작성자명" %>
                  </span>

                  <span class="doglog-date">
                    <%= log.getLogDate() != null ? log.getLogDate() : "" %>
                  </span>
                </div>
              </div>
            </a>
          </div>
        <%
            }
          } else {
        %>
          <div class="empty-box">
            등록된 멍! 로그가 없습니다.
          </div>
        <%
          }
        %>
      </div>

      <!-- 검색 -->
      <form class="search-box" action="<%= contextPath %>/log/list.lo" method="get">
        <select class="search-select" name="searchType">
          <option value="writer">작성자명</option>
          <option value="title">제목</option>
        </select>
        <input type="text" class="search-input" name="keyword">
        <button type="submit" class="btn-search">검색</button>
      </form>
    </div>

    <!-- 하단 검색 + 글 작성 -->
    <div class="main-container-footer">
      <!-- 페이지네이션 -->
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
              onclick="location.href='<%= contextPath %>/log/write.lo'">
        글 작성하기
      </button>
    </div>
  </main>

  <!-- footer -->
  <div id="footer-container"></div>

  <!-- js -->
  <script src="<%= contextPath %>/assets/js/header-footer.js"></script>
</body>
</html>