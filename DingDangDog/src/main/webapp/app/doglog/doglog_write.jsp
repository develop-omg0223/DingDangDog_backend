<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="<%= contextPath %>/assets/css/doglog/doglog_write.css" />
  <script defer src="<%= contextPath %>/assets/js/doglog/doglog_write.js"></script>
  <title>멍! 로그 작성</title>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>

  <main class="doglog-write">
    <div class="container">
      <div class="container-header">
        <h2 id="main-title">멍! 로그 작성</h2>
      </div>

      <form action="<%= contextPath %>/log/writeOk.lo"
            method="post"
            enctype="multipart/form-data"
            id="doglogWriteForm">

        <!-- contenteditable 본문 전송용 hidden -->
        <input type="hidden" name="logPost" id="logPostHidden">

        <div class="container-body">
          <div class="doglog-write-container">
            <div class="write-title">
              <input type="text"
                     name="logTitle"
                     placeholder="제목을 입력해주세요" />
            </div>

            <div class="write-main-container">
              <!-- 대표 이미지 -->
              <div class="write-main-img">
                <div class="img-preview-box">
                  <img id="thumbnailPreview"
                       src=""
                       alt="대표 이미지 미리보기"
                       style="display:none;" />
                  <span class="img-placeholder">대표 이미지</span>
                </div>
              </div>

              <!-- 본문 입력 -->
              <div class="write-main-post">
                <div class="write-content-editor"
                     id="writeContentEditor"
                     contenteditable="true"
                     data-placeholder="내용을 입력해주세요"></div>
              </div>
            </div>
          </div>
        </div>

        <div class="container-footer">
          <div class="footer-btn-wrap">
            <input type="file"
                   id="imageUpload"
                   name="logImages"
                   accept="image/*"
                   multiple
                   hidden />

            <div class="footer-left">
              <label for="imageUpload" class="btn btn-upload">이미지 첨부</label>
            </div>

            <div class="footer-right">
              <button type="submit" class="btn btn-save">저장하기</button>
              <a href="<%= contextPath %>/log/list.lo" class="btn btn-cancel">취소</a>
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