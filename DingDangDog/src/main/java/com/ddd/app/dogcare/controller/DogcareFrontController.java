package com.ddd.app.dogcare.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;

/**
 * Servlet implementation class DogCareFrontController
 */

public class DogcareFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DogcareFrontController() {
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

        System.out.println("DogcareFrontController 실행");
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("DogcareFrontController 현재 경로 : " + target);
		Result result = new Result();

        switch(target) {

        case "/care/list.ca":
            System.out.println("케어 목록 요청");
            result = new CareListController().execute(request, response);
            System.out.println("케어 목록 처리 완료");
            break;
        case "/care/detail.ca":
            System.out.println("케어 상세페이지 요청");
            result = new CareDetailController().execute(request, response);
            System.out.println("케어 상세페이지 처리 완료");
            break;
        case "/care/write.ca":
            System.out.println("케어 글 작성페이지 이동 요청");
            result = new CareWriteController().execute(request, response);
            System.out.println("케어 글 작성페이지 이동 완료");
            break;
        case "/care/update.ca":
            System.out.println("케어 글 수정 요청");
            result = new CareUpdateController().execute(request, response);
            System.out.println("케어글 수정 완료");
            break;
        case "/care/delete.ca":
            System.out.println("케어 글 삭제 요청");
            result = new CareDeleteController().execute(request, response);
            System.out.println("케어 글 삭제 완료");
            break;
        case "/care/apply.ca":
            System.out.println("케어 신청 요청");
            result = new CareApplyController().execute(request, response);
            System.out.println("케어 신청 완료");
            break;
        case "/care/cancel.ca":
            System.out.println("케어 신청 취소 요청");
            result = new CareCancelController().execute(request, response);
            System.out.println("케어 신청 취소 완료");
            break;
        case "/care/applyUsers.ca":
            System.out.println("신청자 목록 조회");
            result = new CareApplyUserController().execute(request, response);
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
