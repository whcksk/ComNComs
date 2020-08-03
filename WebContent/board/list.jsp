<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="/inc/header.jsp"%>

<%--
	attr>	item : dto
			num  : 글 넘버링 위한 숫자. 페이지의 맨 윗글의 넘버
 --%>
<div class="container">
	<div class="ui segment">
	<h3 class="ui blue header">자유게시판</h3>
	<table class="ui very basic table">
		<thead>
			<tr>
				<th scope="col">NO</th>
				<th scope="col">제목</th>
				<th scope="col">글쓴이</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty items}">
			<c:forEach var="item" items="${items}" varStatus="status">
				<tr>
					<td>${num - status.index}</td>
					<td><a href="${pageContext.request.contextPath}/detail.board?no=${item.bno}">${item.btitle}</a></td>
					<td>${item.bname}</td>
					<td>${item.bdate}</td>
					<td>${item.bhit}</td>
				</tr>
			</c:forEach>
			</c:if>
			<tr>
		</tbody>
	</table>
	<div>
		<%@ include file="pagination.jsp" %>
	</div>
	<div style="text-align: right;">
		<button class="ui blue button" onclick="location.href='${pageContext.request.contextPath}/write.board'">글쓰기</button>
	</div>
	</div>
</div>

<%@ include file="/inc/footer.jsp"%>