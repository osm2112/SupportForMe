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
.inputStyle {
	text-align:right;
	padding-right:5px;
}
</style>
<script>
$(function(){
	$("save_button").on("click",function(){
		
	});
	
	
});
</script>
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
    </div>
    <div id="story_contents">
    
    </div>
</body>
</html>