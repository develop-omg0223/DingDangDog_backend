<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>멍! 케어 일정 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogcare/dogcare_write.css" />
</head>

<body>

    <main>
        <div class="dogcare-main-container">
            <div class="main-header">
                <div class="main-header-title">멍! 케어</div>
            </div>
            <div class="main-content">
                <div class="content-header">멍! 케어 일정 수정</div>

                <!-- form 시작 -->
                <form action="${pageContext.request.contextPath}/care/updateOk.ca"
                    method="post">

                    <!-- hidden -->
                    <input type="hidden" name="careNumber" value="${care.careNumber}" />

                    <div class="dogcare-write-container">

                        <!-- 제목 -->
                        <div class="write-title">제목</div>
                        <div class="write-box-container">

                            <input class="title-write-box" type="text" name="careTitle"
                                value="${care.careTitle}" required />

                            <!-- 모집 인원 -->
                            <div class="dogcare-number">
                                <label>모집 인원</label>
                                <input type="number" name="careRecruit"
                                    value="${care.careRecruit}" min="1" required />
                            </div>

                            <!-- 날짜 -->
                            <div class="dogcare-date">
                                <label>일정</label>
                                <input type="date" name="careDate"
                                    value="${care.careDate}" required />
                            </div>

                        </div>

                        <!-- 내용 -->
                        <div class="write-main-container">
                            <div class="write-main">상세 내용</div>
                            <div class="input-main">
                                <textarea class="input-detail" name="carePost"
                                    required><c:out value="${care.carePost}" /></textarea>
                            </div>
                        </div>

                        <!-- 버튼 -->
                        <div class="detail-footer-container">
                            <div>
                                <button type="submit" class="btn-dogcare-post">수정 완료</button>
                            </div>
                        </div>

                    </div>
                </form>
                <!-- form 끝 -->

            </div>
        </div>
    </main>

</body>
</html>