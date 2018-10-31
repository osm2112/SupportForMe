<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
<script src="http://malsup.github.com/jquery.form.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>프로젝트 등록</title>
<style>
input:focus{
	outline:none;
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

.next_button {
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

.ui-datepicker-trigger {
	width: 20px;
	height: 20px;
	vertical-align: middle;
	margin-top:2px;
}
#rg_projectPeriodDeadline {
	display:flex;
}
#rg_projectPeriodDeadline > input {
	margin-right:5px;
}
#rg_projectDeadline {
	width: 175px;
	height:35px;
	border : 1px solid lightgrey;
	border-radius: 3.5px;
	padding :0px 5px;
	margin-left : 10px;
} 
#projectDeadline {
	border :none;
	width : 145px;
	margin:0px;
	font-size:17px;
}
#projectDeadline:focus {
	outline:none;
}
.inputStyle {
	border : 1px solid lightgrey;
	border-radius: 3.5px;
	height:30px;
	padding-left:10px;
}
.inputStyle:focus {
	outline:none;
}
.inputRight {
	text-align: right;
	padding-right:10px;
}
.fileContainer {
    position: relative;
    display:flex;

}
.rg_img {
	position:relative;
	border : 1px solid lightgrey;
	text-align: center;
	margin-right:10px;
}
.rg_img:hover {
	cursor:pointer;
}
.thumbnailImg {
	width:200px;
	height:170px;
}
.introductionImg {
	width:150px;
	height:120px;
}
.thumbnailImg > img, .introductionImg > img, #soge{
	position:absolute;
    max-width:100%; max-height:100%;
  	margin:auto;
    top:0; bottom:0; left:0; right:0;
}

#default ,#plus{
	 width:35px;
	 height:35px;
}
#thumb {
	width:190px;
	height:160px;
}

#registerBasicFrm > div{
	margin:10px 0px;
	font-size:17px;
}
#registerBasicFrm > div > input, #registerBasicFrm > div > div{
	margin:10px 0px;
}  

#keyword_div {
	width:700px;
	height:35px;
	border : 1px solid lightgrey;
	border-radius : 3.5px;
}
#keyword_div > input {
	border : none;
	width : 500px;
	font-size:15px;
}
#keyword {
	position:relative;
	height:25px;
	background-color:#4682B4;
	display:grid;
	grid-template-columns: 50px 50px;
}
#keyword > img {
	position:absolute;
	width : 20px;
	height:20px;
	vertical-align:middle;
}
</style>
<script>
$(function() {
		$(".save_button").on("click", function() {

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
						console.log(obj);
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

			$("#fileUploadFrm").ajaxForm({
				dataType:"json",
				url:'fileUpload',
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
		}); 
		
		$(".next_button").on("click",function() {
			
			var page = $(this).attr("class").split(" ")[1];
			
			if(page == "basic"){
					$.ajax({
					url : "../updateProject/story",
					data : $("#registerBasicFrm").serialize(), 
					method : "post",
					success : function(result) {
						$("#result").html(result);
					}
				}); 
			}else if(page == "story") {
				$.ajax({
					url : "../updateProject/reward",
					data : $("#registerStoryFrm").serialize(), 
					method : "post",
					success : function(result) {
						$("#result").html(result);
					}
				});	
			}else if(page == "reward"){
				$.ajax({
					url : "../updateProject/pay",
					data : $("#registerRewardFrm").serialize(), 
					method : "post",
					success : function(result) {
						$("#result").html(result);
					}
				});	
			}else {
				return;
			}
			
			
		}); 
		
		$("input[name=keyword]").on("keypress",function(e) { 

		    if (e.keyCode == 13){
		    	var keyword = $(this).val();
		    	/* var spanKeyword = "<span id=" */
		    	

		    }    
		});
		
});

</script>
</head>
<body>
	<form name="fileUploadFrm" id="fileUploadFrm" method="post">
		<input type="file" name="uploadFile" id="fileUploadImage" style="display:none">
	</form>
	<div id="result">
	<div style="height: 40px"></div>
	
	<form name="registerBasicFrm" id="registerBasicFrm">
		<input type="hidden" name="projectNo" value="${project.projectNo}">
		<input type="hidden" name="userId" value="${project.userId}">
		<div id="basic_subject">
			<div>프로젝트의 제목을 적어주세요</div>
			<input type="text" name="projectName" id="r_projectName" class="inputStyle" value="">
		</div>
		<div id="basic_target">
			<div>목표 금액을 적어주세요</div>
			<input type="text" name="targetAmount" id="r_targetAmount"
				class="inputStyle inputRight" placeholder="0"> 원
		</div>
		<div id="basic_">
			<div>프로젝트의 진행기간을 적어주세요</div>
			<div>최소 7일부터 최대 50일까지 가능합니다.</div>
			<div id="rg_projectPeriodDeadline">
				<input type="text" name="remainingPeriod" id="remainingPeriod"
					class="inputStyle inputRight" disabled> 일 남음 
				 <div id="rg_projectDeadline">
					<input type="text" name="projectDeadline" id="projectDeadline" class="inputStyle">
				</div>
			</div>
		</div>
		<div id="basic_">
			<div>프로젝트 대표 이미지를 등록해주세요</div>
			<div class="fileContainer"> 
				<div class="thumbnailImg rg_img">
					<img src="/SupportForMe/images/picture.png" id="default">
					<c:if test="${project.image != null}" >
						<img src="/SupportForMe/upload/${project.image}">
					</c:if>
				</div>
			</div>
		</div>
		<div id="basic_keyword">
			<div>프로젝트 키워드를 적어주세요 (선택사항)</div>
			<div>제목 외에도 키워드 검색 시 검색 결과에 프로젝트가 나타납니다.</div>
			<div id="keyword_div">
				<div id="keyword">예술<img src="/SupportForMe/images/remove.png" id="remove"></div>
				<c:if test="${hashtag.hashtagName != null}" >
					<c:forTokens var="keyword" items="${hashtag.hashtagName}" delims="||">
		               
		          	</c:forTokens>
	          	</c:if>
				<input type="text" name="keyword" class="inputStyle"
					placeholder="최대 5개까지 등록 가능합니다. 키워드 입력 후 엔터를 눌러주세요.">
			</div>
		</div>
		<input type="button" name="save" class="save_button" value="저장하기">
		<input type="button" name="next" class="next_button basic" value="다음 단계">
	</form>
	</div>
</body>
</html>