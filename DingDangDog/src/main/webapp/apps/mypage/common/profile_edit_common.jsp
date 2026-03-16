<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>내 정보 변경</title>
    <link rel="stylesheet" href="./../../../assets/css/mypage/common/profile_edit_common.css" />
    <script defer src="./../../../assets/js/mypage/common/profile_edit_common.js"></script>
</head>

<body>
    <!-- header -->
    <div id="header-container"></div>
    <main class="profile-edit">
        <div class="container">
            <aside class="sidebar">
                <nav class="side-menu">
                    <a class="btn-side-link" href="./profile_edit_common.html">내 정보 변경</a>
                    <hr>
                    <a class="btn-side-link" href="./volunteer_status_list_common.html">멍! 케어 신청 확인</a>
                    <hr>
                    <a class="btn-side-link" href="./review_list.html">내가 작성한 멍! 로그 목록</a>
                    <hr>
                    <a class="btn-side-link" href="./support_list_common.html">1 : 1 문의</a>
                </nav>
            </aside>

            <section class="content">
                <div class="content-box">
                    <div class="panel">
                        <div class="panel-head">
                            <h2 class="panel-title">내 정보 변경</h2>
                        </div>
                        <div class="panel-body">
                            <div class="edit-form">
                                <div class="edit-row">
                                    <div class="edit-label">아이디</div>
                                    <div class="edit-value">lucas1144</div>
                                </div>

                                <!-- <div class="edit-row">
                            <label class="edit-label" for="current-pw">현재 비밀번호</label>
                            <div class="edit-control">
                                <input type="password" id="current-pw" class="edit-input" value="">
                            </div>
                        </div> -->

                                <div class="edit-row edit-row-top">
                                    <label class="edit-label" for="new-pw">변경 할 비밀번호</label>
                                    <div class="edit-control">
                                        <input type="password" id="new-pw" class="edit-input" value="">
                                        <p id="pw-guide" class="guide-text">영문, 숫자, 특수문자 포함 8자리 이상</p>
                                    </div>
                                </div>

                                <div class="edit-row edit-row-top">
                                    <label class="edit-label" for="new-pw-check">비밀번호 재확인</label>
                                    <div class="edit-control">
                                        <input type="password" id="new-pw-check" class="edit-input" value="">
                                        <p id="pw-check-message" class="guide-text error-text">입력한 비밀번호가 틀립니다.</p>
                                    </div>
                                </div>

                                <div class="edit-row">
                                    <div class="edit-label">이름</div>
                                    <div class="edit-value">서정원</div>
                                </div>

                                <div class="edit-row">
                                    <div class="edit-label">생년월일</div>
                                    <div class="edit-value">2001.10.10</div>
                                </div>

                                <div class="edit-row">
                                    <label class="edit-label" for="nickname">닉네임</label>
                                    <div class="edit-inline">
                                        <div class="edit-control">
                                            <input type="text" id="nickname" class="edit-input" value="lucas1144">
                                            <p id="nickname-success" class="guide-text info-text">사용 가능한 닉네임 입니다.</p>
                                            <p id="nickname-error" class="guide-text error-text">사용 불가능한 닉네임 입니다.</p>
                                        </div>
                                        <button type="button" id="nickname-check-btn" class="action-btn">중복확인</button>
                                    </div>
                                </div>

                                <div class="edit-row">
                                    <div class="edit-label">이메일 주소</div>
                                    <div class="edit-value">lucas1144@naver.com</div>
                                </div>

                                <div class="edit-row">
                                    <label class="edit-label" for="phone">핸드폰 번호</label>
                                    <div class="edit-inline">
                                        <div class="edit-control">
                                            <input type="text" id="phone" class="edit-input" value="010-6272-9040">
                                        </div>
                                        <button type="button" id="send-code-btn" class="action-btn">인증 번호 전송</button>
                                    </div>
                                </div>

                                <div class="edit-row">
                                    <label class="edit-label" for="verify-code">인증 번호</label>
                                    <div class="edit-inline">
                                        <div class="edit-control">
                                            <input type="text" id="verify-code" class="edit-input" value="">
                                            <p id="verify-message" class="guide-text info-text">번호가 일치 합니다.</p>
                                        </div>
                                        <button type="button" id="verify-code-btn" class="action-btn">인증 번호 확인</button>
                                    </div>
                                </div>

                                <div class="edit-bottom">
                                    <button type="button" id="withdraw-open-btn" class="withdraw-btn">회원 탈퇴</button>
                                    <button type="button" id="complete-btn" class="complete-btn">변경 완료</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
        <div id="withdraw-modal" class="modal-overlay">
            <div class="withdraw-modal-box">
                <div class="withdraw-modal-head">
                    <button type="button" id="withdraw-close-btn" class="modal-close-btn">x</button>
                </div>

                <div class="withdraw-modal-body">
                    <p class="withdraw-text">정말 탈퇴하시겠습니까?</p>
                    <p class="withdraw-text">계정은 삭제되며 정보는 다시 복구되지 않습니다.</p>
                    <p class="withdraw-highlight">네 탈퇴하겠습니다를 입력하세요.</p>

                    <div class="withdraw-input-row">
                        <input type="text" id="withdraw-confirm-input" class="withdraw-confirm-input">
                        <button type="button" id="withdraw-submit-btn" class="withdraw-submit-btn">입력</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="password-check-modal" class="modal-overlay show">
            <div class="password-check-modal-box">
                <div class="password-check-modal-head">
                    <button type="button" id="password-check-close-btn" class="modal-close-btn">x</button>
                </div>

                <div class="password-check-modal-body">
                    <p class="password-check-title">비밀번호 입력</p>

                    <div class="password-check-input-row">
                        <input type="password" id="password-check-input" class="password-check-input"
                            placeholder="비밀번호를 입력하세요">
                        <button type="button" id="password-check-submit-btn"
                            class="password-check-submit-btn">입력</button>
                    </div>

                    <p id="password-check-error" class="password-check-error">비밀번호가 틀렸습니다</p>
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