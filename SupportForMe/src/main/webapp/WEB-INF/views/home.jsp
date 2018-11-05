<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.3/flexslider.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.3/jquery.flexslider-min.js"></script>

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
	border: 4px solid rgb(26, 188, 156);
	box-shadow: 8px 8px 3px grey;
}

<!--
-->
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
<!----> 
@keyframes flickerAnimation {
  0%   { opacity:1; }
  50%  { opacity:0; }
  100% { opacity:1; }
}
@-o-keyframes flickerAnimation{
  0%   { opacity:1; }
  50%  { opacity:0; }
  100% { opacity:1; }
}
@-moz-keyframes flickerAnimation{
  0%   { opacity:1; }
  50%  { opacity:0; }
  100% { opacity:1; }
}
@-webkit-keyframes flickerAnimation{
  0%   { opacity:1; }
  50%  { opacity:0; }
  100% { opacity:1; }
}
.ranktext {
   -webkit-animation: flickerAnimation 8s;
   -moz-animation: flickerAnimation 8s;
   -o-animation: flickerAnimation 8s;
    animation: flickerAnimation 8s;
    
} 

/* test
 #rank a {
    color: black; /*글자색
    text-decoration: none;
}
#rank a:hover { /*검색어 마우스 올릴시 밑줄 언더라인
    text-decoration: underline;
}

#rank { /*구역 부분 위치조정
	text-align: center; 
  	overflow: hidden; 
    width: 200px;
    height: 100px; 
    margin: 0;
}

#rank ul {
    position: relative; 
    margin: 0;
 
}

#rank ol { /* 글자 위치 부분 
	
    position: relative;
    top: 0;
    left: 0;
    padding: 0;
    list-style-type: none;    
}
#rank li { /* 순위 문장 사이의 거리
    height: 100px;
    line-height: 20px;
} */
</style>

<script>
	$(document).ready(
			function() {

				$('.flexslider').flexslider({
					animation : "slide"
				});
				$('.flexslider2').flexslider({
					/* animation: "fade", */
					slideshowSpeed : 5000,
					animation : "slide",
					controlNav : false,
					customDirectionNav : $(".custom-navigation a")
				});

				$('.flexslider3').flexslider(
						{
							slideshowSpeed : 4000,
							animation : "slide",
							controlNav : false,
							start : function(slider) {
								$('.real_time_rank_projects li').eq(0)
										.css('border',
												'2px solid rgb(26, 188, 156)');
							},
							after : function(slider) {
								$('.real_time_rank_projects li').eq(
										slider.currentSlide - 1).css('border',
										"");
								$('.real_time_rank_projects li').eq(
										slider.currentSlide).css('border',
										'2px solid rgb(26, 188, 156)');

								console.log(slider.currentSlide);
								/* console.log(slider.currentSlide); */
							}
						});

				Rank();
				setTimeout("Rank()", 5000);
	//			step(0);
			console.log($('.real_time_rank_projects li').length);
			// test
			$('.real_time_rank_projects li').eq(0).addClass("ranktext").delay(10000).queue(function(){ 
				$(this).removeClass("ranktext").dequeue();
			});
	
			});

	function Rank() {
		$.ajax({
			type : "post",
			url : "./",
			dataType : "json",
			success : function(data) {
				if (data.length > 0) {
					for (i = 0; i < data.length; i++) {

						$('.real_time_image ul li img').eq(i).attr("src",
								"./images/" + data[i].image);
						$('.real_time_image ul li img').eq(i).attr("onclick",
								"location.href='support/getProjectDetailPage?projectNo="
								+ data[i].projectNo + "'");
						
						$('.real_time_rank_projects nav ol li').eq(i).text(
								data[i].projectName);
						$('.real_time_rank_projects nav ol li').eq(i).attr(
								"onclick",
								"location.href='support/getProjectDetailPage?projectNo="
										+ data[i].projectNo + "'");
						/* 	$('.real_time_rank_projects nav ol').append(	
							'<li style="font-size: small; cursor: pointer;" id='+ data[i].projectName +' onclick="location.href=\'support/getProjectDetailPage?projectNo=' + data[i].projectNo + '\'\">'+ data[i].projectName+'</li>'
							); */
					}
				}

			}
		});
	}
	

	

// test	  
/* 	
	    function step(index) {
	    	  var count = $('#rank li').length;
	  	    var height = $('#rank li').height();
	  		console.log(count+" :   " + height);
	    	
	        $('#rank ol').delay(2000).animate({top: -height * index }, 500, function() {
	            step((index + 1 ) % count);
	        });
	    }
	    
	 */
	
	/* function doAnimation(elapsed){
	 var iterations = $('.real_time_rank_projects li').length;
	 var current = elapsed+1;
	 if (current <= iterations){      
	 setTimeout(function(){
	 //   console.log($('.real_time_rank_projects li:eq(' + elapsed + ')'));
	 $('.real_time_rank_projects li:eq(' + elapsed + ')').fadeToggle();
	 doAnimation(current);
	 },500);

	 }
	 } */
