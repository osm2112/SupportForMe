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
nav {
	float: left;
	max-width: 160px;
	margin: 0; 
	padding: 1em;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul a {
	text-decoration: none;
}

article {
	padding: 1em;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<article>
			<tiles:insertAttribute name="content" />
		</article>
		<footer>
			
		</footer>
	</div>
</body>
</html>