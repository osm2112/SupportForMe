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
/* 공통 css */
input:focus{
	outline:none;
}
input:-webkit-autofill {
   -webkit-box-shadow: 0 0 0 1000px white inset;
}
.inputStyle {
	border : 1px solid lightgrey;
	border-radius: 3.5px;
	height:30px;
	padding: 2px 10px 2px 15px;
	width : 280px;
	font-size : 17px;
	
}

#registerBasicFrm > div,#basic_keyword>div{
	margin:10px 0px;
}
#registerStoryFrm > div{
	margin:15px 0px;
}
#registerBasicFrm > div > div ,#registerStoryFrm > div > div{
	margin:10px 0px;
} 
.lg {
	color:#7f7f7f;
	font-size:15px;
}
.bold {
	color:#5e5e5e;
	font-weight:600;
	font-size:17px;
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

.fileContainer {
	width: 1000px;
    position: relative;
    display: grid;
	grid-column: 1/5;
	grid-column-gap: 10px; 
	grid-row-gap:10px; 
	grid-template-columns: repeat(5, 200px);
	/*grid-template-columns: 25% 25% 25% 25%;*/
	grid-auto-rows: minmax(20px, auto);
	/* text-align: center; */
}
.rg_img {
	position:relative;
	border : 1px solid lightgrey;
	border-radius : 2.5px;
	text-align: center;
	margin-right:10px;
}
.rg_img:hover {
	cursor:pointer;
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
/* basic css */
.ui-datepicker-trigger {
	width: 20px;
	height: 20px;
	vertical-align: middle;
	margin-top:2px;
	margin-left:-10px;
}
#rg_projectPeriodDeadline {
	display:flex;
}
#rg_projectPeriodDeadline > input {
	margin-right:5px;
}
#rg_projectDeadline {
	width: 200px;
	height:35px;
	border : 1px solid lightgrey;
	border-radius: 3.5px;
	padding :0px 5px;
	margin-left : 10px;
} 
#projectDeadline{
	border :none;
	width : 165px;
	margin:0px;
	font-size:17px;
}
#projectDeadline:focus {
	outline:none;
}
#remainingPeriod {
	width : 200px;
}

.thumbnailImg {
	width:395px;
	height:300px;
}

#thumb {
	width:190px;
	height:160px;
}
 

#keyword_div {
	width:700px;
	overflow:hidden;
	height:auto;
	min-height:100px;
/* 	border : 1px solid lightgrey;
	border-radius : 3.5px; */
	padding-left:5px;
}
.keyText {
	border : 1px solid lightgrey;
	border-radius : 3.5px;
	width : 500px;
	font-size:15px;
}
#keyword_div > .keyword {
	height:25px;
	background-color:#EAEAEA;
	padding:2px 5px;
	margin:2.5px 2.5px;
	border-radius : 3.5px;
	display : inline-block;
	float:left;
}
.keyword > label {
	padding-right:2.5px;
	margin-right:5px;
}
.keyword > img {
	width : 10px;
	height:10px;
	margin-top:7.5px;
	opacity : 0.2;	
}
.keyword > img:hover {
	cursor:pointer;
	opacity : 0.8;
}

/* 
	story css
 */
.introductionImg {
	width:200px;
	height:150px;
} 

.sogeRemove {
	width:200px;
	height:150px;
	opacity:0
}
.sogeRemove:hover {
	opacity:1
}
.videoInput {
 	border : 1px solid lightgrey;
	border-radius: 3.5px;
	height:30px;
	padding: 2px 10px;
	width : 380px;
	font-size : 17px;
 }

</style>
<script>
$(function() {
	
		//////공통 js-------------------------
		$(".save_button").on("click", function() {

		});
		
		$(".next_button").on("click",function() {
					
					var page = $(this).attr("class").split(" ")[1];
					
					switch(page){
					case "basic" : 
							$.ajax({
								url : "../insertHashtag",
								data : $("#hashtagFrm").serialize(),
								method : "post",
								success : function(result) {
									console.log(result.code);
								}
							});
							$.ajax({
								url : "../updateProject/story",
								data : $("#registerBasicFrm").serialize(),
								method : "post",
								success : function(result) {
									$("#result").html(result);
								}
							});
							break;
					
					case "story" : 
							$.ajax({
								url : "../updateProject/reward",
								data : $("#registerStoryFrm").serialize(), 
								method : "post",
								success : function(result) {
									$("#result").html(result);
								}
							});	
							break;
					case "reward" :
							$.ajax({
								url : "../updateProject/pay",
								data : $("#registerRewardFrm").serialize(), 
								method : "post",
								success : function(result) {
									$("#result").html(result);
								}
							});	
							break;
					default  : break;
							}
					
				}); 
		//////공통 js----------------------
	
		//////기본정보 js ------------------
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
					dataType : {"hashtagNo":keyNo,"hashtagName":removeKey},
					data : jsonTest,
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
					url:'fileUpload',
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
			 $.ajax({
				url : "deleteIntroductionImg",
				dataType : "JSON",
				data : {"projectNo":projectNo,"removeIntroductionImg":removeImg[3]},
				method : "post",
				success : function(result) {
					if(result.code = 'success') {
						$(".sogeRemove."+cnt).parent().remove();
						
						if(!$("#storyDefault").is(":visible")){
							var dfImg = "<div class='introductionImg rg_img' id='storyDefault'>"
								  	  + "<img src='/SupportForMe/images/picture.png' id='default'>"	
								  	  +	"</div>";
							$(".plus").before(dfImg);
						}		
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
	<div id="result">
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
		<div id="basic_target">
			<div class="bold">목표 금액을 적어주세요</div>
			<input type="text" name="targetAmount" id="r_targetAmount" 
				class="inputStyle"
			 placeholder="<c:if test="${project.targetAmount != null}">${project.targetAmount}</c:if>
			<c:if test="${project.targetAmount == null}">0</c:if>"> 원
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
		<input type="button" name="save" class="save_button" value="저장하기">
		<input type="button" name="next" class="next_button basic" value="다음 단계">
	
	</div>
</body>
</html>