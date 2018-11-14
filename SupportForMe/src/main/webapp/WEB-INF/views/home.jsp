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
	width: 1200px;
}

.suforme {
	display: grid;
	grid-template-columns: 850px 1fr;
}
/*         .slide_main_img {
            width : 100%;
            height : 400px;
        } */
.suforme_picks_grid {
	display: grid;
	grid-template-columns: 1fr 320px;
 	border: 1px solid #EEEEEE;
	height: 360px;
}

.suforme_picks_div {
	width:800px;
}

.suforme_picks_div .flexslider {
	height: 370px;
}

.suforme_top_1_text_div {
	font-size: 30px;
	font-weight:700;
	color: #474747;
	width: auto;
	height: 45px;
}

.suforme_picks_projects {
	width: 480px;
	height: 360px;
	background-color: #E9E9E9;
}
.suforme_picks_projects_content {
	/* border-left: 1px solid lightgrey; */
	width: 280px;
	height: 360px;
	margin: 10px 15px;
}

.suforme_picks_projects_content div {
	margin-top: 10px;
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
	border: 1px solid #EEEEEE;
	height: 360px;
	width: 300px;
}

.real_time_image {
	width:100%;
	height: 170px;
	/* border: 1px solid lightgrey; */
	/* margin-left: auto;
	margin-right: auto;
	margin-top: 10px;	background-color: #E9E9E9; */

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
	background: white;
	width: 280px;
	height: 350px;
	border: 1px solid #EEEEEE;
}

.main_project_image {
	width: 100%;
	height: 170px;
	background-color: #E9E9E9;
}
.main_project_content {
	width: 280px;
	height: 160px;
	padding: 10px 10px 10px 15px;
	margin: 5px;
	color: #474747;
}

.category_project_div {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
}

.project_box:hover {
	/* 	border: 4px solid rgb(26, 188, 156); */
	box-shadow: 5px 5px 3px lightgrey;
	margin-top:-5px;
	
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
	height: 480px;
	display: block;
	-moz-user-select: none;
}

.flexslider3 .slides img {
	width: 100%;
	height: 180px;
}

<!--
-->
@keyframes flickerAnimation { 
	0% { opacity: 1 }
	50%{ opacity:0;	}
	100%{opacity:1;}
}
@-o-keyframes flickerAnimation { 
	0% {opacity: 1;	}
	50%{opacity:0;}
	100%{opacity:1;}
}
@-moz-keyframes flickerAnimation { 
	0% {opacity: 1;}
	50%{opacity:0;}
	100%{opacity:1;}
}
@-webkit-keyframes flickerAnimation { 
	0% {opacity: 1;}
	50%{opacity:0;}
	100%{opacity:1;}
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
	right: 120px; /* adjust offset to match the hover style */
	opacity: 0; /* adjust opacity to match the hover style */
}

.flexslider2 .flex-direction-nav .flex-prev {
	left: 120px; /* adjust offset to match the hover style */
	opacity: 0; /* adjust opacity to match the hover style */
}

.flexslider2 .flex-direction-nav a {
	margin: -150px 0 0 0;
}

.flexslider2 .flex-direction-nav a.flex-prev:before {
	font-family: 'flexslider-icon';
	font-size: 40px;
	display: inline-block;
	width: 40px;
	content: '\f001';
	color: #474747;
	/*  text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.3); */
	line-height: 40px;
}

.flexslider2 .flex-direction-nav a.flex-next:before {
	font-family: 'flexslider-icon';
	font-size: 40px;
	display: inline-block;
	width: 40px;
	content: '\f002';
	color: #474747;
	/* text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.3); */
	line-height: 40px;
}
.flexslider2:hover .flex-direction-nav .flex-prev {
  opacity: 0.7;
  left: 80px;
}
.flexslider2:hover .flex-direction-nav .flex-prev:hover {
  opacity: 1;
}
.flexslider2:hover .flex-direction-nav .flex-next {
  opacity: 0.7;
  right: 80px;
}
.flexslider2:hover .flex-direction-nav .flex-next:hover {
  opacity: 1;
}
/* .text3dss{
text-shadow:   0 1px 0 #ccc,
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
      font:Arial, Helvetica, sans-serif;
      color:grey; 
} */
.text3d {
	/* text-shadow: 1px 1px white, -1px -1px #666; */
	font-size:18px;
	color:#474747;
}

