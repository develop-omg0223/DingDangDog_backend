<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
  <c:when test="${sessionScope.userType eq 'C'}">
    <aside class="sidebar">
      <nav class="side-menu">
        <a class="btn-side-link" href="${pageContext.request.contextPath}/mypage/profileEditC.mp">내 정보 변경</a>
        <hr>
        <a class="btn-side-link" href="${pageContext.request.contextPath}/mypage/.mp">멍! 케어 신청 확인</a>
        <hr>
        <a class="btn-side-link" href="${pageContext.request.contextPath}/mypage/myLog.mp">내가 작성한 멍! 로그 목록</a>
        <hr>
        <a class="btn-side-link" href="${pageContext.request.contextPath}/mypage/.mp">1 : 1 문의</a>
      </nav>
    </aside>
  </c:when>

  <c:when test="${sessionScope.userType eq 'S'}">
    <aside class="sidebar">
      <nav class="side-menu">
        <a class="btn-side-link" href="${pageContext.request.contextPath}/mypage/.mp">보호소 정보 변경</a>
        <hr>
        <a class="btn-side-link" href="${pageContext.request.contextPath}/mypage/.mp">멍! 케어 목록 및 현황</a>
        <hr>
        <a class="btn-side-link" href="${pageContext.request.contextPath}/mypage/.mp">멍! 카이브 등록 정보</a>
        <hr>
        <a class="btn-side-link" href="${pageContext.request.contextPath}/mypage/.mp">1 : 1 문의</a>
      </nav>
    </aside>
  </c:when>

</c:choose>