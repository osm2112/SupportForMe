<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<title>SupportForMe</title>
<style>
#headDiv {
	margin:0px;
    border-bottom:1px solid lightgrey;
}
.headBodysize {
  display:grid;
  grid-template-columns: 1fr 7fr 1fr;
}
#head{
  padding : 10px 20px;
  display : grid;
  /* grid-template-columns: 2fr 1fr 6fr 2fr; */
  grid-template-columns: 2fr 1fr 6fr 1fr 1fr;
  grid-template-rows: 50px;    
  grid-gap: 20px;  
   
}
#head > #site_name {
  color : rgb(26, 188, 156);
  font-size : 30px; 
}

#make_project {
   font-size : 16px;
   font-weight : 800;
   color: white;
   background-color : rgb(26, 188, 156);
   border-radius: 5px;
   border : none;
   padding : 5px 40px; 
   margin-top : 7px;
   margin-left : 50px;
}
#make_project:hover {
	cursor:pointer;
}
#search_div1 {
    display:none;
}
#search_div2 {
    text-align : right; 
    height : 45px;
    padding-right : 10px;
    padding-top : 15px;
    display : flex;
    justify-content : flex-end;
}
.searchImg {
    height : 25px;
    width : 25px;
    vertical-align: top;
}
.search_keyword {
        width :300px;
        height : 25px;
        margin: 0px 10px;
        border : none;
        border-bottom: 1px solid rgb(127, 127, 127);
        font-size : 18px;
        color:rgb(127, 127, 127);
        padding-left:10px;
}
#head_font_size {
    font-size:18px;
    padding-top:15px;
    text-align:center;
    width : 100px;
}
#logout_head_menu {
    display:grid;
    grid-template-columns: 80px 80px;
}                 
@media(max-width:850px){
    .bodysize {
        display:grid;
        grid-template-columns: 0fr 1fr 0fr;
        grid-template-rows:80px;
    }
    #head {
        display:grid;
        grid-template-columns : 1fr 3fr ;
    }
    #head > #site_name {
     color : rgb(26, 188, 156);
     font-size : 30px; 
    }
    #make_project {
        display:none;
    }
    #head > #search_div1 {
        height : 45px;
        padding-right : 10px;
        padding-top : 15px;
        display:flex;
    }
    #search_div1 > .search_keyword {
        display:none;
    }
    #head > #search_div2 {
        display:none;
    }
    
    #search_div2 > input {
        display:none;
    }
    #logout_head_menu{
        display:none;
    }
    
    #head_font_size {
   		display:none;
    }
}   
<!-- 사이드바 -->
/* body { margin: 0; padding: 0; }
body.dark { background: rgba(0,0,0,.4); z-index: 30; }
 */
.hamburger-wrapper {
  float: right;

}
.hamburger {
  cursor: pointer;
}
#close-sidenav {
  cursor: pointer;
  font-size: 3em;
  margin-top: -10px;
  float: right;
}
#sidenav {

  z-index : 30;
  height: 100%; width: 200px;
  top: 0; right: -200px;
  background: white;
  border : 1px solid black;
  position: fixed;
  transition: 0.4s;
}
#sidenav ul { margin: 0; padding: 0; list-style-type: none; }

#sidenav header {

	border : 0px;
	height: 70px;
	text-align: center;
	font-size: 1em;
}
#sidenav header, #sidenav a {
  color: black;
  display: block;
  text-decoration: none;
  padding: 1em;
}
#sidenav header { background: rgb(26, 188, 156); }
#sidenav a:hover { background: lightgrey; }
</style>
<script>
function go_register() {
	var url = window.location.pathname.toString().split('/');
	console.log(url);
	var cpath = url[3];
	if(cpath != 'make'){
		 var $form = $('<form></form>');
	     $form.attr('action', '/SupportForMe/forme/registerProject');
	     $form.attr('method', 'post');
	     $form.appendTo('body');
		
	     $form.submit();
	} 
	
}


