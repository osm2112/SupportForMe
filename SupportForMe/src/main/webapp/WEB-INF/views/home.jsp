<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<!doctype html>
<html>
<head>
<!-- <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> -->



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.3/flexslider.min.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.3/jquery.flexslider-min.js"></script>


<!--  부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.bodysize {
	margin-left: auto;
	margin-right: auto;
	width: 1100px;
}

.suforme {
	display: grid;
	grid-template-columns: 780px 1fr;
}
/*         .slide_main_img {
            width : 100%;
            height : 400px;
        } */
.suforme_picks_grid {
	display: grid;
	grid-template-columns: 1fr 300px;
}

.suforme_picks_div {
	width: 750px;
	height: 400px;
}

.suforme_top_1_text_div {
	font-size: 20px;
	width: auto;
	height: 45px;
}

.suforme_picks_projects {
	border: 1px solid lightgrey;
	width: 450px;
	height: 350px;
	background-color: #E9E9E9;
}
  
.suforme_picks_projects_content {
	border: 1px solid lightgrey;
	border-left: none;
	width: 295px;
	height: 350px;
} 

.suforme_picks_projects_content nav li {
	margin-top: 10px;
	list-style-type: none;
}

.picks_project_category {
	font-size: 15px;
	background-color: rgb(26, 188, 156);
	width: 80px;
	height: 25px;
	text-align: center;
	color: white;
	padding-top: 2px;
}

.picks_project_subject {
	font-size: 20px;
}

.real_time_rank_outer {
	margin-left: 30px;
}

.real_time_rank_div {
	border: 1px solid lightgrey;
	height: 370px;
	width: 285px;
}

.real_time_image {
	width: 250px;
	height: 160px;
	/* border: 1px solid lightgrey; */
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
	background-color: #E9E9E9;
}

.real_time_rank_projects {
	width: 250px;
	height: 150px;
}

.real_time_rank_projects nav ol li {
	margin-top: 5px;
	font-size: 18px;
	text-align: left;
}

.project_box {
	width: 255px;
	height: 350px;
	border: 1px solid lightgrey
}

.main_project_image {
	width: 240px;
	height: 160px;
	border: 1px solid lightgrey;
	margin-left: auto;
	margin-right: auto;
	margin-top: 5px;
	background-color: #E9E9E9;
}

.main_project_content {
	margin-top: 10px;
	margin-left: 10px;
	width: 230px;
	height: 150px;
}

.main_project_content ul {
	list-style-type: none;
}

.category_project_div {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
}

.project_box:hover {
/* 	border: 4px solid rgb(26, 188, 156); */
	box-shadow: 8px 8px 3px lightgrey;
}

<!-- -->
.main_project_image img {
	width: 100%;
	height: 100%;
	object-fit: .main_project_image;
}
.flexslider .slides img {
	width: 100%;
	height: 100%;
	display: block;
	-moz-user-select: none;
}
.real_time_rank_projects nav {
	max-width: 100%;
	width: 100%;
	height: 100%;
	object-fit: .real_time_rank_projects;
}

.flexslider2 .slides img {
	width: 100%;
	height: 400px;
	display: block;
	-moz-user-select: none;
}

.flexslider3 .slides img {
	width: 100%;
	height: 160px;
}
<!--
-->
@keyframes flickerAnimation { 
0%  { opacity: 1;}
50% { opacity: 0;}
100%{ opacity: 1;}
}
@-o-keyframes flickerAnimation { 
0% { opacity: 1;}
50%{ opacity :0;}
100%{ opacity : 1; }
}
@-moz-keyframes flickerAnimation { 
0% { opacity: 1;}
50%{ opacity: 0;}
100%{ opacity: 1;}
}
@-webkit-keyframes flickerAnimation { 
0% { opacity: 1;}
50%{ opacity: 0;}
100%{ opacity: 1;}
}
.ranktext {
	-webkit-animation: flickerAnimation 6s infinite;
	-moz-animation: flickerAnimation 6s infinite;
	-o-animation: flickerAnimation 6s infinite;
	animation: flickerAnimation 6s infinite;
}
#rank ol {
	list-style-type: none;
}

