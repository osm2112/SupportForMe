<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서포미픽 관리</title>
</head>
<body>
	<h3>서포미 픽 관리</h3>
	<hr>
	<script>
	function go_page(p){
		document.searchForm.page.value=p;
		document.searchForm.submit();
	}
	function SupportForMePickUp(s){
		var flag = s;
		if(flag=='no'){
			var check= confirm('선택하신 프로젝트의 서포미픽을 해제하시겠습니까?');
		} else if (flag=='yes') {
			var check= confirm('선택하신 프로젝트의 서포미픽으로 선택하시겠습니까?');
		}
		var ids='';
		var getIds = document.getElementsByName('ids');
		for(var i = 0 ; i < getIds.length ; i++ ){
			if(getIds[i].checked ==true){	
				ids += getIds[i].value+'|';
			}
		}
		console.log(ids);
		if(check){
			var form = document.createElement("form");
			var parm = new Array();
			var input = new Array();
			form.action = "../forme/AdminSupportForMePick";
			form.method = "post";
			parm.push([ 'ids', ids ]);
			parm.push([ 'flag', flag ]);
	
			
			for (var i = 0; i < parm.length; i++) {
				input[i] = document.createElement("input");
				input[i].setAttribute("type", "hidden");
				input[i].setAttribute('name', parm[i][0]);
				input[i].setAttribute("value", parm[i][1]);
				form.appendChild(input[i]);
			}
			document.body.appendChild(form);
			form.submit();
		}else {
			return false;
		}
	}
	
	

	
	
</script>
</head>
<body>
	<h3>서포미픽 관리</h3>
	<hr>
<form action="../forme/AdminSupportForMePickList" name="searchForm">
	<input type="hidden" name="page" value="1">
	<select name="searchCondition">
	<option value="">전체</option>
		<option value="projectNo">프로젝트번호</option>
		<option value="projectName">프로젝트명</option>
		<option value="name">프로젝트작성자</option>	
		<option value="userId">프로젝트작성자ID</option>
	</select>
	<select name="supportForMePickUp">
		<option value="">서포미픽여부</option>
		<option value="Y">서포미픽업Yes</option>
		<option value="N">서포미픽업No</option>	
	</select>
	
	
	<input type="text" name="searchKeyword" value="">
	<input type="submit" value="검색">
	<script>
		document.searchForm.searchCondition.value ='${searchCondition}';
		document.searchForm.searchKeyword.value ='${searchKeyword}';
		document.searchForm.supportForMePickUp.value ='${supportForMePickUp}';
	</script>
</form>

	<table border="1">
		<tr>
			<td>선택</td>
			<td>프로젝트번호</td>
			<td>프로젝트명</td>
			<td>프로젝트작성자</td>
			<td>프로젝트작성ID</td>
			<td>서포미 픽 여부</td>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr>
				<td><input type="checkbox" name="ids" value="${list.projectNo}"></td>
				<td>${list.projectNo}</td>
				<td>${list.projectName}</td>
				<td>${list.name}</td>
				<td>${list.userId}</td>
				<td>${list.supportPickYn}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6">
				<input type="button" value="서포미픽 해제" onclick="SupportForMePickUp('no')">
				<input type="button" value="서포미픽  선택" onclick="SupportForMePickUp('yes')">
			</td>
		</tr>
	</table>
	<my:paging paging="${paging}"/>
	
</body>
</html>