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
import com.pyrong93.dao.AdminBoardDao;
import com.pyrong93.dao.AdminDao;
import com.pyrong93.dao.Admin_authoDao;
import com.pyrong93.dao.AuthoDao;
import com.pyrong93.dto.AdminBoardDto;
import com.pyrong93.dto.AdminDto;
import com.pyrong93.dto.AuthoDto;

/**
 * Servlet implementation class Admin
 */
@WebServlet("*.admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		
		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(path);
		if (path.equals("/login.admin")) {
			if (request.getSession().getAttribute("id") == null)
				request.getRequestDispatcher("/admin/sign/login.jsp").forward(request, response);
			else
				request.getRequestDispatcher("/admin/home.jsp").forward(request, response);
		} else if (path.equals("/logout.admin")) {
			request.getSession().invalidate();
			request.getRequestDispatcher("/admin/sign/login.jsp").forward(request, response);
		} else if (path.equals("/home.admin")) {
			request.getRequestDispatcher("/admin/home.jsp").forward(request, response);
		} else if (path.equals("/mypage.admin")) {
			String id = (String) request.getSession().getAttribute("id");
			AdminDto dto = new AdminDao().select(id);
			HashMap<String, String> autho = new Admin_authoDao().select(id);
			
			request.setAttribute("admin", dto);
			request.setAttribute("autho", autho);
			
			request.getRequestDispatcher("/admin/mypage.jsp").forward(request, response);
		} else if (path.equals("/notice.admin")) {
			if (request.getParameter("no") != null) {
				request.getRequestDispatcher("/admin/notice_r.jsp").forward(request, response);
			} else {
				request.setAttribute("last", 1); // 없앨 녀석
				request.setAttribute("boardName", "notice.admin");
				request.getRequestDispatcher("/admin/notice.jsp").forward(request, response);
			}
		} 
		//adminBoard
		else if (path.equals("/board.admin")) {
			System.out.println("admin(get): 자유게시판 글 조회");
			String no = request.getParameter("no");
			if (no != null) {
				AdminBoardDto dto = new AdminBoardDao().select(Integer.parseInt(no));
				request.setAttribute("item", dto);
				request.getRequestDispatcher("/admin/board_r.jsp").forward(request, response);
			} else {
				ArrayList<AdminBoardDto> dtos = new AdminBoardDao().selectAll();
				
				int last = (int) Math.ceil((double)new AdminBoardDao().selectCnt() / 10);
				
				request.setAttribute("last", last);
				request.setAttribute("boardName", "board.admin");
				request.setAttribute("items", dtos);
				request.getRequestDispatcher("/admin/board.jsp").forward(request, response);
			}
		} else if(path.equals("/board_c.admin")) {
			response.sendRedirect(request.getContextPath() + "/admin/board_c.jsp");
		} else if(path.equals("/board_u.admin")) {
			String no = request.getParameter("no");
			if(no == null)
				response.sendRedirect(request.getContextPath() + "/");
			else {
				AdminBoardDto dto = new AdminBoardDao().select(Integer.parseInt(no));
				if(request.getSession().getAttribute("id").equals(dto.getName())) {
					request.setAttribute("item", dto);
					request.getRequestDispatcher("/admin/board_u.jsp").forward(request, response);
				} else {
					response.sendRedirect(request.getContextPath() + "/");
				}
			}
		} else if(path.equals("/board_d.admin")) {
			String name = (String)request.getSession().getAttribute("id");
			String no = request.getParameter("no");
			System.out.println(path + "(post)");
			System.out.println("-------->no: " + no + " -- name: " + name);
			//secure
			if(no == null)
				response.sendRedirect(request.getContextPath() + "/board.admin");
			if(!new AdminBoardDao().select(Integer.parseInt(no)).getName().equals(name))
				response.sendRedirect(request.getContextPath() + "/board.admin");
			
			if(new AdminBoardDao().delete(Integer.parseInt(no))>0)
				alertGo(request, response, "삭제 성공", "/board.admin");
			else
				alertGo(request, response, "삭제 실패", null);
		}
		else if (path.equals("/home.admin")) {
			request.getRequestDispatcher("/admin/board.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(path);
		if (path.equals("/login.admin")) {
			// 관리자 로그인 요청
			AdminDto dto = new AdminDto(0, request.getParameter("id"), "", request.getParameter("pass"));
			AdminDto admin = new AdminDao().login(dto);

			if (admin != null) {
				request.getSession().setAttribute("id", admin.getId());
				ArrayList<AuthoDto> authos = new AuthoDao().getAuthos(admin);
				request.getSession().setAttribute("authos", authos);
				alertGo(request, response, "로그인 성공", "/");
			} else {
				alertGo(request, response, "로그인 실패", "/login.admin");
			}
		} 
		// AdminBoard(POST)
		else if(path.equals("/board_c.admin")) {
			System.out.println("admin(post): 자유게시판 글 생성");
			MultipartRequest multi = getMulti(request);
			String name = (String)request.getSession().getAttribute("id");
			
			if(name == null) {
				alertGo(request, response, "로그인 하세요", "/login.admin");
			}
			
			AdminBoardDto dto = new AdminBoardDto(0, name, multi.getParameter("title"), multi.getParameter("content"), 0, null, multi.getFilesystemName("file"));
			if(new AdminBoardDao().create(dto) > 0) {
				alertGo(request, response, "글쓰기 성공", "/board.admin");
			} else {
				alertGo(request, response, "글쓰기 실패", null);
			}
		} else if(path.equals("/board_u.admin")) {
			MultipartRequest multi = getMulti(request);
			String name = (String)request.getSession().getAttribute("id");
			String no = request.getParameter("no");
			String file = multi.getFilesystemName("file");
			
			System.out.println(path + "(post)");
			System.out.println("-------->no: " + no + " -- name: " + name + "-- file: " + file + "-- prevfile: " + multi.getParameter("prevfile"));
			//secure
			if(no == null)
				response.sendRedirect(request.getContextPath() + "/board.admin");
			if(!new AdminBoardDao().select(Integer.parseInt(no)).getName().equals(name))
				response.sendRedirect(request.getContextPath() + "/board.admin");
			if(file == null)
				file = multi.getParameter("prevfile");
			
			AdminBoardDto dto = new AdminBoardDto(Integer.parseInt(no), "", multi.getParameter("title"), multi.getParameter("content"), 0, null, file);
			if(new AdminBoardDao().update(dto) > 0) {
				alertGo(request, response, "수정 성공", "/board.admin?no=" + no);
			} else {
				alertGo(request, response, "수정 실패", null);
			}
		}
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
