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
</style>
</head>
<body>
    <div style="height:50px"></div>
    <input type="hidden" name="projectNo" value="${project.projectNo}">
    <input type="hidden" name="userId" value="${project.userId}">
    <div id="story_introduction" style="height:50px">
		<div>프로젝트 소개 영상과 이미지를 등록해주세요</div>
            <div style="font-size:15px;color:gray">소개 영상과 이미지 중 택 1 가능합니다.</div>
    </div>
	<div id="story_video" style="height:60px">
		<div>동영상 주소를 적어주세요</div>
        <input type="text" placeholder="  YouTube URL을 입력해주세요." style="width:350px;height:25px;color:grey">
	</div>
	<div id="story_image">
		<div>이미지를 등록해주세요.</div>
		<div class="fileContainer"> 
				<div class="introductionImg">
					<img src="/SupportForMe/images/picture.png" id="default">
				</div>
				<div class="introductionImg plus">
					<img src="/SupportForMe/images/plus1.png" id="default">
				</div>
		</div>
    </div>
    <div id="story_contents">
    
    </div>
   <input type="button" name="save" class="save_button" value="저장하기">
	<input type="button" name="next" class="next_button story" value="다음 단계">
</body>
</html>