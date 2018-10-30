<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!doctype html>
<html>
<header>
    <style>
        
        .bodysize {
           margin-left: auto;
           margin-right: auto;
           width: 1100px;
        }
        .suforme {
            display:grid;
            grid-template-columns: 780px 1fr;
        }
        .slide_main_img {
            width : 100%;
            height : 400px;
        }
         .suforme_picks_grid {
            display : grid;
            grid-template-columns: 1fr 300px;
        }
        .suforme_picks_div {
            width : 750px;
            height : 400px;
        }
        .suforme_top_1_text_div {
            font-size : 20px;
            width : auto;
            height: 45px;
        }
        .suforme_picks_projects {
            border : 1px solid lightgrey;
            width : 450px;
            height : 350px;
	    background-color:#E9E9E9;
        }
        .suforme_picks_projects_content {
            border : 1px solid lightgrey;
            border-left : none;
            width : 295px;
            height : 350px;
        }
        .suforme_picks_projects_content nav li{
            margin-top : 10px;
            list-style-type :none;
        }
        .picks_project_category {
            font-size : 15px;
            background-color : rgb(26, 188, 156);
            width : 80px;
            height : 25px;
            text-align: center;
            color: white;
            padding-top : 2px;
            
        }
        .picks_project_subject {
            font-size : 20px;
            
        }
        .real_time_rank_outer {
            margin-left : 30px;
        }
        .real_time_rank_div {
             border : 1px solid lightgrey;
             height : 350px;
             width : 285px;
             
        }
         .real_time_image {
             width : 250px;
             height: 160px;
             border : 1px solid lightgrey;
 	         margin-left: auto;
             margin-right: auto;
             margin-top : 10px;
             background-color:#E9E9E9;
        }
	   .real_time_rank_projects {
            width : 230px;
             height: 150px;
        }
	  .real_time_rank_projects nav ol li {
            margin-top:5px;
	        font-size:18px;
            text-align : left;
        }
        .project_box {
            width : 255px; 
            height:350px;
            border:1px solid lightgrey
        }
        .main_project_image {
             width : 240px;
             height: 160px;
             border : 1px solid lightgrey;
 	         margin-left: auto;
             margin-right: auto;
             margin-top : 5px;
             background-color:#E9E9E9;
        }
        .main_project_content {
             margin-top : 10px;
             margin-left : 10px;
	         width : 230px;
             height: 150px;
        }
        .main_project_content nav{
            list-style-type: none;
        }
        .category_project_div {
            display : grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
        }
    </style>
</header>
<body>
    <div>
    <img src="main.png" class="slide_main_img">
    </div>
    <div style="height:50px"></div>
    <div class="bodysize">
        <div class="suforme">
        <div class="suforme_picks_div">
            <div class="suforme_top_1_text_div">서포미 PICKS</div>
            <div class="suforme_picks_grid">
                <div class="suforme_picks_projects">
                    서포미 pick 슬라이드
                </div>
                <div class="suforme_picks_projects_content">
                    <nav>
                        <ul>
                            <li>카테고리</li>
                            <li>프로젝트 제목</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="real_time_rank_outer">
            <div class="suforme_top_1_text_div">실시간 랭킹</div>
            <div class="real_time_rank_div">
                <div class="real_time_image">프로젝트 대표 이미지<img src=""></div>
		      <div class="real_time_rank_projects">
                    <nav>
                        <ol>
                            <li>프로젝트 제목 1</li>
                            <li>프로젝트 제목 2</li>
                            <li>프로젝트 제목 3</li>
                            <li>프로젝트 제목 4</li>
                            <li>프로젝트 제목 5</li>
                        </ol>
                    </nav>
               </div>
            </div>
         </div>
        </div>
	<div style="height:50px"></div>
        <div class="suforme_top_1_text_div">공연 프로젝트</div>
        <div class="category_project_div">
        <%-- <c:forEach items="${list}" var="project"> --%>
	       <div class="project_box" style="">
              <div class="main_project_image">프로젝트 대표 이미지<img src=""></div>
		      <div class="main_project_content">
                    <nav>
                        <li>창작자 이름</li>
                        <li style="font-size : 18px;">프로젝트 제목프로젝트 제목프로젝트 제목</li>
                        <li style="height : 20px"></li>
                        <li><span>000,000,000(모금액)</span> <span>##%</span></li>
                        <li>====chart==============</li>
                        <li>참여자 OO명</li>
                    </nav>
               </div>
            </div>  
       <%--  </c:forEach>  --%>          
        </div>
        
    <div style="height:50px"></div>
    <!-- 미술 부분  -->
    <div class="suforme_top_1_text_div">미술 프로젝트</div>
	<div class="art_project_div">
        <div class="category_project_div">
         <%-- <c:forEach items="${list}" var="project"> --%>
	       <div class="project_box" style="">
              <div class="main_project_image">프로젝트 대표 이미지<img src=""></div>
		      <div class="main_project_content">
                    <nav>
                        <li>창작자 이름</li>
                        <li style="font-size : 18px;">프로젝트 제목프로젝트 제목프로젝트 제목</li>
                        <li style="height : 20px"></li>
                        <li><span>000,000,000(모금액)</span> <span>##%</span></li>
                        <li>====chart==============</li>
                        <li>참여자 OO명</li>
                    </nav>
               </div>
            </div>   
         <%-- 	</c:forEach> --%>
        
        </div>
    </div>
    </div>
    <div style="height:500px"></div>
</body>
</html>