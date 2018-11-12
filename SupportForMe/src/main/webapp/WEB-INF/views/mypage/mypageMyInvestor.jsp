<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 투자자</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function go_page(p){
	document.searchForm.page.value=p;
	document.searchForm.submit();
}

$(function(){
	investorList();
});
var path = "<c:url value='/'/>"
//사용자 목록 조회 요청
function investorList() {
	$.ajax({
		url:path+'forme/getInvestors',
		type:'GET',
		dataType:'json',		//return 결과가 json임을 뜻함
		error:function(xhr,status,msg){
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
		},
		success:investorListResult
	});
}//userList

//사용자 목록 조회 응답
function investorListResult(data) {
	$("tbody").empty();
	$.each(data,function(idx,item){
		$('<tr>')
		.append($('<td>').html(item.investNo))
		.append($('<td>').html(item.name))
		.append($('<td>').html(item.investmentAmount))
		.append($('<td>').html(item.investDate))
		.append($('<td>').html(item.presentName))
		.append($('<td>').html(item.postcode))
		.append($('<td>').html(item.address))
		.append($('<td>').html(item.email))
		.append($('<td>').html(item.phoneNum))
		.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
		.appendTo('tbody');
	});//each
}//userListResult
</script>
</head>
<body>	
	<div style="height:50px"></div>
	<h3>나의 투자자 보기</h3>
	<div style="height:30px"></div>
	<table class="table table-hover" style="width:1350px">
		<thead>
		<tr>
			<th class="text-center">투자번호</th>
			<th class="text-center">이름</th>
			<th class="text-center">투자금</th>
			<th class="text-center">투자일</th>
			<th class="text-center">선물이름</th>
			<th class="text-center">우편번호</th>
			<th class="text-center">주소</th>
			<th>이메일</th>
			<th>휴대폰번호</th>
		</tr>
		</thead>
		<tbody></tbody>
	</table>
	<div style="width:100%;text-align:center">
		<my:paging paging="${paging}"/>
	</div>
</body>
</html>