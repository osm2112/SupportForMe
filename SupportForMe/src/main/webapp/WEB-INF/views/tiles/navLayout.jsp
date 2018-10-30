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
.container > nav {
	float: left;
	max-width: 550px;
	margin: 0px 25px 0px 150px; 
	padding: 1em;
}

.container > nav > ul {
	list-style-type: none;
	padding: 0;
}

.container > nav > ul > a {
	text-decoration: none;
}
.container > article {
	padding: 1em;
	overflow: hidden;
}
#active {
   /* color : rgb(26, 188, 156);
   border-left : 2px solid rgb(26, 188, 156);*/
   background-color : rgb(26, 188, 156);
   color : white;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<nav>
			<tiles:insertAttribute name="nav"/>
		</nav>
		<article>
			<tiles:insertAttribute name="content" />
		</article>
		<footer>
			
		</footer>
	</div>
</body>
</html>