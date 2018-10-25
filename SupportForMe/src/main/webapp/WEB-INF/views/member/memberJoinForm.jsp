<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<style>
.wrapper {
	display: grid;
	grid-template-columns: 1fr 1fr;
	/*grid-template-rows: 80% 50%; */
	grid-auto-rows: minmax(100px, auto);
}
/*    .wrapper > div {
        background-color: aquamarine;
        border: 1px solid red;
    }*/
.div1 {
	grid-column: 1/3;
	text-align: center;
}

.div2 {
	grid-column: 1/3;
}

.table1 {
	table-layout: fixed;
	width: 800px;
	height: 300px;
	align : center;
	border: 1px solid;
}

span {
	color: blue;
}

p.p1 {
	display: inline;
}

textarea.textarea1 {
	resize: none;
	width: 95%;
	height: 80px;
}
caption{
	text-align: right;
}
</style>
</head>

<body>
	<div class="wrapper">
		<div class="div1">
			<h1 style="text-align: left;">회원가입</h1>
			<br> <img src="./webapp/images/회원이미지2.png" width="80%">
		</div>
		<div class="div2">
			<table class="table1">
				<caption>
					<span>*</span> 
					<span class="p1">표시는 필수 입력사항 입니다.</span>
				</caption>
				<tbody>
					<tr>
						<td width="150"><span>＊</span>이름</td>
						<td>이름</td>
					</tr>

					<tr>
						<td><span>＊</span>아이디</td>
						<td><input name="userid" type="text" size="10"> <input type="button" value="아이디중복확인"></td>
					</tr>

					<tr>
						<td><span>＊</span>비밀번호</td>
						<td><input name="password" type="password" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>비밀번호확인</td>
						<td><input type="password" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>E-mail&nbsp;주소</td>
						<td><input name="email" type="email" size="20"></td>
					</tr>
					<tr>
						<td><span>＊</span>전화번호</td>
						<td><select name="phone">
								<option value="1" checked>010</option>
								<option value="2">011</option>
								<option value="2">016</option>
								<option value="2">017</option>
								<option value="2">018</option>
								<option value="2">019</option>
						</select> - <input type="text" name="post" size="10"> - <input type="text" name="post" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>주소</td>
						<td>
							<input type="text" size="10"> 
							<input type="button" value="우편번호 검색"> 
							<input type="text" size="60"> 
							<input type="text" size="60">
						</td>
					</tr>
					<tr>
						<td>자기소개</td>
						<td><textarea class="textarea1"> </textarea></td>
					</tr>
					<tr style="text-align: right;">
						<td colspan="2">
							<input type="button" value="회원가입하기"> 
							<input type="button" value="취소">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>