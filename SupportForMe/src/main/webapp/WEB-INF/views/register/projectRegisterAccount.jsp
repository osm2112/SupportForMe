<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<script>
$(function(){
	$(".save_button").click(function(){
		var regexp = /^[0-9]+$/;
		var deposit = $("[name=depositAccount]").val()
		if(regexp.test(deposit) || deposit == ''){
			url = "../saveProject/ex";
			params = $("#registerAccountFrm").serialize();
			
			$.ajax({
				url : url,
				data : params,
				type : "post",
				success : function(result) {
					$("#alertMessage").text('저장되었습니다.');
					$("#alertModal").show();
				}
			}); 
		}else {
			$("#alertMessage").text("계좌번호 입력란은 숫자만 가능합니다.");
			$("#alertModal").show();
		}
	});
	$(".register_button").click(function(){
		$("#confirmMessage").html('정말 등록하시겠습니까?<br>등록완료 후 메인 화면에 프로젝트가 나타나게 됩니다.<br>적절하지 않을 경우 관리자에 의해 보류되어질 수 있음<br>양해부탁드립니다.');
		$("#confirmModal").show();	
	});

	$("#confirmModalOk").click(function(){ 
		$("#confirmModal").hide();
		var url = "../registerComplete";
		var params = {projectNo : '${project.projectNo}'};
		$.getJSON(url,params,function(result){
			if(result.code=="success"){
				$("#alertMessage").text('정상적으로 등록되었습니다.');
				$("#alertModal").show();
			}else if(result.code=="fail"){
				$("#alertMessage").text('등록에 실패했습니다. 리워드를 등록해주세요.');
				$("#alertModal").show();
			}
		});
	});
});
</script>
<div style="height: 50px"></div>
	<form name="registerAccountFrm" id="registerAccountFrm">
	 	<div class="bold">계좌 정보를 입력하세요</div>
	 	<div class="lg">프로젝트 종료 후 입금 받으실 계좌를 입력하세요</div>
	 	<input type="hidden" name="projectNo" value="${project.projectNo}">
	 	<input type="hidden" name="userId" value="${project.userId}">
	 	<div class="bold">거래 은행을 선택해주세요</div>
	 	<select name="bankCode" id="bankCode">
	 		<option value="002" >산업은행</option>
			<option value="003" >기업은행</option>
			<option value="004" >국민은행</option>
			<option value="007" >수협</option>
			<option value="011" >농협</option>
			<option value="039" >경남은행</option>
			<option value="034" >광주은행</option>
			<option value="031" >대구은행</option>
			<option value="032" >부산은행</option>
			<option value="050" >상호저축은행</option>
			<option value="045" >새마을금고</option>
			<option value="088" >신한은행</option>
			<option value="048" >신용협동조합</option>
			<option value="027" >시티은행</option>
			<option value="005" >외환은행</option>
			<option value="020" >우리은행</option>
			<option value="071" >우체국</option>
			<option value="037" >전북은행</option>
			<option value="035" >제주은행</option>
			<option value="081" >하나은행</option>
			<option value="023" >SC제일은행</option>
			<option value="090" >카카오뱅크</option>
		</select>
		<script>
		$('select[name="bankCode"]').val('${project.bankCode}').attr("selected", "selected");
		</script>
		<div class="bold">계좌번호를 적어주세요</div>
		<input type="text" name="depositAccount" id="depositAccount" placeholder="'-' 없이 적어주세요" value="${project.depositAccount}">
		<div style="height:100px"></div>
		<div id="accountNotice">
			<span id="notice">공지</span> 프로젝트의 창작자 명과 계좌에 등록된 예금주명과 다를 시 관리자에게 문의해주세요. TEL) 053-421-2460
		</div>
	</form>
	<div style="height:100px"></div>
	<input type="button" name="save" class="save_button account" value="저장하기">
	<c:if test="${project.progress == '004'}">
		<input type="button" name="complete" class="register_button" value="등록완료">
	</c:if>
</body>
</html>