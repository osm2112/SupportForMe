<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 투자 내역 보기</title>
</head>
<script>
	function go_page(p){
		document.searchForm.page.value=p;
		document.searchForm.submit();
	}
	
</script>

<body>
	<h3>결제 내역 보기</h3>
<form action="../forme/InvestList" name="searchForm">
	<input type="hidden" name="page" value="1">
	<select name="searchCondition">
	<option value="">전체</option>
		<option value="projectName">프로젝트명</option>	
		<option value="investNo">결제번호</option>
	</select>
	<select name="payType">
	<option value="">결제유형</option>
		<option value="신용카드">신용카드</option>	
		<option value="계좌결제">계좌결제</option>
		<option value="휴대폰결제">휴대폰결제</option>
	</select>
	<input type="date" name="startdate">~<input type="date" name="enddate">
	<input type="text" name="searchKeyword" value="">
	<input type="submit" value="검색">
	<script>
		document.searchForm.searchCondition.value ='${searchCondition}';
		document.searchForm.startdate.value ='${startdate}';
		document.searchForm.enddate.value ='${enddate}';
		document.searchForm.searchKeyword.value ='${searchKeyword}';
		document.searchForm.payType.value ='${payType}';
	</script>
</form>

	<table border="1">
		<tr><td>결제번호</td><td>프로젝트명</td><td>결제금액</td><td>결제방법</td><td>결제상태</td><td>결제일</td></tr>
		<c:forEach items="${list}" var="list">
		<tr><td><a href="../forme/InvestDetail?investNo=${list.investNo}">${list.investNo }</a></td><td>${list.projectName }</td><td>${list.invenstAmount }</td><td>${list.payType}</td><td>${list.paymentState }</td><td>${list.investDate }</td></tr>
	</c:forEach>
	</table>
	<my:paging paging="${paging}"/>
</body>
</html>