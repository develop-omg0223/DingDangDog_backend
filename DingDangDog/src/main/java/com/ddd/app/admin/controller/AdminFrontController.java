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

//		HttpSession session = request.getSession();
//
//		// 테스트용 관리자 세션 강제 주입
//		session.setAttribute("adminNumber", 1);
//		session.setAttribute("adminId", "admin1");
//		session.setAttribute("userType", "A");

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
		case "/admin/adminLogout.ad":
			System.out.println("관리자 로그아웃 처리 요청");
			result = new AdminLogoutController().execute(request, response);
			System.out.println("관리자 로그아웃 처리 완료");
			break;

		// 대시보드 페이지 추후 컨트롤러로 작성
		case "/admin/dashboard.ad":
			System.out.println("관리자 대시보드 페이지 요청");
			result = new AdminDashBoardOkController().execute(request, response);
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
		case "/admin/adminCareListOk.ad":
			System.out.println("멍! 케어 페이지 요청");
			result = new AdminCareListOkController().execute(request, response);
			System.out.println("명! 케어 페이지 이동");
			break;
		case "/admin/adminCareDetailOk.ad":
			System.out.println("멍! 케어 상세페이지 요청");
			result = new AdminCareDetailOkController().execute(request, response);
			System.out.println("멍! 케어 상세페이지 이동");
			break;
		case "/admin/adminCareDeleteOk.ad":
			System.out.println("멍! 케어 상세페이지 삭제 요청");
			result = new AdminCareDeleteOkController().execute(request, response);
			System.out.println("멍! 케어 상세페이지 삭제 완료");
			break;

		case "/admin/adminLogListOk.ad":
			System.out.println("멍! 로그 목록 요청");
			result = new AdminLogListOkController().execute(request, response);
			System.out.println("멍! 로그 목록 이동");
			break;

		case "/admin/adminLogDetailOk.ad":
			System.out.println("멍! 로그 상세 요청");
			result = new AdminLogDetailOkController().execute(request, response);
			System.out.println("멍! 로그 상세 이동");
			break;

		case "/admin/adminLogDeleteOk.ad":
			System.out.println("멍! 로그 삭제 요청");
			result = new AdminLogDeleteOkController().execute(request, response);
			System.out.println("멍! 로그 삭제 완료");
			break;

		case "/admin/adminLogCommentDeleteOk.ad":
			System.out.println("멍! 로그 댓글 삭제 요청");
			result = new AdminLogCommentDeleteOkController().execute(request, response);
			System.out.println("멍! 로그 댓글 삭제 완료");
			break;

		case "/admin/adminArchiveDetailOk.ad":
			System.out.println("멍! 카이브 상세 요청");
			result = new AdminArchiveDetailOkController().execute(request, response);
			System.out.println("멍! 카이브 상세 완료");
			break;

		case "/admin/adminArchiveListOk.ad":
			System.out.println("멍! 카이브 리스트 요청");
			result = new AdminArchiveListOkController().execute(request, response);
			System.out.println("멍! 카이브 리스트 완료");
			break;

		case "/admin/archiveSearch.ad":
			System.out.println("관리자 멍! 카이브 검색 요청");
			result = new AdminArchiveSearchOkController().execute(request, response);
			System.out.println("관리자 멍! 카이브 검색 완료");
			break;

		case "/admin/adminArchiveDeleteOk.ad":
			System.out.println("멍! 카이브 게시물 삭제 요청");
			result = new AdminArchiveDeleteOkController().execute(request, response);
			System.out.println("멍! 카이브 게시물 삭제 완료");
			break;

		case "/admin/blackListOk.ad":
			System.out.println("관리자 블랙리스트 페이지 요청");
			result = new AdminBlackListOkController().execute(request, response);
			System.out.println("관리자 블랙리스트 페이지 이동");
			break;
		case "/admin/blackListDetailOk.ad":
			System.out.println("관리자 블랙리스트 상세페이지 요청");
			result = new AdminBlackListDetailOkController().execute(request, response);
			System.out.println("관리자 블랙리스트 상세페이지 이동");
			break;
		case "/admin/blackListRemoveOk.ad":
			System.out.println("블랙리스트 해제 요청");
			result = new AdminblackListRemoveOkController().execute(request, response);
			System.out.println("블랙리스트 해제 완료");
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