li em {
margin-top: 2px;
	
	font-style: normal;
	display: block;
	float: left;
	min-width: 13px;
	width: 13px;
	height: 12px;
	margin-right: 9px;
	border: 1px solid #e0e0e0;
	color: #666; 
	line-height: 12px;
	font-size: 11px; 
	text-align: center;
	font-family: tahoma, sans-serif;
}

.flexslider2 .flex-direction-nav .flex-next {
    right: 60px; /* adjust offset to match the hover style */
    opacity: .8; /* adjust opacity to match the hover style */
  
}

.flexslider2 .flex-direction-nav .flex-prev {
   
    left: 60px; /* adjust offset to match the hover style */
    opacity: .8; /* adjust opacity to match the hover style */
 
}
.flexslider2 .flex-direction-nav a {
   
    margin: -70px 0 0;
}

.flexslider2 .flex-direction-nav a.flex-prev:before {
    font-family:'FontAwesome';
    font-size: 40px;
    display: inline-block;
    width:40px;
    content: "\f191";  
    color: black; 
   /*  text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.3); */
    line-height: 40px;  
}  
 
.flexslider2 .flex-direction-nav a.flex-next:before {
   font-family:'FontAwesome';
    font-size: 40px;
    display: inline-block;
    width:40px;
    content: "\f152";
    color: black; 
    /* text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.3); */
    line-height: 40px;
}

.real_time_rank_projects li span text {

/* background: -webkit-linear-gradient(to right, #BDFFF3, #4AC29A);  /* Chrome 10-25, Safari 5.1-6 */
/* background: linear-gradient(to right, #BDFFF3, #4AC29A); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
/* transition-duration: 1s; */
}

.text3d{
/* text-shadow:   0 1px 0 #ccc,
               0 2px 0 #c9c9c9,
               0 3px 0 #bbb,
               0 4px 0 #b9b9b9,
               0 5px 0 #aaa,
               0 6px 1px rgba(0,0,0,.1),
               0 0 5px rgba(0,0,0,.1),
               0 1px 3px rgba(0,0,0,.3),
               0 3px 5px rgba(0,0,0,.2),
               0 5px 10px rgba(0,0,0,.25),
               0 10px 10px rgba(0,0,0,.2),
               0 20px 20px rgba(0,0,0,.15);
      font:18px Arial, Helvetica, sans-serif;
      color:grey; */

  /* text-shadow: 0px 0px 0px #FFD, -0px 0px 0px #FFD, -0px -0px 0px #FFD, 0px -0px 0px #FFD, 0px 1px 0px #FFD, -0px 1px 0px #FFD, -0px -1px 0px #FFD, 0px -1px 0px #FFD, 0px 2px 0px #FFD, -0px 2px 0px #FFD, -0px -2px 0px #FFD, 0px -2px 0px #FFD, 1px 0px 0px #FFD, -1px 0px 0px #FFD, -1px -0px 0px #FFD, 1px -0px 0px #FFD, 1px 1px 0px #FFD, -1px 1px 0px #FFD, -1px -1px 0px #FFD, 1px -1px 0px #FFD, 1px 2px 0px #FFD, -1px 2px 0px #FFD, -1px -2px 0px #FFD, 1px -2px 0px #FFD, 2px 0px 0px #FFD, -2px 0px 0px #FFD, -2px -0px 0px #FFD, 2px -0px 0px #FFD, 2px 1px 0px #FFD, -2px 1px 0px #FFD, -2px -1px 0px #FFD, 2px -1px 0px #FFD, 2px 2px 0px #FFD, -2px 2px 0px #FFD, -2px -2px 0px #FFD, 2px -2px 0px #FFD, 0px 0px 0px hsla(0,0%,0%,0), -4px 2px 2px black; */
   /* text-shadow: -0px 0px hsla(0,0%,100%,0.03333), 0px -0px hsla(0,0%,0%,0.2), -0.5px 0.5px hsla(0,0%,100%,0.03333), 0.5px -0.5px hsla(0,0%,0%,0.2), -1px 1px hsla(0,0%,100%,0.03333), 1px -1px hsla(0,0%,0%,0.2), -1.5px 1.5px hsla(0,0%,100%,0.03333), 1.5px -1.5px hsla(0,0%,0%,0.2), -2px 2px hsla(0,0%,100%,0.03333), 2px -2px hsla(0,0%,0%,0.2), 0px 0px 40px hsla(0,0%,100%,0.1); */
 font-size : 17px;
 text-shadow: -0px 0px hsla(0,0%,0%,0.2), 0px -0px hsla(0,0%,100%,0.2), -0.5px 0.5px hsla(0,0%,0%,0.2), 0.5px -0.5px hsla(0,0%,100%,0.2), -1px 1px hsla(0,0%,0%,0.2), 1px -1px hsla(0,0%,100%,0.2), -1.5px 1.5px hsla(0,0%,0%,0.2), 1.5px -1.5px hsla(0,0%,100%,0.2), 0px 0px 4.5px hsla(0,0%,0%,1);
 
 }
