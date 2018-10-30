<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="header.css">
    <style>
        #project_admin {
            display : grid;
            grid-template-columns: 280px 1fr;
        }
        #project_admin_menu {
            margin-left : 25px;
        }
        #project_admin_menu > nav > div {
            height : 35px;
            padding-top : 10px;
            padding-left : 5px;
            font-size : 18px;
        }       
    </style>
</head>
<body>
<div style="height:50px"></div>
    <div class="bodysize">
    <div style="height : 80px; font-size:30px;font-weight: 800;padding : 25px;color:grey">관리 페이지</div>
    <div id="project_admin">
         <div id="project_admin_menu">  
            <nav>
                <div id="active">프로젝트 관리</div>
                <div>회원 관리</div>
                <div>서포미 픽 관리</div>
            </nav>
        </div>
    </div>
</div>
</body>
</html>