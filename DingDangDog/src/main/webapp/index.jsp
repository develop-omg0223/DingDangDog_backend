<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 테스트</h1>

	번호 : ${sessionScope.userNumber}
	<br> 닉네임 : ${sessionScope.userNickname}
	<br> 타입 : ${sessionScope.userType}
</body>
</html>
