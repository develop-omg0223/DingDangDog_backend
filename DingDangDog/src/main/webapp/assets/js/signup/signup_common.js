document.addEventListener("DOMContentLoaded", function() {
	const form = document.querySelector("form");
	const base = (form && form.dataset.contextPath) ? form.dataset.contextPath : "";

	const idInput = document.getElementById("user-common-id");
	const idBtn = document.querySelector(".id-common-btn button");
	const idMsg = document.querySelector(".main-form-id-common-message p");
	let isIdChecked = false;
	const nickInput = document.getElementById("user-common-nickname");
	const nickBtn = document.querySelector(".nickname-common-btn button");
	const nickMsg = document.querySelector(".main-form-nickname-common-message p");
	let isNickChecked = false;
	const emailInput = document.getElementById("email-common-user");
	const emailBtn = document.querySelector(".email-common-btn button");
	const emailMsg = document.querySelector(".main-form-email-common-message p");
	let isEmailChecked = false;

	/*----------------------아이디 중복확인----------------------*/
	idInput.addEventListener("input", function() {
		isIdChecked = false;
		idMsg.textContent = "중복 확인을 해주세요.";
		idMsg.style.color = "red";
	});

	idInput.addEventListener("blur", function() {
		if (!isIdChecked && idInput.value.trim() !== "") {
			idMsg.textContent = "중복 확인을 해주세요.";
			idMsg.style.color = "red";
		}
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


	/*----------------------닉네임 중복확인----------------------*/
	nickInput.addEventListener("input", function() {
		isNickChecked = false;
		nickMsg.textContent = "중복 확인을 해주세요.";
		nickMsg.style.color = "red";
	});

	nickInput.addEventListener("blur", function() {
		if (!isNickChecked && nickInput.value.trim() !== "") {
			nickMsg.textContent = "중복 확인을 해주세요.";
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



	/*----------------------이메일 중복확인----------------------*/
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
		// 1. 숫자 이외의 문자 제거
		let val = this.value.replace(/[^0-9]/g, '');
		let result = '';

		// 2. 글자 수에 따른 하이픈 삽입 로직
		if (val.length < 5) {
			result = val;
		} else if (val.length < 7) {
			result = val.substring(0, 4) + '-' + val.substring(4);
		} else {
			result = val.substring(0, 4) + '-' + val.substring(4, 6) + '-'
				+ val.substring(6, 8);
		}

		// 3. 결과값 반영
		this.value = result;
	});


})