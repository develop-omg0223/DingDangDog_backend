

document.addEventListener("DOMContentLoaded", function() {

	const findPwForm = document.getElementById("find-pw-form");
	const base = findPwForm ? findPwForm.getAttribute("data-context-path") : "";


	/*-------------------문자인증-------------------*/
	// ===== SMS 발송 =====
	const phoneNumberInput = document.getElementById("user-common-phone");
	const sendSMSBtn = document.querySelector(".phone-common-btn button");
	const phoneStatus = document.querySelector(".main-phone-common-message p");

	const verificationBtn = document.querySelector(".verification-common-btn button");
	const verificationCodeInput = document.getElementById("user-common-verification");
	const verificationStatus = document.querySelector(".main-verification-common-message p"); // 인증번호 관련 메시지

	const phoneRegex = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;



	sendSMSBtn.addEventListener("click", function() {
		const phoneNumber = phoneNumberInput.value.trim();
		const realPhoneNumber = phoneNumber.replace(/[^0-9]/g, '');
		console.log(phoneNumber);
		console.log(realPhoneNumber);
		if (!phoneNumber) {
			alert("핸드폰 번호를 입력해주세요.");
			return;
		}

		if (!phoneRegex.test(phoneNumber)) {
			phoneStatus.textContent = "올바른 형식이 아닙니다. (예: 010-1234-5678)";
			phoneStatus.style.color = "red";
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
					phoneStatus.textContent = "인증번호가 발송되었습니다.";
					phoneStatus.style.color = "green";
				} else {
					phoneStatus.textContent = "발송 실패: " + (data.message || "");
					phoneStatus.style.color = "red";
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
			verificationStatus.textContent = "인증번호를 입력해주세요.";
			verificationStatus.style.color = "red";
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
					verificationStatus.textContent = "인증에 성공했습니다.";
					verificationStatus.style.color = "green";
					verificationCodeInput.dataset.verified = "true";

					phoneNumberInput.readOnly = true;
					verificationCodeInput.readOnly = true;
					sendSMSBtn.disabled = true;
					verificationBtn.disabled = true;
				} else {
					verificationStatus.textContent = "인증번호가 일치하지 않습니다.";
					verificationStatus.style.color = "red";
					verificationCodeInput.dataset.verified = "false";
				}
			})
			.catch(() => {
				verificationStatus.textContent = "인증 처리 중 오류가 발생했습니다.";
				verificationStatus.style.color = "red";
			});
	});




	findPwForm.addEventListener("submit", function(e) {
		const isVerified = verificationCodeInput.dataset.verified === "true";
		const userIdInput = document.getElementById("user-id").value.trim();

		if (!userIdInput) {
			alert("아이디를 입력해주세요.");
			e.preventDefault();
			return;
		}

		if (!isVerified) {
			alert("휴대폰 번호 인증을 완료해주세요.");
			e.preventDefault(); // 폼 제출 중단
		}
	});

})