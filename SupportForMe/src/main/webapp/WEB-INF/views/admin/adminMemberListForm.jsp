<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리</title>
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
</head>
<body>
	<h3>회원관리</h3>
<form action="../forme/AdminMemberList" name="searchForm">
	<input type="hidden" name="page" value="1">
	<select name="searchCondition">
	<option value="">전체</option>
		<option value="userId">ID</option>
		<option value="name">이름</option>	
		<option value="email">Email</option>
		<option value="phoneNum">전화번호</option>
	</select>
	<input type="text" name="searchKeyword" value="">
	<input type="submit" value="검색">
	<script>
		document.searchForm.searchCondition.value ='${searchCondition}';
		document.searchForm.searchKeyword.value ='${searchKeyword}';
	</script>
</form>

	<table border="1">
		<tr>
			<td>선택</td>
			<td>ID</td>
			<td>이름</td>
			<td>Email</td>
			<td>전화번호</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>상세주소</td>
		</tr>
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
				<input type="button" value="회원 탈퇴 처리" onclick="DeleteMembers()">
			</td>
		</tr>
	</table>
	<my:paging paging="${paging}"/>
</body>
</html>