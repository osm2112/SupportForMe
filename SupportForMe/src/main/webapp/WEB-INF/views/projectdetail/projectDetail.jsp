<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<title>* ${project.projectName} *</title>

<!-- 슬라이드 -->
<link type="text/css" rel="stylesheet" href="../css/lightslider.css" />                  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="../js/lightslider.js"></script> 

<style>

.pjdtl-bodysize {
	margin-left: auto;
	margin-right: auto;
	width: 1200px;
}

.pjdtl-center {
	text-align: center;
}

.pjdtl-flex-container {
	display: flex;
}

.pjdtl-project-name {
	display: flex;
	justify-content: center;
	font-size: 50px;
}

.pjdtl-pick-btn {
	display: flex;
	flex: 0 0 auto;
	margin-left: auto;
	width: 100px;
	height: 40px;
	font-size: 15px;
	font-weight:700;
	color:rgb(26, 188, 156);
	background-color:white;
	border: 1px solid rgb(26, 188, 156);
	border-radius:7px;
	padding:5px;
}

.pjdtl-hashtag {
	color: rgb(26, 188, 156);
	font-size: 25px;
}

.pjdtl-intro-box {
	width: 660px;
	height: 430px;
	border: 1px solid;
	border-color: silver;
}

.pjdtl-empty-box {
	width: 20px;
	height: 430px;
}

.pjdtl-detail-box {
	display: flex;
	flex-direction: column;
	width: 520px;
	height: 430px;
}

.pjdtl-get-price {
	font-size: 45px;
}

.pjdtl-target-price {
	font-size: 33px;
	color: #A6A6A6;
}

.pjdtl-invest-btn {
	width:420px;
	height:50px;
	margin-right:20px;
	font-size:20px;
	font-weight:800;
	color:white;
	background-color:rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
	border-radius:10px;
	padding:5px;
}

.pjdtl-share-btn {
	width: 50px;
	height: 50px;
}

.pjdtl-status-box {
	display: flex;
	justify-content: space-between;
	width: 479px;
	height: 170px;
	border: 1px solid lightgray;
	padding: 0px 20px;
}

.pjdtl-status-img {
	width: 90px;
	height: 90px;
}

.pjdtl-right-arrow {
	width: 50px;
	height: 50px;
}

.pjdtl-status-font {
	font-size: 20px;
	text-align: center;
}

.pjdtl-content {
	width: 800px;
}

.pjdtl-empty-content {
	width: 30px;
}

.pjdtl-reward {
	width: 370px;
}

.pjdtl-each-reward {
	width: 330px;
	padding: 20px;
	margin: 10px 0px;
	border: 1px solid lightgray;
}

li>img {
	max-width:660px;
	max-height:375px;
	width:auto;
	height:auto;
}

ul {
	list-style: none outside none;
	padding-left: 0;
	margin: 0;
}

.demo .item {
	margin-bottom: 60px;
}

.content-slider li {
	background-color: #ed3020;
	text-align: center;
	color: #FFF;
}

.content-slider h3 {
	margin: 0;
	padding: 70px 0;
}

.demo {
	width: 660px;
}




/* Style the tab */
.tab {
    overflow: hidden;
    /*border: 1px solid #ccc;
    background-color: #f1f1f1;*/
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    color: #747474;
    font-size: 20px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    border-bottom: 2px solid rgb(26, 188, 156);
    color:#4C4C4C;
}

/* Create an active/current tablink class */
.tab button.active {
    border-bottom: 2px solid rgb(26, 188, 156);
    color:#4C4C4C;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
}
</style>

<script>
$(document).ready(function() {
	$("#content-slider").lightSlider({
        loop:true,
      	auto:true,
        keyPress:true
    });
    $('#image-gallery').lightSlider({
        gallery:true,
        item:1,
        thumbItem:6,
        slideMargin: 0,
        speed:500,
        auto:true,
        loop:true,
        onSliderLoad: function() {
            $('#image-gallery').removeClass('cS-hidden');
        }  
    });
});

