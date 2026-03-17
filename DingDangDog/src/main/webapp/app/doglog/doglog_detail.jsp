<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/doglog/doglog_detail.css" />
  <script defer src="${pageContext.request.contextPath}/assets/js/doglog/doglog_detail.js"></script>
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
            <c:choose>
              <c:when test="${not empty log and not empty log.logTitle}">
                ${log.logTitle}
              </c:when>
              <c:otherwise>
                제목 없음
              </c:otherwise>
            </c:choose>
          </div>

          <!-- 작성자 / 날짜 -->
          <div class="detail-info-container">
            <div class="detail-info-name" id="detailWriter">
              <c:choose>
                <c:when test="${not empty log and not empty log.userNickname}">
                  ${log.userNickname}
                </c:when>
                <c:otherwise>
                  작성자 없음
                </c:otherwise>
              </c:choose>
            </div>

            <div class="detail-info-date" id="detailDate">
              <c:if test="${not empty log and not empty log.logDate}">
                ${log.logDate}
              </c:if>
            </div>
          </div>

          <!-- 이미지 / 본문 -->
          <div class="detail-main-container">
            <div class="detail-main-img" id="detailMainImg">
              <c:choose>
                <c:when test="${not empty imageList}">
                  <c:forEach var="image" items="${imageList}">
                    <div class="detail-image-item">
                      <img src="${pageContext.request.contextPath}${image.logImgPath}" alt="멍로그 이미지" />
                    </div>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <div class="detail-image-empty">이미지가 없습니다.</div>
                </c:otherwise>
              </c:choose>
            </div>

            <div class="detail-main-post" id="detailMainPost">
              <c:choose>
                <c:when test="${not empty log and not empty log.logPost}">${log.logPost}</c:when>
                <c:otherwise>
                  내용 없음
                </c:otherwise>
              </c:choose>
            </div>
          </div>

          <hr />

          <!-- 댓글 목록 -->
          <div class="comment-list" id="commentList">
            <c:choose>
              <c:when test="${not empty commentList}">
                <c:forEach var="comment" items="${commentList}">
                  <div class="detail-comment-container">
                    <div class="detail-comment-info">
                      <div class="comment-info-name">
                        <c:choose>
                          <c:when test="${not empty comment.userNickname}">
                            ${comment.userNickname}
                          </c:when>
                          <c:otherwise>
                            작성자
                          </c:otherwise>
                        </c:choose>
                      </div>

                      <div class="comment-info-date">
                        <c:if test="${not empty comment.commentDate}">
                          ${comment.commentDate}
                        </c:if>
                      </div>
                    </div>

                    <div class="detail-comment-post">
                      <div class="comment-post-content">
                        <c:if test="${not empty comment.commentPost}">
                          ${comment.commentPost}
                        </c:if>
                      </div>

                      <c:if test="${not empty sessionScope.userNumber and comment.userNumber eq sessionScope.userNumber}">
                        <div class="comment-btn-wrap">
                          <a href="${pageContext.request.contextPath}/comment/edit.lc?commentNumber=${comment.commentNumber}&logNumber=${log.logNumber}"
                             class="btn btn-comment-edit">
                            수정
                          </a>

                          <a href="${pageContext.request.contextPath}/comment/deleteOk.lc?commentNumber=${comment.commentNumber}&logNumber=${log.logNumber}"
                             class="btn btn-comment-delete"
                             data-action="delete-comment"
                             onclick="return confirm('댓글을 삭제하시겠습니까?');">
                            삭제
                          </a>
                        </div>
                      </c:if>
                    </div>
                  </div>
                </c:forEach>
              </c:when>

              <c:otherwise>
                <div class="detail-comment-container">
                  <div class="detail-comment-post">등록된 댓글이 없습니다.</div>
                </div>
              </c:otherwise>
            </c:choose>
          </div>

          <!-- 댓글 작성 -->
          <div class="comment-write-container" id="commentWriteContainer">
            <form action="${pageContext.request.contextPath}/comment/writeOk.lc" method="post">
              <input type="hidden" name="logNumber" value="${log.logNumber}" />
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
            <a href="${pageContext.request.contextPath}/log/list.lo"
               class="btn btn-backlist"
               id="btnBackToList">
              목록으로
            </a>
          </div>

          <div class="btn-right">
            <c:if test="${not empty sessionScope.userNumber and log.userNumber eq sessionScope.userNumber}">
              <a href="${pageContext.request.contextPath}/log/edit.lo?logNumber=${log.logNumber}"
                 class="btn btn-detail-edit"
                 id="btnDetailEdit">
                수정
              </a>

              <button type="button"
                      class="btn btn-detail-delete"
                      id="btnDetailDelete"
                      data-delete-url="${pageContext.request.contextPath}/log/deleteOk.lo?logNumber=${log.logNumber}">
                삭제
              </button>
            </c:if>
          </div>
        </div>
      </div>
    </div>
  </main>

  <div id="footer-container"></div>
  <script src="${pageContext.request.contextPath}/assets/js/header-footer.js"></script>
</body>

</html>