.text3dPn {
	/* text-shadow: -1px -1px white, 1px 1px #666; */
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 245px;
	height: 35px;
	font-size:20px;
}
.remainDay {
	padding-right:20px;
	display:inline-block;
	width:180px;
}
.rdPercent {
	color:#5e5e5e;
	font-size:16.5px;
}
.mainCategory{
	width:1185px;
	display:grid;
	grid-template-columns: 1fr 1fr;
	margin-bottom:20px
}
.mainCategory div a {
	font-size:20px;
	border:1px solid rgb(26, 188, 156);
	/* background-color:rgb(26, 188, 156);
	color:white; */
	color:rgb(26, 188, 156);
	padding:5px 15px;
	border-radius : 5px;
}
.mainCategory div a:hover{
	font-size:20px;
	text-decoration:none;
	background-color:white;
	border:1px solid #FF007F;
	border-radius : 5px;
	color:#FF007F;
	padding:5px 15px;
}
</style>
<script>
	$(document)
			.ready(
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
							prevText : "Previous",
							nextText : "Next"

						/* ,
						customDirectionNav : $(".custom-navigation2 a")  */
						});

						$('.flexslider3')
								.flexslider(
										{
											slideshowSpeed : 8000,
											animation : "slide",
											controlNav : false,
											directionNav : false,
											start : function(slider) {
												$(
														'.real_time_rank_projects li span text')
														.eq(0)
														.css(
																{

																	"background" : "linear-gradient(to right, #BDFFF3, #4AC29A)"

																});

											},
											after : function(slider) {
												$(
														'.real_time_rank_projects li span text')
														.eq(
																slider.currentSlide - 1)
														.css('background', "");
												/* 		$('.real_time_rank_projects li').eq(
																slider.currentSlide - 1).attr("class","ranktext");										
														$('.real_time_rank_projects li').eq(
																slider.currentSlide).attr("class","no");
												 */

												$(
														'.real_time_rank_projects li span text')
														.eq(slider.currentSlide)
														.css(
																{
																	"background" : "linear-gradient(to right, #BDFFF3, #4AC29A)"
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
																	$(
																			'.real_time_rank_projects li')
																			.eq(
																					3)
																			.attr(
																					"class",
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
		$
				.ajax({
					type : "post",
					url : "./",
					dataType : "json",
					success : function(data) {
						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {

								$('.real_time_image ul li img').eq(i + 1).attr(
										"src", "./upload/" + data[i].image);
								$('.real_time_image ul li img').eq(i + 1).attr(
										"onclick",
										"location.href='support/getProjectDetailPage?projectNo="
												+ data[i].projectNo + "'");
								$('.real_time_rank_projects nav ol li')
										.eq(i)
										.html(
												"<span style='cursor: pointer; display:block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 170px; height: 20px;'><em>"
														+ (i + 1)
														+ "</em>"
														+ "<text>"
														+ data[i].projectName
														+ "</text></span>");
								$('.real_time_rank_projects nav ol li span')
										.eq(i).attr(
												"onclick",
												"location.href='support/getProjectDetailPage?projectNo="
														+ data[i].projectNo
														+ "'");
							}
						}

					}
				});
	}
	function remainDay(deadLine) {
		var dl = deadLine.split(".");
		var remain;
		if(deadLine != null && deadLine != ''){
			var now = new Date();
			var dDay = new Date(dl[0],dl[1]-1, dl[2]);
			var now2 = now.getTime();
			var dDay2 = dDay.getTime();
			remain = dDay2 - now2;
			remain = Math.floor(remain / (24 * 3600 * 1000)) + 1;
		}
		return remain;
	}
</script>
</head>
<body>
<!-- <span class="text3dss" style="font-size: 35px;"><i class="fa fa-paint-brush" style="color: rgb(6, 135, 133);"></i></span> -->
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
				<div class="suforme_top_1_text_div" style="	margin-bottom:-3px;">
				<!-- <i class="fa fa-heart" style="color: #FF007F;width:25px;height:25px"></i> --> 서포미 PICKS </div><br>

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
										<div class="text3dPn" style="font-size: 30px"><strong>카테고리</strong></div>
										<div style="font-size: 25px">
											<c:if test="${pick.categoryCode eq 001}">공연</c:if>
											<c:if test="${pick.categoryCode eq 002}">영화</c:if>
											<c:if test="${pick.categoryCode eq 003}">미술</c:if>
											<c:if test="${pick.categoryCode eq 004}">도서</c:if>
										</div> 
										<div class="text3dPn" style="font-size: 30px"><strong>프로젝트 제목</strong></div>
										<p style="font-size: 25px">${pick.projectName}</p>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<div class="real_time_rank_outer">
				<div class="suforme_top_1_text_div">실시간 랭킹</div><br>
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
								<li class="" style="height:25px; font-size: 17px;" onclick="1"></li>
								<li class="" style="height:25px; font-size: 17px;" onclick="2"></li>
								<li class="" style="height:25px; font-size: 17px;"	onclick="3"></li>
								<li class="" style="height:25px; font-size: 17px;"	onclick="4"></li>
								<li class="" style="height:25px; font-size: 17px;"	onclick="5"></li>
							</ol>
							<!-- </marquee> -->
							
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 50px"></div> 
	
		<div class="suforme_top_1_text_div mainCategory">
			<div>공연 프로젝트</div>
			<div style="text-align:right;"><a href="./support/getCategoryProjects?searchCondition=001">더보기 </a></div></div> 
		<div class="category_project_div">
			<c:forEach items="${Performance}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./upload/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<div class="text3d">${project.userId}님</div>
						<div style="height: 5px"></div>
						<div class="text3dPn" style=""><strong>${project.projectName}</strong></div>
						<div style="height:20px"></div>
						<div style="display: grid; grid-template-columns: 100%">
							<span class="text3d">모금액 ${project.totalInvest}원</span> 
						</div>
						<div style="height: 5px"></div>
						<div style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress" style="height:10px;width:250px">
	    						<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%;height:10px">
	   							 </div>
	  						</div>
						</div>
						<div class="rdPercent">
							<div class="remainDay" id="${project.projectNo}pf"></div>
							<div style="display:inline-block;">&nbsp;${project.percent}%</div>
						</div>
						<script>
							var seq = '${project.projectNo}';
							var rd = '${project.projectDeadline}';
							if(rd != ''){
								$("#"+seq+"pf").text("D-"+remainDay(rd));
							}
						</script>
					</div>						
				</div>				
			</c:forEach>
		</div>
		
		<div style="height: 70px"></div>
		<!-- 미술 부분  -->
		<div class="suforme_top_1_text_div mainCategory">
			<div>미술 프로젝트</div>
			<div  style="text-align:right;"><a href="./support/getCategoryProjects?searchCondition=003">더보기 </a></div></div>	
			<div class="category_project_div">
				<c:forEach items="${Art}" var="project">
					<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./upload/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<div class="text3d">${project.userId}님</div>
						<div style="height: 5px"></div>
						<div class="text3dPn" style=""><strong>${project.projectName}</strong></div>
						<div style="height:20px"></div>
						<div style="display: grid; grid-template-columns: 100%">
							<span class="text3d">모금액 ${project.totalInvest}원</span> 
						</div>
						<div style="height: 5px"></div>
						<div style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress" style="height:10px;width:250px">
	    						<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%;height:10px">
	   							 </div>
	  						</div>
						</div>
						<div class="rdPercent">
							<div class="remainDay" id="${project.projectNo}art"></div>
							<div style="display:inline-block;">&nbsp;${project.percent}%</div>
						</div>
						<script>
							var seq = '${project.projectNo}';
							var rd = '${project.projectDeadline}';
							if(rd != ''){
								$("#"+seq+"art").text("D-"+remainDay(rd));
							}
						</script>
					</div>						
				</div>				
				</c:forEach>
			</div>
			<div style="height: 70px"></div>
		<!-- 도서 --> 
		<div class="suforme_top_1_text_div mainCategory">
			<div>도서 프로젝트</div>
			<div  style="text-align:right;"><a href="./support/getCategoryProjects?searchCondition=004">더보기 </a></div>
		</div>	
		<div class="category_project_div">
			<c:forEach items="${Book}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./upload/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<div class="text3d">${project.userId}님</div>
						<div style="height: 5px"></div>
						<div class="text3dPn" style=""><strong>${project.projectName}</strong></div>
						<div style="height:20px"></div>
						<div style="display: grid; grid-template-columns: 100%">
							<span class="text3d">모금액 ${project.totalInvest}원</span> 
						</div>
						<div style="height: 5px"></div>
						<div style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress" style="height:10px;width:250px">
	    						<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%;height:10px">
	   							 </div>
	  						</div>
						</div>
						<div class="rdPercent">
							<div class="remainDay" id="${project.projectNo}book"></div>
							<div style="display:inline-block;">&nbsp;${project.percent}%</div>
						</div>
						<script>
							var seq = '${project.projectNo}';
							var rd = '${project.projectDeadline}';
							if(rd != ''){
								$("#"+seq+"book").text("D-"+remainDay(rd));
							}
						</script>
					</div>						
				</div>				
			</c:forEach>
		</div>
		<div style="height: 70px"></div>
		<!-- 영화 -->
		<div class="suforme_top_1_text_div mainCategory">
			<div>영화 프로젝트</div>
			<div  style="text-align:right;"><a href="./support/getCategoryProjects?searchCondition=002">더보기 </a></div>
		</div>
		<div class="category_project_div">
			<c:forEach items="${Movie}" var="project">
				<div class="project_box" id="${project.projectNo}"
					style="cursor: pointer;"
					onclick="location.href='support/getProjectDetailPage?projectNo=${project.projectNo}'">
					<div class="main_project_image">
						<img src="./upload/${project.image}" onerror="this.src='./images/대체이미지.jpg'">
					</div>
					<div class="main_project_content">
						<div class="text3d">${project.userId}님</div>
						<div style="height: 5px"></div>
						<div class="text3dPn" style=""><strong>${project.projectName}</strong></div>
						<div style="height:20px"></div>
						<div style="display: grid; grid-template-columns: 100%">
							<span class="text3d">모금액 ${project.totalInvest}원</span> 
						</div>
						<div style="height: 5px"></div>
						<div style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress" style="height:10px;width:250px">
	    						<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%;height:10px">
	   							 </div>
	  						</div>
						</div>
						<div class="rdPercent">
							<div class="remainDay" id="${project.projectNo}mv"></div>
							<div style="display:inline-block;">&nbsp;${project.percent}%</div>
						</div>
						<script>
							var seq = '${project.projectNo}';
							var rd = '${project.projectDeadline}';
							if(rd != ''){
								$("#"+seq+"mv").text("D-"+remainDay(rd));
							}
						</script>
					</div>						
				</div>				
			</c:forEach>
		</div>
	</div>
	<div style="height: 100px"></div>
	
</body>
</html>