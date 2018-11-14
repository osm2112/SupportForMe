<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer class="footer">
      FOOTER<br>
        <br>
        ${serverTime} <br>
        <h2 id="clock"></h2> <!-- 현재시간 clock.js 파일 -->
<%--     <tiles:insertAttribute name="footer" /> --%>
   </footer>
    .footer {
    /*    position: absolute; bottom: 0; width: 100%; */
    height: 222px;
    padding: 1em;
    color: black;
    background-color: #fcedff;
    text-align: center;
    box-shadow: 0px -1px 10px 1px rgba(0, 0, 0, 0.2);
    }
</body>
</html>