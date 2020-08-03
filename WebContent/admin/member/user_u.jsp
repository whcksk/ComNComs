<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
$(document).ready(function() {
	
}
</script>
<!-- 
	session : String id= 관리자 아이디
			: AuthoDto[] authos = 
 -->
<!-- Attribute : 
				 UserDto user :  유저 계정 정보
				 int thisAutho : 이 페이지의 권한 번호
-->
<div>
	<h2 class="ui dividing header">사용자 계정 수정 페이지</h2>
	<form action="" method="post">
		<div class="field">
			<label for="id"></label>
			<input type="text" id="id" name="id" value="${user.id}"/>
		</div>
		<div class="field">
			<label for="name"></label>
			<input type="text" id="name" name="name" value="${user.name}"/>
		</div>
		<div class="field">
			<label for="pass">비밀번호</label>
			<input type="password" id="pass" name="pass"/>
		</div>
		<div class="field">
			<label for="email">이메일</label>
			<input type="text" id="email" name="email"/>
		</div>
		<c:if test="${sessionScope.id}">
		
		</c:if>
		<button class="">수정</button>
		<button class="">삭제</button>
		<button>뒤로가기</button>
	</form>
</div>