<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
<script src="http://malsup.github.com/jquery.form.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="/SupportForMe/smarteditor/js/HuskyEZCreator.js?ver=1"></script>

<title>프로젝트 등록</title>
<style>
/* 공통 css */
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
   
/* Modal Content/Box */
.modal-content {
   text-align:center;
   background-color: #fefefe;
   margin: 20% auto; /* 15% from the top and centered */
   padding: 5px 10px 10px 10px;
   border: 1px solid #888;
   width: 22.5%; /* Could be more or less, depending on screen size */                      
}

#alertMessage,#confirmMessage {
	border-bottom : 1px solid lightgrey;
	padding-bottom : 15px;
	margin-bottom : 10px;
}
/* The Close Button */
.close {
    color: #aaa;
    text-align:right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
     cursor: pointer;
}

/* 모달 확인 버튼 */
#alertModalClose, #confirmModalOk{
	background-color: #FF007F;
	border : none;
	border-radius : 5px;
	padding : 7px 35px;
	margin:5px;
	color:white;
}
#confirmModalCel {
	border : 1px solid #FF007F;
	border-radius : 5px;
	padding : 7px 35px;
	margin:5px;
	color:#FF007F;
	background-color:white;
}

input[type=text]:focus {
	outline: none;
}

input[type=text]:-webkit-autofill {
	-webkit-box-shadow: 0 0 0 1000px white inset;
}

.inputStyle {
	border: 1px solid lightgrey;
	border-radius: 3.5px;
	height: 30px;
	padding: 2px 10px 2px 10px;
	width: 280px;
	font-size: 17px;
}

#registerBasicFrm>div, #basic_keyword>div, #registerRewardFrm>div, #registerAccountFrm >div{
	margin: 10px 0px;
}

#registerStoryFrm>div {
	margin: 15px 0px;
}

#registerBasicFrm>div>div, #registerStoryFrm>div>div {
	margin: 10px 0px;
}

.lg {
	color: #5e5e5e;
	font-size: 17px;
}

.bold {
	color: #383737;
	font-weight: 600;
	font-size: 20px;
}

.inputRight {
	text-align: right;
}

.save_button {
	font-size: 15px;
	font-weight: 800;
	color: rgb(26, 188, 156);
	background-color: white;
	border-radius: 5px;
	border: 1px solid rgb(26, 188, 156);
	padding: 5px 50px;
	margin-top: 5px;
	margin-left: 50px;
}

.next_button  {
	font-size: 15px;
	font-weight: 800;
	color: white;
	background-color: rgb(26, 188, 156);
	border-radius: 5px;
	border: none;
	padding: 5px 50px;
	margin-top: 5px;
	margin-left: 50px;
}

.fileContainer {
	width: 1000px;
	position: relative;
	display: grid;
	grid-column: 1/5;
	grid-column-gap: 10px;
	grid-row-gap: 10px;
	grid-template-columns: repeat(5, 200px);
	/*grid-template-columns: 25% 25% 25% 25%;*/
	grid-auto-rows: minmax(20px, auto);
	/* text-align: center; */
}

.rg_img {
	position: relative;
	border: 1px solid lightgrey;
	border-radius: 2.5px;
	text-align: center;
	margin-right: 10px;
}

.rg_img:hover {
	cursor: pointer;
}

.thumbnailImg>img, .introductionImg>img, #soge {
	position: absolute;
	max-width: 100%;
	max-height: 100%;
	margin: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

#default, #plus {
	width: 35px;
	height: 35px;
}
/* basic css */
.ui-datepicker-trigger {
	width: 20px;
	height: 20px;
	vertical-align: middle;
	margin-top: 2px;
	margin-left: -10px;
	cursor: pointer;
}

#rg_projectPeriodDeadline {
	display: flex;
}

#rg_projectPeriodDeadline>input {
	margin-right: 5px;
}

#rg_projectDeadline {
	width: 200px;
	height: 35px;
	border: 1px solid lightgrey;
	border-radius: 3.5px;
	padding: 0px 5px;
	margin-left: 10px;
}

#projectDeadline {
	border: none;
	width: 165px;
	margin: 0px;
	font-size: 17px;
}

#projectDeadline:focus {
	outline: none;
}

#remainingPeriod {
	width: 200px;
}

.thumbnailImg {
	width: 395px;
	height: 300px;
}

#thumb {
	width: 190px;
	height: 160px;
}

