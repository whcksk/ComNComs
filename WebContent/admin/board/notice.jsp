<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div>
	<h2 class="ui header">공지사항</h2>
	<table class="ui table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="items">
				<tr>
					<th scope="row">${item.no}</th>
					<td><a href="<%=request.getContextPath()%>/board/">${item.title}</a></td>
					<td>${item.date}</td>
					<td class="right aligned">
						<button class="ui default button">수정</button>
						<button class="ui red button">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>