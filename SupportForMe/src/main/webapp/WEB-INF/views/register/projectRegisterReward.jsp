<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html5>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div style="height: 50px"></div>
<script>
$(function() {
	
	/* var context = '${pageContext.request.contextPath}';	//절대 경로
	console.log(context); */
	
	$(".next_button").on("click",function(){
		
		$.ajax({
			url : "../updateProject/account",  
			data : $("#rewardRegisterFrm").serialize(),
			method : "post",
			success : function(result) {
				$("#result").html(result);
				$("#rn > .reward").removeClass("active");
				$("#rn > .account").addClass("active");	
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
	
	$("#registerRewardFrm").on("click",".add_button",function(){
		var seq = $("#registerRewardFrm [name=presentNo]").val();
		var params =  $("#registerRewardFrm").serialize();
		if(seq != ''){
			var url = "../updateReward";
			$.getJSON(url, params, function(datas){
				var newDiv = makeRewardBox(datas);
				var oldDiv = $("#rw"+datas.presentNo);
				$(newDiv).replaceAll(oldDiv);
				$("[name=registerRewardFrm]")[0].reset();
				$("#registerRewardFrm [name=presentNo]").val('');
				deliveryDateInput(datas.presentDeliveryDate);
				$("#alertMessage").text("정상적으로 수정되었습니다.");
			});
		}else {
			var url = "../insertReward";
			$.getJSON(url, params, function(datas){
				$("#reward_preview").append( makeRewardBox(datas));
				$("[name=registerRewardFrm]")[0].reset();
				deliveryDateInput(datas.presentDeliveryDate);
				$("#alertMessage").text("정상적으로 등록되었습니다.");
			});	
		} 	
		$("#alertModal").show();
	});
	
	//수정폼 이벤트(수정할 선물을 다시 등록 폼으로 옮김 )
	$("#reward_preview_div").on("click",".rewardEdit",function(){
		var reward = $(this).closest(".reward_preview_box").get(0).reward;
		$("#registerRewardFrm [name=presentNo]").val(reward.presentNo);  
		$("#registerRewardFrm [name=presentPrice]").val(reward.presentPrice);
		$("#registerRewardFrm [name=presentName]").val(reward.presentName);
		$("#registerRewardFrm [name=presentDeliveryDate]").val(reward.presentDeliveryDate);
	});
	
	//선물 삭제 
	$("#reward_preview").on("click",".rewardDel",function(){
		var seq = $(this).closest(".reward_preview_box").attr("id").substring(2);
		$("#confirmMessage").text("해당 선물을 삭제하시겠습니까?");
		$("#confirmModal").show();  
		rewardDel(seq);
	});
	
	function rewardDel (seq){
		console.log(seq);
		$("#confirmModalOk").on("click", function(){
			var params = "presentNo=" + seq;
			var url = "../deleteReward";
			$.getJSON(url,params,function(datas){
				$('#rw'+seq).remove();
				$("#confirmModal").hide();	
			});
		});
	}
	
	
	function deliveryDateInput(date) {
		var dateList = $(".rw_preview_delivery");
		var tempDate = date;
		for(var i=0;i<dateList.size();i++){
			var newDate = dateList.eq(i).text();
			if(newDate < tempDate){
				tempDate = newDate;
			}
		}
		var d = tempDate.split('-');
		
		$("input[name=deliveryDate]").val(d[0]+"."+d[1]+"."+d[2]);
	}
	
	//선물 목록 조회 요청
	function loadRewardList() {
		var params = {projectNo : '${project.projectNo}'};
		$.getJSON("../getRewards",params,function(datas){
			for(i = 0; i<datas.length; i++){
				$("#reward_preview").append(makeRewardBox(datas[i]));	
			}
		});
	}

	function makeRewardBox(reward) {
		var div = $("<div>");
		div.attr("id", "rw"+reward.presentNo);
		div.addClass('reward_preview_box');
		div[0].reward=reward;
		
		var rewardBox = "<div class='rw_preview_amount_div'><span class='rw_preview_amount'>"+reward.presentPrice+"</span><label>원 펀딩</label></div>"
					  + "<div class='rw_preview_delivery_s'>리워드 구성</div>"
					  + "<div class='rw_preview_info'>"+reward.presentName+"</div>"
					  + "<div class='rw_preview_delivery_s'>예상배송일</div>"
					  + "<div class='rw_preview_delivery'>"+reward.presentDeliveryDate+"</div><div class='preview_button'>"
					  + "<button type='button' class='rewardEdit'><img src='/SupportForMe/images/rewardEdit.png' class='rewardImg'>수정하기</button>"
					  + "<button type='button' class='rewardDel'><img src='/SupportForMe/images/rewardDel.png' class='rewardImg'>삭제하기</button>"
					  + "</div>";
		
		div.html(rewardBox);
		return div;
	}

	//목록 조회
	loadRewardList(); 
	
});
</script>
<form name="rewardRegisterFrm" id="rewardRegisterFrm">
	<input type="hidden" name="projectNo" value="${project.projectNo}">
	<input type="hidden" name="userId" value="${project.userId}">
	<input type="hidden" name="deliveryDate" value="${project.deliveryDate}">
</form>
<form name="registerRewardFrm" id="registerRewardFrm">
<input type="hidden" name="projectNo" value="${project.projectNo}">
<input type="hidden" name="presentNo" value="">
<div class="bold">프로젝트 리워드를 구성해주세요</div>
	<div class="lg">
	프로젝트 시작을 위해서는 <span style="color:#FF007F" class="bold">최소 1개 이상의 리워드</span>가 있어야 합니다. 
	배송이 필요한 리워드는 배송비가 포함된 가격을 적어주세요.
</div>
<div id="reward_box">
	<div class="reward_grid"><label>리워드 금액 </label><input type="text" name="presentPrice" id="reward_input"><label>&nbsp;&nbsp;원</label></div>
    <div class="reward_grid">
    	<label>리워드 구성 </label>
    	<textarea  rows="5" cols="200" id="reward_textarea" name="presentName"
    			  placeholder="준비된 리워드를 적어주세요."></textarea>
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
<div id="reward_preview_div">
	<div class="bold" style="margin-bottom:15px;">등록된 리워드 미리보기</div>
	<div id="reward_preview">
	</div>
</div>
<div style="height:50px"></div>
<input type="button" name="save" class="save_button reward" value="저장하기">
<input type="button" name="next" class="next_button reward" value="다음 단계">
</body>
</html>