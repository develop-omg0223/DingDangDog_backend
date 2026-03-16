
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header-login -->
<!-- 로그아웃 상태 = 로그인 버튼이 보이는 header -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header-logout</title>
    <link rel="stylesheet" href="/assets/css/header.css" />

</head>

<body>
    <header class="header">
        <div class="h-container">
            <!-- header 왼쪽 : 로고 이미지, 사이트 한 줄 소개 텍스트 -->
            <!-- <div class="left-menu"> -->
            <div class="h-container">
                <!-- header 왼쪽 : 로고 이미지, 사이트 한 줄 소개 텍스트 -->
                <div class="h-left-menu">

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
                            <li><a href="#" class="h-centent-menu-item"><span class="h-mung"> </span>소개</a></li>
                            <li><a href="/html/dogmatching/dogmatching.html" class="h-centent-menu-item"><span class="h-mung">멍! </span>매칭</a></li>
                            <li><a href="/html/doglog/doglog_list.html" class="h-centent-menu-item"><span class="h-mung">멍! </span>로그</a></li>
                            <li><a href="/html/dogcare/dogcare_list_common.html" class="h-centent-menu-item"><span class="h-mung">멍! </span>케어</a></li>
                            <li><a href="/html/dogarchive/dogarchive_list.html" class="h-centent-menu-item"><span class="h-mung">멍! </span>카이브</a></li>
                        </ul>
                    </nav>
                    <!-- header 오른쪽 : 로그인 -->
                    <div class="h-right-menu">

                        <a href="/html/login/login.html" class="h-login-link">로그인</a>
                    </div>
                </div>

    </header>

</body>

</html>