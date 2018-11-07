<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.supportforme.biz.common.Paging" %>
<%@ attribute name="jsFunc" required="false" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>
<ul>
<c:choose>
    <c:when test="${paging.page > 1}">
    <li><a href="#" onclick="${jsFunc}(${paging.page - 1})">이전</a>
    </c:when>
    <c:otherwise>
		<li>이전
    </c:otherwise>
</c:choose>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<li><a href="#" onclick="${jsFunc}(${i})">${i}</a>
	</c:if>
	<c:if test="${i == paging.page}">
		<li class="active">${i}
	</c:if>
</c:forEach>

<c:choose>
    <c:when test="${paging.page < paging.lastPage}">
    <li><a href="#" onclick="${jsFunc}(${paging.page + 1})">다음</a>
    </c:when>
    <c:otherwise>
		<li>다음
    </c:otherwise>
</c:choose>
</ul>