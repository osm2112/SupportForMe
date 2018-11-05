<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div style="height: 50px"></div>
<script>
$(function() {
	
	$(".next_button").on("click",function(){
		
		$.ajax({
			url : "../updateProject/pay",
			data : $("#tempRegisterFrm").serialize(),
			method : "post",
			success : function(result) {
				$("#result").html(result);
				$(".reward").removeClass("active");
				$(".pay").addClass("active");	
			}
		});	
	});
	
	$("#presentDeliveryDate").datepicker(
			{
				dateFormat : "yy-mm-dd",
				maxDate : "+1m +19d", //7 // new Data(2018,11,20)
				minDate : "1w",
				dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
				onSelect : function(strDate, obj) {
					
				},
				showOn : "both",
				buttonImage : "/SupportForMe/images/calendar.png",
				buttonImageOnly : true,
				buttonText : "Select date"
	});
	
	$(".add_button").on("click",function(){
		$.ajax({
			url : "../insertReward",
			data : $("#registerRewardFrm").serialize(), 
			method : "post",
			/* success : insertReward  */
		});	
	});
	
	function insertReward(result) {
		var rewardBox = "<div class='reward_preview_box' id='"+result.presentNo+"'>"
					  + "<div class='rw_preview_amount_div'><span class='rw_preview_amount'>"+result.presentPrice+"</span><label>원 펀딩</label></div>"
					  + "<div class='rw_preview_delivery_s'>리워드 구성</div>"
					  + "<div class='rw_preview_info'>"+result.presentName+"</div>"
					  + "<div class='rw_preview_delivery_s'>예상배송일</div>"
					  + "<div class='rw_preview_delivery'>"+result.deliveryDate+"</div>"
					  + "<input type='button' name='rewardEdit' class='preview_button rewardEdit' value='수정하기'>"
					  + "<input type='button' name='rewardDel' class='preview_button rewardDel' value='삭제하기'></div>";	
		$("#reward_preview").append(rewardBox);	
	}
});
</script>
<form name="tempRegisterFrm" id="tempRegisterFrm">
	<input type="hidden" name="projectNo" value="${project.projectNo}">
	<input type="hidden" name="userId" value="${project.userId}">
	<input type="hidden" name="deliveryDate" value="">
</form>
<form name="registerRewardFrm" id="registerRewardFrm">
<input type="hidden" name="projectNo" value="${project.projectNo}">
<div class="bold">프로젝트 리워드를 구성해주세요</div>
	<div class="lg">
	프로젝트 시작을 위해서는 최소 1개 이상의 리워드가 있어야 합니다.<br>
	배송이 필요한 리워드는 배송비가 포함된 가격을 적어주세요.
</div>
<div id="reward_box">
	<div class="reward_grid"><label>리워드 금액 </label><input type="text" name="presentPrice" id="reward_input"><label>&nbsp;&nbsp;원</label></div>
    <div class="reward_grid">
    	<label>리워드 구성 </label>
    	<textarea  rows="5" cols="200" id="reward_textarea" name="presentName"
    			  placeholder=" 준비된 리워드를 적어주세요."></textarea>
    </div>
    <div class="reward_grid">
	    <label>예상 배송일 </label>
	    <div class="rg_delivery"> 
	    	<input type="text" name="presentDeliveryDate" id="presentDeliveryDate" class="inputStyle">
	    </div>
	    <label></label>
   </div>
    <div style="text-align:center;margin-top:20px;">
        <input type="button" class="reward_button add_button" value='등록'>
        <input type="reset" class="reward_button reset_button" value='초기화'>
    </div>
</div>
</form>
<div style="height:30px"></div>
<div id="reward_preview">
	<div class="bold" style="margin-bottom:15px;">리워드 미리보기</div>
	<div class="reward_preview_box">
		<div class="rw_preview_amount_div"><span class="rw_preview_amount">5,000</span> <label>원 펀딩</label></div>
		<div class="rw_preview_delivery_s">리워드 구성</div>
		<div class="rw_preview_info">연필 50자루</div>
		<div class="rw_preview_delivery_s">예상배송일</div>
		<div class="rw_preview_delivery">2018.12.30</div>
		<input type="button" name="rewardEdit" class="preview_button rewardEdit " value="수정하기">
		<input type="button" name="rewardDel" class="preview_button rewardDel" value="삭제하기">	
	</div>
</div>
<div style="height:50px"></div>
<input type="button" name="next" class="next_button story" style="margin-left:-5px" value="다음 단계">  
</body>
</html>