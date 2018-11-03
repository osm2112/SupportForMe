<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div style="height: 50px"></div>
<div>
<script>
$(function() {
	
	$(".next_button").on("click",function(){
		
		$.ajax({
			url : "../updateProject/pay",
			data : $("#registerRewardFrm").serialize(), 
			method : "post",
			success : function(result) {
				$("#result").html(result);
				$(".reward").removeClass("active");
				$(".pay").addClass("active");	
			}
		});	
	});
});
</script>
	<div class="bold">프로젝트 리워드를 구성해주세요</div>
	<p style="font-size:15px;color:rgb(127, 127, 127)">
	프로젝트 시작을 위해서는 최소 1개 이상의 리워드가 있어야 합니다.<br>
	배송이 필요한 리워드는 배송비가 포함된 가격을 적어주세요.
	</p>
</div>
<div id="reward_box">
    <div id="reward_grid">리워드 금액 <input type="text" name="reward_amount" style="width:400px;height:25px"> 원</div>
    <div id="reward_grid">리워드 구성 <textarea  rows="5" cols="200" style="width:400px; height:100px;resize:none"></textarea></div>
    <div id="reward_grid">예상 배송일 <input type="date" name="delivery_date" style="width:200px;height:25px;"></div>
    <div style="text-align:center;margin-top:20px;">
        <input type="button" class="reward_button add_button" value='등록'>
        <input type="button" class="reward_button reset_button" value='초기화'>
    </div>
</div>
<div id="reward_preview">
	<div class="bold">리워드 미리보기</div>
</div>
<div style="height:50px"></div>
<input type="button" name="next" class="next_button story" value="다음 단계">  
</body>
</html>