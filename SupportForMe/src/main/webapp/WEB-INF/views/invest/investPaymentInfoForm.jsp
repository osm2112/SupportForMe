<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>결제</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
<script>
	function AddrInput(){
		var input = document.querySelector("input[id=inputAddr]").checked;
		if( input == true){
			$.ajax({
				url : "../forme/AddrInput",
				method : "post",
				type : "json",
				success : function(data) {
					document.querySelector("#name").value = data.name;
					document.querySelector("#postcode").value = data.postcode;
					document.querySelector("#email").value = data.email;
					document.querySelector("#address").value = data.address;
					document.querySelector("#addrDetail").value = data.addrDetail;
					var phoneNum = data.phoneNum
					var telArray = phoneNum.split('-');
					document.querySelector("#tel1").value = telArray[0];
					document.querySelector("#tel2").value = telArray[1];
					document.querySelector("#tel3").value = telArray[2];
					
				}
			});
		} else {
			document.querySelector("#name").value = '';
			document.querySelector("#postcode").value = '';
			document.querySelector("#email").value = '';
			document.querySelector("#address").value = '';
			document.querySelector("#addrDetail").value = '';
			document.querySelector("#tel1").value =  '';
			document.querySelector("#tel2").value =  '';
			document.querySelector("#tel3").value =  '';
		}
	}
/* 	let 
	$(document).ready(function() {	
		IMP.init('imp55982631');	
		$("#btn").click(function(){
			$.ajax({
				url : "../forme/CheckEmail",
				method : "post",
				type : "json",
				success : function(data) {
					
				}
			});
		},function() {	
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : amount,
			    buyer_email : buyer_email,
			    buyer_name : buyer_name
			    buyer_tel :  buyer_tel,
			    buyer_addr : buyer_addr
			   // buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {

			    	
			    	
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }

			    alert(msg);
			});
		});
		
		
	});
	 */
	function PaymentInfo(){
		 $.ajax({
				url : "../forme/PaymentInfo",
				method : "post",
				type : "json",
				success : function(data) {
					
				}
			});

		
	}
</script>
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
			<input type="radio" name="" checked> 카드결제
			<hr>
			<table>
				<tbody>
					<tr>
						<td colspan="2">배송정보 입력</td>
					</tr>
					<tr>
						<td colspan="2"><input id="inputAddr" type="checkbox" onclick="AddrInput()">결제자와 동일</td>
					</tr>
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
						<td>주소</td>
						<td>
							<input type="text" size="10" id="postcode" id="postcode"value="" readonly="readonly"> 
							<input type="button" onclick="SearchPostcode()" value="우편번호검색" class=""><br>
							<div id="layer"	style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
								<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"	id="btnCloseLayer"	style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"	onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
							<script src="../js/SearchAddr.js"></script>
							<input type="text" id="address" size="60" id="address"value="" readonly="readonly"><br>
							<input type="text" size="60" id="addrDetail"value="" >
						</td>
					</tr>
					<tr>
						<td>배송시 요청사항</td>
						<td><textarea id=""></textarea></td>
					</tr>
					<tr>
						<td>선택 리워드</td>
						<td>${presentName}</td>
					</tr>
					<tr>
						<td>추가 투자 금액</td>
						<td>${price2}원</td>
					</tr>
					<tr>
						<td>총 결제 금액</td>
						<td>${allAmount}원</td>
					</tr>	
					<tr>
						<td colspan="2">
							<input type="button" value="결제하기"	style="background: rgb(26, 188, 156); color: white">
							<input type="button" value="취소"	style="background: rgb(26, 188, 156); color: white">	
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</session>
	</div>
</body>
</html>
