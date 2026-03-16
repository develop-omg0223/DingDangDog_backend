<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>멍! 로그 전체목록</title>
  <link rel="stylesheet" href="../../assets/css/doglog/doglog_list.css">
  <script defer src="../../assets/js/doglog/doglog_list.js"></script>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>

<<<<<<< HEAD
  <main class="doglog-write">
    <div class="container">
      <div class="container-header">
        <h2 id="main-title">멍! 로그 작성</h2>
      </div>

      <div class="container-body">
        <div class="doglog-write-container">
          <div class="write-title">
            <input type="text" placeholder="제목을 입력해주세요" />
          </div>

          <div class="write-main-container">
            <!-- 대표 이미지 -->
            <div class="write-main-img">
              <div class="img-preview-box">
                <img id="thumbnailPreview" src="" alt="대표 이미지 미리보기" />
                <span class="img-placeholder">대표 이미지</span>
              </div>
            </div>

            <!-- 본문 입력 -->
            <div class="write-main-post">
              <div class="write-content-editor" id="writeContentEditor" contenteditable="true"
                data-placeholder="내용을 입력해주세요"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="container-footer">
        <div class="footer-btn-wrap">
          <input type="file" id="imageUpload" accept="image/*" multiple hidden />

          <div class="footer-left">
            <label for="imageUpload" class="btn btn-upload">이미지 첨부</label>
          </div>

          <div class="footer-right">
            <a href="" class="btn btn-save">저장하기</a>
            <a href="" class="btn btn-cancel">취소</a>
          </div>
        </div>
      </div>
    </div>
  </main>
  <!-- footer -->
  <div id="footer-container"></div>
  <!-- js -->
  <script src="/assets/js/header-footer.js"></script>


=======
  <main>
    <div class="doglog-main-container">
      <div class="main-container-header">
        <div class="main-header-title">멍! 로그</div>
      </div>
      <!-- 카드 리스트 -->
      <div class="doglog-list">

        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  작성자명
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  철수
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  철수
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  유리
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  유리
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  짱구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  짱구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  짱구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  짱구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  짱구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  짱구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  맹구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  맹구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  맹구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  맹구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  맹구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  맹구
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  작성자명
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  작성자명
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  작성자명
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  작성자명
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  작성자명
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  작성자명
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
        <!-- 카드 -->
        <div class="doglog-card">
          <a href="doglog_detail.html" class="doglog-link">
            <div class="doglog-image">
              이미지
            </div>

            <div class="doglog-content">

              <div class="doglog-post-title">
                글 제목이 들어갈 공간
              </div>

              <div class="doglog-meta">

                <span class="doglog-writer">
                  작성자명
                </span>

                <span class="doglog-date">
                  2024.03.06
                </span>

              </div>

            </div>
          </a>
        </div>
      </div>


      <!-- 검색 -->
      <div class="search-box">
        <select class="search-select">
          <option>작성자명</option>
          <option>제목</option>
        </select>
        <input type="text" class="search-input">
        <button class="btn-search">검색</button>
      </div>

    </div>
    <!-- 하단 검색 + 글 작성 -->
    <div class="main-container-footer">


      <!-- 페이지네이션 -->
      <div class="pagination">
        <ul class="page-list">
          <li>
            <button class="prev-btn">
              <span>&lt;</span>
            </button>
          </li>
          <li>
            <button class="page-item current-page">1</button>
          </li>
          <li>
            <button class="page-item">2</button>
          </li>
          <li>
            <button class="page-item">3</button>
          </li>
          <li>
            <button class="page-item">4</button>
          </li>
          <li>
            <button class="page-item">5</button>
          </li>
          <li>
            <button class="next-btn"><span>&gt;</span></button>
          </li>
        </ul>
      </div>
      <button class="btn-write" onclick="location.href = 'doglog_write.html'">
        글 작성하기
      </button>
    </div>
    <!-- footer -->
    <div id="footer-container"></div>
    <!-- js -->
    <script src="/assets/js/header-footer.js"></script>

>>>>>>> d8ad925fa7fa32c2fcb63f78a48583663e8b2478
</body>

</html>