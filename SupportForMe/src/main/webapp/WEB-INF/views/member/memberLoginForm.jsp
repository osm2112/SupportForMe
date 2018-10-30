<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<style>
    input.inputtext {
        width : 99%;
    }
    button.loginbutton{
        height: 70px;
        width: 100px;
        background-color: dimgrey;
        color: white;
    }
    .h1text{
        
        display: inline;
            
    }
    button.btn1, button.btn2, button.btn3 {
        width: 100px;
        
    }
    div.div1 {
        padding: 10% 2% 10%;
    }
    div.div2 {
        padding: 10% 0px; border:1px solid black; text-align: left;
    }
    table.table1 {
        margin: auto;
    }
</style>
<body>
	<div>
		<div class="div1">
			<h1 class="h1text">로그인</h1>
			<img src="./images/open-lock.png" width="80px"	height="10%" align="right">
		</div>

		<div class="div2">
		<form action="../support/login" method="post">
			<table class="table1">
				<tr>
					<td>아이디</td>
					<td colspan="2"><input name="userId" class="inputtext" type="text"></td>
					<td rowspan="2"><button type="submit" class="loginbutton">로그인</button></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td colspan="2"><input name="password" class="inputtext" type="password"></td>
				</tr>
			</table>
			</form>
			<table>
				<tr>
					<td></td>
					<td>아이디 또는 비밀번호를 잊으셨나요?</td>
					<td>
						<button class="btn1" onclick="document.location.href='../support/MemberFindIdForm'" >아이디찾기</button>
						<button class="btn2">비밀번호찾기</button>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>회원이 아니라면 가입해주세요</td>
					<td><button class="btn3" onclick="document.location.href='../support/MemberTermsConfirmForm'">회원가입</button></td>
				</tr>
			
			</table>
		</div>
	</div>
</body>
</html>