<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<title>SupportForMe</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/'/>images/favicon.ico" />


<style>
#headDiv {
	margin:0px;
    border-bottom:1px solid lightgrey;
    background-color:white;
    z-index:5;
}
.headBodysize {
  display:grid;
  grid-template-columns: 1fr 10fr 1fr;
}
#head{
  padding : 10px 20px;
  display : grid;
  grid-template-columns: 1.5fr 1fr 6fr 1.5fr; 
 /*  grid-template-columns: 2fr 1fr 6fr 1fr 1fr; */
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
        width :350px;
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
    color:#474747;
    font-weight:550;
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
   /*      grid-template-columns : 1fr 3fr ; */
        
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
  margin-right:5px;
  float: right;
}
#sidenav {

  z-index : 50;
  height: 100%; width: 260px;
  top: 70.5px; right: -260px;
  background: white;
  border : 1px solid #EEEEEE;
  position: fixed;
  transition: 0.4s;
}
#sidenav ul { margin: 0; padding: 0; list-style-type: none;}

#sidenav header {
	border : 0px;
	height: 180px;
	text-align: center;
	font-size: 1em;
}
#sidenav a {
  color: #474747;
  display: block;
  text-decoration: none;
  padding: 1em;
  font-weight:600;
  border-bottom:1px solid #EEEEEE;
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

function view2() {
	
	var objDiv2 = document.getElementById("searchKeyword2");
	
    if(objDiv2.style.display=="block"){ 
    	objDiv2.style.display = "none";
    }
    else{ 
    	objDiv2.style.display = "block";
    }
}
</script>
	<div id="headDiv">
		<div class="headBodysize">
	    	<div></div>
	    	<div id="head">
		    	<!--  화면줄였을때 보이는 영역 -->
	    	    <div id="search_div1">
		        	<a href="#" onclick="view()"><img src="<%= request.getContextPath() %>/images/search.png" class="searchImg"></a>
		        	<form action="<%= request.getContextPath() %>/support/getProjects">
	        			<input type="text" name="searchKeyword" id="searchKeyword" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?" style="display:none;">
					</form> 	    
	        	</div>
				
	        	<div id="site_name" style="cursor:pointer; display:block;" onclick="location.href='<%= request.getContextPath() %>'">
	            	SupportForME
	        	</div>
	        
	        	<div>
	        	<input type="button" onclick="go_register()" id="make_project" value="프로젝트 만들기">
	        	</div>
	        
	        	<!-- 전체화면일때 보이는 영역 -->
	        	<div id="search_div2">
	        	<form action="<%= request.getContextPath() %>/support/getProjects">
	        		<input type="text" name="searchKeyword" id="searchKeyword2" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?" style="display:none;">
	      
				<%--<input TYPE="image" src="<%= request.getContextPath() %>/images/search.png" class="searchImg" name="Submit" value="Submit"> --%> 
				</form>
				<a href="#" onclick="view2()"><img src="<%= request.getContextPath() %>/images/search.png" class="searchImg"></a>
	        	</div>
	        	
	        	<c:if test="${member.userId eq null}">
	        	<div id="logout_head_menu">
		        	<div id="head_font_size" style="cursor:pointer;" onclick="location.href='<%= request.getContextPath() %>/support/MemberLoginForm'">로그인</div>
		        	<div id="head_font_size" style="cursor:pointer;" onclick="location.href='<%= request.getContextPath() %>/support/MemberTermsConfirmForm'">회원가입</div>
	        	</div>
	        	</c:if>
	        	<c:if test="${member.userId ne null}">
	        	<div id="head_font_size" class="hamburger-wrapper"><span class="hamburger">마이 페이지</span></div>
	        	</c:if>
 <!--  사이드바 -->
 <nav id="sidenav">
  <span id="close-sidenav">&times;</span>
  <header>
  	<div style="height:30px"></div>
  	<div style="margin-left:10px"><img src="<%= request.getContextPath() %>/images/user-white2.png" style="width:55px;height:55px;margin-left:15px;"></div>
  	<div style="color:white; font-size:18px;margin-top:5px">${member.name}</div> 
  	<div style="color:white; font-size:18px;margin-top:5px">${member.email}</div>
  </header>
  <ul>
    <li><a href="<%= request.getContextPath() %>/forme/MemberUpdateConfirmForm">프로필 설정</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/getMyProjects">나의 프로젝트</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/MyInvestList">나의 투자 현황</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/MyInvestors">나의 투자자</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/InvestList">나의 결재 내역</a></li>
    <c:set var ="id" value="${member.userId}"/>
    <c:if test="${fn:contains(id,'Admin' )}">
    <li><a href="<%= request.getContextPath() %>/forme/AdminProjectProgressList">프로젝트 관리</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/AdminMemberList">회원 관리</a></li>
    <li><a href="<%= request.getContextPath() %>/forme/AdminSupportForMePickList">서포미 픽 관리</a></li>
    </c:if>
    <li><a href="<%= request.getContextPath() %>/support/logout">로그아웃</a></li>
    
  </ul>
</nav>


<script>
$(".hamburger").click(function() {
	if($("#sidenav").css("right") == '0px'){
		$("#sidenav").css("right", "-260px");
		  $("body").removeClass("dark");
	}else {
		$("#sidenav").css("right", "0");
		  $("body").addClass("dark");
	}
});
$("#close-sidenav").click(function() {
	$("#sidenav").css("right", "-260px");
  $("body").removeClass("dark");
});


</script>
</div>
</div>
</div>
</body>
</html>