/*-----------------------------------------댓글-----------------------------------------------------------*/
$(function(){
	
	//댓글 조회
	function loadCommentsList() {
		var params = { projectNo: '${project.projectNo}'};
		$.getJSON("../support/getCommentsList", params, function(data){
			for(i=0; i<data.length; i++) {
				$("#commentList").append(makeCommentView(data[i]));
			}
		});
	}
	
	function makeCommentView(comments) {
		var div = $("<div>");
		div.attr("id", "c"+comments.commentNo);
		div.addClass('comments');
		div[0].comments=comments;
		
		var str ="<span class='userId'>" + comments.userId + "</span><br>" 
        		+"<span class='commentContent'>" + comments.commentContent +"</span><br>"
        		+"<span class='commentDate'>"+comments.commentDate+"</span><br>"
				+"<button type=\"button\" class=\"btnUpdFrm\">수정</button>"
				+"<button type=\"button\" class=\"btnDel\">삭제</button><hr><br>"
		div.html(str);
		console.log(div[0].comments);		
				
		return div;
	}

	//댓글등록
	$("#btnAdd").click(function(){
		$("#btnCancel").click();
		var params = $("[name=addForm]").serialize();		
		var url = "../forme/insertComments";
		$.getJSON(url, params, function(data){
			$("#commentList").prepend( makeCommentView(data) );
			$("[name=addForm]")[0].reset();
		});
	});
	
	//댓글 수정
	$("#btnUpd").click(function(){
		var params = $("[name=updateForm]").serialize();
		var url = "../forme/updateComments";
		$.getJSON(url, params, function(data){
			var newDiv = makeCommentView(data);
			var oldDiv = $("#c"+data.commentNo);
			$("#btnCancel").click();
			$(newDiv).replaceAll(oldDiv);
		});
	});
	//수정폼 (수정할 댓글밑에 수정폼 보이게 함)
	$("#commentList").on("click", ".btnUpdFrm", function(){
		var seq = $(this).parent().attr("id").substring(1);		//seq = 'commentNo'
		var comments = $(this).parent().get(0).comments;		//$(this).parent()[0]
		
		$("#updateForm [name=seq]").val(seq);    
		$("#updateForm [name=commentContent]").val(comments.commentContent);
		$("#updateForm [name=commentNo]").val(comments.commentNo);
		//수정할 댓글밑으로 이동하고 보이게
		$("#c"+seq).html('');
		$("#c"+seq).append($('#commentUpdate'));  
		$('#commentUpdate').show();   
	});
	//수정 취소 이벤트
	$("#btnCancel").click(function(){
		$("[name=updateForm]")[0].reset(); 
		$("#comments").append( $("#commentUpdate") );
		$("#commentUpdate").hide();  
	});
	
	
	loadCommentsList();
})








</script>

</head> 
    
<body>
    <input type="hidden" value="${project.projectNo}">
    <br>
    <div class="pjdtl-bodysize">
    <!-- 프로젝트 이름, 관리자 버튼 -->
    <div class="pjdtl-flex-container">
        <div class="pjdtl-project-name">${project.projectName}</div>
        <button class="pjdtl-pick-btn" onclick="#">PICK</button>
    </div>
    <div class="pjdtl-center"><!-- 해시태그 -->
        <c:forEach items="${hashtag}" var="projectTag">
            <span class="pjdtl-hashtag">#${projectTag.hashtagName}</span>&nbsp;
        </c:forEach>
    </div>
    <br>
    <div class="pjdtl-flex-container">
        <!-- 사진/이미지/영상/비디오 -->
        <div class="demo">
        <div class="item">
        	<div class="clearfix">
        	<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
				<c:forTokens items="${project.introductionVideo}" delims="||" var="video">
					<li data-thumb="${video}" class="video-thumb">
						<iframe width="660" height="371" src="https://www.youtube.com/embed/${video}"
							frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</li>
				</c:forTokens>
				<c:forTokens items="${project.introductionImage}" delims="||" var="img">
					<li data-thumb="/SupportForMe/upload/${img}" style="background-color:black; width:660px; height:380px;">
						<img src="/SupportForMe/upload/${img}"/>
					</li>
				</c:forTokens>
				
			</ul>
			</div>
		</div>
        </div>
        
        <div class="pjdtl-empty-box"></div>
        <!-- 디테일 박스 -->
        <div class="pjdtl-detail-box">
            <div class="pjdtl-get-price">${invest.totalInvestAmount}원<a style="font-size:40px;">(모인금액)</a></div>
            <div class="pjdtl-target-price">목표금액 ${project.targetAmount}원</div>
