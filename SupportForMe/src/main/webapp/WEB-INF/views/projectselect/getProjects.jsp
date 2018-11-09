<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2018. 10. 26.</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!--   jQuery  -->

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

.state {
	border-radius: 5px;
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
	$(document)
			.ready(
					function() {
						var count = 0;
						$(document).scroll(
								function() {
									var lastno = $(".project_box").last().attr(
											"id");
									console.log(lastno);
									var maxHeight = $(document).height();
									var currentScroll = $(window).scrollTop()
											+ $(window).height();
									if (maxHeight <= currentScroll) {
										loadArticle(lastno);
									}
								});
						function loadArticle(lastno) {

							$
									.ajax({
										type : "post",
										url : "./getProjects",
										data : {
											"projectNo" : lastno,
											"searchKeyword" : '${searchDTO.searchKeyword}'
										},
										dataType : "json",
										success : function(data) {
											if (data.length > 0) {
												for (i = 0; i < data.length; i++) {
													count = ++count;
													var select = "project_state"
															+ count;

													$('.div2')
															.append(
																	'<div class="project_box" id='
																			+ data[i].projectNo
																			+ ' style="cursor:pointer;" onclick="location.href=\'./getProjectDetailPage?projectNo='
																			+ data[i].projectNo
																			+ '\'\">'
																			+ '		<div class="mypage_project_image"><img src="../images/'+data[i].image +'" onerror="this.src=\'../images/대체이미지.jpg\'"></div>'
																			+ '			<div class="mypage_project_content">'
																			+ '				<div class="state" id="project_state'+count+'">'
																			+ data[i].progress
																			+ '</div>'
																			+ '				<ul>'
																			+ '  				<li style="font-size: 16px;">창작자 ID : '
																			+ data[i].userId
																			+ '</li>'
																			+ ' 				<li style="height: 5px"></li>'
																			+ '   				<li style="font-size : 18px;">'
																			+ data[i].projectName
																			+ '</li>'
																			+ ' 				<li style="height: 10px"></li>'
																			+ '   				<li style="display:grid; grid-template-columns: 100%">'
																			+ '       				<span>모금액 : '
																			+ data[i].totalInvest
																			+ '원</span></li>'
																			+ ' 				<li style="height: 10px"></li>'
																			+ ' 				<li style="color: rgb(26, 188, 156); display: grid; grid-template-columns: 80% 20%">'
																			+ ' 						<progress style="width: 95%; height:21px;" value="'
																			+ data[i].percent
																			+ '" max="100"></progress><span>'
																			+ data[i].percent
																			+ '%</span></li>'
																			+ ' 				<li style="height: 10px"></li>'
																			+ ' 				<li>목표액 :'
																			+ data[i].targetAmount
																			+ '원</li>'
																			+ '				</ul>'
																			+ '			</div>'
																			+ '	</div>');

													if (data[i].progress == '진행중') {
														$("#" + select)
																.css(
																		{
																			"border" : "1.5px solid rgb(211, 84, 0)",
																			"color" : "rgb(211, 84, 0)"
																		});
													} else if (data[i].progress == '마감') {
														$("#" + select)
																.css(
																		{
																			"border" : "1.5px solid rgb(132, 127, 132)",
																			"color" : "rgb(132, 127, 132)"
																		});
													} else if (data[i].progress == '완료') {
														$("#" + select)
																.css(
																		{
																			"border" : "1.5px solid rgb(84, 70, 13)",
																			"color" : "rgb(84, 70, 13)"
																		});
													} else if (data[i].progress == '무산') {
														$("#" + select)
																.css(
																		{
																			"border" : "1.5px solid rgb(38, 11, 102)",
																			"color" : "rgb(38, 11, 102)"
																		});
													}
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
				<h1 style="text-align: left;">${count}개의검색결과</h1>
				<p style="text-align: left;">검색어 "${searchDTO.searchKeyword}"</p>
				<br> <br>
			</div>
			<div class="div2">

				<c:forEach items="${list}" var="project">
					<div class="project_box" id="${project.projectNo}"
						style="cursor: pointer;"
						onclick="location.href='./getProjectDetailPage?projectNo=${project.projectNo}'">
						<div class="mypage_project_image">
							<img src="../images/${project.image}"
								onerror="this.src='../images/대체이미지.jpg'">
						</div>
						<div class="mypage_project_content">
							<div class="project_state"
								<c:if test="${project.progress eq '완료'}">style="border: 1.5px solid rgb(84, 70, 13); color : rgb(84, 70, 13);"</c:if>
								<c:if test="${project.progress eq '무산'}">style="border: 1.5px solid rgb(38, 11, 102); color : rgb(38, 11, 102);"</c:if>
								<c:if test="${project.progress eq '마감'}">style="border: 1.5px solid rgb(132, 127, 132); color : rgb(132, 127, 132);"</c:if>>${project.progress}</div>
							<ul>
								<li style="font-size: 16px;">창작자 ID : ${project.userId}</li>
								<li style="height: 5px"></li>
								<li style="font-size: 18px;">${project.projectName}</li>
								<li style="height: 10px"></li>
								<li style="display: grid; grid-template-columns: 100%"><span>모금액
										: ${project.totalInvest}원</span></li>
								<li style="height: 10px"></li>
								<li
									style="color: rgb(26, 188, 156); display: grid; grid-template-columns: 80% 20%">
									<progress style="width: 95%; height: 21px;"
										value="${project.percent}" max="100"></progress><span>${project.percent}%</span>
								</li>
								<li style="height: 10px"></li>
								<li>목표액 : ${project.targetAmount}원</li>
							</ul>
						</div>
					</div>
				</c:forEach>

				<!--  참고
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
	</div>
	<div style="height: 300px"></div>
</body>
</html>