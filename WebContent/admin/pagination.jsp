<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
	param.page : page 번호
	attr -> last : 마지막 페이지 번호 
			boardName : 보드 서블릿 이름
 --%>
<c:choose>
	<c:when test="${not empty param.page}">
		<c:set var="page" value="${param.page}"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="page" value="1"></c:set>
	</c:otherwise>
</c:choose>
<div class="ui center aligned grid">
	<div class="column">
		<div class="ui pagination menu">
			<c:choose>
				<%--10개 초과 페이지일 경우 --%>
				<c:when test="${last > 10}">
					<%--1. 첫번째 페이징 --%>
					<c:if test="${page <= 8}">
						<%-- 메인 페이징 --%>
						<c:forEach var="num" begin="1" end="10" step="1" varStatus="status">
							<c:choose>
								<c:when test="${num==page}"><c:set var="active" value="active"></c:set></c:when>
								<c:otherwise><c:set var="active" value=""></c:set></c:otherwise>
							</c:choose>
							<a class="${active} item" href="<%=request.getContextPath() %>/${boardName}?page=${num}">${num}</a>
						</c:forEach>
						<%-- 뒤... --%>
						<a class="item" href="<%=request.getContextPath()%>/${boardName}?page=${page+10}">...</a>
						<a class="item" href="<%=request.getContextPath()%>/${boardName}?page=${last}">${last}</a>
					</c:if>
					<%--2. 중간 페이징 --%>
					<c:if test="${(page > 8) && (page < (last - 8))}">
						<%-- 앞... --%>
						<a class="item" href="<%=request.getContextPath()%>/${boardName}?page=1">1</a>
						<a class="item" href="<%=request.getContextPath()%>/${boardName}?page=${page-10}">...</a>
						<%-- 메인 페이징 --%>
						<c:forEach var="num" begin="${page-3}" end="${page+3}" step="1" varStatus="status">
							<c:choose>
								<c:when test="${num==page}"><c:set var="active" value="active"></c:set></c:when>
								<c:otherwise><c:set var="active" value=""></c:set></c:otherwise>
							</c:choose>
							<a class="${active} item" href="<%=request.getContextPath()%>/${boardName}?page=${num}">${num}</a>
						</c:forEach>
						<%-- 뒤... --%>
						<a class="item" href="<%=request.getContextPath()%>/${boardName}?page=${page+10}">...</a>
						<a class="item" href="<%=request.getContextPath()%>/${boardName}?page=${last}">${last}</a>
					</c:if>
					<%--3. 마지막 페이징 --%>
					<c:if test="${page >= last - 8}">
						<%-- 앞... --%>
						<a class="item" href="<%=request.getContextPath()%>/${boardName}?page=1">1</a>
						<a class="item" href="<%=request.getContextPath()%>/${boardName}?page=${page-10}">...</a>
						<%-- 메인 페이징 --%>
						<c:forEach var="num" begin="${last-10}" end="${last}" step="1" varStatus="status">
							<c:choose>
								<c:when test="${num==page}"><c:set var="active" value="active"></c:set></c:when>
								<c:otherwise><c:set var="active" value=""></c:set></c:otherwise>
							</c:choose>
							<a class="${active} item" href="<%=request.getContextPath() %>/${boardName}?page=${num}">${num}</a>
						</c:forEach>
					</c:if>
				</c:when>
				<%--10개 이하 페이지의 경우 --%> 
				<c:otherwise>
					<%-- 메인 페이징만 --%>
					<c:forEach var="num" begin="1" end="${last}" step="1" varStatus="status">
						<c:choose>
							<c:when test="${num==page}"><c:set var="active" value="active"></c:set></c:when>
							<c:otherwise><c:set var="active" value=""></c:set></c:otherwise>
						</c:choose>
						<a class="${active} item" href="<%=request.getContextPath() %>/${boardName}?page=${num}">${num}</a>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
