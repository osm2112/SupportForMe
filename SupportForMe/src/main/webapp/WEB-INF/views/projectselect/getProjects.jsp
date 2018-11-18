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

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Projects.css">
<script>
var contextPath = '<%= request.getContextPath() %>';
	$(document)
			.ready(
					function() {
						var count = 0;
						
						if ($(".project_box").length <= '${count}' ) {
							$('.loader').addClass('display-none');
						}
						
						$(document).scroll(function() {
									var lastno = $(".project_box").last().attr("id");
									var maxHeight = $(document).height();
									var currentScroll = $(window).scrollTop()+ $(window).height();

									console.log("documentHeight:" + maxHeight + " | scrollTop +windowHeight: " + currentScroll );
									if (maxHeight <= currentScroll +1) {
											loadArticle(lastno);
											}				
								});
						function loadArticle(lastno) {

							$.ajax({
										type : "post",
										url : contextPath+"/support/getProjects",
										data : {
											"projectNo" : lastno,
											"searchKeyword" : '${searchDTO.searchKeyword}'
										},
										dataType : "json",
										success : function(data) {
											 $('.loader').addClass('display-none');
											
											if (data.length > 0) {
												for (i = 0; i < data.length; i++) {
													count = ++count;
													var select = "project_state"+ count;

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
																	+ '</div>'
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
																	+ '			</div>'
																	+ '	</div>');
											$("#" + select).addClass("progress"+data[i].progressCd);
													/* if (data[i].progress == '진행중') {
														$("#" + select)
																.css(
																		{
																			"border" : "1.5px solid rgb(211, 84, 0)",
																			"color" : "rgb(211, 84, 0)"
																		});
													}  */
												}
											}
										
										},beforeSend:function(){											
									        $('.loader').removeClass('display-none');											
									    },timeout :5000
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
				<h1 class="text3dss" style="text-align: left;  color: black;">${count}개의검색결과</h1>
				<p class="text3dss" style="text-align: left; font-size: 25px;">검색어 "${searchDTO.searchKeyword}"</p>
				<br> <br>
			</div>
			<div class="div2">

				<c:forEach items="${list}" var="project">
					<div class="project_box" id="${project.projectNo}"
						style="cursor: pointer;"
						onclick="location.href='<%= request.getContextPath() %>/support/getProjectDetailPage?projectNo=${project.projectNo}'">
						<div class="mypage_project_image">
							<img src="<%= request.getContextPath() %>/upload/${project.image}"
								onerror="this.src='<%= request.getContextPath() %>/images/대체이미지.jpg'">
						</div>
						<div class="mypage_project_content">
							<div class="project_state progress${project.progressCd}">${project.progress}</div>
							<div class="text3d" style="font-size: 16px;">${project.userId}</div>
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
	<div class="loader">Loading...</div>
	<div style="height: 100px"></div>
	
</body>
</html>