#keyword_div {
	width: 700px;
	overflow: hidden;
	height: auto;
	min-height: 100px;
	/* 	border : 1px solid lightgrey;
	border-radius : 3.5px; */
	padding-left: 5px;
}

.keyText {
	border: 1px solid lightgrey;
	border-radius: 3.5px;
	width: 500px;
	font-size: 15px;
}

#keyword_div>.keyword {
	height: 25px;
	background-color: #EAEAEA;
	padding: 2px 5px;
	margin: 2.5px 2.5px;
	border-radius: 3.5px;
	display: inline-block;
	float: left;
}

.keyword>label {
	padding-right: 2.5px;
	margin-right: 5px;
}

.keyword>img {
	width: 10px;
	height: 10px;
	margin-top: 7.5px;
	opacity: 0.2;
}

.keyword>img:hover {
	cursor: pointer;
	opacity: 0.8;
}
[type="radio"]:checked,
[type="radio"]:not(:checked) {
    position: absolute;
    left: -9999px;
}
[type="radio"]:checked + label,
[type="radio"]:not(:checked) + label
{
    position: relative;
    padding-left: 28px;
    cursor: pointer;
    line-height: 20px;
    display: inline-block;
    color: #666;
}
[type="radio"]:checked + label:before,
[type="radio"]:not(:checked) + label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 18px;
    height: 18px;
    border: 1px solid #ddd;
    border-radius: 100%;
    background: #fff;
}
[type="radio"]:checked + label:after,
[type="radio"]:not(:checked) + label:after {
    content: '';
    width: 12px;
    height: 12px;
    background: #1abc9c;
    position: absolute;
    top: 4px;
    left: 4px;
    border-radius: 100%;
    -webkit-transition: all 0.2s ease;
    transition: all 0.2s ease;
}
[type="radio"]:not(:checked) + label:after {
    opacity: 0;
    -webkit-transform: scale(0);
    transform: scale(0);
}
[type="radio"]:checked + label:after {
    opacity: 1;
    -webkit-transform: scale(1);
    transform: scale(1);
}
/*
*story style
*/
.introductionImg {
	width: 200px;
	height: 150px;
}

.sogeRemove {
	width: 200px;
	height: 150px;
	opacity: 0
}

.sogeRemove:hover {
	opacity: 1
}

.videoInput {
	border: 1px solid lightgrey;
	border-radius: 3.5px;
	height: 30px;
	padding: 2px 10px;
	width: 380px;
	font-size: 17px;
}

.videoSpan {
	width: 34px;
	height: 34px;
	display: inline-block;
	vertical-align: middle;
	position: relative;
	border: 1px solid lightgrey;
	border-radius: 2.5px;
	text-align: center;
}

.videoPlus, .videoMinus {
	width: 20px;
	height: 20px;
}

.videoSpan>.videoPlus, .videoSpan>.videoMinus {
	position: absolute;
	max-width: 100%;
	max-height: 100%;
	margin: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.checks {
	position: relative;
	display: inline-block;
	padding-right: 10px;
}


/*
*reward style
*/
#reward_box {
	background-color: rgb(244, 243, 243);
	width: 580px;
	height: 300px;
	padding: 15px;
}

#reward_box div {
	margin: 10px 5px;
}

.reward_grid {
	display: grid;
	grid-template-columns: 100px 5fr 1fr;
}

.reward_grid>label {
	
}

#reward_input {
	width: 400px;
	height: 25px;
	border: 1px solid lightgrey;
	border-radius: 3.5px;
	padding-left: 10px;
}

#reward_input:focus, #reward_textarea:focus {
	outline: 1px solid rgb(26, 188, 156);
}

#reward_textarea {
	width: 400px;
	height: 100px;
	resize: none;
	border-radius: 3.5px;
	border: 1px solid lightgrey;
	padding: 10px;
	font-size:17px;
}

.reward_button {
	font-size: 15px;
	font-weight: 800;
	padding: 5px 45px;
	margin-top: 5px;
	margin-left: 50px;
}

.preview_button {
	font-size: 15px;
	font-weight: 800;
	padding: 2.5px 10px;
	margin-top: 5px;
}
.add_button, .rewardEdit  {
	color: rgb(26, 188, 156);
	background-color: white;
	border-radius: 5px;
	border: 1px solid rgb(26, 188, 156);
	margin-right:10px;
}

.reset_button, .rewardDel  {
	color: white;
	background-color: rgb(26, 188, 156);
	border-radius: 5px;
	border: none;
}