</script>
</head>
<body>
<script>
function view() {
	var objDiv = document.getElementById("site_name");
	var objDiv2 = document.getElementById("searchKeyword");
    if(objDiv.style.display=="block"){ 
    	objDiv.style.display = "none";
    	objDiv2.style.display = "block";
    }
     else{ 
    	 objDiv.style.display = "block";
    	 objDiv2.style.display = "none";  
     }
}
</script>
<c:choose>
	<c:when test="${preview == 'p'}">
		<div id="headDiv">
		<div class="headBodysize">
	    	<div></div>
	    	<div id="head">
		    	<!--  화면줄였을때 보이는 영역 -->
	    	    <div id="search_div1">
		        <img src="/SupportForMe/images/search.png" class="searchImg">
		        <form action="/SupportForMe/support/getProjects">
	        	<input type="text" name="searchKeyword" id="searchKeyword" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?">
				</form> 	    
	        	</div>
				
	        	<div id="site_name" style="cursor:pointer;" onclick="">
	            	SupportForME
	        	</div>
	        
	        	<div>
	        	<input type="button" id="make_project" value="프로젝트 만들기">
	        	</div>
	        
	        	<!-- 전체화면일때 보이는 영역 -->
	        	<div id="search_div2">
	        	<form>
	        	<input type="text" name="searchKeyword" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?">
	        	<img src="/SupportForMe/images/search.png" class="searchImg">
				</form>
	        	</div>
	        	
	        	
	        	<div id="head_font_size" class="hamburger-wrapper"><span class="hamburger">마이 페이지</span></div>
	        	<!--<div id="head_font_size">관리 페이지</div>-->
	       		<!-- <div id="logout_head_menu">
		            <div id="head_font_size"> 로그인 </div>
	    	        <div id="head_font_size">회원가입</div>
		        </div> -->
	   		</div>
	   	
	    	<div>
	    	</div>
		</div>
	</div>	
	</c:when>
	<c:otherwise>
	<div id="headDiv">
		<div class="headBodysize">
	    	<div></div>
	    	<div id="head">
		    	<!--  화면줄였을때 보이는 영역 -->
	    	    <div id="search_div1">
		        <a href="#" onclick="view()"><img src="/SupportForMe/images/search.png" class="searchImg"></a>
		        <form action="/SupportForMe/support/getProjects">
	        	<input type="text" name="searchKeyword" id="searchKeyword" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?">
				</form> 	    
	        	</div>
				
	        	<div id="site_name" style="cursor:pointer;" onclick="location.href='/SupportForMe'">
	            	SupportForME
	        	</div>
	        
	        	<div>
	        	<input type="button" onclick="go_register()" id="make_project" value="프로젝트 만들기">
	        	</div>
	        
	        	<!-- 전체화면일때 보이는 영역 -->
	        	<div id="search_div2">
	        	<form action="/SupportForMe/support/getProjects">
	        	<input type="text" name="searchKeyword" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?">
	        	<input TYPE="image" src="/SupportForMe/images/search.png" class="searchImg" name="Submit" value="Submit">
				</form>
	        	</div>
	        	<c:if test="${loginID eq null}">
	        	<div id="head_font_size" style="cursor:pointer;" onclick="location.href='/SupportForMe/support/MemberLoginForm'">로그인</div>
	        	<div id="head_font_size" style="cursor:pointer;" onclick="location.href='/SupportForMe/support/MemberTermsConfirmForm'">회원가입</div>
	        	</c:if>
	        	<c:if test="${loginID ne null}">
	        	<div id="head_font_size" class="hamburger-wrapper"><span class="hamburger">마이 페이지</span></div>
	        	</c:if>
	        	
	        	
	        	<!-- <div class="hamburger-wrapper">
				  <span class="hamburger">&equiv;</span>
				</div> -->
	        	<!--<div id="head_font_size">관리 페이지</div>-->
	       		<!-- <div id="logout_head_menu">
		            <div id="head_font_size"> 로그인 </div>
	    	        <div id="head_font_size">회원가입</div>
		        </div> -->
 <!--  사이드바 -->
 <nav id="sidenav">
  <span id="close-sidenav">&times;</span>
  <header>회원아이디 <br> ${loginID} </header>
  <ul>
    <li><a href="/SupportForMe/forme/MemberUpdateConfirmForm">프로필 설정</a></li>
    <li><a href="#">나의 프로젝트</a></li>
    <li><a href="/SupportForMe/forme/MyInvestList">나의 투자 현황</a></li>
    <li><a href="/SupportForMe/forme/InvestList">나의 결제 내역</a></li>
    <li><a href="/SupportForMe/support/logout">로그아웃</a></li>
    <li><a href="/SupportForMe/forme/MemberDeleteConfirmForm">회원탈퇴</a></li>
  </ul>
</nav>


<script>
$(".hamburger").click(function() {
	$("#sidenav").css("right", "0");
  $("body").addClass("dark");
});
$("#close-sidenav").click(function() {
	$("#sidenav").css("right", "-200px");
  $("body").removeClass("dark");
});
</script>

<!--  사이드바 -->
	   		</div>
	   <!-- 	
	    	<div>
	    	</div> -->
		</div>
		

	</div>
	</c:otherwise>
</c:choose>
</body>
</html>