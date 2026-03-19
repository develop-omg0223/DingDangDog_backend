package com.ddd.app.main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ddd.app.Result;

/**
 * Servlet implementation class mainController
 */

public class mainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		System.out.println("mainController 실행!!");

		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("현재 경로 : " + target);

		Result result = null;	
		// 테스트용 하드코딩 세션
		request.getSession().setAttribute("userNumber", 10001);

		switch (target) {
					
		
		case "/mainpage/Main.main":
			System.out.println("메인 페이지 요청");
			result = new mainOkController().execute(request, response);
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

