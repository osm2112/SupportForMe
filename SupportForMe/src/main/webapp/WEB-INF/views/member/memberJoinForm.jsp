<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<script>
	var idCheck = false;
	var emailCheck = false;
	function CheckId(){
		var  userid = document.getElementById("userId").value;
		$.ajax({
			url : "../support/CheckId?userId="+userid,
			method : "post",
			type : "text",
			success : function(data) {
				if(data == 0){
					document.getElementById("checkIdResult").innerHTML = '사용할수 있는  ID입니다.';
					idCheck = true;
				} else {
					document.getElementById("checkIdResult").innerHTML = '<font color="red">사용할수 없는 ID입니다.</font>';
					idCheck = false;
				}
			}
		});
	}
	
	
	function CheckEmail(){
		var  email = document.getElementById("email").value;
		$.ajax({
			url : "../support/CheckEmail?email="+email,
			method : "post",
			type : "text",
			success : function(data) {
				if(data == 0){
					document.getElementById("checkEmailResult").innerHTML = '사용할수 있는  Email입니다.';
					emailCheck = true;
				} else {
					document.getElementById("checkEmailResult").innerHTML = '<font color="red">사용할수 없는 Email입니다.</font>';
					emailCheck = false;
				}
			}
		});
	}

	function InsertMember(){
			var  userId = document.getElementById("userId").value;
			var  password = document.getElementById("password").value;
			var  password2 = document.getElementById("password2").value;
			var  name = document.getElementById("name").value;
			var  email = document.getElementById("email").value;
			var  tel1 = document.getElementById("tel1").value;
			var  tel2 = document.getElementById("tel2").value;
			var  tel3 = document.getElementById("tel3").value;
			var  postcode = document.getElementById("postcode").value;
			var  address = document.getElementById("address").value;
			var  addrDetail = document.getElementById("addrDetail").value;
			var  introduction = document.getElementById("introduction").value;
				if(idCheck == false){
					alert('해당 ID는 중복된 ID 입니다.');
					return false;
				}
				if(emailCheck == false){
					alert('해당  Email은 중복된 Email 입니다.');
					return false;
				}
				if (!userId) {
					alert('ID가 입력되지 않았습니다.');
					return false;
				}
				if (!password) {
					alert('비밀번호가 입력되지 않았습니다.');
					return false;
				}
				if(password != password2) {
					alert('비밀번호가 일치하지 않습니다.');
					return false;
				}
				if (!name) {
					alert('이름이 입력되지 않았습니다.');
					return false;
				}
				if (!email) {
					alert('이메일주소가 입력되지 않았습니다.');
					return false;
				}
				if (!postcode||!address||!addrDetail) {
					alert('주소가 입력되지 않았습니다.');
					return false;
				}
			
				if (!introduction) {
					alert('자기소개가 입력되지 않았습니다.');
					return false;
				}


				if (!tel1 || !tel2 || !tel3) {
					alert('전화번호가 입력 되지 않았습니다.');
					return false;
				} else {
					var regexp = /^[0-9]*$/;
					if (!regexp.test(tel1) || !regexp.test(tel2) || !regexp.test(tel3)){
						alert('전화번호는 숫자이여야 합니다.');
						return false;
					}
				}

				var form = document.createElement("form");
				var parm = new Array();
				var input = new Array();
				form.action = "../support/InsertMember";
				form.method = "post";
				parm.push([ 'userId', userId ]);
				parm.push([ 'password', password ]);
				parm.push([ 'name', name ]);
				parm.push([ 'phoneNum', tel1+'-'+tel2+'-'+tel3 ]);
				parm.push([ 'email', email ]);
				parm.push([ 'postcode', postcode ]);
				parm.push([ 'address', address ]);
				parm.push([ 'addrDetail', addrDetail ]);
				parm.push([ 'introduction', introduction ]);
				
				for (var i = 0; i < parm.length; i++) {
					input[i] = document.createElement("input");
					input[i].setAttribute("type", "hidden");
					input[i].setAttribute('name', parm[i][0]);
					input[i].setAttribute("value", parm[i][1]);
					form.appendChild(input[i]);
				}
				document.body.appendChild(form);
				form.submit();
	}

</script>
<body>
	<div class="wrapper">
		<div class="div1">
			<h1 style="text-align: left;">회원가입</h1>
			<br> <img src="../images/회원이미지2.png" width="80%">
		</div>
		<div class="div2">
	
			<table class="table1">
				<caption>
					<span>*</span> 
					<span class="p1">표시는 필수 입력사항 입니다.</span>
				</caption>
				<tbody>


					<tr>
						<td><span>＊</span>아이디</td>
						<td><input id="userId" type="text" size="10" onkeyup="CheckId()"><span id="checkIdResult"></span></td>
					</tr>
					
					<tr>
						<td width="150"><span>＊</span>이름</td>
						<td><input id="name" type="text" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>비밀번호</td>
						<td><input id="password" type="password" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>비밀번호확인</td>
						<td><input id="password2" type="password" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>E-mail&nbsp;주소</td>
						<td><input id="email" type="email" size="20" onkeyup="CheckEmail()"><span id="checkEmailResult"></span></td>
					</tr>
					<tr>
						<td><span>＊</span>전화번호</td>
						<td><select id="tel1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input type="text" id="tel2" size="10"> - <input type="text" id="tel3" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>주소</td>
						<td>
							<input type="text" size="10" id="postcode" id="postcode"value="" readonly="readonly"> 
							<input type="button" onclick="SearchPostcode()" value="우편번호검색" class=""><br>
							<div id="layer"	style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"	id="btnCloseLayer"	style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"	onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
							<script src="../js/SearchAddr.js"></script>
							<input type="text" id="address" size="60" id="address"value="" readonly="readonly"> 
							<input type="text" size="60" id="addrDetail"value="" >
						</td>
					</tr>
					<tr>
						<td>자기소개</td>
						<td><textarea id="introduction"class="textarea1"> </textarea></td>
					</tr>
					<tr style="text-align: right;">
						<td colspan="2">
							<input type="button" onclick="InsertMember()" value="회원가입하기"> 
							<input type="button" value="취소">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>