<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function go_page(p){
		document.searchForm.page.value=p;
		document.searchForm.submit();
	}
	function DeleteMembers(){
		var check= confirm('선택하신 회원을 정말 탈퇴 시키겠습니까?');
		var ids='';
		var getIds = document.getElementsByName('ids');
		for(var i = 0 ; i < getIds.length ; i++ ){
			if(getIds[i].checked ==true){	
				ids += getIds[i].value+'|';
			}
		}
		if(check){
			var form = document.createElement("form");
			var input = document.createElement("input"); 
			form.action = "../forme/AdminDeleteMembers";
			form.method = "post";
			input.setAttribute("type", "hidden");
			input.setAttribute('name', "ids");
			input.setAttribute("value", ids);
			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		}else {
			return false;
		}
		
		
	}
</script>
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
</head>
<body>
<h3>회원관리</h3>
<hr>
<form action="../forme/AdminMemberList" name="searchForm">
<div class="input-group" style="width:1200px;">
	<input type="hidden" name="page" value="1">
	<select name="searchCondition" class="form-control" style="width:200px;">
	<option value="">전체</option>
		<option value="userId">ID</option>
		<option value="name">이름</option>	
		<option value="email">Email</option>
		<option value="phoneNum">전화번호</option>
	</select>
	<input type="text" name="searchKeyword" value="" class="form-control" style="width:800px;">
	<input type="submit" class="btn _btn2" value="검색" style="width:200px;">
	<script>
		document.searchForm.searchCondition.value ='${searchCondition}';
		document.searchForm.searchKeyword.value ='${searchKeyword}';
	</script>
</div>
</form>

	<table class="table table-hover" style="width:1200px">
		<thead>
		<tr>
			<th>선택</th>
			<th>ID</th>
			<th>이름</th>
			<th>Email</th>
			<th>전화번호</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<td><input type="checkbox" name="ids" value="${list.userId}"></td>
				<td>${list.userId}</td>
				<td>${list.name}</td>
				<td>${list.email}</td>
				<td>${list.phoneNum}</td>
				<td>${list.postcode}</td>
				<td>${list.address}</td>
				<td>${list.addrDetail}</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="8">
				<my:paging paging="${paging}"/>
				<input type="button" value="회원 탈퇴 처리" class="btn _btn _btn2 pull-right" onclick="DeleteMembers()">
			</td>
		</tr>
		</tbody>
	</table>
	
</body>
</html>