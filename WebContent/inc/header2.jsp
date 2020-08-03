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
	#header .navbar-default{
		background-color: transparent;
		border: 0 none;
	}
	#header div{
		margin-top: 2px;
		margin-bottom: 1px;
	}
	.mybg{
		background:url('<%=request.getContextPath()%>/images/bg_header.gif')0 -30px;
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
<div class='mybg'>
	<div id="header" class="container">
		<h1 class="myhidden">LOGO</h1>
		<nav class="navbar navbar-default">
			<h2 class="myhidden">주메뉴</h2>
			<div class="container-fluid">
				<div class="navbar-header col-sm-3">
					<a class="navbar-brand" href="#"><img alt="CGV LOGO" src="<%=request.getContextPath() %>/images/h1_cgv.png"></a>
				</div>
				<div class="col-sm-6 text-center">
					<p><img alt="CGV LOGO" src="<%=request.getContextPath() %>/images/h2_cultureplex.png"></p>
					<ul class="nav navbar-nav">
						<li class=""><a href="#">영화</a></li>
						<li><a href="#">예매</a></li>
						<li ><a href="#">극장</a></li>
						<li><a href="#">이벤트&amp;컬쳐</a></li>
					</ul>
				</div>
				<div class="nav navbar-nav col-sm-3">
					<p><a href="#"><img alt="현대오일뱅크 보너스카드혜택바로가기" src="<%=request.getContextPath() %>/images/15728438201650.png"></a></p>
					<form action="#" method="get">
						<fieldset>
							<legend class="myhidden">search</legend>
							<input type="search" name="search" id="search" title="검색어 입력창"/>
							<input type="submit" value="검색"/>
						</fieldset>
					</form>
				</div>
			</div>
		</nav>
	</div>
</div>
<div class="container">
	<div class="well">
		NAVBAR 중
	</div>
</div>