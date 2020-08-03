<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="/inc/header.jsp"%>

<script>
	let func = "";
	$(document).ready(function(){
		$(".ui.action.button").click(function(){
			func = $(this).val();
			$("#form").attr('action', func + ".board?no=${item.bno}");
			$("#button").val(func);
			$('.ui.modal')
			  .modal('show');
		});
		$("#form").submit(function(){
			
		})
	});
</script>
<style>
	.main.container{
		background-color: white;
	}
	.ui.board.header{
		font-size: 22px;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.title{
		display: block; 
		font-size:20px; 
		border-bottom:2px solid black;
		padding-bottom: 10px;
	}
	.writer{
		dislplay: block;
		background-color: #f1f7ff;
	}
	.ui.segment.full{
		height : 100%;
	}
	.panel{
		margin-left:10px;
		margin-right: 10px;
	}
	.row.writer{
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.row.writer>a{
		style="font-size: 20px; 
		margin-right: 15px;"
	}
	.row.content{
		padding-top: 10px;
		padding-bottom: 10px;
	}
</style>
<div class="main container">
	<div class="panel">
	<div class="row">
		<div class="col">
			<h3 class="ui blue board header">자유게시판</h3>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<h4 class="title"><strong>${item.btitle}</strong></h4>
		</div>
	</div>
	<div class="row writer">
		<div class="col-sm-10">
			<a>${item.bname}</a>
			<span>작성일: ${item.bdate}</span>
		</div>
		<div class="col-sm-2">
			<span class="hit">조회수: ${item.bhit}</span>
		</div>
	</div>
	<div class="row content">
		<div class="col">
			<p style="overflow-y:scroll; height: 400px; word-wrap: break-word; white-space: pre-line;" class="scrolling content">${item.bcontent}</p>
		</div>
	</div>
	<div class="ui row" style="text-align: right; border-top: 1px solid gray; padding-top: 15px;">
		<div class="column">
			<button type='button' class='ui basic teal button' onclick="location.href='${pageContext.request.contextPath}/write_re.board?no=${item.bno}';">답글</button>
			<button type='button' class='ui basic orange action button' value="update_r">수정</button>
			<button type='button' class='ui basic red action button' value="delete">삭제</button>
			<button type="button" class="ui basic black button" onclick="location.href='${pageContext.request.contextPath}/list.board';">목록보기</button>
		</div>		
	</div>
	</div>
</div>
<div class="ui mini modal" style="position: relative;">
	<div class="header">비밀번호 입력</div>
	<div class="content">
		<form id="form" action="" method="post" class="ui form">
			<div class="field">
				<input type="password" placeholder="아무 키나 누르세요" name="pass">
			</div>
			<div class="actions">
			    <div class="ui black deny button">
			      cancel
			    </div>
			    <input id="button" type="submit" class="ui red button" value=""/>
			 </div>
		</form>
	</div>
</div>

<%@ include file="/inc/footer.jsp"%>
