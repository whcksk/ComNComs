<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String func_ = (String)request.getAttribute("func");
	char func = func_.charAt(0);
	int res = (int)request.getAttribute("res");
	String name = "";
	switch(func){
	case 'w':
		name = "쓰기";
		break;
	case 'd':
		name = "삭제";
		break;
	case 'e':
		name = "수정";
		break;
	}
	
	if(res > 0){
		out.println("<script> alert('"+ name +" 성공!'); location.href='"+ request.getContextPath() +"/board.do?id="+id+"'; </script>");
	} else{
		out.println("<script> alert('"+ name +" 실패!'); location.href='" + request.getContextPath() + "/board.do?id="+id+"'; </script>");
	}
%>
<%@ include file="/inc/footer.jsp"%>