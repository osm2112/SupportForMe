<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 결제 내역보기</title>
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
	
</script>
</head>
<!-- <div class="input-group" style="width:1200px;">
	<input type="hidden" name="page" value="1">
	<select name="searchCondition" class="form-control" style="width:200px;">
		<option value="">전체</option>>
		<option value="projectName">프로젝트명</option>
		<option value="name">프로젝트작성자</option>
		<option value="userId">프로작성자ID</option>
	</select>
	<select name="progress" class="form-control" style="width:200px;">
		<option value="">프로젝트진행상태</option>
		<option value="001">진행중</option>
		<option value="002">마감</option>
		<option value="003">무산</option>
		<option value="004">제작중</option>
		<option value="005">보류</option>
		<option value="006">완료</option>
	</select>
	<input type="text" name="searchKeyword" value="" class="form-control" style="width:600px;">
	<input type="submit" class="btn _btn2" value="검색" style="width:200px;">
	<script>
		document.searchForm.searchCondition.value ='${searchCondition}';
		document.searchForm.searchKeyword.value ='${searchKeyword}';
		document.searchForm.progress.value ='${progress}';
	</script>
</div> -->


<body>
	<h3>결제 내역 보기</h3>
<form action="../forme/InvestList" name="searchForm">
<div class="input-group">
	<input type="hidden" name="page" value="1">
	<select name="searchCondition" class="form-control" style="width:120px;">
	<option value="">전체</option>
		<option value="projectName">프로젝트명</option>	
		<option value="investNo">결제번호</option>
	</select>
	<select name="payType" class="form-control" style="width:120px;">
	<option value="">결제유형</option>
		<option value="신용카드">신용카드</option>	
		<option value="계좌결제">계좌결제</option>
		<option value="휴대폰결제">휴대폰결제</option>
	</select>
	<input type="date" name="startdate" class="form-control" style="width:150px;"><input type="date" name="enddate" class="form-control" style="width:150px;">
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

	<table class="table table-hover">
		<tr><td>결제번호</td><td>프로젝트명</td><td>결제금액</td><td>결제방법</td><td>결제상태</td><td>결제일</td></tr>
		<c:forEach items="${list}" var="list">
		<tr><td><a href="../forme/InvestDetail?investNo=${list.investNo}">${list.investNo }</a></td><td>${list.projectName }</td><td>${list.invenstAmount }</td><td>${list.payType}</td><td>${list.paymentState }</td><td>${list.investDate }</td></tr>
	</c:forEach>
	</table>
	<div style="width:100%;text-align:center">
		<my:paging paging="${paging}"/>
	</div>
</body>
</html>