.rg_delivery {
	width: 200px;
	height: 35px;
	border: 1px solid lightgrey;
	border-radius: 3.5px;
	margin-top: -10px;
	background-color: white;
	border-radius: 3.5px;
}

#presentDeliveryDate {
	border: none;
	width: 165px;
	margin: 0px;
	font-size: 17px;
}

#delivery_date:focus {
	outline: none;
}
#reward_preview{
	width: 1000px;
	position: relative;
	display: grid;
	grid-column: 1/4;
	grid-column-gap: 10px;
	grid-row-gap: 10px;
	grid-template-columns: repeat(4, 220px);
	/*grid-template-columns: 25% 25% 25% 25%;*/
	grid-auto-rows: minmax(20px, auto);
	/* text-align: center; */
}
.reward_preview_box {
	width: 190px;
	height: 190px;
	padding: 10px 10px 10px 15px;
	border: 1px solid lightgray;
}

.rw_preview_amount_div {
	font-size: 25px;
	color: #302c2c;
	font-weight: 700
}

.rw_preview_info_s, .rw_preview_delivery_s {
	font-size: 16px;
	color: #5e5e5e;
	margin: 5px 0px 2px 0px;
}

.rw_preview_info, .rw_preview_delivery {
	font-size: 18px;
	color: #211f1f;
	margin: 2px 0px 10px 0px;
}

