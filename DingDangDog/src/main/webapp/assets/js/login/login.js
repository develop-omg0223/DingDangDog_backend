document.addEventListener("DOMContentLoaded", function() {
	const commonBtn = document.getElementById("commonLogin");
	const shelterBtn = document.getElementById("shelterLogin");
	const userTypeInput = document.getElementById("userType");

	//일반회원
	commonBtn.addEventListener("click", function() {
		userTypeInput.value = "C";
		commonBtn.classList.add("selected-login");
		shelterBtn.classList.remove("selected-login");
	});

	// 보호소 
	shelterBtn.addEventListener("click", function() {
		userTypeInput.value = "S";
		shelterBtn.classList.add("selected-login");
		commonBtn.classList.remove("selected-login");
	});
	commonBtn.click();

});


