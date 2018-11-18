<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<title>SupportForMe</title>
<style>
body {
	background-color:white;
	overflow:hidden;
	margin:0;
}
#preview_body {
	border : 10px solid #EEEEEE;
	border-radius:15px;
	margin-left: auto;
	margin-right: auto;
	width: 1300px;
	text-align:center;
}
#preview_box {
	border:none;
	border-radius:15px;
/* 	box-shadow: 5px 5px 5px 5px silver; */
	margin-top:5px;
}
#preview_subject{
	
	font-size : 45px;
	font-weight: 800;
	color: #8C8C8C;
	text-align:center;
	padding-top:10px;
	padding-bottom : 10px;
	margin-bottom:5px;
	/* border-bottom : 1px solid lightgrey;  */
	text-shadow:3px 1px #D5D5D5;
}  
.previewImg {
	position: fixed; 
	width:165px;
	height:165px;
	bottom: 650px; 
}
</style>
</head>
<body>
 <!-- <img src="/SupportForMe/images/heart.gif" style="width:80px;height:50px;vertical-align:bottom"> -->
	<div id="preview_subject">PREVIEW</div>
	<div style="border:15px solid silver;;width:1320px;margin-left:auto;margin-right:auto;border-radius:30px;">
		<div id="preview_body">
		<iframe name="test1" id="preview_box" width='1300px' height='675px'></iframe>
		<script>
			 var src="/SupportForMe/support/getProjectDetailPage?projectNo=${projectNo}";
			/* var src="/SupportForMe/forme/make/${projectNo}"; */
			$("#preview_box").attr("src",src);
			//disable
		</script>
		</div>
	</div>
	<img src="/SupportForMe/images/HEART2.gif" class="previewImg" style="right:10px;bottom:20px" >
	<img src="/SupportForMe/images/HEART2.gif" class="previewImg" style="left:10px">
</body>
</html>