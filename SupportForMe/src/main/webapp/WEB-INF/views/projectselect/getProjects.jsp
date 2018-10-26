<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2018. 10. 26.</title>
<style>
.wrapper {
	display: grid;
	grid-template-columns: 25% 25% 25% 25%;
	grid-auto-rows: minmax(100px, auto);
}

.wrapper>div {
	background-color: orange;
	border: 1px black solid;
}

.div1 {
	grid-column: 1/5;
}

.div2 {
	display: grid;
	grid-column: 1/5;
	grid-column-gap: 20px;
	grid-row-gap: 3em;
	grid-template-columns: repeat(4, 1fr);
	/*grid-template-columns: 25% 25% 25% 25%;*/
	grid-auto-rows: minmax(300px, auto);
	text-align: center;
}

.div2>div {
	background-color: blue;
	border: 1px red solid;
}
</style>
</head>
<body>
<%-- ${list} --%>
	<div class="wrapper">
		<div class="div1">
			<h1 style="text-align: left;">${count}개의 검색결과</h1>
			<p style="text-align: left;">검색어 "${searchDTO.searchKeyword}"</p>
			<br>
			<br>
		</div>
		<div class="div2">
			<%-- <div class="card" style="width: 20rem;">
				<img class="card-img-top" src="(db에서 받아온 이미지경로)" alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">프로젝트상태(진행중, 마감)</h4>
					<p class="card-text">${list[0].projectName}</p>
					<p class="card-text">( 모집률을 구하는함수호출값 )</p>
					<p class="card-text">${list[0].targetAmount}</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div> --%>
			
		<c:forEach items="${list}" var="project">
			<div class="card" style="width: 20rem;">
				<img class="card-img-top" src="${project.image}" alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">${project.progress}</h4>
					<p class="card-text">${project.projectName}</p>
					<p class="card-text">( 모집률을 구하는함수호출값 )</p>
					<p class="card-text">목표금액 : ${project.targetAmount}</p>
				</div>
			</div>
		</c:forEach>
		
	
	

<!-- 

			<div class="card" style="width: 20rem;">
				<img class="card-img-top" src="(db에서 받아온 이미지경로)" alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">프로젝트상태(진행중, 마감)</h4>
					<p class="card-text">(db에서 받아 온 프로젝트제목값)</p>
					<p class="card-text">( 모집률을 구하는함수호출값 )</p>
					<p class="card-text">(db에서 받아 온 프로젝트의 목표금액)</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
 -->
		</div>

	</div>
</body>
</html>