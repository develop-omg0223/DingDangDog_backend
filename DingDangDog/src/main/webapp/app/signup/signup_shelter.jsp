
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ë³´í¸ì íì íìê°ì</title>
<link rel="stylesheet" href="/assets/css/signup/signup_shelter.css">
</head>
<body>
	<header></header>
	<main>
		<div class="main-shelter-title">ë³´í¸ìíì</div>
		<form action="">
			<div class="main-shelter-container">

				<div class="main-form-shelter-id">
					<div class="main-container-shelter-id">
						<div class="main-input-shelter-id">
							<div class="main-input-id-shelter-writing">
								<label for="user-shelter-id">ìì´ë</label>
							</div>
							<input type="text" id="user-shelter-id" name="user-shelter-id">
						</div>
						<div class="id-shelter-btn">
							<button type="button">ì¤ë³µíì¸</button>
						</div>
					</div>
					<div class="main-form-id-shelter-message">
						<p>íìëì ìì´ëê° ì¤ë³µ ëììµëë¤</p>
					</div>
				</div>

				<div class="main-form-shelter-pw">
					<div class="main-container-shelter-pw">
						<div class="main-input-shelter-pw">
							<div class="main-input-pw-shelter-writing">
								<label for="user-shelter-pw">ë¹ë°ë²í¸</label>
							</div>
							<input type="password" id="user-shelter-pw"
								name="user-shelter-pw"> <span>ë</span>
						</div>
						<div class="main-form-pw-shelter-message">
							<p>ìë¬¸,ì«ì,í¹ìë¬¸ì í¬í¨ 8ìë¦¬ì´ì ìë ¥</p>
						</div>
					</div>
				</div>

				<div class="main-form-shelter-checkpw">
					<div class="main-container-shelter-checkpw">
						<div class="main-input-shelter-checkpw">
							<div class="main-input-checkpw-shelter-writing">
								<label for="user-pw-shelter-check">ë¹ë°ë²í¸
									ì¬ìë ¥</label>
							</div>
							<input type="password" id="user-pw-shelter-check"
								name="user-pw-shelter-check"> <span>ë</span>
						</div>
					</div>
					<div class="main-form-checkpw-shelter-message">
						<p>ë¹ë°ë²í¸ê° ì¼ì¹íì§ ììµëë¤</p>
					</div>
				</div>

				<div class="main-form-sheltername">
					<div class="main-input-sheltername">
						<label for="sheltername">ë³´í¸ìëª</label>
					</div>
					<input type="text" id="sheltername" name="user-sheltername">
				</div>

				<div class="main-form-shelter-nickname">
					<div class="main-container-shelter-nickname">
						<div class="main-input-shelter-nickname">
							<div class="main-input-nickname-shelter-writing">
								<label for="user-shelter-nickname">ëë¤ì</label>
							</div>
							<input type="text" id="user-shelter-nickname"
								name="user-shelter-nickname">
						</div>
						<div class="nickname-shelter-btn">
							<button type="button">ì¤ë³µíì¸</button>
						</div>
					</div>
					<div class="main-form-nickname-shelter-message">
						<p>íìëì ëë¤ìì´ ì¤ë³µ ëììµëë¤</p>
					</div>
				</div>

				<div class="main-form-shelter-name">
					<div class="main-container-shelter-name">
						<div class="main-name-shelter-writing">
							<label for="user-shelter-name">ì´ë¦</label>
						</div>
						<input type="text" id="user-shelter-name" name="user-shelter-name">
					</div>
					<div class="user-gender-shelter-container">
						<div class="user-gender-container-shelter-male">
							<span class="user-gender-shelter-male">ë¨</span> <input
								type="radio" id="user-shelter-male" name="user-shelter-gender"
								value="ë¨">
						</div>
						<div class="user-gender-container-shelter-female">
							<label for="user-shelter-female">ì¬</label> <input type="radio"
								id="user-shelter-female" name="user-shelter-gender" value="ì¬">
						</div>
					</div>
				</div>

				<div class="main-form-shelter-birth">
					<div class="main-form-shelter-container">
						<div class="main-birth-shelter-writing">
							<label for="user-shelter-birth">ìëìì¼</label>
						</div>
						<input type="text" id="user-shelter-birth"
							name="user-shelter-birth">
					</div>
					<div class="main-birth-shelter-message">ex&#41;2000-00-00</div>
				</div>

				<div class="main-form-shelter-address">
					<div class="main-container-shelter-address">
						<div class="main-address-shelter-writing">
							<label for="user-shelter-address">ì£¼ì</label>
						</div>
						<input type="text" id="user-shelter-address"
							name="user-shelter-address">
					</div>
					<div class="address-shelter-btn">
						<button type="button">ì°í¸ë²í¸ ì°¾ê¸°</button>
					</div>
				</div>

				<div class="main-form-shelter-business">
					<div class="main-container-shelter-business">
						<div class="main-input-shelter-business">
							<div class="main-business-shelter-writing">
								<label for="user-shelter-business">ì¬ìì
									ë±ë¡ë²í¸</label>
							</div>
							<input type="text" id="user-shelter-business"
								name="user-shelter-business">
						</div>
						<div class="user-business-shelter-message">
							<p>ì¬ìì ë±ë¡ë²í¸ 10ìë¦¬ë¥¼ ì íí
								ìë ¥í´ì£¼ì¸ì</p>
						</div>
					</div>
				</div>

				<div class="main-form-shelter-phone">
					<div class="main-container-shelter-phone">
						<div class="main-phone-shelter-writing">
							<label for="user-shelter-phone">í´ëí° ë²í¸</label>
						</div>
						<input type="text" id="user-shelter-phone"
							name="user-shelter-phone">
						<div class="phone-shelter-btn">
							<button type="button">ì¸ì¦ë²í¸ ì ì¡</button>
						</div>
					</div>
					<div class="main-phone-shelter-message">
						<p>ì¸ì¦ë²í¸ ë°ì¡ì ì¤í¨íìµëë¤. ì ë³´ë¥¼ ë¤ì
							íì¸í´ì£¼ì¸ì.</p>
					</div>
				</div>

				<div class="main-form-shelter-verification">
					<div class="main-container-shelter-verification">
						<div class="main-input-shelter-verification">
							<div class="main-verification-shelter-writing">
								<label for="user-shelter-verification">ì¸ì¦ë²í¸</label>
							</div>
							<input type="text" id="user-shelter-verification"
								name="user-shelter-verification">
						</div>
						<div class="verification-shelter-btn">
							<button type="button">ì¸ì¦ë²í¸ íì¸</button>
						</div>
					</div>
					<div class="main-verification-shelter-message">
						<p>ì¸ì¦ë²í¸ê° ì¼ì¹íì§ ììµëë¤</p>
					</div>
				</div>

				<div class="main-form-shelter-emailAddress">
					<div class="main-container-shelter-emailAddress">
						<div class="main-emailAddress-shelter-writing">
							<label for="email-shelter-user">ì´ë©ì¼ ì£¼ì</label>
						</div>
						<input type="text" id="email-shelter-user"
							name="email-shelter-user">
					</div>
				</div>
				<div class="signup-shelter-btn">
					<button type="submit">íìê°ì</button>
				</div>
			</div>

		</form>
	</main>
	<footer></footer>