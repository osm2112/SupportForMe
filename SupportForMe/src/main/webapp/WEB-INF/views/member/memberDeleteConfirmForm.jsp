<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
</head>
<script>
	function Confirm(){
		var check = confirm('정말 탈퇴 하시겠습니까?');
		if(check){
			var form = document.getElementById('frm');
			form.submit();
		}
	}
</script>
<body>
	<form id="frm" action="../forme/MemberDeletePassWordCheck" method="post">
		<input type="password" name="password" id = password><input type="submit" onclick="Confirm()" value="확인" >
	</form>
</body>
</html>