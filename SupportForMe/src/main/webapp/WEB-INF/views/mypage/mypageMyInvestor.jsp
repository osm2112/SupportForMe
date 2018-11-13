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
<style>
._btn {
	margin-left: 15px;
}

._btn2 {
	background: rgb(26, 188, 156);
	color: white;
}
.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
  background: rgb(26, 188, 156);
  border-color: rgb(26, 188, 156);
}
.pagination{
	text-align: center;
}
</style>
<script>
function go_page(p){
	document.searchForm.page.value=p;
	document.searchForm.submit();
}

/*  $(function(){
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
	console.log(data.length);
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
	var paging = data[data.length-1].paging;
	var page = "";
	$("#page").append(page);
	
}//userListResult  */
</script>
</head>
<body>	
	<div style="height:50px"></div>
	<h3>나의 투자자 보기</h3>
	<div style="height:30px"></div>
	<form action="<c:url value='/'/>forme/MyInvestors" name="searchForm">
	<div class="input-group">
		<input type="hidden" name="page" value="1">
		<select name="searchCondition" class="form-control" style="width:120px;">
		<option value="">전체</option>
			<option value="projectName">프로젝트명</option>	
			<option value="investNo">투자번호</option>
			<option value="presentName">선물명</option>
			<option value="address">주소</option>
		</select>
		<input type="text" name="searchKeyword" value="" class="form-control" style="width:300px;">
		<input type="submit" value="검색" class="btn _btn2">
		<script>
			document.searchForm.searchCondition.value ='${searchCondition}';
			document.searchForm.startdate.value ='${startdate}';
			document.searchForm.enddate.value ='${enddate}';
			document.searchForm.searchKeyword.value ='${searchKeyword}';
			document.searchForm.payType.value ='${payType}';
		</script>
	</div>
	</form>
	
	<table class="table table-hover" style="width:1350px">
		<thead>
		<tr>
			<th class="text-center">투자번호</th>
			<th class="text-center">이름</th>
			<th class="text-center">선물명</th>
			<th class="text-center">우편번호</th>
			<th class="text-center">주소</th>
			<th>이메일</th>
			<th>휴대폰번호</th>
			<th>프로젝트 이름</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${investor}" var="investor">
			<tr>
				<td class="text-center">${investor.investNo}</td>
				<td class="text-center">${investor.name}</td>
				<td class="text-center">${investor.presentName}</td>
				<td class="text-center">${investor.postcode}</td>
				<td class="text-center">${investor.address}</td>
				<td>${investor.email}</td>
				<td>${investor.phoneNum}</td>
				<td>${investor.projectName}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="width:100%;text-align:center" id="page">
		<my:paging paging="${paging}"/>
	</div>
</body>
</html>