<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp"%>
<div class="ui container">
	<div class="ui segment">
	<h2 class="ui dividing blue header">자유게시판</h2>
	<table class="ui celled table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">글쓴이</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${items}">
				<tr>
					<th scope="row">${item.no}</th>
					<td><a href="<%=request.getContextPath()%>/board.admin?no=${item.no}">${item.title}</a></td>
					<td>${item.name}</td>
					<td>${item.date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@include file="pagination.jsp" %>
	<div class="ui right aligned">
		<button class="ui button" onclick="location.href='${pageContext.request.contextPath}/board_c.admin'">글쓰기</button>
	</div>
	</div>
</div>
<%@ include file="/admin/inc/footer.jsp"%>