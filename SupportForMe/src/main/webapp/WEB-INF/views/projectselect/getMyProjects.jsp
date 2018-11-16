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
<!--  부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/loading.css">
<style>
/*↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓*/
.pjdtl_bodysize {
	width: 1100px;
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
	grid-row-gap: 2em;
	grid-template-columns: repeat(4, 1fr);
	/*grid-template-columns: 25% 25% 25% 25%;*/
	grid-auto-rows: minmax(300px, auto);
	/* text-align: center; */
}

/* .div2>div {
	background-color: blue;
	border: 1px red solid;
}  */
<!-- -->
.project_box {
	width: 100%;
	height: 400px;
	border: 1px solid #EEEEEE;
	padding:0;
}

.project_box:hover {
	/* 	border: 4px solid rgb(26, 188, 156); */
	box-shadow: 5px 5px 3px lightgrey;
}

.project_state, .state {
	width: 100px;
	height: 30px;
	font-weight:700;
	font-family:'';
}

.mypage_project_content {
	margin-left: 15px;
	width: 100%;
	height: 180px;
}

.mypage_project_image {
	width: 100%;
	height: 170px;
	margin: -2px -5px 0 0;
	padding:0 ;
}

.mypage_project_image img {
	margin:0;
	width: 100%;
	height: 100%;
	object-fit: .mypage_project_image;
}
.text3d {
	/* text-shadow:1px 1px white, -1px -1px #666; */
	font-size:17px;
}

.text3dPn {
	/*  text-shadow:-1px -1px white, 1px 1px #666; */
	font-size: 18px;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 200px;
	height:30px;
}
/*진행중 */
.progress001 {
	border:1px solid #FF007F;
	color: #FF007F;
}
/* 마감 */
.progress002 {
	border:1px solid #8041D9;
	color:#8041D9;
}
/* 무산 */
.progress003 {
	border:1px solid #a6a6a6;
	color:#a6a6a6;
}
/* 제작중 */
.progress004 {
	border:1px solid #CC3D3D;
	color: #CC3D3D;
}
/* 보류 */
.progress005 {
	border:1px solid #008299;
	color:#008299;
}
/* 완료 */
.progress006 {
	border:1px solid #D9418C;
	color:#D9418C;
}

