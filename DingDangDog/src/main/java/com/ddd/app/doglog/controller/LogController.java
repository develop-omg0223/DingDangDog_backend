package com.ddd.app.doglog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;

@MultipartConfig(
		fileSizeThreshold = 1024 * 1024,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
	)


public class LogController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		System.out.println("LogFrontController 실행!!");

		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("현재 경로 : " + target);

		Result result = null;

		// 테스트용 하드코딩 세션
		request.getSession().setAttribute("userNumber", 10001);

		switch (target) {

		// =========================
		// 멍! 로그
		// =========================
		case "/log/list.lo":
			System.out.println("멍! 로그 목록 요청");
			result = new DogLogListController().execute(request, response);
			break;
			
		case "/log/listSearch.lo":
			System.out.println("멍! 로그 검색 요청");
			result = new DogLogListSearchController().execute(request, response);
			break;

		case "/log/detail.lo":
			System.out.println("멍! 로그 상세 요청");
			result = new DogLogDetailController().execute(request, response);
			break;

		case "/log/write.lo":
			System.out.println("멍! 로그 작성 페이지 요청");
			result = new DogLogWriteController().execute(request, response);
			break;

		case "/log/writeOk.lo":
			System.out.println("멍! 로그 작성 처리 요청");
			result = new DogLogWriteOkController().execute(request, response);
			break;

		case "/log/edit.lo":
			System.out.println("멍! 로그 수정 페이지 요청");
			result = new DogLogEditController().execute(request, response);
			break;

		case "/log/editOk.lo":
			System.out.println("멍! 로그 수정 처리 요청");
			result = new DogLogEditOkController().execute(request, response);
			break;

		case "/log/deleteOk.lo":
			System.out.println("멍! 로그 삭제 처리 요청");
			result = new DogLogDeleteOkController().execute(request, response);
			break;

		// =========================
		// 댓글
		// =========================
		case "/comment/writeOk.lo":
			System.out.println("댓글 작성 처리 요청");
			result = new DogLogCommentWriteOkController().execute(request, response);
			break;


		case "/comment/editOk.lo":
			System.out.println("댓글 수정 처리 요청");
			result = new DogLogCommentEditOkController().execute(request, response);
			break;

		case "/comment/deleteOk.lo":
			System.out.println("댓글 삭제 처리 요청");
			result = new DogLogCommentDeleteOkController().execute(request, response);
			break;

		default:
			System.out.println("잘못된 요청 : " + target);
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