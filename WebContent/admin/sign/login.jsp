<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp"%>
<style type="text/css">
body>.grid {
	height: 10%;
}
.column {
	max-width: 450px;
}
</style>
<script>
	$(document).ready(function() {
		$(".ui.form").form({
			fields : {
				id : {
					identifier : 'id',
					rules : [ {
						type : 'empty',
						prompt : '아이디를 적어주세요'
					} ]
				},
				pass : {
					identifier : 'pass',
					rules : [ {
						type : 'empty',
						prompt : '비밀번호를 적어주세요'
					} ]
				}
			}
		});
	});
</script>
<div class="ui middle aligned center aligned grid">
	<div class="column">
		<h2 class="ui teal image header">
			<img src="" alt="logo" class="image"> 관리자 로그인
		</h2>

		<form action="<%=request.getContextPath() %>/login.admin" method="post" class="ui large form">
			<div class="ui segment">
				<fieldset>
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i> <input type="text" id="id" name="id"
								placeholder="아이디" />
						</div>
					</div>
					<div class="field">	
						<div class="ui left icon input">
							<i class="lock icon"></i> <input type="password" id="pass"
								name="pass" placeholder="비밀번호" />
						</div>
					</div>
					<button type="submit" class="ui fluid blue button">로그인</button>
				</fieldset>
			</div>
			<div class="ui error message"></div>
		</form>
	</div>
</div>
<%@ include file="/admin/inc/footer.jsp"%>