<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 투자 목록</title>
</head>
<style>

#mypage_list {
	margin-left: 20px;
}


.project_box {
	width: 255px;
	height: 420px;
	border: 1px solid lightgrey;
	display: inline-block;
	margin-top: 5px;
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

.mypage_project_image {
	width: 240px;
	height: 160px;
	border: 1px solid lightgrey;
	margin-left: auto;
	margin-right: auto;
	margin-top: 5px;
	background-color: #E9E9E9;
}

.mypage_project_content {
	margin-top: 35px;
	margin-left: 10px;
	width: 230px;
	height: 200px;
}

</style>
<script>
$(document).ready(function() {
	$(document).scroll(function() {
				var lastno = $(".project_box").last().attr("id");
				var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop()+ $(window).height();
				if (maxHeight <= currentScroll) {
					loadArticle(lastno);
				}
			});
	function loadArticle(lastno) {
		$.ajax({	type : "post",
					url : "../forme/MyInvestListScroll",
					data : { "investNo" : lastno},
					dataType : "json",
					success : function(data) {
						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {
								$('#myInvestList').append(
										 '<div class="project_box" style="" id="'+data[i].investNo+'">													'
									   	+'	<div class="mypage_project_image">																			'
									   	+'		<img class="mypage_project_image"src="../upload/'+data[i].image+'">										'
										+'	</div>																										'
										+'	<div class="mypage_project_content">																		'
										+'		<div class="project_state">'+data[i].projectProgress+'</div>											'
										+'		<nav>																									'
										+'			<div style="font-size: 15px;">프로젝트 명 : '+data[i].projectName+'</div>								'
										+'			<div style="font-size: 15px;">선택 리워드 : '+data[i].presentName+'('+data[i].presentPrice+'원)</div>	'
										+'			<div style="font-size: 15px;">총 투자 금액 : '+data[i].invenstAmount+'원</div>							'
										+'			<div style="font-size: 15px;">투자일 : '+data[i].investDate+'</div>									'
										+'			<div style="font-size: 15px;">배송예정일 : '+data[i].investDate+'</div>									'
										+'			<div style="height: 20px"></div>																	'
										+'			<div align="right">'+data[i].projectProgressRate+'%</div>											'
										+'			<progress value="'+data[i].projectProgressRate+'" max="100" style="width:235px"/>										'
										+'		</nav>																									'
										+'	</div>																										'
										+'</div>																										'						
								);
							}
						}
					}
				});
		lastno = $(".project_box").last().attr("id");					
	}
});









</script>
<body>
	<div id="myInvestList" >
		<div style="font-size: 30px; font-weight: 800; margin-bottom: 20px">나의	투자 현황</div>
		<c:forEach items="${list}" var="list">
		<div class="project_box" style="" id="${list.investNo}" onclick="location.href='../support/getProjectDetailPage?projectNo=${list.projectNo}'">
			<div class="mypage_project_image">
				<img class="mypage_project_image"src="../upload/${list.image}">
			</div>
			<div class="mypage_project_content">
				<div class="project_state">${list.projectProgress}</div>
				<nav>
					<div style="font-size: 15px;">프로젝트 명 : ${list.projectName}</div>
					<div style="font-size: 15px;">선택 리워드 : ${list.presentName}(${list.presentPrice}원)</div>
					<div style="font-size: 15px;">총 투자 금액 : ${list.invenstAmount}원</div>
					<div style="font-size: 15px;">투자일 : ${list.investDate}</div>
					<div style="height: 20px"></div>
					<div align="right">${list.projectProgressRate}%</div>
					<progress value="${list.projectProgressRate}" max="100" style="width:235px"></progress>
				</nav>
			</div>
		</div>
		</c:forEach>
	</div>
</body>
</html>