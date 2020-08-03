<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="ui two column stackable grid" style="height: 80%">
	<div class="two wide stretched column">
		<div id="vmenu" class="ui vertical menu">
			<div class="item">
				<div class="ui accordion">
					<div class="title header">
						<i class="dropdown icon"></i><b>멤버 관리</b>
					</div>
					<div class="content menu">
						<a class="menu item" data-tab='admin' onclick="location.href='${pageContext.request.contextPath}/admin.admin_m';">관리자</a> 
						<a class="menu item" data-tab='user'>회원</a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ui accordion">
					<div class="title header">
						<i class="dropdown icon"></i><b>카테고리 관리</b>
					</div>
					<div class="content menu">
						<a class="menu item" data-tab='cpu'>CPU</a> <a class="menu item"
							data-tab='cooler'>쿨러/튜닝</a> <a class="menu item" data-tab='board'>메인보드</a>
						<a class="menu item" data-tab='memory'>메모리</a> <a
							cl.ass="menu item" data-tab='gpu'>그래픽카드</a> <a class="menu item"
							data-tab='ssd'>SSD</a> <a class="menu item" data-tab='hard'>하드디스크</a>
						<a class="menu item" data-tab='case'>케이스</a> <a class="menu item"
							data-tab='power'>파워</a> <a class="menu item" data-tab='keyboard'>키보드</a>
						<a class="menu item" data-tab='mouse'>마우스</a> <a class="menu item"
							data-tab='sound'>사운드/스피커</a> <a class="menu item"
							data-tab='monitor'>모니터</a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ui accordion">
					<div class="title header">
						<i class="dropdown icon"></i><b>제품 관리</b>
					</div>
					<div class="content menu">
						<a class="menu item">CPU</a> <a class="menu item">쿨러/튜닝</a> <a
							class="menu item">메인보드</a> <a class="menu item">메모리</a> <a
							class="menu item">그래픽카드</a> <a class="menu item">SSD</a> <a
							class="menu item">하드디스크</a> <a class="menu item">케이스</a> <a
							class="menu item">파워</a> <a class="menu item">키보드</a> <a
							class="menu item">마우스</a> <a class="menu item">사운드/스피커</a> <a
							class="menu item">모니터</a> <a class="menu item">소프트웨어</a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ui accordion">
					<div class="title header">
						<i class="dropdown icon"></i><b>게시판 관리</b>
					</div>
					<div class="content menu">
						<a class="menu item" data-tab='notice'>공지사항</a> <a
							class="menu item">1:1 문의</a> <a class="menu item">이벤트</a> <a
							class="menu item">FAQ</a>
					</div>
				</div>
			</div>
		</div>
		<!-- ui vertical menu -->
	</div>
	<!-- side grid-->
	<div class="fourteen wide stretched column">
		<div class="ui segment">
			<div id="main_content" class="ui active tab">
				
			</div>
		<%--
				<div class="ui active tab">관리자 페이지 홈 AJAX 사용 예정 공간</div>
				<div class='ui tab' data-tab='admin'>
					<button class="ui red button"
						onclick="location.href='${pageContext.request.contextPath}/admin.admin_m'">바로가기</button>
				</div>
				<div class='ui tab' data-tab='user'>
					<button class="ui red button"
						onclick="location.href='${pageContext.request.contextPath}/user.admin_m'">바로가기</button>
				</div>
				<div class='ui tab' data-tab='cpu'>CPU!</div>
				<div class='ui tab' data-tab='cooler'>쿨러/튜닝</div>
				<div class='ui tab' data-tab='board'>메인보드!</div>
				<div class='ui tab' data-tab='memory'>메모리!</div>
				<div class='ui tab' data-tab='gpu'>그래픽카드!</div>
				<div class='ui tab' data-tab='ssd'>SSD!</div>
				<div class='ui tab' data-tab='notice'></div>
		--%>
		</div>
	</div>
</div>
	<script>
		$(function(){
			<%--
			$("#admin").click(function(){
				$.ajax({
					url : "${pageContext.request.contextPath}/admin.admin_m",
				    dataType : "html",
				    type : "get",
				    success : function(result){
				        $("#content").html(result);
				    }
				});
			});
			--%>
			$('.ui.accordion').accordion();
			$('.vertical.menu .item').tab();
		});
	</script>
	<!-- main content -->
