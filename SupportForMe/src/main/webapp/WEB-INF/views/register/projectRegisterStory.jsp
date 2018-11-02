<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 등록</title>
<style>
</style>
</head>
<body>
	
	<form name="fileUploadStoryFrm" id="fileUploadStoryFrm" method="post">
		<input type="file" name="uploadFile" id="fileUploadStory"  accept=".gif, .jpg, .png" style="display:none">
	</form>
    <div style="height:50px"></div>
    
    <form name="registerStoryFrm" id="registerStoryFrm">
	    <input type="hidden" name="projectNo" value="${project.projectNo}">
	    <input type="hidden" name="userId" value="${project.userId}">
	    <div id="story_introduction" style="height:50px">
			<div class="bold">프로젝트 소개 영상과 이미지를 등록해주세요</div>
	        <div class="lg">소개 영상과 이미지 중 택 1 가능합니다.</div>
	    </div>
		<div id="story_video">
			<div class="bold">동영상 주소를 적어주세요</div>
	        <input type="text" placeholder="  YouTube URL을 입력해주세요." class="videoInput">
		</div>
		<div id="story_image">
			<div class="bold">이미지를 등록해주세요.</div>
			<div class="fileContainer introImg">
					<c:if test="${project.introductionImage != null}" >
							<c:forTokens var="image" items="${project.introductionImage}" delims="||" varStatus="i">
								<div class="introductionImg rg_img soge">
									<img src="/SupportForMe/upload/${image}">	
									<img src="/SupportForMe/images/cancel1.png" class="sogeRemove ${i.index+1}">
									<input type='hidden' name='arrImage' value='${image}'>
								</div>
									             		
			          		</c:forTokens>	
					</c:if>
					<div class="introductionImg rg_img" id="storyDefault">
						<img src="/SupportForMe/images/picture.png" id="default" class="">	
					</div>
					<div class="introductionImg plus rg_img">
						<img src="/SupportForMe/images/plus1.png" id="plus">
					</div>
			</div>
	    </div>
	    <div id="story_contents">
	    
	    </div>
	    <div style="height:200px"></div>
	   	<input type="button" name="save" class="save_button" value="저장하기">
		<input type="button" name="next" class="next_button story" value="다음 단계">
	</form>
	
</body>
</html>