</script>
</head>
<body>

	<div class="flexslider2">
		<ol class="slides">
			<li><img src="./images/main.PNG"></li>
			<li><img src="./images/picture.png"></li>
			<li><img src="./images/images.jpg"></li>
			<li><img src="./images/remove.png"></li>
			<li><img src="./images/plus1.png"></li>
		</ol>
	</div>
	<div class="custom-navigation">
		<p style="float: left;">
			<a href="#" class="flex-prev">Prev</a>
		</p>
		<p style="float: right;">
			<a href="#" class="flex-next" style="text-align: right;">Next</a>
		</p>
	</div>

	<div style="height: 50px"></div>
	<div class="bodysize">
		<div class="suforme">
			<div class="suforme_picks_div">
				<div class="suforme_top_1_text_div">서포미 PICKS</div>

				<div class="flexslider">
					<ul class="slides">
						<c:forEach items="${Pick}" var="pick">
							<li>
								<div class="suforme_picks_grid" style="cursor: pointer;"
									onclick="location.href='support/getProjectDetailPage?projectNo=${pick.projectNo}'">
									<div class="suforme_picks_projects">
										<img src="./images/${pick.image}">
									</div>
									<div class="suforme_picks_projects_content">
										<nav>
											<ul>
												<li>카테고리</li>
												<li>${pick.categoryCode}</li>
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
				<div class="suforme_top_1_text_div">실시간 랭킹</div>
				<div class="real_time_rank_div">
					<div class="real_time_image flexslider3">
						<ul class="slides">
							<li><img src="" style="cursor: pointer;"></li>
							<li><img src="" style="cursor: pointer;"></li>
							<li><img src="" style="cursor: pointer;"></li>
							<li><img src="" style="cursor: pointer;"></li>
							<li><img src="" style="cursor: pointer;"></li>
						</ul>
					</div>
					<div class="real_time_rank_projects">
						<nav id="rank">
						
							<!-- <marquee behavior=slide loop=30> -->
								<ol>
									<li class="ranktext" style="font-size: small; cursor: pointer;"
										onclick="1"></li>
									<li class=""
										style="font-size: small; cursor: pointer;" onclick="2"></li>
									<li class=""
										style="font-size: small; cursor: pointer;" onclick="3"></li>
									<li class=""
										style="font-size: small; cursor: pointer;" onclick="4"></li>
									<li class=""
										style="font-size: small; cursor: pointer;" onclick="5"></li>
								</ol>
							<!-- </marquee> -->
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 50px"></div>
		<div class="suforme_top_1_text_div">공연 프로젝트</div>
		<div class="category_project_div">

			<c:forEach items="${Performance}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./images/picture.png">
					</div>
					<div class="main_project_content">
						<ul>
							<li>창작자 ID : ${project.userId}</li>
							<li style="font-size: 18px;">${project.projectName}</li>
							<li style="height: 20px"></li>
							<li style="display: grid; grid-template-columns: 70% 30%"><span
								align="left">모금액 : ${project.totalInvest}</span> <span>${project.percent}%</span>
							</li>
							<li style="color: rgb(26, 188, 156);"><progress
									style="width: 80%;" value="${project.percent}" max="100"></progress></li>
							<li>목표금액 : ${project.targetAmount}</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>

		<div style="height: 50px"></div>
		<!-- 미술 부분  -->
		<div class="suforme_top_1_text_div">미술 프로젝트</div>
		<div class="art_project_div">
			<div class="category_project_div">
				<c:forEach items="${Art}" var="project">
					<div class="project_box" id="${project.projectNo}"
						style="cursor: pointer;"
						onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
						<div class="main_project_image">
							<img src="./images/picture.png">
						</div>
						<div class="main_project_content">
							<ul>
								<li>창작자 ID : ${project.userId}</li>
								<li style="font-size: 18px;">${project.projectName}</li>
								<li style="height: 20px"></li>
								<li style="display: grid; grid-template-columns: 70% 30%">
									<span align="left">모금액 : ${project.totalInvest}</span> <span>${project.percent}%</span>
								</li>
								<li style="color: rgb(26, 188, 156);"><progress
										style="width: 80%;" value="${project.percent}" max="100"></progress></li>
								<li>목표금액 : ${project.targetAmount}</li>
							</ul>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div> 
	<div style="height: 200px"></div>
</body>
</html>