/*
* account page css
*/
#depositAccount {
	width:350px;
	height:30px;
	border : 1px solid lightgrey;
	border-radius:3.5px;
	padding-left:10px;
}
#bankCode {
	border : 1px solid lightgrey;
	border-radius:3.5px;
	width : 200px;
	height:30px;
}
.register_button {
	font-size: 15px;
	font-weight: 800;
	color: rgb(231, 76, 60);
	background-color: white;
	border-radius: 5px;
	border: 1px solid rgb(231, 76, 60);
	padding: 5px 50px;
	margin-top: 5px;
	margin-left: 50px;
}
#accountNotice {
	width: 1000px;
	background-color: #e3f7eb;
	padding : 15px 10px ;
	font-size : 18px;
	vertical-align:middle;
}
#notice {
	width:80px;
	background-color: #7ebc97;
	border-radius: 5px;
	padding : 5px 15px;
	
}
</style>
<script>
$(function() {
		//////공통 js-------------------------
		$(document).on("click",".save_button",function(){
			var url = "../saveProject/ex";
			var saveClass = $(this).attr("class").substring(12);
			var params ;
			if(saveClass == 'basic'){
				url = "../saveProject/basic";
				params = $("#registerBasicFrm").serialize();
			}else if(saveClass == 'story'){
				url = "../saveProject/story";
				params = $("#registerStoryFrm").serialize();
			}else if(saveClass == 'reward'){
				params = $("#rewardRegisterFrm").serialize();
			}else if(saveClass == 'account'){
				params = $("#registerAccountFrm").serialize();  
			}
			$.getJSON(url,params,function(result){
				$("#alertModal > #alertMessage").text('저장되었습니다.');
				$("#alertModal").show();
				$("#alertModal > .model-content").show("slow");
			}) 
		});
		
		$("#alertModalClose").on("click",function(){
			$("#alertModal").hide();
		});
		$(".close").on("click",function(){
			$(this).parent().parent().hide();
		});

		/*  $("#alertModal").css("display","block");  */
		/* $("#confirmModal").css("display","block"); */
		
		//////공통 js----------------------
	
		//////기본정보 js ------------------
		$(".next_button").on("click",function(){
				$.ajax({
					url : "../insertHashtag",
					data : $("#hashtagFrm").serialize(),
					method : "post",
					success : function(result) {}
				});
				$.ajax({
					url : "../updateProject/story",
					data : $("#registerBasicFrm").serialize(),
					method : "post",
					success : function(result) {
						$("#result").html(result);
						$("#rn > .basic").removeClass("active");
						$("#rn > .story").addClass("active");								}
				});
					
		}); 
		
		$("#projectDeadline").datepicker(
				{
					dateFormat : "yy-mm-dd",
					maxDate : "+1m +19d", //7 // new Data(2018,11,20)
					minDate : "1w",
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					onSelect : function(strDate, obj) {
						var now = new Date();
						var dDay = new Date(obj.selectedYear,
								obj.selectedMonth, obj.selectedDay);
						var now2 = now.getTime();
						var dDay2 = dDay.getTime();
						var remain = dDay2 - now2;
						remain = Math.floor(remain / (24 * 3600 * 1000)) + 1;
						$("#remainingPeriod").val(remain);
					},
					showOn : "both",
					buttonImage : "/SupportForMe/images/calendar.png",
					buttonImageOnly : true,
					buttonText : "Select date"
		});
		
		$(".thumbnailImg").on("click",function(){
			$("#fileUploadImage").click();
		});
		
		$("#fileUploadImage").on("change",function() {
		
			if($(this).val() != "") {
				$("#fileUploadFrm").ajaxForm({
					dataType:"json",
					url:'../fileUpload',
					success: 
						function(result, textStatus){
							if(result.code = 'success') {
								var fileName = result.filename;
								$("#default").hide();
								var img = "<img src='/SupportForMe/upload/"+fileName+"'>";
								var tn = "<input type='hidden' name='image' id='thumbImage' value='"+fileName+"'>";
								$(".thumbnailImg").html(img + "<br>" + tn); 
							}
						},
					error: 
						function(){
							alert("파일업로드 중 오류가 발생하였습니다.");
							return;
						}
				}).submit();
			}
		}); 
		
		//hashtag-----------------------------
		//hashtag 갯수 가져오기
		function removeNo() {
			var removeCount = $(".remove").length;
			
			if(removeCount > 0){
				var removeEnd = $(".remove").eq(removeCount-1).attr("class").substr(7);
				return parseInt(removeEnd) + 1;	
			}
			else { return removeCount+1; }
		}
		$("input[name='keyword']").on("keydown",function(e){
			
			if(e.keyCode == 13){//키가 13이면 실행 (엔터는 13)
				
				if($(".remove").length < 5){
					var key = $(this).val();
					var rc = removeNo();
		            var k = "<span class='keyword'><label class='keyword_label'>"+key
		            	  + "</label><img src='/SupportForMe/images/remove.png' class='remove " + rc + "'></span>";
		           	var keyHidden = "<input type='hidden' name='arrHashtag' class='hashHidden"+rc+"' value='" + key + "'>";
		            $("#keyword_div").append(k);
		            $("input[name='keyword']").val("");
		            $("#hashtagFrm").append(keyHidden);
				}else {
					alert("최대 5개 까지입니다.");
					$("input[name='keyword']").val("");
				}
	        }
			
		});
		
		$(document).on("click",".remove",function(){
			var cnt = $(this).attr("class").substr(7);
			var removeKey = $(this).prev().text();
			if($(".hashHidden"+cnt).hasClass("db")){
				var keyNo = $(".hashHidden"+cnt).attr("id");
				 $.ajax({
					url : "../deleteHashtag",
					dataType : "JSON",
					data : {"hashtagNo":keyNo,"hashtagName":removeKey},
					method : "post",
					success : function(result) {
						if(result.code = 'success') {
							$(".hashHidden"+cnt).remove();
							$(".remove."+cnt).parent().remove();
						}
					},
					error : function() {
						alert("삭제할 수 없습니다.")
					} 
				});
			}else {
				$(this).parent().remove();
				$(".hashHidden"+cnt).remove();
			}
			
			
			
		})
		//hashtag 끝-----------------------------		

		//기본정보 js 끝 ---------------------------------------------------------       
	   	
		//story--------------------------------------------------------------
		
		//story page video url----------------
		$(document).on("click",".videoPlus",function(){
			if($(this).parent().prev().val() != '' && !$(this).parent().parent().next().is(":visible")){
				var videoDiv = "<div class='videoUrl'>"
       			 + "<input type='text' placeholder='  YouTube URL을 입력해주세요.' class='videoInput' name='arrVideo'>"
       			 + " <span class='videoSpan'><img src='/SupportForMe/images/plus1.png' class='videoPlus'></span></div>";
       			$("#story_video").append(videoDiv);		
			} else {
				alert('url을 입력해주세요');
			}
		});
		
		
		//story page video url end------------
		
		//story page img upload---------------
		function sogeRemoveNo() {
			var removeCount = $(".sogeRemove").length;
			
			if(removeCount > 0){
				var removeEnd = $(".sogeRemove").eq(removeCount-1).attr("class").substr(11);
				return parseInt(removeEnd) + 1;	
			}
			else { return removeCount+1; }
		}
		
		
		$(document).on("click","#storyDefault",function(){
			$("#fileUploadStory").click();
		});
		
		$(document).on("change","#fileUploadStory",function() {
			
			if($(this).val() != "") {
				$("#fileUploadStoryFrm").ajaxForm({
					dataType:"json",
					url:'../fileUpload',
					success: 
						function(result, textStatus){
							if(result.code = 'success') {
								var fileName = result.filename;
								var RemoveNo = sogeRemoveNo();
								$("#storyDefault").remove();
								var img = "<div class='introductionImg rg_img soge'>"
										+ "<img src='/SupportForMe/upload/"+fileName+"' id='soge'>"
										+ "<img src='/SupportForMe/images/slimcancel.png' class='sogeRemove "+RemoveNo+"'>"
										+ "<input type='hidden' name='arrImage' value='"+fileName+"'>"
										+ "</div>";	
										/* "<input type='hidden' name='arrImage' class='sogeHidden"+RemoveNo+"' value='"+fileName+"'>" */
								$(".plus").before(img)
							}
						},
					error: 
						function(){
							alert("파일업로드 중 오류가 발생하였습니다.");
							return;
						}
				}).submit(); 
			}
		}); 
		
		$(document).on("click",".plus",function(){
			
			if($(this).prev().attr("id") != "storyDefault"){
				var dfImg = "<div class='introductionImg rg_img' id='storyDefault'>"
					  + "<img src='/SupportForMe/images/picture.png' id='default'>"	
					  +	"</div>";
					$(".plus").before(dfImg);
			}else { alert("먼저 이미지를 등록해주세요"); return ;}
			
		})
		
		
		$(document).on("click",".sogeRemove",function(){
			var cnt = $(this).attr("class").substr(11);
			var removeImg = $(this).prev().attr("src").split('/');
			var projectNo = $("input[name=projectNo]").val();
			var introImg = removeImg[3];
			$.ajax({
				url : '../deleteIntroductionImg',
				dataType : "JSON",
				data : {"removeIntroductionImg":introImg},
				method : "post",
				success : function(result) {
						$(".sogeRemove."+cnt).parent().remove();
						
						if(!$(".soge").is(":visible") && !$("#storyDefault").is(":visible")){
							var dfImg = "<div class='introductionImg rg_img' id='storyDefault'>"
								  	  + "<img src='/SupportForMe/images/picture.png' id='default'>"	
								  	  +	"</div>";
							$(".plus").before(dfImg);
						}		
				},
				error : function() {
					alert("삭제할 수 없습니다.")
				} 
			});   
		})
		//story page img upload----------- 
		
		

		//story 끝--------------------------------------------------------------	
		
});

