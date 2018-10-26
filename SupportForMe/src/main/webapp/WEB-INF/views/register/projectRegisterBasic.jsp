<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>프로젝트 등록</title>
<style>
#save_button {
   font-size : 15px;
   font-weight : 800;
   color: rgb(26, 188, 156);
   background-color: white;
   border-radius: 5px;
   border : 1px solid rgb(26, 188, 156);
   padding : 5px 50px; 
   margin-top : 5px;
   margin-left : 50px;
}
#next_button {
   font-size : 15px;
   font-weight : 800;
   color: white;
   background-color : rgb(26, 188, 156);
   border-radius: 5px;
   border : none;
   padding : 5px 50px; 
   margin-top : 5px;
   margin-left : 50px;
}
.ui-datepicker-trigger {
	width:25px;
	height:25px;
	vertical-align:top;
}
.inputStyle {
	text-align:right;
	padding-right:5px;
}
</style>
<script>
$(function(){
	$("save_button").on("click",function(){
		
	});
	
	$("#projectDeadline").datepicker({
		dateFormat: "yy-mm-dd",
    	maxDate: "+1m +19d", //7 // new Data(2018,11,20)
		minDate: "1w",
    	dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
    	onSelect : function(strDate, obj){
    		var now = new Date();
			var dDay = new Date(obj.selectedYear,obj.selectedMonth,obj.selectedDay);
			var now2 = now.getTime();
			var dDay2 = dDay.getTime();
			var remain = dDay2 - now2;
			remain = Math.floor(remain/(24*3600*1000))+1;
    		$("#remainingPeriod").val(remain);
    		console.log(obj);
    	},
		 showOn: "both",
	     buttonImage: "./images/calendar.png",
	     buttonImageOnly: true,
	     buttonText: "Select date"
    });
});
</script>
</head>
<body>
    <div style="height:50px"></div>
    <form action="updateProject.do" method="post" name="registerBasicFrm" id="registerForm">
    	<input type="hidden" name="projectNo" value="${project.projectNo}">
    	<input type="hidden" name="userId" value="${project.userId}">
	     <div id="basic_subject">
			<div>프로젝트의 제목을 적어주세요</div>
			<input type="text" name="projectName" id="r_projectName" class="inputStyle" value="">
	      </div>
	      <div id="basic_target">
			<div>목표 금액을 적어주세요</div>
			<input type="text" name="targetAmount" id="r_targetAmount" class="inputStyle" placeholder="0"> 원
	      </div>
	      <div id="basic_">
			<div>프로젝트의 진행기간을 적어주세요</div>
			<div>최소 7일부터 최대 50일까지 가능합니다.</div>
			<div>
			<input type="text" name="remainingPeriod" id="remainingPeriod" class="inputStyle" disabled> 일 남음 <input type="text" name="projectDeadline" id="projectDeadline" class="inputStyle">
			</div>
	      </div>
	      <div id="basic_">
			<div>프로젝트 대표 이미지를 등록해주세요</div>
			<div>
				<input type="text" name="image" class="thumbnailImg" placeholder="메인 사진을 올려주세요."  />
				<input type="button" style="background-color: white; border: 1px solid lightgrey" value="사진올리기"
						onclick="file_open()">
			</div>
	     </div>
	     <div id="basic_keyword">
		 	<div>프로젝트 키워드를 적어주세요  (선택사항)</div>
		 	<div>제목 외에도 키워드 검색 시 검색 결과에 프로젝트가 나타납니다.</div>
			<input type="text" name="keyword" style="width:500px;" placeholder="최대 5개까지 등록 가능합니다. 키워드 입력 후 엔터를 눌러주세요.">
	     </div>	
	     <input type="button" name="save" id="save_button" value="저장하기">
	     <input type="submit" name="next" id="next_button" value="다음 단계">
	  </form>
</body>
</html>