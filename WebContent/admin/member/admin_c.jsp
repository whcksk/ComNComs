<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp" %>
<script>
	$(document).ready(function() {
		$(".ui.checkbox").checkbox();	
		$(".ui.icon.button").click(function(){
			
		});
	});
</script>
<div class="ui container">
<div class="ui compact segment">
	<h2 class="ui violet dividing header"><b>관리자</b> 계정 생성</h2>
	
	<form id="form" action="${pageContext.request.contextPath}/admin_c.admin_m" method="post" class="ui form">
		<div class="required field">
			<label for="id">아이디</label>
			<input type="text" id="id" name="id" placeholder="아이디 입력"/>
		</div>
		<div class="required field">
			<label for="pass">비밀번호</label>
			<input type="password" id="pass" name="pass" placeholder="비밀번호 입력"/>
		</div>
		<div class="required field">
			<label for="name">이름</label>
			<input type="text" id="name" name="name" placeholder="이름 입력"/>
		</div>
		<div class="field">
			<label for="authos">권한 설정</label>
			<div class="column">
				<table class="ui celled structured table">
					<thead>
						<tr>
							<th scope="col" rowspan="2" class="center aligned">목록</th>
							<th scope="col" colspan="4" class="center aligned">권한</th>
						</tr>
						<tr>
							<th scope="col" class="center aligned">추가</th>
							<th scope="col" class="center aligned">조회</th>
							<th scope="col" class="center aligned">수정</th>
							<th scope="col" class="center aligned">삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">멤버 관리</th>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="member" value="c">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="member" value="r">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="member" value="u">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="member" value="d">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리 관리</th>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="category" value="c">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="category" value="r">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="category" value="u">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="category" value="d">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">제품 관리</th>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="goods" value="c">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="goods" value="r">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="goods" value="u">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="goods" value="d">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">게시판 관리</th>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="board" value="c">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="board" value="r">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="board" value="u">
								</div>
							</td>
							<td class="center aligned">
								<div class="ui checkbox">
								  <input type="checkbox" name="board" value="d">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div style="text-align: right;">
			<button type="button" class="ui default button" onclick="history.go(-1);">취소</button>
			<button type="submit" class="ui green button">완료</button>
		</div>
	</form>
</div>
</div>
<%@ include file="/admin/inc/footer.jsp" %>
