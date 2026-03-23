document.addEventListener("DOMContentLoaded", function() {

	const editForm = document.getElementById("edit-profile-form");
	const base = editForm ? editForm.getAttribute("data-context-path") : "";
	const completeBtn = document.getElementById("complete-btn");

	const originNickname = document.getElementById("nickname").value;
	const originPhone = document.getElementById("phone").value;

	/*비밀번호 일치 체크*/
	const newPw = document.getElementById("new-pw");
	const newPwCheck = document.getElementById("new-pw-check");
	const pwGuide = document.getElementById("pw-guide");
	const pwCheckMsg = document.getElementById("pw-check-message");

	let isPasswordValid = true;
	let isPasswordMatch = true;

	function validatePassword() {
		const pwValue = newPw.value;
		const pwCheckValue = newPwCheck.value;

		const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

		if (pwValue === "") {
			isPasswordValid = true;
		} else {
			if (pwRegex.test(pwValue)) {
				pwGuide.style.color = "blue";
				isPasswordValid = true;
			} else {
				pwGuide.style.color = "red";
				isPasswordValid = false;
			}
		}

		if (pwValue === "" && pwCheckValue === "") {
			pwCheckMsg.style.display = "none";
			isPasswordMatch = true;
		} else if (pwValue === pwCheckValue) {
			pwCheckMsg.style.display = "none";
			isPasswordMatch = true;
		} else {
			pwCheckMsg.style.display = "block";
			isPasswordMatch = false;
		}
	}

	newPw.addEventListener("input", validatePassword);
	newPwCheck.addEventListener("input", validatePassword);


	/*닉네임 중복체크*/
	const nicknameInput = document.getElementById("nickname");
	const nicknameCheckBtn = document.getElementById("nickname-check-btn");
	const nicknameSuccess = document.getElementById("nickname-success");
	const nicknameError = document.getElementById("nickname-error");
	let isNicknameChecked = true;

	nicknameInput.addEventListener("input", function() {
		isNicknameChecked = false;
		nicknameSuccess.style.display = "none";
		nicknameError.style.display = "none";
	});

	nicknameCheckBtn.addEventListener("click", function() {
		const userNickname = nicknameInput.value.trim();

		const nicknameRegex = /^[a-zA-Z0-9가-힣]{1,20}$/;

		if (!userNickname) {
			nicknameError.textContent = "닉네임을 입력해주세요.";
			nicknameError.style.display = "block";
			nicknameSuccess.style.display = "none";
			return;
		}

		if (!nicknameRegex.test(userNickname)) {
			nicknameError.textContent = "특수문자 제외 20자 이내로 입력해주세요.";
			nicknameError.style.display = "block";
			nicknameSuccess.style.display = "none";
			isNicknameChecked = false;
			return;
		}

		fetch(`${base}/mypage/checkNickNameOk.mp?userNickname=${encodeURIComponent(userNickname)}`)
			.then(r => {
				if (!r.ok) throw new Error("네트워크 응답 오류");
				return r.json();
			})
			.then(data => {
				if (data.available) {
					nicknameSuccess.style.display = "block";
					nicknameError.style.display = "none";
					isNicknameChecked = true;
				} else {
					nicknameError.textContent = "사용 불가능한 닉네임 입니다.";
					nicknameSuccess.style.display = "none";
					nicknameError.style.display = "block";
					isNicknameChecked = false;
				}
			})
			.catch(error => {
				console.error("Fetch Error:", error);
				nicknameError.textContent = "서버 통신 중 오류 발생";
				nicknameError.style.display = "block";
			});
	});




	/*-------------------문자인증-------------------*/
	// ===== SMS 발송 =====
	const phoneNumberInput = document.getElementById("phone");
	const sendSMSBtn = document.getElementById("send-code-btn");
	const verificationCodeInput = document.getElementById("verify-code");
	const verificationBtn = document.getElementById("verify-code-btn");
	const verifyStatusMsg = document.getElementById("verify-message");


	const phoneRegex = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
	const originalPhoneNumber = phoneNumberInput.value;
	let isPhoneVerified = true;


	phoneNumberInput.addEventListener("input", function() {
		if (this.value === originalPhoneNumber) {
			isPhoneVerified = true;
			verifyStatusMsg.style.display = "none";
		} else {
			isPhoneVerified = false;
			verifyStatusMsg.textContent = "번호가 변경되었습니다. 인증을 해주세요.";
			verifyStatusMsg.style.color = "red";
			verifyStatusMsg.style.display = "block";
		}
	});

	sendSMSBtn.addEventListener("click", function() {
		const phoneNumber = phoneNumberInput.value.trim();
		const realPhoneNumber = phoneNumber.replace(/[^0-9]/g, '');

		if (phoneNumber === originalPhoneNumber) {
			alert("기존에 등록된 번호와 동일합니다.");
			return;
		}

		if (!phoneNumber) {
			alert("핸드폰 번호를 입력해주세요.");
			return;
		}

		if (!phoneRegex.test(phoneNumber)) {
			verifyStatusMsg.textContent = "올바른 형식이 아닙니다. (예: 010-1234-5678)";
			verifyStatusMsg.style.color = "red";
			verifyStatusMsg.style.display = "block";
			phoneNumberInput.focus();
			return;

		}

		fetch(`${base}/user/sendSMS.us?realPhoneNumber=${realPhoneNumber}`, {
			method: "GET",
			headers: {
				"X-Requested-With": "XMLHttpRequest"
			}
		})
			.then(r => {
				if (!r.ok) throw new Error(r.status);
				return r.json();
			})
			.then(data => {
				if (data.ok) {
					verificationCodeInput.disabled = false;
					verifyStatusMsg.textContent = "인증번호가 발송되었습니다.";
					verifyStatusMsg.style.color = "green";
					verifyStatusMsg.style.display = "block";
				} else {
					verifyStatusMsg.textContent = "발송 실패: " + (data.message || "");
					verifyStatusMsg.style.color = "red";
					verifyStatusMsg.style.display = "block";
				}
			})
			.catch(() => {
				alert("인증번호 발송 중 오류가 발생했습니다.");
			});
	});

	// ===== 인증번호 확인 =====
	verificationBtn.addEventListener("click", function() {

		const phoneNumber = phoneNumberInput.value.trim();
		const realPhoneNumber = phoneNumber.replace(/[^0-9]/g, '');
		const code = verificationCodeInput.value.trim();
		console.log(phoneNumber);
		console.log(realPhoneNumber);
		if (!code) {
			alert("인증번호를 입력해주세요.");
			return;
		}
		fetch(`${base}/user/verifyCode.us`, {
			method: "POST",
			headers: { "Content-Type": "application/json; charset=utf-8", "Accept": "application/json" },
			body: JSON.stringify({ code, realPhoneNumber })
		})
			.then(r => { if (!r.ok) throw new Error(r.status); return r.json(); })
			.then(data => {
				if (data.success) {
					verifyStatusMsg.textContent = "인증에 성공했습니다.";
					verifyStatusMsg.style.color = "green";
					verificationCodeInput.dataset.verified = "true";


					isPhoneVerified = true;

					phoneNumberInput.readOnly = true;
					verificationCodeInput.readOnly = true;
					sendSMSBtn.disabled = true;
					verificationBtn.disabled = true;
				} else {
					verifyStatusMsg.textContent = "인증번호가 일치하지 않습니다.";
					verifyStatusMsg.style.color = "red";
					verificationCodeInput.dataset.verified = "false";
				}
			})
			.catch(() => {
				verifyStatusMsg.textContent = "인증 처리 중 오류가 발생했습니다.";
				verifyStatusMsg.style.color = "red";
			});
	});



	/*모달창 */
	const withdrawOpenBtn = document.getElementById("withdraw-open-btn");
	const withdrawModal = document.getElementById("withdraw-modal");
	const withdrawCloseBtn = document.getElementById("withdraw-close-btn");
	const withdrawConfirmInput = document.getElementById("withdraw-confirm-input");

	function openWithdrawModal() {
		if (!withdrawModal) return;
		withdrawModal.classList.add("show");
		if (withdrawConfirmInput) {
			withdrawConfirmInput.value = "";
			withdrawConfirmInput.focus();
		}
	}

	function closeWithdrawModal() {
		if (!withdrawModal) return;
		withdrawModal.classList.remove("show");
	}

	if (withdrawOpenBtn) {
		withdrawOpenBtn.addEventListener("click", openWithdrawModal);
	}

	if (withdrawCloseBtn) {
		withdrawCloseBtn.addEventListener("click", closeWithdrawModal);
	}

	if (withdrawModal) {
		withdrawModal.addEventListener("click", (event) => {
			if (event.target === withdrawModal) {
				closeWithdrawModal();
			}
		});
	}

	/*탈퇴처리*/
	const withdrawSubmitBtn = document.getElementById("withdraw-submit-btn");
	if (withdrawSubmitBtn) {
		withdrawSubmitBtn.addEventListener("click", () => {
			if (withdrawConfirmInput.value === "네 탈퇴하겠습니다") {
				location.href = `${base}/mypage/withdrawOk.mp`;
			} else {
				alert("탈퇴 문구를 정확히 입력해주세요.");
			}
		});
	}


	completeBtn.addEventListener("click", function(e) {

		if (!isPasswordValid || !isPasswordMatch) {
			alert("비밀번호를 다시 확인해주세요.");
			newPw.focus();
			return;
		}

		if (!isNicknameChecked) {
			alert("닉네임 중복 확인을 해주세요.");
			nicknameInput.focus();
			return;
		}

		if (!isPhoneVerified) {
			alert("휴대폰 번호 인증을 완료해주세요.");
			phoneNumberInput.focus();
			return;
		}

		if (confirm("회원 정보를 수정하시겠습니까?")) {
			editForm.submit();
		}
	});

});