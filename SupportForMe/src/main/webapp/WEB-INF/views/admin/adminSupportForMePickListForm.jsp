<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서포미픽 관리</title>
</head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<h3>서포미 픽 관리</h3>
	<hr>
<form action="../forme/AdminSupportForMePickList" name="searchForm">
<div class="input-group">
	<input type="hidden" name="page" value="1">
	<select name="searchCondition" class="form-control" style="width: 150px">
	<option value="">전체</option>
		<option value="projectNo">프로젝트번호</option>
		<option value="projectName">프로젝트명</option>
		<option value="name">프로젝트작성자</option>	
		<option value="userId">프로젝트작성자ID</option>
	</select>
	<select name="supportForMePickUp" class="form-control" style="width: 150px">
		<option value="">서포미픽여부</option>
		<option value="Y">서포미픽업Yes</option>
		<option value="N">서포미픽업No</option>	
	</select>
	
	
	<input type="text" class="form-control" name="searchKeyword" value="" style="width: 500px">
	
		<input type="submit" class="btn _btn2" value="검색" style="width: 80px">
	
	<script>
		document.searchForm.searchCondition.value ='${searchCondition}';
		document.searchForm.searchKeyword.value ='${searchKeyword}';
		document.searchForm.supportForMePickUp.value ='${supportForMePickUp}';
	</script>
</div>
</form>

	<table class="table table-hover" style="width: 880px;">
	<thead>
		<tr>
			<th>선택</th>
			<th>프로젝트번호</th>
			<th>프로젝트명</th>
			<th>프로젝트작성자</th>
			<th>프로젝트작성ID</th>
			<th>서포미 픽 여부</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<td ><input type="checkbox" name="ids" value="${list.projectNo}"></td>
				<td onclick="location.href='../support/getProjectDetailPage?projectNo=?projectNo=${list.projectNo}'">${list.projectNo}</td>
				<td onclick="location.href='../support/getProjectDetailPage?projectNo=?projectNo=${list.projectNo}'">${list.projectName}</td>
				<td onclick="location.href='../support/getProjectDetailPage?projectNo=?projectNo=${list.projectNo}'">${list.name}</td>
				<td onclick="location.href='../support/getProjectDetailPage?projectNo=?projectNo=${list.projectNo}'">${list.userId}</td>
				<td onclick="location.href='../support/getProjectDetailPage?projectNo=?projectNo=${list.projectNo}'">${list.supportPickYn}</td>
			</tr>
		</c:forEach>
	</tbody>
		<tr>
			<td colspan="6">
				<my:paging paging="${paging}"/>
				<input type="button" class="btn _btn _btn2 pull-right" value="서포미픽 해제" onclick="SupportForMePickUp('no')">
				<input type="button" class="btn _btn _btn2 pull-right" value="서포미픽  선택" onclick="SupportForMePickUp('yes')">
			</td>
		</tr>
	
	</table>
</body>
</html>