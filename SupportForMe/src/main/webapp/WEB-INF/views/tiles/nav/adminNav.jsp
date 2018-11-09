<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="header.css">
<style>
#project_admin {
	display: grid;
	grid-template-columns: 280px 1fr;
}

#project_admin_menu {
	margin-left: 25px;
}

#project_admin_menu>nav>div {
	height: 35px;
	padding-top: 10px;
	padding-left: 5px;
	font-size: 18px;
}

#project_admin_menu>nav>div:hover {
	cursor: default;
	border-left: 2px solid rgb(26, 188, 156);
}

#project_admin_subject {
	height: 80px;
	font-size: 30px;
	font-weight: 800;
	padding: 25px;
	color: grey
}
</style>
</head>
<body>
<div style="height:50px"></div>
    <div class="bodysize">
    <div id="project_admin_subject">관리 페이지</div>
    <div id="project_admin">
         <div id="project_admin_menu">  
            <nav>
                <div id="project" class="" onclick="location.href='../forme/AdminProjectProgressList'">프로젝트 관리</div>
                <div id="member" class="" onclick="location.href='../forme/AdminMemberList'">회원 관리</div>
                <div id="supportForMePick" class="" onclick="location.href='../forme/AdminSupportForMePickList'">서포미 픽 관리</div>
            </nav>
        </div>
    </div>
</div>
<script>
$(window).load(function() {
 	var uri = window.location.pathname.toString();
 	console.log(uri);
 	if(uri.match('AdminProjectProgressList')){
 		var project = document.getElementById('project');
 		project.setAttribute("class","_active");
 		
 	}
 	if(uri.match('AdminMemberList')){
 		var member = document.getElementById('member');
 		member.setAttribute("class","_active");
 		
 	}
 	
 	if(uri.match('AdminSupportForMePickList')){
 		var supportForMePick = document.getElementById('supportForMePick');
 		supportForMePick.setAttribute("class","_active");
 		
 	}
 	
});


</script>
</body>
</html>