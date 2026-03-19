<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="./../../assets/css/doglog/doglog_edit.css" />
  <script defer src="./../../assets/js/doglog/doglog_edit.js"></script>
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

      <div class="container-body">
        <div class="doglog-detail-container">

          <!-- 제목 -->
          <input type="text" class="detail-title edit-title" id="editTitle" placeholder="제목을 입력하세요" />

          <!-- 작성자 / 날짜 -->
          <div class="detail-info-container">
            <div class="detail-info-name" id="editWriter">철수</div>
            <div class="detail-info-date" id="editDate">2026-03-07</div>
          </div>

          <!-- 본문 -->
          <div class="detail-main-container">

            <!-- 이미지 -->
            <div class="detail-main-img">
              <img id="editPreviewImg">
              <input type="file" id="editImg" accept="image/*" />
            </div>

            <!-- 내용 -->
            <textarea class="detail-main-post edit-content" id="editContent" placeholder="내용을 입력하세요"></textarea>
          </div>
        </div>
      </div>

      <!-- 버튼 -->
      <div class="container-footer">
        <div class="btn-container">
          <div class="btn-left">
            <a href="./doglog_detail.html" class="btn btn-backlist" id="btnBackToDetail">취소</a>
          </div>
          <div class="btn-right">
            <button type="button" class="btn btn-edit-save" id="btnEditSave">
              수정 완료
            </button>
          </div>
        </div>
      </div>

    </div>

  </main>
  <!-- footer -->
  <div id="footer-container"></div>
  <!-- js -->
  <script src="/assets/js/header-footer.js"></script>


</body>

</html>