.btn {
	border: 1px solid lightgrey;
	width:110px;
	margin-right:5px;
	font-weight:700
}
._btn1 {
	color: rgb(26, 188, 156);
}
._btn2{
	color: #FF007F;
}
.tI {
	display:inline-block;
	width:195px;
}
.loader {
  margin: 100px 0px 0px 500px;
}
</style>
<script>
var contextPath = '<%= request.getContextPath() %>';
/* var path = "<c:url value='/'/>"; */
	$(document).ready(function() {
						var count = 0;
						
						
						$('.loader').addClass('display-none');
						
						
			$(document).scroll(
								function() {
									var lastno = $(".project_box").last().attr(
											"id");
									console.log(lastno);
									var maxHeight = $(document).height();
									var currentScroll = $(window).scrollTop() + $(window).height();
									console.log($(".project_box").length);
									if (maxHeight <= currentScroll) {
										loadArticle(lastno);
									}
								});
						
						function loadArticle(lastno) {
							console.log($(".project_box").length);
							$.ajax({
										type : "post",
										url : contextPath+"/forme/getMyProjects",
										data : {
											"projectNo" : lastno,
											"userId" : '${member.userId}'
										},dataType : "json",
										
										success : function(data) {
											$('.loader').addClass('display-none');
											if (data.length > 0) {
												for (i = 0; i < data.length; i++) {
													count = ++count;
													var select = "project_state"+ count;
													var updateBtn = (data[i].progressCd !='002' && data[i].progressCd !='003' && data[i].progressCd !='006') ? '<button class="btn btn-default _btn1" onclick="location.href=\''+contextPath+'/forme/make/'+data[i].projectNo+'\'">수정</button>' : '';
												 	var detailBtn = (data[i].progressCd !='004') ? '<button class="btn btn-default _btn2" onclick="location.href=\''+contextPath+ '/support/getProjectDetailPage?projectNo='+ data[i].projectNo+'\'">상세화면</button>' : ''; 
													var deleteBtn = (data[i].progressCd =='004') ? '<button class="btn btn-default _btn2" onclick="projectdelete(\''+data[i].projectNo+'\');">삭제</button></div>' : '';
													
													$('.div2')
															.append('<div class="project_box" id='
																			+ data[i].projectNo
																			+ '>'
																			+ '		<div class="mypage_project_image"><img src="'+contextPath+'/upload/'+data[i].image +'" onerror="this.src=\''+contextPath+'/images/대체이미지.jpg\'"></div>'
																			+ '			<div class="mypage_project_content">'
																			+ '				<div class="project_state progress'+data[i].progressCd+'">'
																			+ data[i].progress
																			+ '</div>'
																			+ '  				<div class="text3d" style="font-size: 16px;">'
																			+ data[i].userId
																			+ '님</div>'
																			+ ' 				<div style="height: 5px"></div>'
																			+ '   				<div class="text3dPn"><strong>'
																			+ data[i].projectName
																			+ '</strong></div>'
																			+ ' 				<div style="height: 5px"></div>'
																			+ '   				<div><span class="tI">'
																			+ data[i].totalInvest
																			+ '원</span><span class="text3d">&nbsp;'+ data[i].percent+ '%</span></div>'
																			+ ' 				<div style="height: 5px"></div>'
																			+ ' 	<div class="progress" style="height:15px;width:225px;margin-bottom:5px"><div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"'
																			+ ' style="width:${project.percent}%;height:15px;background-color:rgb(26, 188, 156);"></div></div>'
																			+ ' 				<div class="text3d">목표금액 '
																			+ data[i].targetAmount
																			+ '원</div>'
																			+ '<div style="height: 5px"></div>'
																			+ '<div>'
																			//<button class="btn btn-default _btn1" onclick="location.href=\''+contextPath+'/forme/make/'+data[i].projectNo+'\'">수정</button>
																			+ updateBtn
																			+ detailBtn
																			+ deleteBtn
																			+ '			</div>'
																			+ '	</div>');
													$("#" + select).addClass("progress"+data[i].progressCd)
								
												}
											}
										},beforeSend:function(){											
									        $('.loader').removeClass('display-none');											
									    },timeout :5000
									});
							lastno = $(".project_box").last().attr("id");
						}
				});
	function projectdelete(pno) {
		if(confirm("프로젝트 삭제를 원하면 예, 삭제를 원하지않으면 아니오를 눌러주세요"))
		 {
			console.log('예');
			$.ajax({
				type : "delete",
				url : contextPath+"/project/"+pno,		
				success : function(data) {
					alert('해당프로젝트가 삭제되었습니다.');
					window.location.reload();
				}
			});
		 }
		 else
		 {
			 console.log('아니오');						
		 }
	}
</script>
</head>
<body>
<div style="height:50px"></div>
	<div class="pjdtl_bodysize">
		<h3>나의 프로젝트</h3>
		<div style="height:20px"></div>
		<div class="wrapper">
			<div class="div2">
				<c:forEach items="${list}" var="project">
					<div class="project_box" id="${project.projectNo}"
						<%-- style="cursor: pointer;"
						onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'" --%>>
						<div class="mypage_project_image">
							<img src="<%= request.getContextPath() %>/upload/${project.image}"
								onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'">
						</div>
						<div class="mypage_project_content">
							<div class="project_state progress${project.progressCd}">${project.progress}</div>
							<div class="text3d" style="font-size: 16px;">${project.userId}님</div>
							<div style="height: 5px"></div>
							<div class="text3dPn"><strong>${project.projectName}</strong></div>
							<div style="height: 5px"></div>
							<div ><span class="tI">${project.totalInvest}원</span><span class="text3d">&nbsp;${project.percent}%</span></div>
							<div style="height: 5px"></div>
							<div class="progress" style="height:15px;width:225px;margin-bottom:5px">
    							<div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%;height:15px;background-color:rgb(26, 188, 156);">
   							 	</div>
  							</div>
							<div class="text3d">목표금액  ${project.targetAmount}원</div>
							<div style="height: 5px"></div>
							<div>
								<%-- <button class="btn btn-default _btn1" onclick="location.href='<%= request.getContextPath() %>/forme/make/${project.projectNo}'">수정</button> --%>
							    <c:if test="${project.progressCd ne 002 && project.progressCd ne 003 && project.progressCd ne 006 }"> <button class="btn btn-default _btn1" onclick="location.href='<%= request.getContextPath() %>/forme/make/${project.projectNo}'">수정</button></c:if>
							    <c:if test="${project.progressCd eq 004 }"><button class="btn btn-default _btn2" onclick="projectdelete('${project.projectNo}');">삭제</button></c:if>
							    <c:if test="${project.progressCd ne 004 }"><button class="btn btn-default _btn2" onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'">상세화면</button></c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div> 
		</div>
	</div> 
	<p class="loader">Loading...</p>
	<div style="height: 300px"></div>
</body>
</html>