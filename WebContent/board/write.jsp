<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<c:if test="${not empty parent}">
	<c:forEach begin="1" end="${parent.bindent}">
		<c:set var="reply" value="${reply}ㄴRE: "></c:set>
	</c:forEach>
	<c:set var="_re" value="_re"></c:set>
	<c:set var="group" value="${parent.bgroup}"></c:set>
	<c:set var="step" value="${parent.bstep}"></c:set>
	<c:set var="indent" value="${parent.bindent}"></c:set>
</c:if>
<div class="container" style="width: 50em">
	<div class="ui segment">
	<h3>글 등록</h3>
	<form id="writeForm" action="${pageContext.request.contextPath}/write${_re}.board" method="post">
		<input type="hidden" name="method" value="post">
		<div class="form-group">
			<label for="name">이름</label> <input type="text" class="form-control"
				name="name" id="name">
		</div>
		<div class="form-group">
			<label for="pass">비밀번호</label>
			<div class="input-group">
				<input class="form-control" type="password" name="pass" id="pass">
				<div class="input-group-btn">
					<button class="btn btn-default" type="button" id="btn_pass">
						<i class="glyphicon glyphicon-eye-open" id="icon_pass"></i>
					</button>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="title">제목</label> 
			<input type="text" class="form-control" name="title" id="title" value="${reply}">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" rows=10
				style="resize: none;">${reply}</textarea>
		</div>
		<c:if test="${not empty item}">
			<input type="hidden" name="group" value="${item.bgroup}">
			<input type="hidden" name="step" value="${item.bstep}">
			<input type="hidden" name="indent" value="${item.bindent}">
		</c:if>
		<div style="text-align: right;">
			<button type="submit" class="btn btn-default" id="btn_submit">입력</button>
			<button type="reset" class="btn btn-default" id="btn_cancel">초기화</button>
			<button type="button" class="btn btn-default" id="btn_list" onclick="location.href='${pageContext.request.contextPath}/list.board'">목록보기</button>
		</div>
		<input type="hidden" name="group" value="${group}"/>
		<input type="hidden" name="step" value="${step}"/>
		<input type="hidden" name="indent" value="${indent}"/>
	</form>
	</div>
</div>

<%@ include file="/inc/footer.jsp"%>