document.addEventListener("DOMContentLoaded", function() {

	const editForm = document.getElementById("edit-profile-form");
	const base = editForm ? editForm.getAttribute("data-context-path") : "";
	const completeBtn = document.getElementById("complete-btn");
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

		if (!userNickname) {
			nicknameError.textContent = "닉네임을 입력해주세요.";
			nicknameError.style.display = "block";
			nicknameSuccess.style.display = "none";
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

		if (isPasswordValid && isPasswordMatch && isNicknameChecked) {
			if (confirm("회원 정보를 수정하시겠습니까?")) {
				editForm.submit();
			}
		} else {
			alert("입력 항목을 다시 확인해주세요.");
			e.preventDefault();
		}
	});

});