<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>ㅋㅋㅋ</title>
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
<div class="" style="background-color: #2e4361;">
<div id="header">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<ul class="nav navbar-nav lnb l1">
					<li><a href="">facebook</a></li>
					<li><a href="">instagram</a></li>
					<li><a href="">naver</a></li>
				</ul>
			</div>
			<div class="col-sm-6">
				<ul class="nav navbar-nav lnb l2">
					<li><a href="">로그인</a></li>
					<li><a href="">회원가입</a></li>
					<li><a href="">MY CGV</a></li>
					<li><a href="">VIP LOUNGE</a></li>
					<li><a href="">CLUB 서비스</a></li>
					<li><a href="">고객센터</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<h1 class="myhidden">LOGO</h1>
	<nav class="ui inverted menu" style="background-color: #2e4361;">
		<h2 class="myhidden">주메뉴</h2>
		<div class="header item">
			<img src="<%=request.getContextPath()%>/index.jsp" alt=""><a href="<%=request.getContextPath()%>/index.jsp">홈</a>
		</div>
		<a href="<%=request.getContextPath()%>/list.board" class="item"> 글 목록 </a>
		<a href="<%=request.getContextPath()%>/write.board" class="item"> 글쓰기 </a>
		<a href="<%=request.getContextPath()%>/sample/dropdown_complete.jsp" class="item"> 드랍다운 </a>
		<a href="<%=request.getContextPath()%>/bean4.jsp" class="item"> 아이템 </a>
		<%
			if(sessionId == null){%>
			<div class="right menu">
				<a href="<%=request.getContextPath()%>/member/join.jsp" class="item">회원 가입</a>
		    	<a href="<%=request.getContextPath()%>/member/login.jsp" class="item">로그인</a>
			    <div class="ui simple dropdown item">고객센터<i class="dropdown icon"></i>
			    	<div class="menu">
				      <div class="item">고객센터 홈</div>
				      <div class="item">신고/문의 제안</div>
				      <div class="item">서비스 도움말</div>
				    </div>
			    </div>
	  		</div>
			<%} else {%>
			<div class="right menu">
				<a href="<%=request.getContextPath()%>/member/shoping" class="item">나의 쇼핑내역</a>
				<a href="<%=request.getContextPath()%>/member/shoping.jsp" class="item">장바구니</a>
				<a href="<%=request.getContextPath()%>/mypage.member" class="item">회원 정보</a>
		    	<a href="<%=request.getContextPath()%>/out.member" class="item">로그아웃</a>
			    <div class= "ui simple dropdown item">고객센터<i class="dropdown icon"></i>
			    	<div class="menu">
				      <a class="item">고객센터 홈</a>
				      <a class="item">신고/문의 제안</a>
				      <a class="item">서비스 도움말</a>
				    </div>
			    </div>
	  		</div>
	  		<%
	 }%>
	</nav>
</div>
</div>
