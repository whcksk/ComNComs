<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$(document).ready(function() {
		$('.ui.default.button').click(function() {
			let row = $(this).parent().parent().children();
			$('#m_id').html(row.eq(1).text());
			$('.ui.modal').modal('show');
		});

	});
</script>
<div>
	<h2 class="ui violet dividing header">사용자 계정 관리 페이지</h2>
	<table class="ui table aligned center">
		<thead>
			<tr>
				<th scope="col" class="one wide">번호</th>
				<th scope="col" class="center aligned six wide">아이디</th>
				<th scope="col" class="center aligned six wide">이름</th>
				<th scope="col" class="center aligned three wide">관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr>
					<th scope="row">${user.no}</th>
					<td class="center aligned">${user.id}</td>
					<td class="center aligned">${user.name}</td>
					<td class="right aligned">
						<button class="ui default button">수정</button>
						<button class="ui red button">삭제</button>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td>1</td>
				<td class="center aligned">whcksk</td>
				<td class="center aligned">조민석</td>
				<td class="right aligned">
					<button class="ui default button">수정</button>
					<button class="ui red button">삭제</button>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td class="center aligned">tatata</td>
				<td class="center aligned">무꾸</td>
				<td class="right aligned">
					<button class="ui default button">수정</button>
					<button class="ui red button">삭제</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<!-- 유저 리스트 -->
<div>
	<div class="ui modal">
		<div class="header">사용자 정보 수정</div>
		<div class="image content">
			<div class="ui medium image">
				<img src="/images/avatar/large/chris.jpg" alt="사용자 프로필">
			</div>
			<div class="description">
				<h3 class="ui dividing header">아이디</h3>
				<p id="m_id">아이디 정보</p>
				<h3 class="ui dividing header">비밀번호</h3>
				<p>비밀번호 정보</p>
				<h3 class="ui dividing header">이름</h3>
				<p>이름 정보</p>
				<div class="ui left pointing label">
			    	<input type="text" class="field" placeholder="변경할 아이디 입력"/>
			    </div>
				<h3 class="ui dividing header">이메일</h3>
				<p>이메일 정보</p>
			</div>
		</div>
		<div class="actions">
			<div class="ui approve button">확인</div>
			<div class="ui cancel button">닫기</div>
		</div>
	</div>
</div><!-- modal -->