</style>
<script>
	$(document).ready(
			function() {
				$('.flexslider').flexslider({
					animation : "slide"
				});
				$('.flexslider2').flexslider({
					/* animation: "fade", */
					slideshowSpeed : 10000,
					animation : "slide",
					controlNav : false,
					directionNav : true,
					prevText : "",
					nextText : ""
					
					/* ,
					customDirectionNav : $(".custom-navigation2 a")  */
				});

				$('.flexslider3').flexslider(
						{
							slideshowSpeed : 8000,
							animation : "slide",
							controlNav : false,
							directionNav : false,
							start : function(slider) {
								$('.real_time_rank_projects li span text').eq(0)
										.css({
								
										 "background": "linear-gradient(to right, #BDFFF3, #4AC29A)"
										 
										});
								
							},
							after : function(slider) {
								$('.real_time_rank_projects li span text').eq(
										slider.currentSlide - 1).css('background',
										"");
								/* 		$('.real_time_rank_projects li').eq(
												slider.currentSlide - 1).attr("class","ranktext");										
										$('.real_time_rank_projects li').eq(
												slider.currentSlide).attr("class","no");
								 */

								$('.real_time_rank_projects li span text').eq(
										slider.currentSlide).css({
											 "background": "linear-gradient(to right, #BDFFF3, #4AC29A)"
										});
							}
						});

				Rank();
				Ranking();
				setInterval("Rank()", 8000);

			});
	function Ranking() {
		$('.real_time_rank_projects li')
				.eq(0)  
				.attr("class", "ranktext")
				.delay(800)
				.queue(
						function() {
							$('.real_time_rank_projects li')
									.eq(1)
									.attr("class", "ranktext")
									.delay(800)
									.queue(
											function() {
												$('.real_time_rank_projects li')
														.eq(2)
														.attr("class",
																"ranktext")
														.delay(800)
														.queue(
																function() {
																	$('.real_time_rank_projects li')
																			.eq(3)
																			.attr(	"class",
																					"ranktext")
																			.delay(
																					800)
																			.queue(
																					function() {
																						$(
																								'.real_time_rank_projects li')
																								.eq(
																										4)
																								.attr(
																										"class",
																										"ranktext")
																								.delay(
																										800);
																					});
																});
											});
						});
	}

	function Rank() {
		$.ajax({
			type : "post",
			url : "./",
			dataType : "json",
			success : function(data) {
				if (data.length > 0) {
					for (i = 0; i < data.length; i++) {
						
						$('.real_time_image ul li img').eq(i+1).attr("src",
								"./upload/" + data[i].image);
						$('.real_time_image ul li img').eq(i+1).attr(
								"onclick",
								"location.href='support/getProjectDetailPage?projectNo="
										+ data[i].projectNo + "'");
						$('.real_time_rank_projects nav ol li').eq(i).html(
								"<span style='cursor: pointer; display:block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 170px; height: 20px;'><em>" + (i + 1) + "</em>"
										+"<text>"+ data[i].projectName + "</text></span>");
						$('.real_time_rank_projects nav ol li span').eq(i).attr(
								"onclick",
								"location.href='support/getProjectDetailPage?projectNo="
										+ data[i].projectNo + "'");
					}
				} 

			}
		});
	}
