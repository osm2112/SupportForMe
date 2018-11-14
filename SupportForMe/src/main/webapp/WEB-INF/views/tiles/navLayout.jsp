<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	margin:0px;
}
._container > nav {
	float: left;
	max-width: 800px;
	margin: 0px 45px 0px 160px; 
	padding: 1em;
}

._container > nav > ul {
	list-style-type: none;
	padding: 0;
}

._container > nav > ul > a {
	text-decoration: none;
}
._container > article {
	padding: 1em;
	overflow: hidden;
}
#_active,._active {
   /* color : rgb(26, 188, 156);
   border-left : 2px solid rgb(26, 188, 156);*/
   background-color : rgb(26, 188, 156);
   color : white;
}
.footer {
    /*    position: absolute; bottom: 0; width: 100%; */
    height: 200px;
    color: white;
    background-color: rgb(26, 188, 156);
    color:white;
    text-align: center;
    margin-top:15em;
    box-shadow: 0px -1px 5px 1px rgba(0, 0, 0, 0.2);
    font-size:25px;
}
</style>
<script>
setInterval(function() {
    var timer = new Date();
    var h = timer.getHours();
    var m = timer.getMinutes();
    var s = timer.getSeconds();
document.getElementById('clock').innerHTML = h + ":" + m + ":" + s; }, 1000);
</script>
</head>
<body>
	<div class="_container">
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<nav>
			<tiles:insertAttribute name="nav"/>
		</nav>
		<article>
			<tiles:insertAttribute name="content" />
		</article>
		<footer class="footer">
			 ⓒSupportForMe<br><br>
        	${serverTime} <br>
        	<h3 id="clock"></h3> <!-- 현재시간 clock.js 파일 -->
	<%--     <tiles:insertAttribute name="footer" /> --%>
		</footer>
	</div>
</body>
</html>