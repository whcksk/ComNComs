<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp"%>
<%@ include file="/admin/inc/sidebar.jsp"%>

<script>
	$(function() {
		$("#main_content").html($("#admin_u").html());
		$('.dropdown').dropdown();

		$(".ui.icon.button").click(function() {
			$(this).children().toggleClass("green checkmark icon");
			$(this).children().toggleClass("red x icon");
			let name = $(this).parent().parent().find('th').html();
			let length = $(this).parent().parent().parent().find('tr').length;
			
		});
		$("#form").submit(function(){
			let length = $("table tbody tr").length;
			alert(length);
			let mode = "";
			for (var i = 0; i < length; i++) {
				for(var j = 0; j < 4; j++){
					mode += $("table tr ")	
				}
				$("")
			}
			$("#" + name).val();
			return false;
		});
	});
</script>

<!-- Attribute : ArrayList<AuthoDto> authoList : 권한 목록
				 HashMap<Admin_autho> authos : 해당 계정의 권한
				 AdminDto admin :  관리자 계정 정보
-->
<c:set var="crud" value="<%=new char[] { 'c', 'r', 'u', 'd' }%>" />

<div id="admin_u" style="display: none;">
	<h2 class="ui dividing header">관리자 계정 수정 페이지</h2>
	<form id="form" 
		action="${pageContext.request.contextPath}/admin_u.admin_m/id=${admin.id}"
		method="post" class="ui form">
		<div class="field">
			<label for="id">아이디</label> <input type="text" id="id" name="id"
				value="${admin.id}" />
		</div>
		<div class="field">
			<label for="name">이름</label> <input type="text" id="name" name="name"
				value="${admin.name}" />
		</div>
		<div class="field">
			<label for="pass">비밀번호</label> 
			<input type="password" id="pass" name="pass" />
		</div>
		<c:forEach var="autho" items="${authoList}">
			<input type="hidden" id="${autho.name}" name="${autho.name}" value=""/>	
		</c:forEach>
		<div class="field">
			<table class="ui celled structured table">
				<thead>
					<tr>
						<th rowspan="2">이름</th>
						<th colspan="4">권한</th>
					</tr>
					<tr>
						<th>생성</th>
						<th>조회</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="autho" items="${authoList}">
						<tr>
							<th>${autho.name}</th>
							<c:choose>
								<c:when test="${not empty authos[autho.name]}">
									<c:forEach var="i" items="${crud}">
										<td class="center aligned">
											<button type="button" class="ui basic icon button">
											<c:choose>
												<c:when test="${fn:contains(authos[autho.name], i)}">
													<i class="green checkmark icon"></i>
												</c:when>
												<c:otherwise>
													<i class="x red icon"></i>
												</c:otherwise>
											</c:choose>
											</button>
										</td>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach begin="1" end="4" step="1">
										<td class="center aligned">
											<button type="button" class="ui basic icon button">
												<i class="x red icon"></i>
											</button>
										</td>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<button type="submit" class="ui blue basic button">완료</button>
	</form>
</div>