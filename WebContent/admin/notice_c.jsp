<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp"%>

<div class="ui container" style="width: 50em">
	<div class="ui segment">
		<h3 class="ui blue header">공지사항 등록</h3>
		<form action="${pageContext.request.contextPath}/notice_c.admin" method="post" enctype="multipart/form-data" class="ui form">
			<div class="field">
				<label for="title">제목</label> 
				<input type="text" class="form-control" name="title" id="title" value="${item.title}">
			</div>
			<div class="field">
				<label for="content">내용</label>
				<textarea class="form-control" name="content" id="content" rows=10 style="resize: none;">${item.content}</textarea>
			</div>
			<div class="field">
				<div class="field">
					<label for="file">파일</label>
					<input type="file" id="file" name="file"/>
				</div>
			</div>
			<div style="text-align: right;">
				<button type="submit" class="btn btn-default">입력</button>
				<button type="reset" class="btn btn-default">초기화</button>
				<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/notice.admin';">목록보기</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="/admin/inc/footer.jsp"%>
