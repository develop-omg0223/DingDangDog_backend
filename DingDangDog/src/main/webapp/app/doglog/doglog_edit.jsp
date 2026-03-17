<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="firstImagePath" value="" />
<c:if test="${not empty imageList and fn:length(imageList) > 0}">
  <c:set var="firstImagePath" value="${imageList[0].logImgPath}" />
</c:if>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/doglog/doglog_edit.css" />
  <script defer src="${pageContext.request.contextPath}/assets/js/doglog/doglog_edit.js"></script>
  <title>멍! 로그 수정</title>
</head>

<body>
  <div id="header-container"></div>

  <main class="doglog-detail">
    <div class="container">

      <div class="container-header">
        <h2 id="main-title">멍! 로그 수정</h2>
      </div>

      <form action="${pageContext.request.contextPath}/log/editOk.lo"
            method="post"
            enctype="multipart/form-data"
            id="doglogEditForm">

        <input type="hidden" name="logNumber" value="${log.logNumber}">
        <input type="hidden" name="deleteImageIds" id="deleteImageIds">
        <input type="hidden" name="logPost" id="logPostHidden">

        <div class="container-body">
          <div class="doglog-detail-container">

            <!-- 제목 -->
            <input type="text"
                   class="detail-title edit-title"
                   id="editTitle"
                   name="logTitle"
                   placeholder="제목을 입력하세요"
                   value="${not empty log.logTitle ? log.logTitle : ''}" />

            <!-- 작성자 / 날짜 -->
            <div class="detail-info-container">
              <div class="detail-info-name" id="editWriter">
                <c:choose>
                  <c:when test="${not empty log.userNickname}">
                    ${log.userNickname}
                  </c:when>
                  <c:otherwise>
                    작성자 없음
                  </c:otherwise>
                </c:choose>
              </div>

              <div class="detail-info-date" id="editDate">
                <c:if test="${not empty log.logDate}">
                  ${log.logDate}
                </c:if>
              </div>
            </div>

            <!-- 본문 -->
            <div class="detail-main-container">

              <!-- 이미지 -->
              <div class="detail-main-img">
                <div class="img-preview-box">
                  <img id="editPreviewImg"
                       src="${not empty firstImagePath ? pageContext.request.contextPath.concat(firstImagePath) : ''}"
                       alt="대표 이미지 미리보기"
                       style="${not empty firstImagePath ? 'display:block;' : 'display:none;'}">
                  <span class="img-placeholder"
                        style="${not empty firstImagePath ? 'display:none;' : 'display:block;'}">
                    대표 이미지
                  </span>
                </div>

                <input type="file" id="editImg" name="logImages" accept="image/*" multiple />

                <!-- 기존 이미지 목록 -->
                <div class="existing-image-list" id="existingImageList">
                  <c:if test="${not empty imageList}">
                    <c:forEach var="image" items="${imageList}">
                      <div class="existing-image-item"
                           data-image-id="${image.logImgNumber}"
                           data-image-path="${image.logImgPath}">
                        <img src="${pageContext.request.contextPath}${image.logImgPath}" alt="기존 이미지">
                        <button type="button"
                                class="btn-existing-image-delete"
                                data-action="delete-existing-image">×</button>
                      </div>
                    </c:forEach>
                  </c:if>
                </div>
              </div>

              <!-- 내용 -->
              <div class="detail-main-post edit-content"
                   id="editContent"
                   contenteditable="true"
                   data-placeholder="내용을 입력하세요">${not empty log.logPost ? log.logPost : ''}</div>
            </div>
          </div>
        </div>

        <!-- 버튼 -->
        <div class="container-footer">
          <div class="btn-container">
            <div class="btn-left">
              <a href="${pageContext.request.contextPath}/log/detail.lo?logNumber=${log.logNumber}"
                 class="btn btn-backlist"
                 id="btnBackToDetail">취소</a>
            </div>
            <div class="btn-right">
              <button type="submit" class="btn btn-edit-save" id="btnEditSave">
                수정 완료
              </button>
            </div>
          </div>
        </div>

      </form>
    </div>
  </main>

  <div id="footer-container"></div>
  <script src="${pageContext.request.contextPath}/assets/js/header-footer.js"></script>
</body>

</html>