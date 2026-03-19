<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header-login -->
<!-- 로그인 상태 = 로그아웃 버튼이 보이는 header -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header-login</title>
    <link rel="stylesheet" href="/assets/css/header.css" />
</head>

<body>
     <!-- header -->
    <div id="header-container"></div>
        <div class="h-container">
            <!-- header 왼쪽 : 로고 이미지, 사이트 한 줄 소개 텍스트 -->
            <div class="h-left-menu">
                <!-- header 왼쪽 : 로고 이미지 호버시 바뀌게 2가지 -->
                <a href="/html/main.html" class="h-logo-link">
                    <img src="/assets/img/header, footer_logo.svg" alt="DingDongDOG! logo" class="h-logo-img">
                </a>
                <!-- header 왼쪽 : 사이트 슬로건 -->
                <div class="h-left-caption">
                    <p class="h-slogan">멍! 매칭으로 찾는 나만의 반려견, 딩동독!</p>
                </div>
            </div>

            <!-- header 중앙 : 해당 페이지로 이동하는 메뉴 -->
            <nav class="h-centent-menu">
                <ul>
                    <li><a href="#" class="h-centent-menu-item"><span class="mung"> </span>소개</a></li>
                    <li><a href="/html/dogmatching/dogmatching.html" class="h-centent-menu-item"><span class="mung">멍! </span>매칭</a></li>
                    <li><a href="/html/doglog/doglog_list.html" class="h-centent-menu-item"><span class="mung">멍! </span>로그</a></li>
                    <li><a href="/html/dogcare/dogcare_list_common.html" class="h-centent-menu-item"><span class="mung">멍! </span>케어</a></li>
                    <li><a href="/html/dogarchive/dogarchive_list.html" class="h-centent-menu-item"><span class="mung">멍! </span>카이브</a></li>
                </ul>
            </nav>
            <!-- header 오른쪽 : 일반사용자/보호소사용자 이미지, 로그아웃 -->
            <div class="h-right-menu">
                <div class="h-user-section">
                    <div class="h-user-info-group">
                        <img src="./../assets/img/1.png" alt="user-icon" id="headerUserIcon" class="h-user-section-img">
                        <div class="h-user-text-stack">
                            <span id="haderNickname" class="h-user-nickname">닉네임</span>
                            <a href="/html/mypage/common/mypage_common.html" class="h-mypage-btn">마이페이지</a>
                        </div>
                    </div>
                    <a href="/html/main.html" class="h-logout-btn">로그아웃</a>
                </div>
            </div>

    </header>

</body>

</html>