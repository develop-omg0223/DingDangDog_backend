package com.ddd.app.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;
//import com.ddd.app.dogmatching.controller.MatchingResultListController;

public class MyPageDogMatchingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ===== Encoding - UTF-8 =====
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String target = request.getRequestURI().substring(request.getContextPath().length());
		Result result = null;

		System.out.println("Matching 컨트롤러 실행 경로: " + target);

		// ===== 요청별 분기 처리 ===== 
		switch (target) {
		
		// ===== 1. 설문 페이지 이동 =====
		// ===== 멍! 매칭 하러가기 버튼 =====
		case "/matching/test.ma":
			result = new Result();
			result.setPath("/app/dogmatching/dogmatching.jsp");
			result.setRedirect(false);
			break;

		// ===== 2. 매칭 리스트 + 내 정보 불러오기 
		// ===== 마이 페이지 메인 =====
//		case "/matching/list.ma":
//			System.out.println("마이페이지 메인 리스트 호출");
//			result = new MatchingResultListController().execute(request, response);
//			break;

		// ===== 3. 매칭 상세 보기 =====
		// ===== 리스트에 있는 게시글 클릭 시 =====
		case "/matching/result.ma":
			System.out.println("매칭 상세 결과 보기");
			break;
		}

		// ===== 최종 페이지 이동 ===== 
		if (result != null && result.getPath() != null) {
			if (result.isRedirect()) {
				response.sendRedirect(result.getPath());
			} else {
				request.getRequestDispatcher(result.getPath()).forward(request, response);
			}
		}
	}
}