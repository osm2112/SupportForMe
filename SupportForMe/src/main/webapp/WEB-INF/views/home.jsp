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
	height: 350px;
	width: 285px;
}

.real_time_image {
	width: 250px;
	height: 160px;
	border: 1px solid lightgrey;
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
								$('.real_time_rank_projects li').eq(0)
										.css('border',
												'2px solid rgb(26, 188, 156)');
							},
							after : function(slider) {
								$('.real_time_rank_projects li').eq(
										slider.currentSlide - 1).css('border',
										"");
								/* 		$('.real_time_rank_projects li').eq(
												slider.currentSlide - 1).attr("class","ranktext");										
										$('.real_time_rank_projects li').eq(
												slider.currentSlide).attr("class","no");
								 */

								$('.real_time_rank_projects li').eq(
										slider.currentSlide).css('border',
										'2px solid rgb(26, 188, 156)');
							}
						});

				Rank();
				Ranking();
				setInterval("Rank()", 5000);

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
								"./images/" + data[i].image);
						$('.real_time_image ul li img').eq(i+1).attr(
								"onclick",
								"location.href='support/getProjectDetailPage?projectNo="
										+ data[i].projectNo + "'");
						$('.real_time_rank_projects nav ol li').eq(i).html(
								"<span><em>" + (i + 1) + "</em>"
										+ data[i].projectName + "</span>");
						$('.real_time_rank_projects nav ol li').eq(i).attr(
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
				<li><img style="cursor: pointer;" src="./images/${project.image}" onerror="this.src='./images/대체이미지.jpg'" onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'"></li>
			</c:forEach>
		</ol>
	</div>
	<div style="height: 150px"></div>
	<div class="bodysize">
		<div class="suforme">
			<div class="suforme_picks_div"> 
				<div class="suforme_top_1_text_div"><span><i class="fa fa-heart"></i>&nbsp서포미 PICKS</span></div>

				<div class="flexslider">
					<ul class="slides">
						<c:forEach items="${Pick}" var="pick">
							<li>
								<div class="suforme_picks_grid" style="cursor: pointer;"
									onclick="location.href='support/getProjectDetailPage?projectNo=${pick.projectNo}'">
									<div class="suforme_picks_projects">
										<img src="./images/${pick.image}" onerror="this.src='./images/대체이미지.jpg'">
									</div>
									<div class="suforme_picks_projects_content">
										<nav>
											<ul>
												<li>카테고리</li>
												<li>
													<c:if test="${pick.categoryCode eq 001}">공연</c:if>
													<c:if test="${pick.categoryCode eq 002}">영화</c:if>
													<c:if test="${pick.categoryCode eq 003}">미술</c:if>
													<c:if test="${pick.categoryCode eq 004}">도서</c:if>
												</li>
												<li>프로젝트 제목</li>
												<li>${pick.projectName}</li>
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
				<div class="suforme_top_1_text_div"><span><i class="fa fa-trophy"></i>&nbsp실시간 랭킹</span></div>
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
							<!-- <marquee behavior=slide loop=30> -->
							<ol>
								<li class="" style="font-size: small; cursor: pointer;" onclick="1"></li>
								<li class="" style="font-size: small; cursor: pointer;" onclick="2"></li>
								<li class="" style="font-size: small; cursor: pointer;"	onclick="3"></li>
								<li class="" style="font-size: small; cursor: pointer;"	onclick="4"></li>
								<li class="" style="font-size: small; cursor: pointer;"	onclick="5"></li>
							</ol>
							<!-- </marquee> -->
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 100px"></div> 
	
		<div class="suforme_top_1_text_div"><span><i class="fa fa-users"></i>&nbsp공연 프로젝트</span></div> 
		<div class="category_project_div">
			<c:forEach items="${Performance}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./images/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<ul>
							<li style="font-size: 16px;">창작자 ID : ${project.userId}</li>
							<li style="font-size: 18px; height:50px;">${project.projectName}</li>
							<li style="height: 5px"></li>
							<li style="display: grid; grid-template-columns: 100%">
								<span>모금액 : ${project.totalInvest}원</span> 
							</li>
							<li style="height: 10px"></li>
							<li style="color: rgb(26, 188, 156); display: grid; grid-template-columns: 80% 20%"><progress
									style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress><span>${project.percent}%</span></li>
							<li style="height: 10px"></li>
							<li>목표액 : ${project.targetAmount}원</li>
						</ul>						
					</div>
				</div>				
			</c:forEach>
		</div>
		<div style="text-align: right"><br><a href="./support/getCategoryProjects?searchCondition=001">더보기 </a></div>	
		<div style="height: 50px"></div>
		<!-- 미술 부분  -->
		<div class="suforme_top_1_text_div"><span><i class="fa fa-paint-brush"></i>&nbsp미술 프로젝트</span></div>		
			<div class="category_project_div">
				<c:forEach items="${Art}" var="project">
					<div class="project_box" id="${project.projectNo}"
						style="cursor: pointer;"
						onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
						<div class="main_project_image">
							<img src="./images/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
						</div>
						<div class="main_project_content">
						<ul>
							<li style="font-size: 16px;">창작자 ID : ${project.userId}</li>
							<li style="font-size: 18px; height:50px;">${project.projectName}</li>
							<li style="height: 10px"></li>
							<li style="display: grid; grid-template-columns: 100%">
								<span>모금액 : ${project.totalInvest}원</span> 
							</li>
							<li style="height: 10px"></li>
							<li style="color: rgb(26, 188, 156); display: grid; grid-template-columns: 80% 20%"><progress
									style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress><span>${project.percent}%</span></li>
							<li style="height: 10px"></li>
							<li>목표액 : ${project.targetAmount}원</li>
						</ul>						
						</div>
					</div>
				</c:forEach>
			</div>
			<div style="text-align: right"><br><a href="./support/getCategoryProjects?searchCondition=003">더보기 </a></div>	
			<div style="height: 50px"></div>
		<!-- 도서 -->
		<div class="suforme_top_1_text_div"><span><i class="fa fa-book"></i>&nbsp도서 프로젝트</span></div> 
		<div class="category_project_div">
			<c:forEach items="${Book}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./images/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<ul>
							<li style="font-size: 16px;">창작자 ID : ${project.userId}</li>
							<li style="font-size: 18px; height:50px;">${project.projectName}</li>
							<li style="height: 10px"></li>
							<li style="display: grid; grid-template-columns: 100%">
								<span>모금액 : ${project.totalInvest}원</span> 
							</li>
							<li style="height: 10px"></li>
							<li style="color: rgb(26, 188, 156); display: grid; grid-template-columns: 80% 20%"><progress
									style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress><span>${project.percent}%</span></li>
							<li style="height: 10px"></li>
							<li>목표액 : ${project.targetAmount}원</li>
						</ul>						
					</div>
				</div>				
			</c:forEach>
		</div>
		<div style="text-align: right"><br><a href="./support/getCategoryProjects?searchCondition=004">더보기 </a></div>
		<div style="height: 50px"></div>
		<!-- 영화 -->
		<div class="suforme_top_1_text_div"><span><i class="fa fa-film"></i>&nbsp영화 프로젝트</span></div> 
		<div class="category_project_div">
			<c:forEach items="${Movie}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./images/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<ul>
							<li style="font-size: 16px;">창작자 ID : ${project.userId}</li>
							<li style="font-size: 18px; height:50px;">${project.projectName}</li>
							<li style="height: 10px"></li>
							<li style="display: grid; grid-template-columns: 100%">
								<span>모금액 : ${project.totalInvest}원</span> 
							</li>
							<li style="height: 10px"></li>
							<li style="color: rgb(26, 188, 156); display: grid; grid-template-columns: 80% 20%"><progress
									style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress><span>${project.percent}%</span></li>
							<li style="height: 10px"></li>
							<li>목표액 : ${project.targetAmount}원</li>
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