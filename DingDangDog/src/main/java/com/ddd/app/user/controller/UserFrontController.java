package com.ddd.app.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;

/**
 * Servlet implementation class userFrontController
 */
public class UserFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserFrontController() {
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
		System.out.println("UserFrontController 실행");
		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("현재경로 : " + target);

		Result result = null;

		switch (target) {
		case "/user/signup.us":
			System.out.println("회원가입 페이지 요청");
			result = new Result();
			result.setPath("/apps/signup_choice.jsp");
			result.setRedirect(false);
			System.out.println("회원가입 페이지 이동");
			break;
		case "/user/signupCommon.us":
			System.out.println("일반 회원가입 페이지 요청");
			result = new Result();
			result.setPath("/apps/signup_common.jsp");
			result.setRedirect(false);
			System.out.println("일반 회원가입 페이지 이동");
			break;
		case "/user/checkIdOk.us":
			System.out.println("아이디 중복확인 요청");
			result = new CheckIdOkController().execute(request, response);
			System.out.println("아이디 중복확인 완료");
			break;
		case "/user/checkNicknameOk.us":
			System.out.println("닉네임 중복확인 요청");
			result = new CheckNicknameOkController().execute(request, response);
			System.out.println("닉네임 중복확인 완료");
			break;
		case "/user/signupShelter.us":
			System.out.println("보호소 회원가입 페이지 요청");
			result = new Result();
			result.setPath("/apps/signup_common.jsp");
			result.setRedirect(false);
			System.out.println("보호소 회원가입 페이지 이동");
			break;
		case "/user/login.us":
			System.out.println("로그인 페이지 요청");
			result = new Result();
			result.setPath("/apps/login/login.jsp");
			result.setRedirect(false);
			System.out.println("로그인 페이지 이동");
			break;
		case "/user/loginOk.us":
			System.out.println("로그인 처리 요청");
			result = new LoginOkController().execute(request, response);
			System.out.println("로그인 처리 완료");
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
