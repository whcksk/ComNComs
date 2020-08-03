<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp" %>
<div class="ui container">
	<div class="ui segment">
		<h2 class="ui teal dividing header">내 정보</h2>
		<div class="ui internally celled two column grid">
			<div class="column">
				<div>
					<img src="/upload/${admin.photo}" alt="프로필 사진" class="ui centered medium bordered image"/>
				</div>
				<div class="ui divider"></div>
				<div class="ui segment">
					<p>아이디: ${admin.id}</p>
					<p>이름: ${admin.name}</p>
				</div>
			</div>
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
							<c:if test="${not empty autho['게시판']}">
								<td class="center aligned">
									<c:if test="${fn:contains(autho['멤버'], 'c')}">
										<i class="large green checkmark icon"></i>
									</c:if>
								</td>
								<td class="center aligned">
									<c:if test="${fn:contains(autho['멤버'], 'r')}">
										<i class="large green checkmark icon"></i>
									</c:if>
								</td>
								<td class="center aligned">
									<c:if test="${fn:contains(autho['멤버'], 'u')}">
										<i class="large green checkmark icon"></i>
									</c:if>
								</td>
								<td class="center aligned">
									<c:if test="${fn:contains(autho['멤버'], 'd')}">
										<i class="large green checkmark icon"></i>
									</c:if>
								</td>
							</c:if>
						</tr>
						<tr>
							<th scope="row">카테고리 관리</th>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['카테고리'], 'c')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['카테고리'], 'r')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['카테고리'], 'u')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['카테고리'], 'd')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">제품 관리</th>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['제품'], 'c')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['제품'], 'r')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['제품'], 'u')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['제품'], 'd')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">게시판 관리</th>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['게시판'], 'c')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['게시판'], 'r')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['게시판'], 'u')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
							<td class="center aligned">
								<c:if test="${fn:contains(autho['게시판'], 'd')}">
									<i class="large green checkmark icon"></i>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<%@ include file="/admin/inc/footer.jsp"%>