<!-- 진행상황 막대그래프 -->           
            <div>
            	<progress style="width:80%; height:27px;" value="${project.projectProgressRate}" max="100"></progress>
            	<span style="font-size:25px;">${project.projectProgressRate}%</span>
            </div>
            <div>
                <div>${project.progress}</div>
                <div style="font-size:25px; color:#A6A6A6;">참여자 ${invest.headcount}명</div>
            </div>
            <div style="display:flex;">
                <button class="pjdtl-invest-btn" onclick="location.href='../forme/InvestSelectReward?projectNo=${project.projectNo}'">투자하기</button>
                <img src="../images/share-button.png" class="pjdtl-share-btn" onclick="#">
            </div><br>
            <div class="pjdtl-status-box">
                <div class="">
                <div>
                    <img src="../images/calendar.png" class="pjdtl-status-img">
                    <img src="../images/right-arrow.png" class="pjdtl-right-arrow">
                    <img src="../images/credit-card.png" class="pjdtl-status-img">
                    <img src="../images/right-arrow.png" class="pjdtl-right-arrow">
                    <img src="../images/delivery-truck.png" class="pjdtl-status-img">
                </div>
                <div class="pjdtl-flex-container" >
                    <div class="pjdtl-status-font">종료일<br>${project.projectDeadline}</div>
                    <div class="pjdtl-status-font">결제 예정일<br>${project.scheduledPaymentDate}</div>
                    <div class="pjdtl-status-font">예상 배송일<br>${project.deliveryDate}</div>
                </div>
                </div>
            </div>
            
        </div>
    </div>
    </div>
    
    <div style="border-bottom:1px solid lightgray;"></div><br>
    
    <div class="pjdtl-bodysize">
        <div class="pjdtl-flex-container">
        <div class="pjdtl-content">
	        <!-- Tab links -->
	    	<div class="tab">
	  			<button class="tablinks" onclick="openContent(event, 'story')">스토리</button>
	  			<button class="tablinks" onclick="openContent(event, 'comment')">댓글</button>
			</div>
	    	
	    	<!-- Tab content -->
			<div id="story" class="tabcontent">
				${project.story}
			</div>
			
<!--댓글-->	
			<div id="comment" class="tabcontent">
			
<!--댓글출력--><div id="commentList"></div>

			<div style="width:600px; height:150px; border:1px solid grey;">
				<div id="commentAdd">
					<form name="addForm" id="addForm">
						<input type="hidden" name="projectNo" value="${project.projectNo}">
						<input type="text" name="userId" value="${member.userId}" readonly>
						<textarea name="commentContent" cols="60" rows="5"></textarea>	<br>
						<button type="button" id="btnAdd">등록</button>		
					</form>
				</div>
			</div>
			
<!--댓글 수정-->			
			<div id="commentUpdate" style="width:600px; height:150px; border:1px solid blue; display:none;">
				<form name="updateForm" id="updateForm">
					<input type="hidden" name="commentNo" value="${comments.commentNo}">
					<input type="text" name="userId" value="${member.userId}" readonly>
					<textarea name="commentContent" cols="60" rows="5"></textarea>	<br>
					<button type="button" id="btnUpd">수정</button><button type="button" id="btnCancel">취소</button>	
				</form>
			</div>
			
			
			
			
			
			
			
			
			
			
			
			
				
			</div>
        </div>
<script>
	function openContent(evt, btnName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(
					" active", "");
		}
		document.getElementById(btnName).style.display = "block";
		evt.currentTarget.className += " active";
	}
</script>
        <div class="pjdtl-empty-content"></div>
        <div class="pjdtl-reward">
            <div style="font-size:30px;">리워드 목록</div>
            <c:forEach items="${present}" var="reward" varStatus="status">
            <div class="pjdtl-each-reward">
            	<img src="../images/checkmark.png" style="width:27px; height:27px">
            	<span style="font-size:27px; color:#8C8C8C;">${presentCount[status.index].rewardSelectCount}명이 선택</span><br><br>
            	<span style="color:#4C4C4C;">가격</span><br>
            	<span style="font-size:23px; color:#FF007F;">${reward.presentPrice}원 +</span><br>
            	<span style="color:#4C4C4C;">배송비 포함</span><br><br>
            	<span style="color:#4C4C4C;">구성</span><br>
            	<span style="font-size: 23px;">${reward.presentName}</span>
            </div>
            </c:forEach>
        </div>
        </div>
    </div>
    
</body>
</html>