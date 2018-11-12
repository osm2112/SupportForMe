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
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>