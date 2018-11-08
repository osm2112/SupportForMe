/**
 * 프로젝트 선물 등록 자바스크립트 
 */
$(function() {
	
	var projectNo = $("#projectNo").val();
	/* var context = '${pageContext.request.contextPath}';	//절대 경로
	console.log(context); */
	
	$(".next_button").on("click",function(){
		$.ajax({
			url : "../updateProject/account",  
			data : $("#rewardRegisterFrm").serialize(),
			method : "post",
			success : function(result) {
				$("#result").html(result);
				$("#rn > .rnrw").removeClass("_active");
				$("#rn > .rnac").addClass("_active");	
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
	
	//선물 등록, 선물 수정 
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
				$("#alertModal").show();
			});
		}else {
			if(checkReward()){
				var url = "../insertReward";
				$.getJSON(url, params, function(datas){
					$("#reward_preview").append( makeRewardBox(datas));
					$("[name=registerRewardFrm]")[0].reset();
					deliveryDateInput(datas.presentDeliveryDate);
					$("#alertMessage").text("정상적으로 등록되었습니다.");
					$("#alertModal").show();
				});
			}	
		} 		
	});
	
	//선물입력 폼 값 체크
	function checkReward(){
		var msg="";
		if(!$("#registerRewardFrm [name=presentPrice]").val()){
			$("#alertMessage").text("리워드 금액을 적어주세요.");
			$("#alertModal").show();
			return false;
		}
		if(!$("#registerRewardFrm [name=presentName]").val()){
			$("#alertMessage").text("리워드 구성을 적어주세요.");
			$("#alertModal").show();
			return false;
		}
		if(!$("#registerRewardFrm [name=presentDeliveryDate]").val()){
			$("#alertMessage").text("예상배송일을 선택해주세요.");
			$("#alertModal").show();
			return false;
		}
		return true;
	}
	
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
		$("#confirmModalOk").click(function(){
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
		var params = {projectNo : projectNo};
		$.getJSON("../getRewards",params,function(datas){
			$("#reward_preview").empty();
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