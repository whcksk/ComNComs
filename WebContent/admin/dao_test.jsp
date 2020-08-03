<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.pyrong93.dto.AdminBoardDto"%>
<%@page import="com.pyrong93.dao.AdminBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- semantic ui  -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/semantic/semantic.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/semantic/semantic.js"></script>
</head>
<body>
	<%!
		AdminBoardDao dao = new AdminBoardDao();
	%>
	<div class="ui container">
		<div class="ui segment">
			<h1 class="ui red header">AdminBoardDao TEST</h1>
			<div class="ui segment">
				<h3 class="ui header blue well">create</h3>
				<%
					if(dao.create(new AdminBoardDto(0, "test","test","test",0,null, null)) > 0){
						out.println("<p>OK</p>");
					} else{
						out.println("<p>ERROR</p>");
					}
				%>
			</div>
			<div class="ui segment">
				<h3 class="ui header blue well">select</h3>
				<h5 class="ui header">select(int)</h5>
				<%
					if(dao.select(1) != null){
						out.println("<p>OK</p>");
					} else {
						out.println("<p>ERROR</p>");
					}
				%>
				<h5 class="ui header">select(String)</h5>
				<%
					AdminBoardDto test = dao.select("test");
					if(test != null){
						out.println("<p>OK</p>");
					} else {
						out.println("<p>ERROR</p>");
					}
				%>
			</div>
			<div class="ui segment">
				<h3 class="ui header blue well">selectAll</h3>
				<%
					if(dao.selectAll() != null){
						out.println("<p>OK</p>");
					} else {
						out.println("<p>ERROR</p>");
					}
				%>
			</div>
			<div class="ui segment">
				<h3 class="ui header blue well">update</h3>
				<%
					if(dao.update(new AdminBoardDto(test.getNo(), "test", "test", "test", 0, null, null)) > 0){
						out.println("<p>OK</p>");
					} else {
						out.println("<p>ERROR</p>");
					}
				%>
			</div>
			<div class="ui segment">
				<h3 class="ui header blue well">delete</h3>
				<%
					if(dao.delete(test.getNo()) > 0){
						out.println("<p>OK</p>");
					} else {
						out.println("<p>ERROR</p>");
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>