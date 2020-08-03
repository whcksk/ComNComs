<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>컴앤컴스 관리자 페이지</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
<!-- semantic ui  -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/semantic/semantic.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/semantic/semantic.js"></script>

<!-- jquery 쿠키 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<style>
	.myhidden {width:1px; height:1px; overflow: hidden; position:absolute; left: -99999%; font-size:0; line-height:0;}
	#header .navbar-nav.lnb>li>a{
		padding-top: 2px;
		padding-bottom: 2px;
	}
</style>
	
</head>
<body style="background-color: #2F2E2E;">
	<script>
	var ctx = '<%=request.getContextPath()%>';
</script>
	<script src="<%=request.getContextPath()%>/js/get.js"></script>
	<%
		String sessionId = (String) session.getAttribute("id");
	%>
	<script>
		$(document).ready(function(){
			$('.item').click(function(){
				$('.item').removeClass('active');
			});
		});
	</script>
<div class="container">
	<h1 class="myhidden">컴앤컴스 관리자 페이지</h1>
	<nav class="ui inverted menu" style="background-color: #708090;">
		<h2 class="myhidden">주메뉴</h2>
		<div class="header item">
			<img src="<%=request.getContextPath()%>/index.jsp" alt=""><a href="<%=request.getContextPath()%>/home.admin">홈</a>
		</div>
		<a href="<%=request.getContextPath()%>/notice.admin" class="item"> 공지사항 </a>
		<a href="<%=request.getContextPath()%>/board.admin" class="item"> 자유게시판 </a>
		<div class="right menu">
		<c:choose>
			<c:when test="${empty sessionScope.id}">
				<a href="<%=request.getContextPath()%>/login.admin" class="item">로그인</a>
			</c:when>
			<c:otherwise>
				<a href="<%=request.getContextPath()%>/mypage.admin" class="item">내 정보</a>
		    	<a href="<%=request.getContextPath()%>/logout.admin" class="item">로그아웃</a>
			</c:otherwise>
		</c:choose>
		</div>
	</nav>
</div>
<div style="margin-bottom: 10px;"></div>