document.addEventListener("DOMContentLoaded", function() {
	/*const form = document.querySelector("form");*/
	const form = document.querySelector("form");
	const base = (form && form.dataset.contextPath) ? form.dataset.contextPath : "";

	const idInput = document.getElementById("user-common-id");
	const idBtn = document.querySelector(".id-common-btn button");
	const idMsg = document.querySelector(".main-form-id-common-message p");

	const pwInput = document.getElementById("user-common-pw");
	const pwCheckInput = document.getElementById("user-pw-common-check");
	const pwMsg = document.querySelector(".main-form-pw-common-message p");
	const pwCheckMsg = document.querySelector(".main-form-checkpw-common-message p");

	const nickInput = document.getElementById("user-common-nickname");
	const nickBtn = document.querySelector(".nickname-common-btn button");
	const nickMsg = document.querySelector(".main-form-nickname-common-message p");

	const emailInput = document.getElementById("email-common-user");
	const emailBtn = document.querySelector(".email-common-btn button");
	const emailMsg = document.querySelector(".main-form-email-common-message p");

	let isIdChecked = false;
	let isPwValid = false;
	let isPwMatched = false;
	let isNickChecked = false;
	let isEmailChecked = false;



	// ====== 카카오 우편번호 ======
	const searchBtn = document.getElementById("searchPostcodeBtn");
	if (searchBtn) {
		searchBtn.addEventListener("click", function() {
			new daum.Postcode({
				oncomplete: function(data) {
					document.getElementById("postcode").value = data.zonecode || "";

					var isRoad = data.userSelectedType === "R";
					var base = isRoad ? (data.roadAddress || "") : (data.jibunAddress || "");
					var extra = "";

					if (isRoad) {
						if (data.bname && /[동|로|가]$/.test(data.bname)) extra += data.bname;
						if (data.buildingName && data.apartment === "Y") {
							extra += (extra ? ", " : "") + data.buildingName;
						}
					}

					var main = base + (extra ? " (" + extra + ")" : "");
					document.getElementById("mainAddress").value = main;

					document.getElementById("detailAddress").focus();
				}
			}).open({ popupTitle: "우편번호 검색" });
		});
	}

	//----------------------아이디 중복확인----------------------
	idInput.addEventListener("input", function() {
		isIdChecked = false;
		idMsg.textContent = "중복 확인을 해주세요.";
		idMsg.style.color = "red";
	});

	idBtn.addEventListener("click", function() {
		const userId = idInput.value.trim();

		if (!userId) {
			idMsg.textContent = "아이디를 입력해주세요.";
			idMsg.style.color = "red";
			return;
		}

		fetch(`${base}/user/checkIdOk.us?userId=${encodeURIComponent(userId)}`, {
			headers: { "Accept": "application/json" }
		})
			.then(r => {
				if (!r.ok) {
					throw new Error(r.status);
				}
				console.log("Status :", r.status);
				return r.json();
			})
			.then(data => {
				if (data.available) {
					idMsg.textContent = "사용 가능한 아이디입니다";
					idMsg.style.color = "green";
					isIdChecked = true;
				} else {
					idMsg.textContent = "이미 사용 중인 아이디입니다";
					idMsg.style.color = "red";
					isIdChecked = false;
				}
			})
			.catch(error => {
				console.error("Error:", error);
				idMsg.textContent = "중복 확인 중 오류 발생";
				idMsg.style.color = "red";
			});
	});

	//----------------------비밀번호 확인----------------------
	const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

	function checkPassword() {
		if (pwRegex.test(pwInput.value)) {
			pwMsg.textContent = "사용 가능한 비밀번호입니다";
			pwMsg.style.color = "green";
			isPwValid = true;
		} else {
			pwMsg.textContent = "영문, 숫자, 특수문자 포함 8자리 이상 입력해주세요.";
			pwMsg.style.color = "red";
			isPwValid = false;
		}

		// 일치 확인
		if (pwInput.value === pwCheckInput.value && pwInput.value !== "") {
			pwCheckMsg.textContent = "비밀번호가 일치합니다.";
			pwCheckMsg.style.color = "green";
			isPwMatched = true;
		} else {
			pwCheckMsg.textContent = "비밀번호가 일치하지 않습니다.";
			pwCheckMsg.style.color = "red";
			isPwMatched = false;
		}
	}

	pwInput.addEventListener("input", checkPassword);
	pwCheckInput.addEventListener("input", checkPassword);

	//----------------------닉네임 중복확인----------------------
	const nickRegex = /^[a-zA-Z0-9가-힣]{1,20}$/;
	nickInput.addEventListener("input", function() {
		isNickChecked = false;
		const val = nickInput.value.trim();
		if (nickRegex.test(val)) {
			nickMsg.textContent = "형식에 맞습니다. 중복 확인을 해주세요.";
			nickMsg.style.color = "blue";
		} else {
			nickMsg.textContent = "특수문자 제외 2~20자 이내로 입력해주세요.";
			nickMsg.style.color = "red";
		}
	});

	nickBtn.addEventListener("click", function() {
		const userNickname = nickInput.value.trim();

		if (!userNickname) {
			nickMsg.textContent = "닉네임을 입력해주세요.";
			nickMsg.style.color = "red";
			return;
		}

		fetch(`${base}/user/checkNicknameOk.us?userNickname=${encodeURIComponent(userNickname)}`, {
			headers: { "Accept": "application/json" }
		})
			.then(r => {
				if (!r.ok) {
					throw new Error(r.status);
				}
				console.log("Status :", r.status);
				return r.json();
			})
			.then(data => {
				if (data.available) {
					nickMsg.textContent = "사용 가능한 닉네임입니다";
					nickMsg.style.color = "green";
					isNickChecked = true;
				} else {
					nickMsg.textContent = "이미 사용 중인 닉네임입니다";
					nickMsg.style.color = "red";
					isNickChecked = false;
				}
			})
			.catch(error => {
				console.error("Error:", error);
				nickMsg.textContent = "중복 확인 중 오류 발생";
				nickMsg.style.color = "red";
			});
	});



	//----------------------이메일 중복확인----------------------
	emailInput.addEventListener("input", function() {
		isEmailChecked = false;
		emailMsg.textContent = "중복 확인을 해주세요";
		emailMsg.style.color = "red";
	});

	emailInput.addEventListener("blur", function() {
		if (!isEmailChecked && emailInput.value.trim() !== "") {
			emailMsg.textContent = "중복 확인을 해주세요";
			emailMsg.style.color = "red";
		}
	});

	emailBtn.addEventListener("click", function() {
		const userEmail = emailInput.value.trim();

		if (!userEmail) {
			emailMsg.textContent = "이메일을 입력해주세요";
			emailMsg.style.color = "red";
			return;
		}

		const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if (!emailPattern.test(userEmail)) {
			emailMsg.textContent = "올바른 형식이 아닙니다";
			emailMsg.style.color = "red";
			return;
		}

		fetch(`${base}/user/checkEmailOk.us?userEmail=${encodeURIComponent(userEmail)}`, {
			headers: { "Accept": "application/json" }
		})
			.then(r => {
				if (!r.ok) {
					throw new Error(r.status);
				}
				return r.json();
			})
			.then(data => {
				if (data.available) {
					emailMsg.textContent = "사용 가능한 이메일입니다";
					emailMsg.style.color = "green";
					isEmailChecked = true;
				} else {
					emailMsg.textContent = "이미 등록된 이메일입니다";
					emailMsg.style.color = "red";
					isEmailChecked = false;
				}
			})
			.catch(error => {
				console.error("Error:", error);
				emailMsg.textContent = "중복 확인 중 오류 발생";
				emailMsg.style.color = "red";
			});
	});



	const birthInput = document.getElementById('user-common-birth');

	birthInput.addEventListener('input', function() {
		let val = this.value.replace(/[^0-9]/g, '');
		let result = '';

		if (val.length >= 5) {
			let year = val.substring(0, 4);
			let monthPart = val.substring(4, 6);

			if (monthPart.length === 2) {
				let m = parseInt(monthPart);
				if (m > 12) m = 12;
				if (monthPart === "00") m = 1;
				monthPart = m.toString().padStart(2, '0');
			}

			if (val.length >= 7) {
				let dayPart = val.substring(6, 8);

				if (dayPart.length === 2) {
					let d = parseInt(dayPart);
					const maxDay = new Date(parseInt(year), parseInt(monthPart), 0).getDate();
					if (d > maxDay) d = maxDay;
					if (dayPart === "00") d = 1;
					dayPart = d.toString().padStart(2, '0');
				}
				val = year + monthPart + dayPart;
			} else {
				val = year + monthPart;
			}
		}

		if (val.length <= 4) {
			result = val;
		} else if (val.length <= 6) {
			result = val.substring(0, 4) + '-' + val.substring(4);
		} else {
			result = val.substring(0, 4) + '-' + val.substring(4, 6) + '-' + val.substring(6, 8);
		}

		this.value = result;
	});


	/*-------------------문자인증-------------------*/
	// ===== SMS 발송 =====

	const phoneNumberInput = document.getElementById("user-common-phone");
	const sendSMSBtn = document.querySelector(".phone-common-btn button");
	const phoneStatus = document.querySelector(".main-phone-common-message p");

	const verificationCodeInput = document.getElementById("user-common-verification");
	const verificationBtn = document.querySelector(".verification-common-btn button");
	const verificationStatus = document.querySelector(".main-verification-common-message p");


	const phoneRegex = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;

	sendSMSBtn.addEventListener("click", function() {
		const phoneNumber = phoneNumberInput.value.trim();
		const realPhoneNumber = phoneNumber.replace(/[^0-9]/g, '');

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

		fetch(`${base}/user/sendSMS.us`, {
			method: "POST",
			headers: { "Content-Type": "application/json; charset=utf-8" },
			body: JSON.stringify({ realPhoneNumber })
		})
			.then(r => {
				if (!r.ok) throw new Error(r.status);
				const ct = r.headers.get("Content-Type") || "";
				return ct.includes("application/json") ? r.json() : { ok: true };
			})
			.then(data => {
				const ok = typeof data.ok === "boolean" ? data.ok : true;
				if (ok) {
					verificationCodeInput.disabled = false;
					phoneStatus.textContent = "인증번호가 발송되었습니다.";
					phoneStatus.style.color = "green";
				} else {
					phoneStatus.textContent = "발송 실패. 잠시 후 다시 시도하세요.";
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
		if (!code) {
			verificationStatus.textContent = "인증번호를 입력해주세요.";
			verificationStatus.style.color = "red";
			return;
		}
		fetch(`${base}/user/verifyCode.us`, {
			method: "POST",
			headers: { "Content-Type": "application/json; charset=utf-8" },
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



	form.addEventListener("submit", function(e) {
		if (!isIdChecked) {
			alert("아이디 중복 확인을 해주세요.");
			idInput.focus();
			e.preventDefault();
			return;
		}

		if (!isPwValid) {
			alert("비밀번호 형식을 확인해주세요 (영문, 숫자, 특수문자 포함 8자 이상).");
			pwInput.focus();
			e.preventDefault();
			return;
		}

		if (!isPwMatched) {
			alert("비밀번호가 일치하지 않습니다.");
			pwCheckInput.focus();
			e.preventDefault();
			return;
		}

		if (!isNickChecked) {
			alert("닉네임 중복 확인을 해주세요.");
			nickInput.focus();
			e.preventDefault();
			return;
		}

		if (!isEmailChecked) {
			alert("이메일 중복 확인을 해주세요.");
			emailInput.focus();
			e.preventDefault();
			return;
		}



		const shelterName = document.getElementById("sheltername");
		const businessNum = document.getElementById("user-shelter-business");
		const postcode = document.getElementById("postcode");
		const mainAddr = document.getElementById("mainAddress");

		if (shelterName) {
			if (!shelterName.value.trim()) {
				alert("보호소명을 입력해주세요.");
				shelterName.focus();
				e.preventDefault();
				return;
			}

			if (businessNum && !businessNum.value.trim()) {
				alert("사업자 등록번호를 입력해주세요.");
				businessNum.focus();
				e.preventDefault();
				return;
			}

			if (postcode && (!postcode.value || !mainAddr.value)) {
				alert("우편번호 검색을 통해 주소를 입력해주세요.");
				document.getElementById("searchPostcodeBtn").focus();
				e.preventDefault();
				return;
			}
		}


		if (verificationCodeInput.dataset.verified !== "true") {
			alert("휴대폰 인증을 완료해주세요.");
			verificationCodeInput.focus();
			e.preventDefault();
			return;
		}


		alert("회원가입을 완료했습니다!");
	});




})