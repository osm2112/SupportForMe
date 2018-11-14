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

article {
	margin: 0px;
	overflow: hidden;
}
.footer {
    /*    position: absolute; bottom: 0; width: 100%; */
    height: 222px;
    padding: 1em;
    color: white;
    background-color: #1EB496;
    text-align: center;
    box-shadow: 0px -1px 10px 1px rgba(0, 0, 0, 0.2);
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