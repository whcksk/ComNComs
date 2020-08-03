<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="/inc/header.jsp"%>

<div class="ui container">
	<div class="ui segment">
		<h3 class="ui dividing header">글 수정</h3>
		<form action="${pageContext.request.contextPath}/update.board?no=${item.bno}" method="post">
			<div>
				<label for="title">제목</label> <input type="text" class="form-control"
					name="title" id="title" value="${item.btitle}">
			</div>
			<div>
				<label>이름</label> 
				<input type="text" class="form-control" name="name"id="name" value="${item.bname}">
				<p>작성시간: ${item.bdate}</p>
				<p>조회수: ${item.bhit}</p>
				<p>ip: ${item.bip}</p>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea class="form-control" rows="10" style="resize: none;" name="content" id="content">${item.bcontent}</textarea>
			</div>
			<input type="hidden" name="group" value="${item.bgroup}"/>
			<input type="hidden" name="step" value="${item.bstep}"/>
			<input type="hidden" name="indent" value="${item.bindent}"/>
			<div style="text-align: right;">
				<button type="submit" class="ui blue button">완료</button>
				<button type="button" class="ui basic black button" onclick="history.go(-1);">취소</button>
			</div>
		</form>
	</div>
</div>
<%@ include file="/inc/footer.jsp"%>