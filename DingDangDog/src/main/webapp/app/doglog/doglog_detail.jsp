<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="./../../assets/css/doglog/doglog_detail.css" />
  <script defer src="./../../assets/js/doglog/doglog_detail.js"></script>
  <title>멍! 로그 상세</title>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>


  <main class="doglog-detail">
    <div class="container">
      <div class="container-header">
        <h2 id="main-title">멍! 로그</h2>
      </div>

      <div class="container-body">
        <div class="doglog-detail-container">
          <div class="detail-title" id="detailTitle"></div>

          <div class="detail-info-container">
            <div class="detail-info-name" id="detailWriter"></div>
            <div class="detail-info-date" id="detailDate"></div>
          </div>

          <div class="detail-main-container">
            <div class="detail-main-img" id="detailMainImg"></div>
            <div class="detail-main-post" id="detailMainPost"></div>
          </div>

          <hr />

          <div class="comment-list" id="commentList"></div>

          <div class="comment-write-container" id="commentWriteContainer">
            <textarea class="comment-write-input" id="commentWriteInput" placeholder="댓글을 입력해주세요"></textarea>
            <button type="button" class="btn btn-comment-write" id="btnCommentWrite">
              댓글 작성
            </button>
          </div>
        </div>
      </div>

      <div class="container-footer">
        <div class="btn-container">
          <div class="btn-left">
            <a href="" class="btn btn-backlist" id="btnBackToList">목록으로</a>
          </div>

          <div class="btn-right">
            <a href="" class="btn btn-detail-edit" id="btnDetailEdit">수정</a>
            <button type="button" class="btn btn-detail-delete" id="btnDetailDelete">삭제</button>
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