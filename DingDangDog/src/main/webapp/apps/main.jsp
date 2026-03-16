
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="/assets/css/main.css" />
</head>

<body>
    <!-- header -->
    <div id="header-container"></div>

    <main>
        <!-- 최상단 이미지 : 멍! 매칭 설문조사 페이지로 이동 -->
        <section class="top-banner-section">
            <a href="">
                <img src="./../assets/img/1.png" alt="멍! 매칭 설문조사 바로가기" class="banner-img">
            </a>
        </section>
        <div class="main">
            <!-- 카드 이미지 : 멍! 카이브 페이지 이동 -->
            <div class="content">
                <section class="card-banner-section">
                    <div class="card-banner">
                        <button class="slide-btn-left"><img src="./../assets/img/1.png" alt="이전"></button>
                        <div class="card-list" id="main-card-list">
                            <div class="dog-card"><img src="./../assets/img/1.png" alt="유기견1"></div>
                            <div class="dog-card"><img src="./../assets/img/1.png" alt="유기견2"></div>
                            <div class="dog-card"><img src="./../assets/img/1.png" alt="유기견3"></div>
                            <div class="dog-card"><img src="./../assets/img/1.png" alt="유기견4"></div>
                        </div>
                        <button class="slide-btn-right"><img src="./../assets/img/1.png" alt="다음"></button>
                    </div>
                </section>

                <!-- 게시판 리스트 : 멍! 케어 상세페이지 이동 -->
                <section class="list-section">
                    <div class="list-flex">
                        <div class="list-box">
                            <h3>모집중인 멍! 케어</h3><br>
                            <ul class="list-box-caption">
                                <li onclick="">
                                    <span class="title">2026년 02월 유기견 센터 목욕봉사</span>
                                    <span class="title">26-03-09</span>
                                </li>
                                <li onclick="">
                                    <span class="title">2026년 02월 유기견 센터 목욕봉사</span>
                                    <span class="title">26-03-09</span>
                                </li>
                                <li onclick="">
                                    <span class="title">2026년 02월 유기견 센터 목욕봉사</span>
                                    <span class="title">26-03-09</span>
                                </li>
                                <li onclick="">
                                    <span class="title">2026년 02월 유기견 센터 목욕봉사</span>
                                    <span class="title">26-03-09</span>
                                </li>
                                <li onclick="">
                                    <span class="title">2026년 02월 유기견 센터 목욕봉사</span>
                                    <span class="title">26-03-09</span>
                                </li>
                            </ul>
                        </div>
                        <!-- 게시판 옆 로고 이미지 -->
                        <div class="logo-box">
                            <img src="/assets/img/HeaderFooterLogoText.svg" alt="listLogo">
                        </div>
                    </div>
            </div>
            </section>
        </div>
        <!-- 플로팅 버튼 -->
        <div class="floating-btn">
            <a href="">
                <img src="/assets/img/FloatingButton02.svg" alt="멍! 매칭 설문조사">
            </a>
        </div>
    </main>
    <!-- footer -->
    <div id="footer-container"></div>
    <!-- js -->
    <script src="/assets/js/header-footer.js"></script>
    <script src="/assets/js/main.js"></script>
</body>

</html>