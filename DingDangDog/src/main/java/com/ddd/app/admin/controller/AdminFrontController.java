package com.ddd.app.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;

/**
 * Servlet implementation class AdminFrontController
 */
public class AdminFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("AdminFrontController 실행");
		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("현재경로 : " + target);

		Result result = null;

		switch (target) {
		case "/admin/adminLogin.ad":
			System.out.println("관리자 로그인 페이지 요청");
			result = new Result();
			result.setPath("/app/admin/login/admin_login.jsp");
			result.setRedirect(false);
			System.out.println("관리자 로그인 페이지 이동");
			break;
		case "/admin/adminLoginOk.ad":
			System.out.println("관리자 로그인 처리 요청");
			result = new AdminLoginOkController().execute(request, response);
			System.out.println("관리자 로그인 처리 완료");
			break;
			// 대시보드 페이지 추후 컨트롤러로 작성
		case "/admin/dashboard.ad":
			System.out.println("관리자 대시보드 페이지 요청");
			result = new Result();
			result.setPath("/app/admin/dashboard/admin_dashboard.jsp");
			result.setRedirect(false);
			System.out.println("관리자 대시보드 페이지 이동");
			break;
		case "/admin/userListOk.ad":
			System.out.println("회원관리 페이지 요청");
			result = new AdminUserListOkController().execute(request, response);
			System.out.println("회원관리 페이지 이동");
			break;
		case "/admin/userCDetailOk.ad":
			System.out.println("일반 회원 상세 페이지 요청");
			result = new AdminUserCDetailOkController().execute(request, response);
			System.out.println("일반 회원 상세 페이지 이동");
			break;
		case "/admin/userSDetailOk.ad":
			System.out.println("보호소 회원 상세 페이지 요청");
			result = new AdminUserSDetailOkController().execute(request, response);
			System.out.println("보호소 회원 상세 페이지 이동");
			break;
		case "/admin/userShelterConfirmlOk.ad":
			System.out.println("보호소 회원 상세 페이지 요청");
			result = new AdminUserShelterConfirmOkController().execute(request, response);
			System.out.println("보호소 회원 상세 페이지 이동");
			break;
		}

		if (result != null && result.getPath() != null) {
			if (result.isRedirect()) {
				response.sendRedirect(result.getPath());
			} else {
				request.getRequestDispatcher(result.getPath()).forward(request, response);
			}
		}

	}

}
