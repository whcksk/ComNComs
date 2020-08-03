<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp"%>
<%@ include file="/admin/inc/sidebar.jsp"%>
<script>
	$(function(){
		$("#main_content").html($("#admin").html());
	});
</script>
<div style="display: none;">
<div id="admin" class="fourteen wide stretched column">
	<div id="content" class="ui active tab">
		<h3 class="ui header">관리자 관리 페이지</h3>
		<table class="ui table">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>권한</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${not empty admins}">
				<c:forEach var="admin" items="${admins}">
					<tr>
						<td>${admin.no}</td>
						<td>${admin.id}</td>
						<td>${admin.name}</td>
						<td>
						<c:forEach var="autho" items="${authos[admin.id]}">
							<div class="ui label">
							  ${autho.key}
							  <div class="detail">${autho.value}</div>
							</div>
						</c:forEach>
						</td>
						<td>
							<button class="ui basic button" onclick="location.href='${pageContext.request.contextPath}/admin_u.admin_m?id=${admin.id}';">수정</button>
							<button class="ui basic red button" onclick="location.href='${pageContext.request.contextPath}/admin_d.admin_m?id=${admin.id}';">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
		<div>
			<button class="ui basic blue button" onclick="location.href='${pageContext.request.contextPath}/admin_c.admin_m';">계정 생성</button>
		</div>
	</div>
</div>
</div>
<%@ include file="/admin/inc/footer.jsp"%>