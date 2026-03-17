<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ddd.app.doglog.dto.LogDTO" %>
<%@ page import="com.ddd.app.doglog.dto.LogImgDTO" %>
<%@ page import="java.util.List" %>

<%
	LogDTO log = (LogDTO) request.getAttribute("log");
	List<LogImgDTO> imageList = (List<LogImgDTO>) request.getAttribute("imageList");
	String contextPath = request.getContextPath();

	String firstImagePath = null;
	if (imageList != null && !imageList.isEmpty()) {
		firstImagePath = imageList.get(0).getLogImgPath();
	}
%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="<%= contextPath %>/assets/css/doglog/doglog_edit.css" />
  <script defer src="<%= contextPath %>/assets/js/doglog/doglog_edit.js"></script>
  <title>멍! 로그 수정</title>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>

  <main class="doglog-detail">
    <div class="container">

      <div class="container-header">
        <h2 id="main-title">멍! 로그 수정</h2>
      </div>

      <form action="<%= contextPath %>/log/editOk.lo"
            method="post"
            enctype="multipart/form-data"
            id="doglogEditForm">

        <input type="hidden" name="logNumber" value="<%= log != null ? log.getLogNumber() : 0 %>">
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
                   value="<%= log != null && log.getLogTitle() != null ? log.getLogTitle() : "" %>" />

            <!-- 작성자 / 날짜 -->
            <div class="detail-info-container">
              <div class="detail-info-name" id="editWriter">
                <%= log != null && log.getUserNickname() != null ? log.getUserNickname() : "작성자 없음" %>
              </div>
              <div class="detail-info-date" id="editDate">
                <%= log != null && log.getLogDate() != null ? log.getLogDate() : "" %>
              </div>
            </div>

            <!-- 본문 -->
            <div class="detail-main-container">

              <!-- 이미지 -->
              <div class="detail-main-img">
                <div class="img-preview-box">
                  <img id="editPreviewImg"
                       src="<%= firstImagePath != null ? contextPath + firstImagePath : "" %>"
                       alt="대표 이미지 미리보기"
                       style="<%= firstImagePath != null ? "display:block;" : "display:none;" %>">
                  <span class="img-placeholder"
                        style="<%= firstImagePath != null ? "display:none;" : "display:block;" %>">
                    대표 이미지
                  </span>
                </div>

                <input type="file" id="editImg" name="logImages" accept="image/*" multiple />

                <!-- 기존 이미지 목록 -->
                <div class="existing-image-list" id="existingImageList">
                  <%
                    if (imageList != null && !imageList.isEmpty()) {
                      for (LogImgDTO image : imageList) {
                  %>
                    <div class="existing-image-item"
                         data-image-id="<%= image.getLogImgNumber() %>"
                         data-image-path="<%= image.getLogImgPath() %>">
                      <img src="<%= contextPath + image.getLogImgPath() %>" alt="기존 이미지">
                      <button type="button"
                              class="btn-existing-image-delete"
                              data-action="delete-existing-image">×</button>
                    </div>
                  <%
                      }
                    }
                  %>
                </div>
              </div>

              <!-- 내용 -->
              <div class="detail-main-post edit-content"
                   id="editContent"
                   contenteditable="true"
                   data-placeholder="내용을 입력하세요"><%= log != null && log.getLogPost() != null ? log.getLogPost() : "" %></div>
            </div>
          </div>
        </div>

        <!-- 버튼 -->
        <div class="container-footer">
          <div class="btn-container">
            <div class="btn-left">
              <a href="<%= contextPath %>/log/detail.lo?logNumber=<%= log != null ? log.getLogNumber() : 0 %>"
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

  <!-- footer -->
  <div id="footer-container"></div>
  <!-- js -->
  <script src="<%= contextPath %>/assets/js/header-footer.js"></script>
</body>

</html>