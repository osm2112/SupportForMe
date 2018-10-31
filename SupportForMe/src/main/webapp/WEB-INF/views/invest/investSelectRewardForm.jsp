<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>결제</title>
    </head>
    <style>
    .bodysize {
        margin-left: auto;
        margin-right: auto;
        width: 1200px;
    }
        session{
            margin-left: 50px;
        }
        nav{
            padding-top: 50px
        }
    </style>
<body>
    
    <div style="width: 1200px" class="bodysize">
    <nav style="float: left">
        <div calss="side" style="width:150px">
            <div style="background: rgb(26, 188, 156)">리워드 선택</div>
            <div>결제</div>
            <div>내역 확인</div>
        </div>
    </nav>
    <session style="float: left">
    <div style="width: 1000px">
        <h3>리워드 선택</h3>
        <hr>
    <c:forEach items="${presentList}" var="presentList">
       <div style="background: lightgrey; width: 350px">
            <input type="radio" name="invest"> 
            ${presentList.presentPrice} 투자<br>
       		${presentList.presentName}<br>
         	발송 예정일  ${presentList.deliveryDate}
        </div>
        <br>
	</c:forEach>	
        

            <hr>
            <h3>추가 투자</h3>
            <font style="color:red">선택사항</font><br>
            <input type="number" value=0> 원을 추가 투자
            <hr>
            <h3>총 투자 금액 0원</h3>
            <input type="button" value="다음단계" style="background:rgb(26, 188, 156);color:white">
        </div>
    </session>      
    </div>
</body>
</html>
