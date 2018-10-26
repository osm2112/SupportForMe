<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
</head>
<style>
.wrapper {
	display: grid;
	grid-template-columns: 50% auto;
	grid-auto-rows: minmax(100px, auto);
}
/*        .wrapper > div{
        background-color: orange;
        border: 1px black solid;
        }  */
.div1 {
	grid-column: 1/3;
	text-align: center;
}

.div3 {
	text-align: center;
}

.wrapp {
	display: table;
	width: 100%;
	height: 100%;
}

.inner {
	display: table-cell;
	vertical-align: middle;
}
</style>
<script>
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
		
		if (!password || !password2 ) {
			alert('비밀번호가 입력되지 않았습니다.');
			return false;
		}
		
		if (password != password2) {
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}

		if (!email) {
			alert('이메일주소가 입력되지 않았습니다.');
			return false;
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
			var regexp = /^[0-9]*$/;
			if (!regexp.test(tel1) || !regexp.test(tel2) || !regexp.test(tel3)) {
				alert('전화번호는 숫자이여야 합니다.');
				return false;
			}
		}

		var form = document.createElement("form");
		var parm = new Array();
		var input = new Array();
		form.action = "./UpdateMember.do";
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

		<div class="div2">
		<form action="./InsertMember.do" method="get">
			<table class="table1">
				<tbody>
					<tr>
						<td><span>＊</span>아이디</td>
						<td><input id="userId" type="text" size="10" readonly="readonly" value="${member.userId}"></td>
					</tr>
					
					<tr>
						<td width="150"><span>＊</span>이름</td>
						<td><input id="name" type="text" size="10" readonly="readonly" value="${member.name}"></td>
					</tr>

					<tr>
						<td><span>＊</span>새 비밀번호</td>
						<td><input id="password" type="password" size="10"></td>
					</tr>
					
					<tr>
						<td><span>＊</span>비밀번호확인</td>
						<td><input id="password2" type="password" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>E-mail&nbsp;주소</td>
						<td><input id="email" type="email" size="20" value="${member.email}"></td>
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
					<script>
					var phoneNum = '${member.phoneNum}';
					var telArray = phoneNum.split('-');
					document.getElementById("tel1").value=telArray[0];
					document.getElementById("tel2").value=telArray[1];
					document.getElementById("tel3").value=telArray[2];
					</script>
					<tr>
						<td><span>＊</span>주소</td>
						<td>
							<input type="text" size="10" id="postcode" id="postcode" value="${member.postcode}" readonly="readonly"> 
							<input type="button" onclick="SearchPostcode()" value="우편번호검색" class=""><br>
							<div id="layer"	style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"	id="btnCloseLayer"	style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"	onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
							<script src="./js/SearchAddr.js"></script>
							<input type="text" id="address" size="60" id="address" value="${member.address}" readonly="readonly"> 
							<input type="text" size="60" id="addrDetail"value="${member.addrDetail}" >
						</td>
					</tr>
					<tr>
						<td>자기소개</td>
						<td><textarea id="introduction"class="textarea1">${member.introduction}</textarea></td>
					</tr>
					<tr style="text-align: right;">
						<td colspan="2">
							<input type="button" onclick="UpdateMember()" value="수정하기"> 
							<input type="button" value="취소">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		</div>
	</div>
</body>
</html>