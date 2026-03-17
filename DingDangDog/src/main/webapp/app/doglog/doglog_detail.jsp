<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ddd.app.doglog.dto.LogDTO" %>
<%@ page import="com.ddd.app.doglog.dto.LogImgDTO" %>
<%@ page import="com.ddd.app.doglog.dto.LogCommentDTO" %>
<%@ page import="java.util.List" %>

<%
	LogDTO log = (LogDTO) request.getAttribute("log");
	List<LogImgDTO> imageList = (List<LogImgDTO>) request.getAttribute("imageList");
	List<LogCommentDTO> commentList = (List<LogCommentDTO>) request.getAttribute("commentList");
	String contextPath = request.getContextPath();
	Integer loginUserNumber = (Integer) session.getAttribute("userNumber");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="<%= contextPath %>/assets/css/doglog/doglog_detail.css" />
  <script defer src="<%= contextPath %>/assets/js/doglog/doglog_detail.js"></script>
  <title>멍! 로그 상세</title>
</head>

<body>
  <div id="header-container"></div>

  <main class="doglog-detail">
    <div class="container">
      <div class="container-header">
        <h2 id="main-title">멍! 로그</h2>
      </div>

      <div class="container-body">
        <div class="doglog-detail-container">
          <!-- 제목 -->
          <div class="detail-title" id="detailTitle">
            <%= log != null && log.getLogTitle() != null ? log.getLogTitle() : "제목 없음" %>
          </div>

          <!-- 작성자 / 날짜 -->
          <div class="detail-info-container">
            <div class="detail-info-name" id="detailWriter">
              <%= log != null && log.getUserNickname() != null ? log.getUserNickname() : "작성자 없음" %>
            </div>
            <div class="detail-info-date" id="detailDate">
              <%= log != null && log.getLogDate() != null ? log.getLogDate() : "" %>
            </div>
          </div>

          <!-- 이미지 / 본문 -->
          <div class="detail-main-container">
            <div class="detail-main-img" id="detailMainImg">
              <%
                if (imageList != null && !imageList.isEmpty()) {
                  for (LogImgDTO image : imageList) {
              %>
                <div class="detail-image-item">
                  <img src="<%= contextPath + image.getLogImgPath() %>" alt="멍로그 이미지" />
                </div>
              <%
                  }
                } else {
              %>
                <div class="detail-image-empty">이미지가 없습니다.</div>
              <%
                }
              %>
            </div>

            <div class="detail-main-post" id="detailMainPost"><%= log != null && log.getLogPost() != null ? log.getLogPost() : "내용 없음" %></div>
          </div>

          <hr />

          <!-- 댓글 목록 -->
          <div class="comment-list" id="commentList">
            <%
              if (commentList != null && !commentList.isEmpty()) {
                for (LogCommentDTO comment : commentList) {
            %>
              <div class="detail-comment-container">
                <div class="detail-comment-info">
                  <div class="comment-info-name">
                    <%= comment.getUserNickname() != null ? comment.getUserNickname() : "작성자" %>
                  </div>
                  <div class="comment-info-date">
                    <%= comment.getCommentDate() != null ? comment.getCommentDate() : "" %>
                  </div>
                </div>

                <div class="detail-comment-post">
                  <div class="comment-post-content">
                    <%= comment.getCommentPost() != null ? comment.getCommentPost() : "" %>
                  </div>

				<% if (loginUserNumber != null && comment.getUserNumber() == loginUserNumber) { %>
				  <div class="comment-btn-wrap">
				    <a href="<%= contextPath %>/comment/edit.lc?commentNumber=<%= comment.getCommentNumber() %>&logNumber=<%= log != null ? log.getLogNumber() : 0 %>"
				       class="btn btn-comment-edit">
				      수정
				    </a>
				
				    <a href="<%= contextPath %>/comment/deleteOk.lc?commentNumber=<%= comment.getCommentNumber() %>&logNumber=<%= log != null ? log.getLogNumber() : 0 %>"
				       class="btn btn-comment-delete"
				       data-action="delete-comment"
				       onclick="return confirm('댓글을 삭제하시겠습니까?');">
				      삭제
				    </a>
				  </div>
				<% } %>
                </div>
              </div>
            <%
                }
              } else {
            %>
              <div class="detail-comment-container">
                <div class="detail-comment-post">등록된 댓글이 없습니다.</div>
              </div>
            <%
              }
            %>
          </div>

          <!-- 댓글 작성 -->
          <div class="comment-write-container" id="commentWriteContainer">
            <form action="<%= contextPath %>/comment/writeOk.lc" method="post">
              <input type="hidden" name="logNumber" value="<%= log != null ? log.getLogNumber() : 0 %>" />
              <textarea class="comment-write-input"
                        id="commentWriteInput"
                        name="commentPost"
                        placeholder="댓글을 입력해주세요"></textarea>
              <button type="submit" class="btn btn-comment-write" id="btnCommentWrite">
                댓글 작성
              </button>
            </form>
          </div>
        </div>
      </div>

      <div class="container-footer">
        <div class="btn-container">
          <div class="btn-left">
            <a href="<%= contextPath %>/log/list.lo" class="btn btn-backlist" id="btnBackToList">목록으로</a>
          </div>

          <div class="btn-right">
            <a href="<%= contextPath %>/log/edit.lo?logNumber=<%= log != null ? log.getLogNumber() : 0 %>"
               class="btn btn-detail-edit"
               id="btnDetailEdit">
              수정
            </a>

            <button type="button"
                    class="btn btn-detail-delete"
                    id="btnDetailDelete"
                    data-delete-url="<%= contextPath %>/log/deleteOk.lo?logNumber=<%= log != null ? log.getLogNumber() : 0 %>">
              삭제
            </button>
          </div>
        </div>
      </div>
    </div>
  </main>

  <div id="footer-container"></div>
  <script src="<%= contextPath %>/assets/js/header-footer.js"></script>
</body>

</html>