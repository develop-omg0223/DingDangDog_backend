<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/signup/signup_common.css">
<script defer
	src="${pageContext.request.contextPath}/assets/js/signup/signup_common.js"></script>
</head>
<body>
	<header></header>
	<main>
		<div class="main-common-title">일반회원</div>
		<form
			action="${pageContext.request.contextPath }/user/signUpCommonOk.me"
			method="post" data-context-path="${pageContext.request.contextPath}">
			<div class="main-common-container">

				<div class="main-form-common-id">
					<div class="main-container-common-id">
						<div class="main-input-common-id">
							<div class="main-input-id-common-writing">
								<label for="user-common-id">아이디</label>
							</div>
							<input type="text" id="user-common-id" name="userId" required>
						</div>
						<div class="id-common-btn">
							<button type="button">중복확인</button>
						</div>
					</div>
					<div class="main-form-id-common-message">
						<p></p>
					</div>
				</div>

				<div class="main-form-common-pw">
					<div class="main-container-common-pw">
						<div class="main-input-common-pw">
							<div class="main-input-pw-common-writing">
								<label for="user-common-pw">비밀번호</label>
							</div>
							<input type="password" id="user-common-pw" name="userPassword"
								required>
						</div>
						<div class="main-form-pw-common-message">
							<p>영문,숫자,특수문자 포함 8자리이상 입력</p>
						</div>
					</div>
				</div>

				<div class="main-form-common-checkpw">
					<div class="main-container-common-checkpw">
						<div class="main-input-common-checkpw">
							<div class="main-input-checkpw-common-writing">
								<label for="user-pw-common-check">비밀번호 재입력</label>
							</div>
							<input type="password" id="user-pw-common-check"
								name="userPasswordCheck" required>
						</div>
					</div>
					<div class="main-form-checkpw-common-message">
						<p>비밀번호가 일치하지 않습니다</p>
					</div>
				</div>


				<div class="main-form-common-nickname">
					<div class="main-container-common-nickname">
						<div class="main-input-common-nickname">
							<div class="main-input-nickname-common-writing">
								<label for="user-common-nickname">닉네임</label>
							</div>
							<input type="text" id="user-common-nickname" name="userNickname"
								required>
						</div>
						<div class="nickname-common-btn">
							<button type="button">중복확인</button>
						</div>
					</div>
					<div class="main-form-nickname-common-message">
						<p></p>
					</div>
				</div>

				<div class="main-form-common-name">
					<div class="main-container-common-name">
						<div class="main-name-common-writing">
							<label for="user-common-name">이름</label>
						</div>
						<input type="text" id="user-common-name" name="userName" required>
					</div>
					<div class="user-gender-common-container">
						<div class="user-gender-container-common-male">
							<span class="user-gender-common-male">남</span> <input
								type="radio" id="user-common-male" name="userGender" value="남"
								checked="checked">
						</div>
						<div class="user-gender-container-common-female">
							<label for="user-common-female">여</label> <input type="radio"
								id="user-common-female" name="userGender" value="여">
						</div>
					</div>
				</div>

				<div class="main-form-common-birth">
					<div class="main-form-common-container">
						<div class="main-birth-common-writing">
							<label for="user-common-birth">생년월일</label>
						</div>
						<input type="text" id="user-common-birth" name="userBirth"
							placeholder="생년월일 8자를 입력해주세요 - 예) 20000101" maxlength="10"
							required>
					</div>
					<!-- <div class="main-birth-common-message">ex&#41;2000-00-00</div> -->
				</div>

				<div class="main-form-common-phone">
					<div class="main-container-common-phone">
						<div class="main-phone-common-writing">
							<label for="user-common-phone">휴대폰 번호</label>
						</div>
						<input type="text" id="user-common-phone" name="userPhone"
							required>
						<div class="phone-common-btn">
							<button type="button">인증번호 전송</button>
						</div>
					</div>
					<div class="main-phone-common-message">
						<p>인증번호 발송에 실패했습니다. 다시 확인해주세요.</p>
					</div>
				</div>

				<div class="main-form-common-verification">
					<div class="main-container-common-verification">
						<div class="main-input-common-verification">
							<div class="main-verification-common-writing">
								<label for="user-common-verification">인증번호</label>
							</div>
							<input type="text" id="user-common-verification"
								name="userVerification" required>
						</div>
						<div class="verification-common-btn">
							<button type="button">인증번호 확인</button>
						</div>
					</div>
					<div class="main-verification-common-message">
						<p>인증번호가 일치하지 않습니다</p>
					</div>
				</div>

				<div class="main-form-common-emailAddress">
					<div class="main-container-common-emailAddress">
						<div class="main-input-common-emailAddress">
							<div class="main-emailAddress-common-writing">
								<label for="email-common-user">이메일 주소</label>
							</div>
							<input type="text" id="email-common-user" name="userEmail"
								required>
						</div>
						<div class="email-common-btn">
							<button type="button">중복확인</button>
						</div>
					</div>
					<div class="main-form-email-common-message">
						<p></p>
					</div>
				</div>

				<div class="signup-common-btn">
					<button type="submit">회원가입</button>
				</div>
			</div>
		</form>
	</main>
	<footer></footer>
</body>
</html>