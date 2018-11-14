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
    height: 222px;
    padding: 1em;
    color: black;
    background-color: rgb(26, 188, 156);
    text-align: center;
    box-shadow: 0px -1px 10px 1px rgba(0, 0, 0, 0.2);
}
</style>
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
        	<h2 id="clock"></h2> <!-- 현재시간 clock.js 파일 -->
	<%--     <tiles:insertAttribute name="footer" /> --%>
		</footer>
	</div>
</body>
</html>