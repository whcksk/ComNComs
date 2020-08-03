<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp"%>

<c:set var="path" value="/upload"></c:set>
<c:set var="uil" value="${pageContext.request.requestURL}"></c:set>
<c:if test="${fn:contains(uil, 'cafe24')}">
	<c:set var="path" value="${pageContext.request.contextPath}/upload"></c:set>
</c:if>
<div class="ui container">
	<div class="ui segment">
		<div class="" style="display: block; margin: 29px; padding-bottom: 30px; border-bottom: 2px solid cornflowerblue;">
			<h3 class="ui header">
				<span style="font-size: 15px;">no.${item.no}) </span><span
					class="title_subject"> <strong>${item.title}</strong></span>
			</h3>
			<div class="detail_writer">
				<div class="fl" style="float: left;">
					<span class="name" style="border-right: 1px solid cornflowerblue"><em>${item.name}</em></span>
					<span class="date">${item.date}</span>
				</div>
			</div>
		</div>
		<div style="display: block; padding: 15px;">
			<div style="word-wrap: break-word; white-space: pre-line;">${item.content}</div>
		</div>
		<div>
			<p><img src="${path}/${item.file}" alt="${item.file}" 
			onerror="if (this.src != '${pageContext.request.contextPath}/images/error.PNG') this.src = '${pageContext.request.contextPath}/images/error.PNG'"/></p>
		</div>
		<div style="text-align: right; border-top: 2px solid cornflowerblue; padding-top: 15px;">
			<c:if test="${not empty sessionScope.id}">
				<c:if test="${sessionScope.id eq item.name}">
					<button class="ui yellow inverted button" onclick="location.href='${pageContext.request.contextPath}/board_u.admin?no=${item.no}';">수정</button>
					<button class="ui red inverted button" onclick="location.href='${pageContext.request.contextPath}/board_d.admin?no=${item.no}';">삭제</button>
				</c:if>
			</c:if>
			<button class="ui default button" onclick="location.href='${pageContext.request.contextPath}/board.admin';">목록보기</button>
		</div>
	</div>
</div>
<%@ include file="/admin/inc/footer.jsp"%>