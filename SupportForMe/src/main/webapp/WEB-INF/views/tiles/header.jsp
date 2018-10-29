<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>header</title>
<style>
body {
    margin:0px;
}
#headDiv {
	margin:0px;
    border-bottom:1px solid lightgrey;
}
.bodysize {
  display:grid;
  grid-template-columns: 2fr 6fr 2fr;
}
#head{
  padding : 10px 20px;
  display : grid;
  grid-template-columns: 2fr 1fr 6fr 2fr;
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
    width : 120px;
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

</style>
<script>
function go_register() {
	var url = window.location.pathname.toString().split('/');
	var cpath = "forme/"+url[3];
	
	if(cpath != 'forme/make/Project' && cpath != 'forme/updateProject'){
		 var $form = $('<form></form>');
	     $form.attr('action', 'registerProject');
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
<div id="headDiv">
	<div class="bodysize">
    	<div></div>
    	<div id="head">
	    	<!--  화면줄였을때 보이는 영역 -->
    	    <div id="search_div1">
	        <a href="#" onclick="view()"><img src="/SupportForMe/images/search.png" class="searchImg"></a>
	        <form action="getProjects.do">
        	<input type="text" name="searchKeyword" id="searchKeyword" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?">
			</form> 	    
        	</div>
			
        	<div id="site_name">
            	SupportForME
        	</div>
        
        	<div>
        	<input type="button" onclick="go_register()" id="make_project" value="프로젝트 만들기">
        	</div>
        
        	<!-- 전체화면일때 보이는 영역 -->
        	<div id="search_div2">
        	<form action="getProjects.do">
        	<input type="text" name="searchKeyword" class="search_keyword" placeholder="찾으시는 프로젝트가 있으신가요?">
        	<input TYPE="image" src="/SupportForMe/images/search.png" class="searchImg" name="Submit" value="Submit">
			</form>
        	</div>
        
        	<div id="head_font_size">마이 페이지</div>
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
</body>
</html>