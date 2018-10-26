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
<body>

	<div class="wrapper">

		<div class="div2">
			<h1 style="text-align: left;">프로필 설정</h1>
			<table class="table1" border="1" align="center">
				<caption style="text-align: right;">
					<span>*</span>
					<span class="p1">표시는 필수 입력사항 입니다.</span>
				</caption>
				<tbody>
					<tr>
						<th width="150"><span>＊</span>기존 비밀번호</th>
						<td><input type="password" size="10"></td>
					</tr>
					<tr>
						<td><span>＊</span>비밀번호</td>
						<td><input type="password" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>비밀번호확인</td>
						<td><input type="password" size="10"></td>
					</tr>
					<tr>
						<td><span>＊</span>E-mail&nbsp;주소</td>
						<td><input type="email" size="10"> </td>
					</tr>
					<tr>
						<td><span>＊</span>전화번호</td>
						<td>
						<select name="phone2">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input type="text" name="post" size="10"> - <input	type="text" name="post" size="10"></td>
					</tr>

					<tr>
						<td><span>＊</span>주소</td>
						<td>
							<input type="text" size="10" id="postcode" name="postcode"value="" readonly="readonly" > 
							<input type="button" onclick="SearchPostcode()" value="우편번호검색" class=""><br>
							<div id="layer"	style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"	id="btnCloseLayer"	style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"	onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
							<script src="./js/SearchAddr.js"></script>
							<input type="text" id="address" size="60" name="address"value="" readonly="readonly"> 
							<input type="text" size="60" name="addrDetail"value="" >
						</td>
					</tr>
					<tr style="text-align: right;">
						<td colspan="2"><input type="button" value="수정하기"> <input 	type="button" value="취소"></td>
					</tr>
					<tr style="display: none">
						<td><input type="hidden" value=""></td>
						<td><input type="hidden" value=""></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>