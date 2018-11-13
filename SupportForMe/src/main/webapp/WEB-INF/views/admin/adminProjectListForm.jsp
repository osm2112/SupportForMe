<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트관리</title>
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
._btn2:hover {
	background:grey;
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
	var path = "<c:url value='/'/>";
	function go_page(p){
		document.searchForm.page.value=p;
		document.searchForm.submit();
	}
	function ProjectProgres(s){
		var flag = s;
		if(flag=='001'){
			var check= confirm('선택하신 프로젝트의 보류 및 취소를 해제하시겠습니까?');
		} else if (flag=='003') {
			var check= confirm('선택하신 프로젝트를 취소하시겠습니까?');
		} else if (flag=='005') {
			var check= confirm('선택하신 프로젝트를 보류하시겠습니까?');
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
			form.action = path+"forme/AdminProjectProgress";
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

	
	function AllCheck(){
		var allCheck = document.getElementById("allCheck").checked;
		console.log(allCheck);
		var getIds = document.getElementsByName("ids");
		if (allCheck == true){
			for(var i = 0 ; i < getIds.length ; i++){
				getIds[i].checked = true;
			}
		} else{
			for(var i = 0 ; i < getIds.length ; i++){
				getIds[i].checked = false;
			}
		}
	}
</script>
</head>
<body>
<h3>프로젝트 관리</h3>
<hr>
<form action="<c:url value='/'/>forme/AdminProjectProgressList" name="searchForm">
<div class="input-group" style="width:1200px;">
	<input type="hidden" name="page" value="1">
	<select name="searchCondition" class="form-control" style="width:200px;">
		<option value="">전체</option>
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
</div>
</form>

	<table class="table table-hover" style="width:1200px">
		<thead>
		<tr>
			<th><input type="checkbox" id="allCheck" onclick="AllCheck()">선택</th>
			<th>프로젝트명</th>
			<th>프로젝트작성자</th>
			<th>프로젝트작성자ID</th>
			<th>프로젝트 마감일</th>
			<th>목표금액</th>
			<th>진행상황</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<td><input type="checkbox" name="ids" value="${list.projectNo}"></td>
				<td>${list.projectName}</td>
				<td>${list.name}</td>
				<td>${list.userId}</td>
				<td>${list.projectDeadline}</td>
				<td>${list.targetAmount}</td>
				<td>${list.codeName}</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="7">
				<my:paging paging="${paging}"/>
				<input type="button" value="프로젝트 보류" class="btn _btn _btn2 pull-right" onclick="ProjectProgres('005')">
				<input type="button" value="프로젝트 취소" class="btn _btn _btn2 pull-right" onclick="ProjectProgres('003')">
				<input type="button" value="프로젝트 보류 및 취소 해제" class="btn _btn _btn2 pull-right" onclick="ProjectProgres('001')">
			</td>
		</tr>
		</tbody>
	</table>
</body>
</html>