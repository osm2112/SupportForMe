<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 비밀번호 찾기</title>
</head>
<body>
<div>
	<h5>가입시 정보를 입력하여 주세요</h5>
	<form action="../support/FindPassword" method="post">
		ID : <input name="userId" type="text"><br>
		이름 : <input name="name" type="text"><br>
		EMAIL : <input name="email" type="text" ><input type="submit" value="ID 찾기">
	</form>
	<h5>비밀번호는 가입하실때 입력하신 Email로 발송 됩니다</h5>

</div>
</body>
</html>