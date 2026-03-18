package com.ddd.app.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;

/**
 * Servlet implementation class mypageController
 */
@WebServlet("/mypageController")
public class MypageFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MypageFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("MypageFrontController 실행");
		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("현재경로 : " + target);

		Result result = null;

		switch (target) {
		case "/mypage/checkPw.mp":
			System.out.println("비밀번호 검사 페이지 요청");
			result = new Result();
			result.setPath("/app/mypage/mypageCheckPw.jsp");
			result.setRedirect(false);
			System.out.println("비밀번호 검사 페이지 이동");
			break;
		case "/mypage/checkPwOk.mp":
			System.out.println("비밀번호 검사 요청");
			result = new CheckPasswordController().execute(request, response);
			System.out.println("비밀번호 검사 처리 완료");
			break;
		case "/mypage/profileEditC.mp":
			System.out.println("마이페이지 정보수정 페이지 이동 요청");
			result = new ProfileCEditController().execute(request, response);
			System.out.println("마이페이지 정보수정 페이지 이동 완료");
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
