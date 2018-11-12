<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<title></title>

<link rel="stylesheet" href="../css/projectDetail.css">

<!-- 슬라이드 -->
<link type="text/css" rel="stylesheet" href="../css/lightslider.css" />                  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="../js/lightslider.js"></script> 

<!-- 진행률 상태바 -->
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	var path = "<c:url value='/'/>"
	
/*----------------------------------------슬라이드---------------------------------------------------------*/
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
		$.getJSON(path+"/support/getCommentsList", params, function(data){
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
		
		var str = "<div class='updComment' style='background-color: #F6F6F6; border-bottom:3px solid white;'>"
				+ "<div style='display:flex;'>"
				+ "		<div style='width:60px; margin-right:10px;'>"
				+ "			<img src='../images/user-icon.png' style='width:60px; height:60px; margin:auto;'><br>"
				+ "			<img name='rcBtn' id='rcBtn' src='../images/comments.png' style='width:40px; height:40px; margin-top:60px;'>"
				+ "		</div>"
				+ "		<div>"
				+ "			<span class='userId' style='font-size:22px; color:#4C4C4C'>"+ comments.userId + "</span>&nbsp;&nbsp;"
				+ "			<span class='commentDate' style='color:#747474'>"+ comments.commentDate + "</span><br>"
				+ "			<textarea name='commentContent' class='commentContent' readonly cols='53' rows='5' style='resize:none; border:none; font-size:17px; margin-right:10px;'>"+ comments.commentContent +"</textarea>"
				+ "		</div>"
				+ "		<div style='margin:auto;'>"
				+ "			<button type='button' class='btnUpdFrm' style='width:170px; height:40px;'>수정</button>"
				+ "			<button type='button' class='btnDel' style='width:170px; height:40px;'>삭제</button>"
				+ "		</div>"
				+ "</div>"
				+ "<div id='rcList' style='display:none; border-top:2px dotted #BDBDBD; padding:10px; margin-top:10px;'></div>"
				+ "<div id='replyCommentAdd' style='display:none; width:100%; padding:15px; background-color:#F6F6F6;'>"
				+ "		<form name='replyAddForm' id='replyAddForm'>"
				+ "			<input type='hidden' name='projectNo' value='${project.projectNo}'>"
				+ "			<input type='hidden' name='userId' value='${pMember.userId}'>"
				+ "			<input type='hidden' name='topCommentNo' value='"+comments.commentNo+"'>"
				+ "			<div style='display:flex;'>"
   				+ "				<img src='../images/arrow.png' style='width:60px; height:60px; margin:auto;'>&nbsp"
    			+ "				<textarea name='commentContent' cols='70' rows='5'></textarea>&nbsp;"
    			+ "				<button type='button' id='replyBtnAdd' style='width:170px; height:40px; margin:auto;'>등록</button>"
				+ "			</div>"
				+ "		</form>"
				+ "</div>"
				+ "</div>";
		div.html(str);

		return div;
	}
	//답글 조회(버튼클릭시 화면에 출력, 답변이 보이는 상태에서 버튼을 클릭하면 답글목록 닫음)
	$("#commentList").on("click", "#rcBtn", function(){
		/*rc: reply comment*/
		var rc_id = $(this).closest(".comments").attr("id").substring(1);
		
		var rcList = $("#c"+rc_id).children().children("#rcList");
		var rcAdd = $("#c"+rc_id).children().children("#replyCommentAdd");
		
		if( rcList.is(":visible") || rcAdd.is(":visible") ) {
			rcList.children().remove();
			rcList.hide();
			rcAdd.hide();
		} else {
		$.getJSON(path+"/support/getReplyCommentsList?topCommentNo="+rc_id, function(data) {
			for(i=0; i<data.length; i++) {
			$("#c"+rc_id).children().children("#rcList").append(makeReplyCommentView(data[i])).show();
		}
		});
		$("#c"+rc_id).children().children("#replyCommentAdd").show();
		}
	
	});
	//답글 만드는 함수
	function makeReplyCommentView(comments) {
		var div = $("<div>");
		div.attr("id", "rc"+comments.commentNo);
		div.addClass('comments');
		div[0].comments=comments;
		
		var str = "<div class='replyComment' style='background-color: #F6F6F6; border-bottom:1px dotted #BDBDBD;'>"
				+ "<div style='display:flex; padding:10px;'>"
				+ "	<div style='width:60px; margin-right:10px;'>"
				+ "		<img src='../images/arrow.png' style='width:50px; height:50px; margin:auto;'><br>"
				+ "	</div>"
				+ "		<div>"
				+ "			<span class='userId' style='font-size:22px; color:#4C4C4C'>"+ comments.userId + "</span>&nbsp;&nbsp;"
				+ "			<span class='commentDate' style='color:#747474'>"+ comments.commentDate + "</span><br>"
				+ "			<textarea name='commentContent' class='commentContent' readonly cols='51' rows='5' style='resize:none; border:none; font-size:17px; margin-right:10px;'>"+ comments.commentContent +"</textarea>"
				+ "		</div>"
				+ "		<div style='margin:auto;'>"
				+ "			<button type='button' class='rcBtnUpdFrm' style='width:170px; height:40px;'>수정</button>"
				+ "			<button type='button' class='rcBtnDel' style='width:170px; height:40px;'>삭제</button>"
				+ "		</div>"
				+ "</div>"
				+ "</div>";
		
		div.html(str);
		return div;
	}
	
	//댓글등록
	$("#btnAdd").click(function(){
		var params = $("[name=addForm]").serialize();		
		var url = path+"/forme/insertComments";
		$.getJSON(url, params, function(data){
			$("#commentList").prepend( makeCommentView(data) );
			$("[name=addForm]")[0].reset();
		});
	});
	//답글등록
		$("#commentList").on("click", "#replyBtnAdd", function(){
		var params = $(this).closest("[name=replyAddForm]").serialize();
		var check_this = $(this).closest("[name=replyAddForm]");	//function안에서 this 안돼서 넣음
		var url = path+"/forme/insertReplyComments";
		$.getJSON(url, params, function(data){		
			check_this.parent().prev().prepend( makeReplyCommentView(data) );
			check_this.closest("[name=replyAddForm]")[0].reset();
		});
	});
	
	//댓글 수정
	$("#btnUpd").click(function(){
		var params = $("[name=updateForm]").serialize();
		var url = path+"/forme/updateComments";
		$.getJSON(url, params, function(data){
			var newDiv = makeCommentView(data);
			var oldDiv = $("#c"+data.commentNo);
			$("#btnCancel").click();
			$(".tabcontent").append($("#commentUpdate"));
			$("[name=updateForm]")[0].reset(); 
			$('#commentUpdate').hide(); 
			$(newDiv).replaceAll(oldDiv);
		});
	});
	//답글 수정
	
	
	//수정폼
	$("#commentList").on("click", ".btnUpdFrm", function(){
		var seq = $(this).closest(".comments").attr("id").substring(1);		//seq = 'commentNo'
		var temp_seq = $("#c"+seq);
		var comments = temp_seq[0].comments;		//$(this).parent()[0]
		$("#updateForm [name=seq]").val(seq);    
		$("#updateForm [name=commentContent]").val(comments.commentContent);
		$("#updateForm [name=commentNo]").val(comments.commentNo);
		
		$("#c"+seq).find(".updComment").hide();
		$("#c"+seq).append($('#commentUpdate')); 
		$('#commentUpdate').show();   
	});
	//수정 취소
	$("#btnCancel").click(function(){
		var seq = $(this).closest(".comments").attr("id").substring(1);
		$("[name=updateForm]")[0].reset(); 
		$(".tabcontent").append( $("#commentUpdate") );
		$("#commentUpdate").hide();
		$("#c"+seq).find(".updComment").show();
	});
	
	//댓글 삭제
	$("#commentList").on("click", ".btnDel", function(){
		var seq = $(this).closest(".comments").attr("id").substring(1);  //seq = 'commentNo' => 201811080061
		if(confirm("댓글을 삭제하시겠습니까?")) {
			var params = "commentNo="+ seq;
			var url = path+"/forme/deleteComments";
			$.getJSON(url, params, function(data){
				$('#c'+data.commentNo).remove();
			});
		}
	});
	//답글 삭제
	$("#commentList").on("click", ".rcBtnDel", function(){
		var seq = $(this).parent().parent().parent().parent().attr("id").substring(2);
		console.log("아아아아아아아아아악아아아아아악"+seq);
		if(confirm("답글을 삭제하시겠습니까?")) {
			var params = "commentNo="+seq;
			var url = path+"/forme/deleteComments";
			$.getJSON(url, params, function(data){
				$('#rc'+data.commentNo).remove();
			});
		}
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
        <c:if test="${pMember.userId == 'admin'}">
        	<button class="pjdtl-pick-btn" >PICK</button>
    	</c:if>
    </div>
    <div class="pjdtl-center"><!-- 해시태그 -->
        <c:forEach items="${hashtag}" var="projectTag">
            <span class="pjdtl-hashtag" onclick="location.href='../support/getProjects?searchKeyword=${projectTag.hashtagName}'">#${projectTag.hashtagName}</span>&nbsp;
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
							frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"></iframe>
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
            <div style="font-size:45px;">${invest.totalInvestAmount}원<span style="font-size:37px;">(모인금액)</span></div>
            <div class="pjdtl-target-price">목표금액 ${project.targetAmount}원</div>
			<div style="width:70px; border:1px solid #FF007F; border-radius:7px; color:#FF007F; padding:5px; text-align:center; margin-bottom:5px;">
				<span style="font-weight:700;">${project.progress}</span>
			</div>
<!-- 진행상황 막대그래프 -->
			<div class="progress">
				<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${project.projectProgressRate}%">${project.projectProgressRate}%</div>
			</div>
			
            <div style="font-size:25px; color:#A6A6A6;">참여자 ${invest.headcount}명</div>
            <div style="display:flex;">
                <button class="pjdtl-invest-btn" onclick="location.href='../forme/InvestSelectReward?projectNo=${project.projectNo}'">투자하기</button>
                <img src="../images/share-button.png" class="pjdtl-share-btn">
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
		
		<div class="container">
		  <ul class="nav nav-tabs" style="width:785px;">
		    <li class="active"><a data-toggle="tab" href="#home">스토리</a></li>
		    <li><a data-toggle="tab" href="#menu1">댓글</a></li>
		  </ul>
		
		  <div class="tab-content">
		    <div id="home" class="tab-pane fade in active" style="width:785px;">
		    	${project.story}
		    </div>
		    <div id="menu1" class="tab-pane fade" style="width:785px;">
		     			
<!--댓글-->	
			<div id="comment" class="tabcontent">
			
<!--댓글출력--><div id="commentList"></div>
			<br>
<!--댓글입력--><div id="commentAdd" style="width:785px; padding:15px; background-color:#F6F6F6;">
				<form name="addForm" id="addForm">
					<input type="hidden" name="projectNo" value="${project.projectNo}">
					<input type="hidden" name="userId" value="${pMember.userId}">
                       <div style="display: flex;">
				           <img src="../images/user-icon.png" style="width:60px; height:60px; margin:auto;">&nbsp;
                           <textarea name="commentContent" cols="70" rows="5"></textarea>&nbsp;
                           <button type="button" id="btnAdd" style="width:170px; height:40px; margin:auto;">등록</button>
				       </div>
 				</form>
			</div><br><br>
			
<!--댓글 수정-->			
			<div id="commentUpdate" style="width:785px; padding:15px; background-color:#F6F6F6; border-bottom:2px solid white;display:none;">
				<form name="updateForm" id="updateForm">
					<input type="hidden" name="commentNo" value="${comments.commentNo}">
					<input type="hidden" name="userId" value="${pMember.userId}">
					<div style="display: flex;">
						<img src="../images/user-icon.png" style="width:60px; height:60px; margin:auto;">&nbsp;
						<textarea name="commentContent" cols="70" rows="5"></textarea>&nbsp;
						<div style="margin:auto;">
							<button type="button" id="btnUpd" style="width:170px; height:40px;">수정</button><br>
							<button type="button" id="btnCancel" style="width:170px; height:40px;">취소</button>
						</div>
					</div>	
				</form>
			</div>

        	
			
			
		    </div>
<!--댓글탭끝나는곳--></div>
		</div>

			
				
			</div>
        </div>

        <div class="pjdtl-empty-content"></div>
        <div class="pjdtl-reward">
            <div style="font-size:30px;">리워드 목록</div>
            <c:forEach items="${present}" var="reward" varStatus="status">
            <div class="pjdtl-each-reward">
            	<div style="display:flex;">
            		<img src="../images/checkmark.png" style="width:27px; height:27px">
            		<c:choose>
            		<c:when test="${presentCount[status.index].rewardSelectCount == null}">
            			<span style="font-size:27px; color:#8C8C8C;">0명이 선택</span>
            		</c:when>
            		<c:otherwise>
            			<span style="font-size:27px; color:#8C8C8C;">${presentCount[status.index].rewardSelectCount}명이 선택</span>
            		</c:otherwise>
            		</c:choose>
            	</div><br><br>
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