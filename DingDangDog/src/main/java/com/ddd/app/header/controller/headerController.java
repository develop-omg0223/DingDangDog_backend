package com.ddd.app.header.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;

/**
 * Servlet implementation class headerController
 */

public class headerController extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public headerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		System.out.println("headerController 실행!!");

		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("현재 경로 : " + target);

		Result result = null;
		
		
		// 테스트용 하드코딩 세션
		request.getSession().setAttribute("userNumber", 10001);

		switch (target) {
		
		
//		case "/header/logIn.he":
//			System.out.println("로그인 요청");
//			result = new DogLogListController().execute(request, response);
//			break;
		
		
			
		case "/header/logoutOk.he":
			System.out.println("로그 아웃 요청");
			result = new HeaderLogOutOkController().execute(request, response);
			break;
		}
		
		if (result != null) {
		    if (result.isRedirect()) {
		        response.sendRedirect(result.getPath());
		    } else {
		        request.getRequestDispatcher(result.getPath()).forward(request, response);
		    }
		}
		
	}
	
}
