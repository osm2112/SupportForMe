<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 세부 내역</title>
</head>
<body>
	<table border="1">
		
		<tr>
			<td>결제번호</td>
			<td>${invest.investNo }</td>
		</tr>
		<tr>
			<td>프로젝트명</td>
			<td>${invest.projectName }</td>
		</tr>

		<tr>
			<td>결제금액</td>
			<td>${invest.invenstAmount }</td>
		</tr>
		<tr>
			<td>결제방식</td>
			<td>${invest.payType }</td>
		</tr>
		<tr>
			<td>결제상태</td>
			<td>${invest.paymentState }</td>
		</tr>
		<tr>
			<td>선택 리워드</td>
			<td>${invest.presentName }</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${invest.postcode}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${invest.address }</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td>${invest.addrDetail }</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${invest.phoneNum }</td>
		</tr>
		<tr>
			<td>EMail</td>
			<td>${invest.email }</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="뒤로 가기" onclick="history.back()"></td>
		</tr>
	</table>
</body>
</html>