</script>
</head>
<body>
	<div class="flexslider2">
		<ol class="slides">
			<c:forEach items="${Latest}" var="project">
				<li><img style="cursor: pointer;" src="./upload/${project.image}" onerror="this.src='./images/대체이미지.jpg'" onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'"></li>
			</c:forEach>
		</ol>
	</div>
	<div style="height: 150px"></div>
	<div class="bodysize">
		<div class="suforme">
			<div class="suforme_picks_div"> 
				<div class="suforme_top_1_text_div"><span style="font-size: 35px;"><i class="fa fa-heart" style="color: rgb(255, 135, 99);"></i>&nbsp서포미 PICKS</span></div><br>

				<div class="flexslider">
					<ul class="slides">
						<c:forEach items="${Pick}" var="pick">
							<li>
								<div class="suforme_picks_grid" style="cursor: pointer;"
									onclick="location.href='support/getProjectDetailPage?projectNo=${pick.projectNo}'">
									<div class="suforme_picks_projects">
										<img src="./upload/${pick.image}" onerror="this.src='./images/대체이미지.jpg'">
									</div>
									<div class="suforme_picks_projects_content">
										<nav>
											<ul>
												<li style="font-size: 30px"><strong>카테고리</strong></li>
												<li style="font-size: 25px">
													<c:if test="${pick.categoryCode eq 001}">공연</c:if>
													<c:if test="${pick.categoryCode eq 002}">영화</c:if>
													<c:if test="${pick.categoryCode eq 003}">미술</c:if>
													<c:if test="${pick.categoryCode eq 004}">도서</c:if>
												</li>
												<li style="font-size: 30px"><strong>프로젝트 제목</strong></li>
												<li style="font-size: 25px">${pick.projectName}</li>
											</ul>
										</nav>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<div class="real_time_rank_outer">
				<div class="suforme_top_1_text_div"><span style="font-size: 35px;"><i class="fa fa-trophy" style="color: rgb(239, 205, 119);"></i>&nbsp실시간 랭킹</span></div><br>
				<div class="real_time_rank_div">
					<div class="real_time_image flexslider3">
						<ul class="slides">
							<li><img src="" onerror="this.src='./images/대체이미지.jpg'" style="cursor: pointer;"></li>
							<li><img src="" onerror="this.src='./images/대체이미지.jpg'" style="cursor: pointer;"></li>
							<li><img src="" onerror="this.src='./images/대체이미지.jpg'" style="cursor: pointer;"></li>
							<li><img src="" onerror="this.src='./images/대체이미지.jpg'" style="cursor: pointer;"></li>
							<li><img src="" onerror="this.src='./images/대체이미지.jpg'" style="cursor: pointer;"></li>
						</ul>
					</div>
					<div class="real_time_rank_projects">
						<nav id="rank">
							<div style="height:20px;"></div>
							<!-- <marquee behavior=slide loop=30> -->
							<ol>
								<li class="" style="height:30px; font-size: small;" onclick="1"></li>
								<li class="" style="height:30px; font-size: small;" onclick="2"></li>
								<li class="" style="height:30px; font-size: small;"	onclick="3"></li>
								<li class="" style="height:30px; font-size: small;"	onclick="4"></li>
								<li class="" style="height:30px; font-size: small;"	onclick="5"></li>
							</ol>
							<!-- </marquee> -->
							
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 100px"></div> 
	
		<div class="suforme_top_1_text_div"><span style="font-size: 35px;"><i class="fa fa-users" style="color: rgb(6, 135, 133);"></i>&nbsp공연 프로젝트</span></div><br> 
		<div class="category_project_div">
			<c:forEach items="${Performance}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./upload/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<ul>
							<li style="font-size: 16px;">${project.userId}님</li>
							<li style="font-size: 18px; height:50px;"><strong>${project.projectName}</strong></li>
							<li style="height: 5px"></li>
							<li style="display: grid; grid-template-columns: 100%">
								<span class="text3d">모금액 : ${project.totalInvest}원</span> 
							</li>
							<li style="height: 10px"></li>
							<li style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress">
    							<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%">
   								 </div>
  							</div>
							<span>&nbsp;${project.percent}%</span>
							</li>
							<li style="height: 10px"></li>
							<li class="text3d">목표액 : ${project.targetAmount}원</li>
						</ul>						
					</div>
				</div>				
			</c:forEach>
		</div>
		<div style="text-align: right"><br><a href="./support/getCategoryProjects?searchCondition=001">더보기 </a></div>	
		<div style="height: 50px"></div>
		<!-- 미술 부분  -->
		<div class="suforme_top_1_text_div"><span style="font-size: 35px;"><i class="fa fa-paint-brush" style="color: rgb(6, 135, 133);"></i>&nbsp미술 프로젝트</span></div>	<br>	
			<div class="category_project_div">
				<c:forEach items="${Art}" var="project">
					<div class="project_box" id="${project.projectNo}"
						style="cursor: pointer;"
						onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
						<div class="main_project_image">
							<img src="./upload/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
						</div>
						<div class="main_project_content">
						<ul>
							<li style="font-size: 16px;">${project.userId}님</li>
							<li style="font-size: 18px; height:50px;"><strong>${project.projectName}</strong></li>
							<li style="height: 10px"></li>
							<li style="display: grid; grid-template-columns: 100%">
								<span class="text3d">모금액 : ${project.totalInvest}원</span> 
							</li>
							<li style="height: 10px"></li>
							<li style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress">
    							<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%">
   								 </div>
  							</div>
							<span>&nbsp;${project.percent}%</span>
							</li>
							<li style="height: 10px"></li>
							<li class="text3d">목표액 : ${project.targetAmount}원</li>
						</ul>						
						</div>
					</div>
				</c:forEach>
			</div>
			<div style="text-align: right"><br><a href="./support/getCategoryProjects?searchCondition=003">더보기 </a></div>	
			<div style="height: 50px"></div>
		<!-- 도서 -->
		<div class="suforme_top_1_text_div"><span style="font-size: 35px;"><i class="fa fa-book" style="color: rgb(6, 135, 133);"></i>&nbsp도서 프로젝트</span></div> <br>
		<div class="category_project_div">
			<c:forEach items="${Book}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./upload/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<ul>
							<li style="font-size: 16px;">${project.userId}님</li>
							<li style="font-size: 18px; height:50px;"><strong>${project.projectName}</strong></li>
							<li style="height: 10px"></li>
							<li style="display: grid; grid-template-columns: 100%">
								<span class="text3d">모금액 : ${project.totalInvest}원</span> 
							</li>
							<li style="height: 10px"></li>
							<li style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress">
    							<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%">
   								 </div>
  							</div>
							<span>&nbsp;${project.percent}%</span>
							</li>
							<li style="height: 10px"></li>
							<li class="text3d">목표액 : ${project.targetAmount}원</li>
						</ul>						
					</div>
				</div>				
			</c:forEach>
		</div>
		<div style="text-align: right"><br><a href="./support/getCategoryProjects?searchCondition=004">더보기 </a></div>
		<div style="height: 50px"></div>
		<!-- 영화 -->
		<div class="suforme_top_1_text_div"><span style="font-size: 35px;"><i class="fa fa-film" style="color: rgb(6, 135, 133);"></i>&nbsp영화 프로젝트</span></div> <br>
		<div class="category_project_div">
			<c:forEach items="${Movie}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./upload/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<ul>
							<li style="font-size: 16px;">${project.userId}님</li>
							<li style="font-size: 18px; height:50px;"><strong>${project.projectName}</strong></li>
							<li style="height: 10px"></li>
							<li style="display: grid; grid-template-columns: 100%">
								<span class="text3d">모금액 : ${project.totalInvest}원</span> 
							</li>
							<li style="height: 10px"></li>
							<li style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress">
    							<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%">
   								 </div>
  							</div>
							<span>&nbsp;${project.percent}%</span>
							</li>
							<li style="height: 10px"></li>
							<li class="text3d">목표액 : ${project.targetAmount}원</li>
						</ul>						
					</div>
				</div>				
			</c:forEach>
		</div>
		<div style="text-align: right"><br><a href="./support/getCategoryProjects?searchCondition=002">더보기 </a></div>	
		
	</div>
	
	<div style="height: 200px"></div>
	
</body>
</html>