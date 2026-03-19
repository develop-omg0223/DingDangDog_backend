<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>멍! 로그 게시글</title>
    <link rel="stylesheet" href="../../../assets/css/admin/admin.css" />
    <link
      rel="stylesheet"
      href="../../../assets/css/admin/doglog/admin_doglog_detail.css"
    />
    <script defer src="/assets/js/admin/admin_doglog_detail.js"></script>
  </head>

  <body>
    <!-- 전체화면 -->
    <main class="admin-main-container">
      <!-- 사이드바 -->
      <aside class="admin-sidebar"></aside>
      <!-- 메인 화면 -->
      <section class="admin-main-section">
        <!-- 페이지 상단 (제목, 버튼) -->
        <div class="admin-main-section-header">
          <div class="admin-title">멍! 로그 게시글</div>
        </div>
        <!-- 페이지 컨텐츠 -->
        <div class="admin-main-content">
          <div class="doglog-detail-container">
            <div class="detail-title">
              <!-- <div class="detail-title-content"> -->
              저희 강아지 구경하고 가세요!
              <!-- </div> -->
            </div>
            <div class="detail-info-container">
              <div class="detail-info-name">작성자</div>
              <div class="detail-info-date">2026.03.07</div>
            </div>
            <div class="detail-main-container">
              <div class="detail-main-img">
                <img
                  src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTEwMzFfMTU2%2FMDAxNzYxOTEyMzUzODIy.JauIsGx3oY4yGHHaCzkNBKFphQnoYrlTDoFDjP0nXL0g.VyBolt5gEwBxPkbLzf5XE1nNG0Q5ZHlou2VGyUNNVN0g.JPEG%2FP20200101_100034852_82847168-F64B-4527-921D-98D1D04EDDA9.JPG&type=sc960_832"
                  alt=""
                />
              </div>
              <div class="detail-main-post">
                멍! 매칭 입양했는데 너무 만족스럽습니다!!!
              </div>
            </div>
            <!-- <div class="line"></div> -->
            <hr />
            <div class="detail-comment-container">
              <div class="detail-comment-info">
                <div class="comment-info-name">철수</div>
                <div class="comment-info-date">2026.03.07</div>
              </div>
              <div class="detail-comment-post">
                <div class="comment-post-content">
                  강아지 너무 이쁘네요 ㅎㅎㅎ
                </div>
                <div class="btn-comment-delete btn">댓글 삭제</div>
              </div>
            </div>
            <div class="detail-comment-container">
              <div class="detail-comment-info">
                <div class="comment-info-name">철수</div>
                <div class="comment-info-date">2026.03.07</div>
              </div>
              <div class="detail-comment-post">
                <div class="comment-post-content">
                  강아지 너무 이쁘네요 ㅎㅎㅎ
                </div>
                <div class="btn-comment-delete btn">댓글 삭제</div>
              </div>
            </div>
            <div class="detail-comment-container">
              <div class="detail-comment-info">
                <div class="comment-info-name">철수</div>
                <div class="comment-info-date">2026.03.07</div>
              </div>
              <div class="detail-comment-post">
                <div class="comment-post-content">
                  강아지 너무 이쁘네요 ㅎㅎㅎ
                </div>
                <div class="btn-comment-delete btn">댓글 삭제</div>
              </div>
            </div>
            <div class="detail-comment-container">
              <div class="detail-comment-info">
                <div class="comment-info-name">철수</div>
                <div class="comment-info-date">2026.03.07</div>
              </div>
              <div class="detail-comment-post">
                <div class="comment-post-content">
                  강아지 너무 이쁘네요 ㅎㅎㅎ
                </div>
                <div class="btn-comment-delete btn">댓글 삭제</div>
              </div>
            </div>
          </div>
        </div>
        <!-- 페이지 하단 (검색, 페이지네이션) -->
        <div class="admin-main-section-footer">
          <div class="btn-container">
            <button class="btn-backlist btn" onclick="location.href = 'admin_doglog_list.html'"
              class="return-btn admin-box-shadow">목록으로</button>
            <button class="btn-doglog-delete btn" id="btn-remove-detail">게시글 삭제</button>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
