<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>결제</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.bodysize {
	margin-left: auto;
	margin-right: auto;
	width: 1200px;
}

session {
	margin-left: 50px;
}

nav {
	padding-top: 50px
}
</style>
<body>
	<div class="bodysize">
		<nav style="float: left">
			<div style="width: 150px">
				<div>리워드 선택</div>
				<div style="background: rgb(26, 188, 156)">결제</div>
				<div>내역 확인</div>
			</div>
		</nav>
		<session style="float: left">
		<div style="width: 1000px">
			<h3>결제방식 선택</h3>
			<hr>
			<input type="radio" name="" selected> 카드결제
			<hr>
			<table>
				<caption>
					<span>배송정보 입력</span> 					
				</caption>
				<tbody>
					<tr>
						<td width="150">이름</td>
						<td><input id="name" type="text" size="10"></td>
					</tr>
					<tr>
						<td>E-mail&nbsp;주소</td>
						<td><input id="email" type="email" size="20"></td>
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
						<td colspan="2">
							<input type="button" value="결제하기"	style="background: rgb(26, 188, 156); color: white">	
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</session>
	</div>
</body>
</html>
