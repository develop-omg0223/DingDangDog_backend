<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="firstImagePath" value="" />
<c:if test="${not empty imageList and fn:length(imageList) > 0}">
	<c:set var="firstImagePath" value="${imageList[0].logImgPath}" />
</c:if>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="${contextPath}/assets/css/doglog/doglog_detail.css" />
<script>
	const contextPath = "${contextPath}";
</script>
<script defer src="${contextPath}/assets/js/doglog/doglog_detail.js"></script>
<title>멍! 로그 상세</title>
<link rel="stylesheet" href="${contextPath}/assets/css/header.css" />
<link rel="stylesheet" href="${contextPath}/assets/css/footer.css" />
</head>

<body>

	<c:choose>
		<c:when test="${not empty sessionScope.userNumber}">
			<jsp:include page="/app/header_login.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="/app/header_logout.jsp" />
		</c:otherwise>
	</c:choose>

	<main class="doglog-detail">
		<div class="container">
			<div class="container-header">
				<h2 id="main-title">멍! 로그</h2>
			</div>

			<div class="container-body">
				<div class="doglog-detail-container">

					<div class="detail-title" id="detailTitle">
						<c:choose>
							<c:when test="${not empty log and not empty log.logTitle}">
                ${log.logTitle}
              </c:when>
							<c:otherwise>
                제목 없음
              </c:otherwise>
						</c:choose>
					</div>

					<div class="detail-info-container">
						<div class="detail-info-name" id="detailWriter">
							<c:choose>
								<c:when test="${not empty log and not empty log.userNickname}">
                  ${log.userNickname}
                </c:when>
								<c:otherwise>
                  작성자 없음
                </c:otherwise>
							</c:choose>
						</div>

						<div class="detail-info-date" id="detailDate">
							<c:if test="${not empty log and not empty logDateStr}">
                ${logDateStr}
              </c:if>
						</div>
					</div>

					<div class="detail-main-container">
						<div class="detail-main-img" id="detailMainImg">
							<div class="img-preview-box">
								<c:choose>
									<c:when test="${not empty firstImagePath}">
										<img src="${contextPath}${firstImagePath}" alt="대표 이미지" />
									</c:when>
									<c:otherwise>
										<div class="detail-image-empty">이미지가 없습니다.</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="detail-main-post" id="detailMainPost">
							<c:choose>
								<c:when test="${not empty log and not empty log.logPost}">
                  ${log.logPost}
                </c:when>
								<c:otherwise>
                  내용 없음
                </c:otherwise>
							</c:choose>
						</div>
					</div>

					<hr />

					<div class="comment-list" id="commentList">
						<c:choose>
							<c:when test="${not empty commentList}">
								<c:forEach var="comment" items="${commentList}">
									<div class="detail-comment-container">
										<div class="detail-comment-info">
											<div class="comment-info-name">
												<c:choose>
													<c:when test="${not empty comment.userNickname}">
                            ${comment.userNickname}
                          </c:when>
													<c:otherwise>
                            작성자
                          </c:otherwise>
												</c:choose>
											</div>

											<div class="comment-info-date">
												<c:if test="${not empty comment.commentDate}">
                          ${comment.commentDate}
                        </c:if>
											</div>
										</div>

										<div class="detail-comment-post">
											<div class="comment-post-content">
												<c:if test="${not empty comment.commentPost}">
                          ${comment.commentPost}
                        </c:if>
											</div>

											<c:if
												test="${not empty sessionScope.userNumber and comment.userNumber eq sessionScope.userNumber}">
												<div class="comment-btn-wrap">
													<button type="button" class="btn btn-comment-edit"
														data-action="edit-comment"
														data-comment-number="${comment.commentNumber}"
														data-log-number="${log.logNumber}">수정</button>

													<a
														href="${contextPath}/comment/deleteOk.lo?commentNumber=${comment.commentNumber}&logNumber=${log.logNumber}"
														class="btn btn-comment-delete"
														onclick="return confirm('댓글을 삭제하시겠습니까?');"> 삭제 </a>
												</div>
											</c:if>
										</div>
									</div>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<div class="detail-comment-container">
									<div class="detail-comment-post">등록된 댓글이 없습니다.</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="comment-write-container" id="commentWriteContainer">
						<c:choose>
							<c:when test="${not empty sessionScope.userNumber}">
								<form action="${contextPath}/comment/writeOk.lo" method="post"
									id="commentForm">
									<input type="hidden" name="logNumber" id="logNumber"
										value="${log.logNumber}" /> <input type="hidden"
										name="commentNumber" id="commentNumber" value="" />

									<textarea class="comment-write-input" id="commentWriteInput"
										name="commentPost" placeholder="댓글을 입력해주세요"></textarea>

									<div class="comment-write-btn-wrap">
										<button type="submit" class="btn btn-comment-write"
											id="btnCommentWrite">댓글 작성</button>

										<div id="commentCancelWrap" style="display: none;">
											<button type="button" class="btn btn-comment-cancel"
												id="btnCommentCancel">취소</button>
										</div>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<div class="detail-comment-post">댓글 작성은 로그인 후 이용 가능합니다.</div>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>

			<div class="container-footer">
				<div class="btn-container">
					<div class="btn-left">
						<a href="${contextPath}/log/list.lo" class="btn btn-backlist"
							id="btnBackToList"> 목록으로 </a>
					</div>

					<div class="btn-right">
						<c:if
							test="${not empty sessionScope.userNumber and log.userNumber eq sessionScope.userNumber}">
							<a href="${contextPath}/log/edit.lo?logNumber=${log.logNumber}"
								class="btn btn-detail-edit" id="btnDetailEdit"> 수정 </a>

							<button type="button" class="btn btn-detail-delete"
								id="btnDetailDelete"
								data-delete-url="${contextPath}/log/deleteOk.lo?logNumber=${log.logNumber}">
								삭제</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="/app/footer.jsp" />
</body>

</html>