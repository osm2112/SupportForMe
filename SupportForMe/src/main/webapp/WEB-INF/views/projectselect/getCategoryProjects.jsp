<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2018. 10. 26.</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script><!--   jQuery  -->

<style>
/*↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓*/
.pjdtl_bodysize {
	margin-left: auto;
	margin-right: auto;
	width: 1200px;
}
/*↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑*/
.wrapper {
	display: grid;
	grid-template-columns: 25% 25% 25% 25%;
	grid-auto-rows: minmax(100px, auto);
}

/* .wrapper>div {
	background-color: orange;
	border: 1px black solid;
} */
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
	/* text-align: center; */
}

/* .div2>div {
	background-color: blue;
	border: 1px red solid;
}  */
<!--
-->
.project_box {
	width: 100%;
	height: 400px;
	border: 1px solid lightgrey;
}

.project_box:hover {
/* 	border: 4px solid rgb(26, 188, 156); */
	box-shadow: 8px 8px 3px lightgrey;
}

.project_state {
	border: 1.5px solid rgb(211, 84, 0);
	border-radius: 5px;
	color: rgb(211, 84, 0);
	padding-top: 5px;
	width: 100px;
	height: 25px;
	text-align: center;
	margin-bottom: 5px;
}

.mypage_project_content {
	margin-left: 5px;
	width: 100%;
	height: 200px;
}

.mypage_project_image {
	width: 100%;
	height: 160px;
	border: 1px solid lightgrey;
	margin-left: auto;
	margin-right: auto;
	/* margin-top : 5px; */
	margin-bottom: 5px;
	background-color: #E9E9E9;
}

.mypage_project_image img {
	width: 100%;
	height: 100%;
	object-fit: mypage_project_image;
}

.mypage_project_content ul {
	list-style-type: none;
}
</style>
<script>
$(document).ready(function() {
	$(document).scroll(function() {
				var lastno = $(".project_box").last().attr("id");
				console.log(lastno);
				var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop()+ $(window).height();
				if (maxHeight <= currentScroll) {
					loadArticle(lastno);
				}
			});
	function loadArticle(lastno) {
		$.ajax({	type : "post",
					url : "./getCategoryProjects",
					data : { "projectNo" : lastno,
							 "searchCondition" : '${searchCondition}' 
							  },
					dataType : "json",
					success : function(data) {
						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {
								$('.div2').append(
														  '<div class="project_box" id=' + data[i].projectNo + ' style="cursor:pointer;" onclick="location.href=\'getProjectDetailPage?projectNo=' + data[i].projectNo + '\'\">'
														+ '		<div class="mypage_project_image"><img src="../images/'+data[i].image +'" onerror="this.src=\'../images/대체이미지.jpg\'"></div>'
														+ '			<div class="mypage_project_content">'
														+ '				<div class="project_state">' +data[i].progress+ '</div>'
														+ '				<ul>'								
														+ '  				<li>창작자 ID : ' + data[i].userId	+ '</li>'
														+ '   				<li style="font-size : 18px;">' + data[i].projectName + '</li>'
														+ '   				<li style="height : 20px"></li>'
														+ '   				<li style="display:grid;grid-template-columns: 70% 30%">'
														+ '       				<span align="left">모금액 : ' + data[i].totalInvest + '</span>'
														+ '       				<span>' + data[i].percent + '%</span></li>'
														+ '  				<li style="color:rgb(26, 188, 156)"><progress style="width:80%;" value="'+data[i].percent+'" max="100"></progress>   </li>'
														+ '  				<li>목표금액 : ' + data[i].targetAmount + '</li>'
														+ '				</ul>'
														+ '			</div>'
														+ '	</div>');
							}
						}
					}
				});
		lastno = $(".project_box").last().attr("id");					
	}
});
</script>
</head>
<body>
	<div class="pjdtl_bodysize">
		<div class="wrapper">
			<div class="div1">
				<h1 style="text-align: left;">
					<c:if test="${searchCondition eq 001}">공연프로젝트</c:if>
					<c:if test="${searchCondition eq 002}">영화프로젝트</c:if>
					<c:if test="${searchCondition eq 003}">미술프로젝트</c:if>
					<c:if test="${searchCondition eq 004}">도서프로젝트</c:if>
				</h1>
				<h1 style="text-align: left;">${count}개</h1>
				<br> <br>
			</div>
			<div class="div2">
				<c:forEach items="${list}" var="project">
					<div class="project_box" id="${project.projectNo}" style="cursor: pointer;"	onclick="location.href='getProjectDetailPage?projectNo=${project.projectNo}'">
						<div class="mypage_project_image"><img src="../images/${project.image}" onerror="this.src='../images/대체이미지.jpg' "></div>
						<div class="mypage_project_content">
							<div class="project_state">${project.progress}</div>
							<ul>
								<li>창작자 ID : ${project.userId}</li>
								<li style="height: 5px"></li>
								<li style="font-size: 18px;">${project.projectName}</li>
								<li style="height: 10px"></li>
								<li style="display: grid; grid-template-columns: 100%">
									<span>모금액 : <fmt:formatNumber value="${project.totalInvest}" pattern="#,###" />원</span> 
								</li>
								<li style="height: 10px"></li>
								<li style="color: rgb(26, 188, 156); display: grid; grid-template-columns: 80% 20%">
									<progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress><span>${project.percent}%</span></li>
								<li style="height: 10px"></li>
								<li>목표액 : <fmt:formatNumber value="${project.targetAmount}" pattern="#,###" />원</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div> 
	<div style="height:200px"></div>
</body>
</html>