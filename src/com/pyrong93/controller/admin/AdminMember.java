package com.pyrong93.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pyrong93.dao.AdminDao;
import com.pyrong93.dao.Admin_authoDao;
import com.pyrong93.dao.AuthoDao;
import com.pyrong93.dto.AdminDto;
import com.pyrong93.dto.Admin_authoDto;
import com.pyrong93.dto.AuthoDto;

/**
 * Servlet implementation class AdminMember
 */
@WebServlet("*.admin_m")
public class AdminMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(path);
		if (path.equals("/admin.admin_m")) {
			ArrayList<AdminDto> dtos = new AdminDao().selectAll();
			HashMap<String, HashMap<String, String>> authos = new Admin_authoDao().selectAll();	//admin_id : autho_name : mode

			request.setAttribute("admins", dtos);
			request.setAttribute("authos", authos);
			
			request.getRequestDispatcher("/admin/member/admin.jsp").forward(request, response);
		} else if(path.equals("/admin_c.admin_m")) {
			request.getRequestDispatcher("/admin/member/admin_c.jsp").forward(request, response);
		} else if(path.equals("/admin_u.admin_m")) {
			AdminDto admin = new AdminDao().select(request.getParameter("id"));
			System.out.println("admin--> " + admin);
			ArrayList<AuthoDto> authoList = new AuthoDao().selectAll();
			System.out.println("authoList--> " + authoList);
			HashMap<String, String> authos = new Admin_authoDao().select(request.getParameter("id"));
			System.out.println("authos--> " + authos);
			
			request.setAttribute("admin", admin);
			request.setAttribute("authoList", authoList);
			request.setAttribute("authos", authos);
			
			request.getRequestDispatcher("/admin/member/admin_u.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(path);
		if (path.equals("/admin_c.admin_m")) {
			String[] member = request.getParameterValues("member");
			String[] category = request.getParameterValues("category");
			String[] goods = request.getParameterValues("goods");
			String[] board = request.getParameterValues("board");
			
			AdminDto dto = new AdminDto(0, request.getParameter("id"), request.getParameter("name"), request.getParameter("pass"));
			if(new AdminDao().create(dto) > 0) {
				Admin_authoDto[] dtos = {new Admin_authoDto(request.getParameter("id"), "멤버", ArrayToString(member)),
						new Admin_authoDto(request.getParameter("id"), "카테고리", ArrayToString(category)),
						new Admin_authoDto(request.getParameter("id"), "제품", ArrayToString(goods)),
						new Admin_authoDto(request.getParameter("id"), "게시판", ArrayToString(board))
						};
				for(Admin_authoDto tmp : dtos) {
					new Admin_authoDao().create(tmp);
				}
				alertGo(request, response, "관리자 생성 성공", "/admin.admin_m");
			} else {
				alertGo(request, response, "관리자 생성 실패", "/admin.admin_m");
			}
		}
	}
	
	private String ArrayToString(String[] in) {
		String out = "";
		for(String tmp : in) {
			out += tmp;
		}
		return out;
	}
	
	private MultipartRequest getMulti(HttpServletRequest request) throws IOException {
		// 1. 경로 설정
		String path = "/upload/";

		if (request.getRequestURL().toString().contains("cafe24.com"))
			path = request.getServletContext().getRealPath(path); // 호스팅용

		// 2. 업로드 설정
		// 요청, 경로, 최대 업로드 용량, 인코딩타입, 파일명 중복시 새로운이름처리 정책
		MultipartRequest multi = new MultipartRequest(request, path, 1024 * 1024 * 5, "UTF-8",
				new DefaultFileRenamePolicy());
		return multi;
	}
	
	private void alertGo(HttpServletRequest request, HttpServletResponse response, String msg, String ref) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		if(ref == null)
			ref = "history.go(-1)";
		else
			ref =  "location.href='" + request.getContextPath() + ref + "'";
		
		String message = "<script> alert('";
		message += msg + "'); ";
		message += ref;
		message += "; </script>";
		out.println(message);
	}
}
