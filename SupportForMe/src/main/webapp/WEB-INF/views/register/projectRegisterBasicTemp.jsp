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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>프로젝트 등록</title>
<style>
#save_button {
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

#next_button {
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
	width: 25px;
	height: 25px;
	vertical-align: top;
}

.inputStyle {
	text-align: right;
	padding-right: 5px;
}

.input-group {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-ms-flex-align: stretch;
	align-items: stretch;
	width: 100%
}

.mb-3 {
	margin-bottom: 1rem !important
}

.input-group>.custom-file, .input-group>.custom-select, .input-group>.form-control
	{
	position: relative;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	width: 1%;
	margin-bottom: 0
}

.input-group>.custom-file+.custom-file, .input-group>.custom-file+.custom-select,
	.input-group>.custom-file+.form-control, .input-group>.custom-select+.custom-file,
	.input-group>.custom-select+.custom-select, .input-group>.custom-select+.form-control,
	.input-group>.form-control+.custom-file, .input-group>.form-control+.custom-select,
	.input-group>.form-control+.form-control {
	margin-left: -1px
}

.input-group>.custom-file .custom-file-input:focus ~.custom-file-label,
	.input-group>.custom-select:focus, .input-group>.form-control:focus {
	z-index: 3
}

.input-group>.custom-file .custom-file-input:focus {
	z-index: 4
}

.input-group>.custom-select:not(:last-child),.input-group>.form-control:not(:last-child){
border-top-right-radius:0;
border-bottom-right-radius:0
}
.input-group>.custom-select:not(:first-child),.input-group>.form-control:not(:first-child){
border-top-left-radius:0;
border-bottom-left-radius:0
}
.input-group>.custom-file {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center
}

.input-group>.custom-file:not (:last-child ) .custom-file-label,
	.input-group>.custom-file:not (:last-child ) .custom-file-label::after
	{
	border-top-right-radius: 0;
	border-bottom-right-radius: 0
}

.input-group>.custom-file:not (:first-child ) .custom-file-label {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0
}

.custom-file {
	position: relative;
	display: inline-block;
	width: 100%;
	height: 30px;
	margin-bottom: 0
}

.custom-file-input {
	position: relative;
	z-index: 2;
	width: 100%;
	height: calc(2.25rem + 2px);
	margin: 0;
	opacity: 0
}

.custom-file-input:focus ~.custom-file-label {
	border-color: #80bdff;
	box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25)
}

.custom-file-input:focus ~.custom-file-label::after {
	border-color: #80bdff
}

.custom-file-input:disabled ~.custom-file-label {
	background-color: #e9ecef
}

.custom-file-input:lang(en) ~.custom-file-label::after {
	content: "Browse"
}

.custom-file-label {
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	z-index: 1;
	height: 30px;
	padding: .375rem .75rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	border: 1px solid #ced4da;
	border-radius: .25rem
}

.custom-file-label::after {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	z-index: 3;
	display: block;
	height: 30px;
	padding: .375rem .75rem;
	line-height: 1.5;
	color: #495057;
	content: "Browse";
	background-color: #e9ecef;
	border-left: 1px solid #ced4da;
	border-radius: 0 .25rem .25rem 0
}

.custom-file-label, .custom-select {
	transition: background-color .15s ease-in-out, border-color .15s
		ease-in-out, box-shadow .15s ease-in-out
}

.form-control {
	display: block;
	width: 100%;
	height: 30px;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
}

@media screen and (prefers-reduced-motion:reduce) {
	.form-control {
		transition: none
	}
}

.btn-light {
	color: #212529;
	background-color: #f8f9fa;
	border-color: #f8f9fa
}

.btn-light:hover {
	color: #212529;
	background-color: #e2e6ea;
	border-color: #dae0e5
}

.btn-light.focus, .btn-light:focus {
	box-shadow: 0 0 0 .2rem rgba(248, 249, 250, .5)
}

.btn {
	display: inline-block;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out
}

@media screen and (prefers-reduced-motion:reduce) {
	.btn {
		transition: none
	}
}

.btn-block {
	display: block;
	width: 100%
}
</style>
<script>
	$(function() {
		$("save_button").on("click", function() {

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
		var dialog, form;

		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			height : 250,
			width : 350,
			modal : true,
		});

		form = dialog.find("form").on("submit", function(event) {
			event.preventDefault();
			addUser();
		});

		$("#thumbnailImage").on("click", function() {
			dialog.dialog("open");
		});
	});
</script>
</head>
<body>
	<div style="height: 50px"></div>
	<form action="updateProject" method="post" name="registerBasicFrm"
		id="registerForm">
		<input type="hidden" name="projectNo" value="${project.projectNo}">
		<input type="hidden" name="userId" value="${project.userId}">
		<div id="basic_subject">
			<div>프로젝트의 제목을 적어주세요</div>
			<input type="text" name="projectName" id="r_projectName" value="">
		</div>
		<div id="basic_target">
			<div>목표 금액을 적어주세요</div>
			<input type="text" name="targetAmount" id="r_targetAmount"
				class="inputStyle" placeholder="0"> 원
		</div>
		<div id="basic_">
			<div>프로젝트의 진행기간을 적어주세요</div>
			<div>최소 7일부터 최대 50일까지 가능합니다.</div>
			<div>
				<input type="text" name="remainingPeriod" id="remainingPeriod"
					class="inputStyle" disabled> 일 남음 <input type="text"
					name="projectDeadline" id="projectDeadline">
			</div>
		</div>
		<div id="basic_">
			<div>프로젝트 대표 이미지를 등록해주세요</div>
			<div>
				<input type="text" name="image" placeholder="썸네일 사진을 올려주세요." /> <input
					type="button"
					style="background-color: white; border: 1px solid lightgrey"
					value="사진올리기" id="thumbnailImage" data-toggle="modal">
			</div>
		</div>
		<div id="basic_keyword">
			<div>프로젝트 키워드를 적어주세요 (선택사항)</div>
			<div>제목 외에도 키워드 검색 시 검색 결과에 프로젝트가 나타납니다.</div>
			<input type="text" name="keyword" style="width: 500px;"
				placeholder="최대 5개까지 등록 가능합니다. 키워드 입력 후 엔터를 눌러주세요.">
		</div>
		<input type="button" name="save" id="save_button" value="저장하기">
		<input type="submit" name="next" id="next_button" value="다음 단계">
	</form>

	<div id="dialog-form" title="FileUpload">

		<form method="post" enctype="multipart/form-data"
			action="../PostFileUpload">
			<div class="input-group mb-3">
				<div class="custom-file" style="margin: 5px">
					<input type="file" class="custom-file-input" id="inputGroupFile02"
						name="attach1"
						onchange="javascript:document.getElementById('file_route').value=this.value" />
					<label class="custom-file-label" for="inputGroupFile02"
						aria-describedby="inputGroupFileAddon02">사진 선택</label>
				</div>
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="filename"
					aria-label="Recipient's username" aria-describedby="button-addon2"
					id="file_route" size="30">
			</div>

			<input type="submit" value="파일업로드" class="btn btn-block btn-light"
				id="inputGroupFileAddon02">

		</form>
	</div>
</body>
</html>