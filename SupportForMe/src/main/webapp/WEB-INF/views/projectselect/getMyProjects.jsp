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
	padding-top: 0px; 
	width: 100px;
	height: 25px;
	text-align: center;
	margin-bottom: 5px;
}

.state {
	border-radius: 5px;
	/* padding-top: 5px; */
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
.text3d{
text-shadow:1px 1px white, -1px -1px #666; 
 }
.text3dPn{
 text-shadow:-1px -1px white, 1px 1px #666;
 }

</style>
<script>
var contextPath = '<%= request.getContextPath() %>';
	$(document).ready(function() {
						var count = 0;
						
						if ($(".project_box").length == 0 ) {
							$('.loader').addClass('display-none');
						}
						
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
										url : "./getMyProjects",
										data : {
											"projectNo" : lastno,
											"userId" : '${loginID}'
										},dataType : "json",
										
										success : function(data) {
											$('.loader').addClass('display-none');
											if (data.length > 0) {
												for (i = 0; i < data.length; i++) {
													count = ++count;
													var select = "project_state"+ count;
													var deleteBtn = (data[i].progressCd =='004') ? '<button class="btn btn-default" onclick="projectdelete(\''+data[i].projectNo+'\');">삭제</button></li></ul>' : '';
												
													$('.div2')
															.append(
																	// style="cursor:pointer;" onclick="location.href=\''+contextPath+'/support/getProjectDetailPage?projectNo='+ data[i].projectNo+ '\'\"
																	'<div class="project_box" id='
																			+ data[i].projectNo
																			+ '>'
																			+ '		<div class="mypage_project_image"><img src="../upload/'+data[i].image +'" onerror="this.src=\'../images/대체이미지.jpg\'"></div>'
																			+ '			<div class="mypage_project_content">'
																			+ '				<div class="state" id="project_state'+count+'">'
																			+ data[i].progress
																			+ '</div>'
																			+ '				<ul>'
																			+ '  				<li class="text3d" style="font-size: 16px;">'
																			+ data[i].userId
																			+ '님</li>'
																			+ ' 				<li style="height: 5px"></li>'
																			+ '   				<li class="text3dPn" style="font-size : 18px; display:block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 200px; height: 30px;"><strong>'
																			+ data[i].projectName
																			+ '</strong></li>'
																			+ ' 				<li style="height: 10px"></li>'
																			+ '   				<li style="display:grid; grid-template-columns: 100%">'
																			+ '       				<span class="text3d">모금액 : '
																			+ data[i].totalInvest
																			+ '원</span></li>'
																			+ ' 				<li style="height: 10px"></li>'
																			+ ' 				<li style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">'
																			+ ' 	<div class="progress"><div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:'+data[i].percent+'%"></div></div>'
																			+'<span class="text3d">&nbsp;'+ data[i].percent+ '%</span></li>'
																			+ ' 				<li style="height: 10px"></li>'
																			+ ' 				<li class="text3d">목표액 :'
																			+ data[i].targetAmount
																			+ '원</li>'
																			+ '<li style="height: 10px"></li>'
																			+ '<li><button class="btn btn-default" onclick="location.href=\''+contextPath+'/forme/make/'+data[i].projectNo+'\'">수정</button>'
																			+ deleteBtn
																			/* + '<button class="btn btn-default" onclick="projectdelete(\''+data[i].projectNo+'\');">삭제</button></li></ul>' */  
																			
																			+ '			</div>'
																			+ '	</div>');
													$("#" + select).addClass("progress"+data[i].progressCd)
								
												}
											}
										}
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
	<div class="pjdtl_bodysize">
		<div class="wrapper">
			<div class="div1">
			</div>
			<div class="div2">

				<c:forEach items="${list}" var="project">
					<div class="project_box" id="${project.projectNo}"
						<%-- style="cursor: pointer;"
						onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'" --%>>
						<div class="mypage_project_image">
							<img src="../upload/${project.image}"
								onerror="this.src='../images/대체이미지.jpg'">
						</div>
						<div class="mypage_project_content">
							<div class="project_state progress${project.progressCd}">${project.progress}</div>
							<ul>
								<li class="text3d" style="font-size: 16px;">${project.userId}님</li>
								<li style="height: 5px"></li>
								<li class="text3dPn" style="font-size: 18px; display:block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 200px; height: 30px;"><strong>${project.projectName}</strong></li>
								<li style="height: 10px"></li>
								<li style="display: grid; grid-template-columns: 100%"><span class="text3d">모금액
										: ${project.totalInvest}원</span></li>
								<li style="height: 10px"></li>
							<li style="color: rgb(26, 188, 156); height: 20px; display: grid; grid-template-columns: 78% 22%">
							<%-- <progress style="width: 95%; height:21px;" value="${project.percent}" max="100"></progress>
							 --%>
							<div class="progress">
    							<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${project.percent}%">
   								 </div>
  							</div>
							<span class="text3d">&nbsp;${project.percent}%</span>
							</li>
								<li style="height: 10px"></li>
								<li class="text3d">목표액 : ${project.targetAmount}원</li>
								<li style="height: 10px"></li>
								<li><button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/forme/make/${project.projectNo}'">수정</button>
								    <c:if test="${project.progressCd eq 004 }"><button class="btn btn-default" onclick="projectdelete('${project.projectNo}');">삭제</button></c:if>
								    </li>
								
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	
</body>
</html>