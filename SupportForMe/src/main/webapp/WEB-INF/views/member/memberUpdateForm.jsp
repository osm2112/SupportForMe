<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<script>
	var passwordRegexCheck = false;

	function PasswordRegexCheck() {
		var password = document.getElementById("password").value;
		// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
		var passwordRegex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if (passwordRegex.test(password)) {
			document.getElementById("PasswordRegexCheck").innerHTML = '사용할수 있는 비밀 번호 입니다.';
			passwordRegexCheck = true;
		} else {
			document.getElementById("PasswordRegexCheck").innerHTML = '<font color="red">비밀번호는 특수문자 /문자/ 숫자를 한자 이상  포함 형태의 8~15자리 이내여야 합니다.</font>';
			passwordRegexCheck = false;
		}
	}

	function UpdateMember() {
		var userId = document.getElementById("userId").value;
		var password = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		var tel1 = document.getElementById("tel1").value;
		var tel2 = document.getElementById("tel2").value;
		var tel3 = document.getElementById("tel3").value;
		var postcode = document.getElementById("postcode").value;
		var address = document.getElementById("address").value;
		var addrDetail = document.getElementById("addrDetail").value;
		var introduction = document.getElementById("introduction").value;

		if (!password || !password2) {
			alert('비밀번호가 입력되지 않았습니다.');
			return false;
		}

		if (password != password2) {
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}

		if (passwordRegexCheck == false) {
			alert('비밀번호는 특수문자 /문자/ 숫자를 한자 이상  포함 형태의 8~15자리 이내여야 합니다.');
			return false;
		}

		if (!email) {
			alert('이메일주소가 입력되지 않았습니다.');
			return false;
		} else {
			var emailRegexp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
			if (!emailRegexp.test(email)) {
				alert('이메일 주소 형식은 OOO@OOO.OOO 입니다.');
				return false;
			}
		}
		if (!postcode || !address || !addrDetail) {
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
			var regexp = /[0-9]{4}/;
			if (!regexp.test(tel2) || !regexp.test(tel3)) {
				alert('전화번호는 숫자이여야 합니다.');
				return false;
			}
		}

		var check = confirm('ID : ' + userId + '\n' + '이름 : ' + name + '\n'
				+ '이메일 : ' + email + '\n' + '전화번호 : ' + tel1 + '-' + tel2 + '-'
				+ tel3 + '\n' + '우편번호 : ' + postcode + '\n' + '주소 : ' + address
				+ '\n' + '상세주소 : ' + addrDetail + '\n' + '나의 소개 : '
				+ introduction + '\n' + '상기의 정보로 회원 가입을 하시겠습니까?');
		if (check) {
			var form = document.createElement("form");
			var parm = new Array();
			var input = new Array();
			form.action = "../forme/UpdateMember";
			form.method = "post";
			parm.push([ 'userId', userId ]);
			parm.push([ 'password', password ]);
			parm.push([ 'name', name ]);
			parm.push([ 'phoneNum', tel1 + '-' + tel2 + '-' + tel3 ]);
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
	}
</script>
<body>
	<table class="table1" border="1" >
		<tbody>
			<tr style="color: lightgrey">
				<th><span>＊</span>아이디</th>
				<td><input id="userId" type="text" size="10"
					readonly="readonly" value="${member.userId}"
					style="color: lightgrey"></td>
			</tr>

			<tr style="color: lightgrey">
				<th width="150"><span>＊</span>이름</th>
				<td><input id="name" type="text" size="10" readonly="readonly"
					value="${member.name}" style="color: lightgrey"></td>
			</tr>

			<tr>
				<th><span>＊</span>새 비밀번호</th>
				<td><input id="password" type="password" size="10"
					maxlength="15" onkeyup="PasswordRegexCheck()"><br> <span
					id="PasswordRegexCheck"><font color="red">비밀번호는 특수문자
							/문자/ 숫자를 한자 이상 포함 형태의 8~15자리 이내여야 합니다.</font></span></td>
			</tr>

			<tr>
				<th><span>＊</span>비밀번호확인</th>
				<td><input id="password2" type="password" size="10"></td>
			</tr>

			<tr style="color: lightgrey">
				<th><span>＊</span>E-mail&nbsp;주소</th>
				<td><input id="email" type="email" size="20"
					value="${member.email}" readonly="readonly"
					style="color: lightgrey"><br></td>
			</tr>
			<tr>
				<th><span>＊</span>전화번호</th>
				<td><select id="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select> - <input type="text" id="tel2" size="10" maxlength="4"> - <input
					type="text" id="tel3" size="10" maxlength="4"></td>
			</tr>
			<script>
				var phoneNum = '${member.phoneNum}';
				var telArray = phoneNum.split('-');
				document.getElementById("tel1").value = telArray[0];
				document.getElementById("tel2").value = telArray[1];
				document.getElementById("tel3").value = telArray[2];
			</script>
			<tr>
				<th><span>＊</span>주소</th>
				<td><input type="text" size="10" id="postcode" id="postcode"
					value="${member.postcode}" readonly="readonly"> <input
					type="button" onclick="SearchPostcode()" value="우편번호검색" class=""><br>
					<div id="layer"
						style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
						<img
							src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
							id="btnCloseLayer"
							style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
							onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div> <script src="../js/SearchAddr.js"></script> <input type="text"
					id="address" size="60" id="address" value="${member.address}"
					readonly="readonly"><br> <input type="text" size="60"
					id="addrDetail" value="${member.addrDetail}"></td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td><textarea id="introduction" class="textarea1">${member.introduction}</textarea></td>
			</tr>
			<tr style="text-align: right;">
				<td colspan="2"><input type="button" onclick="UpdateMember()"
					value="정보수정하기"> <input type="button"
					onclick="location.href='../forme/MemberDeleteConfirmForm'"
					value="회원탈퇴하기"> <input type="button" value="취소"></td>
			</tr>
		</tbody>
	</table>
</body>
</html>