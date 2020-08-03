<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp"%>

<div class="ui container">
	<div class="detail_head" style="display: block; margin: 29px; padding-bottom: 30px; border-bottom: 2px solid cornflowerblue;">
		<h3 class="detail_title">
			<span style="font-size: 15px;">no.${item.no}) </span><span
				class="title_subject"> <strong>${item.title}</strong></span>
		</h3>
		<div class="detail_writer">
			<div class="fl" style="float: left;">
				<span class="name" style="border-right: 1px solid cornflowerblue"><em>관리자</em></span>
				<span class="date">${item.date}</span>
			</div>
		</div>
	</div>
	<div style="display: block; padding: 15px;">
		<div style="word-wrap: break-word; white-space: pre-line;">${item.content}</div>
	</div>
	<div style="text-align: right; border-top: 2px solid cornflowerblue; padding-top: 15px;">
		<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/notice.admin';">목록보기</button>
	</div>
</div>
<%@ include file="/admin/inc/footer.jsp"%>