</script>

</head>
<body>
 <!-- The Modal -->
 <div id="alertModal" class="modal">
   <!-- Modal content -->
   <div class="modal-content">                                                                   
    <div class="close">&times;</div>
  	<div id="alertMessage">
  		저장되었습니다.
  	</div>
  	<button id="alertModalClose">확인</button>
     </div>
 </div>
 <div id="confirmModal" class="modal">
   <!-- Modal content -->
   <div class="modal-content">                                                                   
    <div class="close">&times;</div>
  	<div id="confirmMessage">
  		정말 삭제하시겠습니까?
  	</div>
  	<button id="confirmModalOk">확인</button> <button id="confirmModalCel">취소</button>
   </div>
 </div>

	<div id="result">
		<div id="pageInfo" style="display:none">basic</div>
		<form name="fileUploadFrm" id="fileUploadFrm" method="post">
			<input type="file" name="uploadFile" id="fileUploadImage" accept=".gif, .jpg, .png"  style="display:none">
		</form>
		<div style="height: 50px"></div>
		
		<form name="registerBasicFrm" id="registerBasicFrm">
			<input type="hidden" name="projectNo" value="${project.projectNo}">
			<input type="hidden" name="userId" value="${project.userId}">
			<div id="basic_subject">
				<div class="bold">프로젝트의 제목을 적어주세요</div>
				<input type="text" name="projectName" id="r_projectName" class="inputStyle" value="${project.projectName}">
			</div>
			<div id="basic_category">
				<div class="bold">프로젝트 분야를 선택해주세요</div>
				<div class="checks small">
					<input type="radio" id="category1" name="categoryCode" value="001">
					<label for="category1">공연</label>
				</div>
				<div class="checks small">
					<input type="radio" id="category2" name="categoryCode" value="002" >
					<label for="category2">영화</label>
				</div>
				<div class="checks small">
					<input type="radio" id="category3" name="categoryCode" value="003" >
					<label for="category3">미술</label>
				</div>
				<div class="checks small">
					<input type="radio" id="category4" name="categoryCode" value="004" >
					<label for="category4">도서</label>
				</div>
				<script>
					var category = '${project.categoryCode}';
					
					switch(category){
						case "001" : $("#category1").attr("checked",true); break;
						case "002" : $("#category2").attr("checked",true); break;
						case "003" : $("#category3").attr("checked",true); break;
						case "004" : $("#category4").attr("checked",true); break;
					}
				</script>
			</div>
			<div id="basic_target">
				<div class="bold">목표 금액을 적어주세요</div>
				<div class="lg"><span style="color:#e74c3c" class="bold">최소 100,000원 이상</span>이어야 합니다.</div>
				<input type="text" name="targetAmount" id="r_targetAmount" 
					class="inputStyle inputRight"  placeholder="0"> 원
				<c:if test="${project.targetAmount != null }">
					<script>
						$("input[name=targetAmount]").val('${project.targetAmount}');
					</script>
				</c:if>
			</div>
			<div id="basic_">
				<div class="bold">프로젝트의 진행기간을 적어주세요</div>
				<div class="lg">최소 7일부터 최대 50일까지 가능합니다.</div>
				<div id="rg_projectPeriodDeadline">
					<input type="text" name="remainingPeriod" id="remainingPeriod"
						class="inputStyle inputRight" disabled><label class="lg" style="padding-top:5px">일 남음</label> 
					 <div id="rg_projectDeadline">
						<input type="text" name="projectDeadline" id="projectDeadline" class="inputStyle" value="">
					</div>
					<script>
						var deadLine = '${project.projectDeadline}';
						console.log(deadLine);
						var dl = deadLine.split(".");
						if(deadLine != null && deadLine != " "){
							var now = new Date();
							var dDay = new Date(dl[0],dl[1]-1, dl[2]);
							var now2 = now.getTime();
							var dDay2 = dDay.getTime();
							var remain = dDay2 - now2;
							remain = Math.floor(remain / (24 * 3600 * 1000)) + 1;
							$("#remainingPeriod").val(remain);
							$("#projectDeadline").val(dl[0]+"-"+dl[1]+"-"+dl[2]);
						}
					</script>
				</div>
			</div>
			<div id="basic_">
				<div class="bold">프로젝트 대표 이미지를 등록해주세요</div>
				<div class="fileContainer"> 
					<div class="thumbnailImg rg_img">
						<img src="/SupportForMe/images/picture.png" id="default">
						<c:if test="${project.image != null}" >
							<img src="/SupportForMe/upload/${project.image}">
						</c:if>
					</div>
				</div>
			</div>
			</form>
			
			<form name="hashtagFrm" id="hashtagFrm" method="post">
				<input type="hidden" name="projectNo" value="${project.projectNo}">
			     <c:if test="${hashtag.size() > 0}" >
						<c:forEach var="i" begin="0" end="${hashtag.size()-1}">
							<input type='hidden' name='arrHashtag' class='hashHidden${i} db' id="${hashtag[i].hashtagNo}" 
									value='${hashtag[i].hashtagName}'>
						</c:forEach>
		         </c:if>
			</form>
	
			<div id="basic_keyword">
				<div class="bold">프로젝트 키워드를 적어주세요 <span style="color:#e74c3c">(선택사항)</span></div>
				<div class="lg">제목 외에도 키워드 검색 시 검색 결과에 프로젝트가 나타납니다.</div>
				<input type="text" name="keyword" class="inputStyle keyText" maxlength="10"
						placeholder="최대 5개까지 등록 가능합니다. 키워드 입력 후 엔터를 눌러주세요." autocomplete=off>
				<div id="keyword_div">
					<c:if test="${hashtag.size() > 0}" >
						<c:forEach var="i" begin="0" end="${hashtag.size()-1}">
							<span class='keyword'><label class='keyword_label'>${hashtag[i].hashtagName}</label>
							<img src='/SupportForMe/images/remove.png' class='remove ${i}'></span>
						</c:forEach> 
		          	</c:if> 
				</div>
			</div>
			<input type="button" name="save" class="save_button basic" value="저장하기">
			<input type="button" name="next" class="next_button basic" value="다음 단계">
		
	</div>
</body>
</html>