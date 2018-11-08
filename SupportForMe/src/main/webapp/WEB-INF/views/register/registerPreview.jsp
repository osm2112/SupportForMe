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
	background-color: white;
	overflow:hidden
}
#preview_body {
	border : 10px solid lightgrey;
	border-radius:15px;
	margin-left: auto;
	margin-right: auto;
	width: 1520px;
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
	padding-bottom : 10px;
	margin-bottom:20px;
	border-bottom : 1px solid lightgrey;
}
.previewImg {
	position: fixed; 
	width:170px;
	height:170px;
	bottom: 30px; 
}
</style>
</head>

<body>
	<div id="preview_subject"> <img src="/SupportForMe/images/heart.gif" style="width:80px;height:50px;vertical-align:bottom">PREVIEW<img src="/SupportForMe/images/heart.gif" style="width:80px;height:50px;vertical-align:bottom"></div>
	<div id="preview_body">
	<iframe id="preview_box" width='1500px' height='800px'></iframe>
	<script>
		var src="/SupportForMe/support/getProjectDetailPage?projectNo=${projectNo}";
		$("#preview_box").attr("src",src);
	</script>
	</div>
	<img src="/SupportForMe/images/HEART2.gif" class="previewImg" style="right:20px" >
	<img src="/SupportForMe/images/HEART2.gif" class="previewImg" style="left:20px">
</body>
</html>