<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
<h3>비밀번호를 입력하여 주세요.</h3>
<hr>
	<form action="../forme/MemberUpdatePassWordCheck" method="post">
	<input type="password" name="password" id = password><input type="submit" value="확인" >
	</form>
</body>
</html>