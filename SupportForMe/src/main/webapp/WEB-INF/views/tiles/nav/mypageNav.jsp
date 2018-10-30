<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="header.css">
    <style>
        #project_mypage {
            display : grid;
            grid-template-columns: 280px 1fr;
        }
        #project_mypage_menu {
            margin-left : 25px;
        }
        #mypage_list {
            margin-left : 20px;
        }
        #project_mypage_menu nav div {
            height : 35px;
            padding-top : 10px;
            padding-left : 5px;
            font-size : 18px;
        }
        #active {
            background-color : rgb(26, 188, 156);
            color : white;
        }
       .project_box {
            width : 255px; 
            height:420px;
            border:1px solid lightgrey
        }
        .project_state {
            border: 1.5px solid rgb(211, 84, 0);
            border-radius:5px;
            color : rgb(211, 84, 0); 
            padding-top:5px;
            width : 100px;
            height: 25px;
            text-align: center;
            margin-bottom:5px;
        }
        .mypage_project_image {
             width : 240px;
             height: 160px;
             border : 1px solid lightgrey;
 	         margin-left: auto;
             margin-right: auto;
             margin-top : 5px;
             background-color:#E9E9E9;
        }
        .mypage_project_content {
             margin-top : 10px;
             margin-left : 10px;
	         width : 230px;
             height: 200px;
        }
        .mypage_project_content nav{
            list-style-type: none;
        }
        #myproject_btn {
            text-align: center;
        }
        .myproject_edit_btn {
            padding:5px 30px;
            border : 1px solid lightgrey;
            border-radius: 5px;
            color : rgb(26, 188, 156);
            background-color:white;
        }
        .myproject_del_btn {
            padding:5px 30px;
            border : 1px solid lightgrey;
            border-radius: 5px;
            color : rgb(231, 76, 60);
            background-color:white;
        }
    </style>
</head>
<body>
    <div style="height : 50px"></div>
    <div class="bodysize">
    <div style="height : 80px; font-size:30px;font-weight: 800;padding : 25px;color:grey">My Page</div>
    <div id="project_mypage">
         <div id="project_mypage_menu">
            <nav>
                <div>프로필 설정</div>
                <div  id="active">나의 프로젝트</div>
                <div>나의 투자현황</div>
                <div>지불정보 설정</div>
            </nav>
        </div>
        <div id="mypage_list" style="height : 600px;">
        <div style="font-size:30px;font-weight: 800;margin-bottom:20px">나의 프로젝트</div>
        <div class="project_box" style="">
              <div class="mypage_project_image">프로젝트 대표 이미지<img src=""></div>
		      <div class="mypage_project_content">
                  <div class="project_state">제작중</div>
                    <nav>
                        <li>창작자 이름</li>
                        <li style="font-size : 18px;">프로젝트 제목프로젝트 제목프로젝트 제목</li>
                        <li style="height : 20px"></li>
                        <li style="display:grid;grid-template-columns: 2fr 1fr">
                            <span>000,000,000(모금액)</span> 
                            <span align="right">##%</span></li>
                        <li style="color:rgb(26, 188, 156)">■□□□□□□□□□□□□□</li>
                        <li>참여자 OO명</li>
                    </nav>
               </div>
                <div id="myproject_btn">
                 <input type="button" class="myproject_edit_btn" value="수정하기">
                 <input type="button" class="myproject_del_btn" value="삭제하기">
                </div>
            </div>         
        </div>
    </div>
    </div>
</body>
</html>