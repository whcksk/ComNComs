<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div class="container panel panel-danger">
		<h3 class="panel-heading">404 ERROR: </h3>
		<p><a href='<%=request.getContextPath() %>/index.jsp' class="btn btn-danger">홈으로 가기</a></p>
	</div>
	<div class="container panel panel-info">
		<h3 class="panel-heading">해결1</h3>
		<p>1. [web-inf] - web.xml : 에러가 났을 때 처리 페이지 등록</p>
		<p>2. 처리페이지 만들기</p>
	</div>
</body>
</html>