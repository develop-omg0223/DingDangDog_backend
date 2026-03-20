package com.ddd.app.dogmatching.controller;

// ===== 멍! 매칭 Front =====
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ddd.app.Result;

public class MatchingResultFrontController extends HttpServlet {
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

		// ===== 요청별 분기 처리 =====
		switch (target) {

		// ===== 설문 시작 =====
		case "/matching/test.ma": // 테스트 시작 페이지 이동
			result = new Result();
			result.setPath("/app/dogmatching/dogmatching.jsp");
			result.setRedirect(false);
			break;

		// ===== 매칭 제출 =====
		case "/matching/matchingOk.ma": // 설문 저장 로직 실행
			result = new MatchingResultOkController().execute(request, response);
			break;

		// ===== 매칭 결과 =====
		case "/matching/result.ma": // 결과 상세 및 추천 조회
			result = new MatchingResultController().execute(request, response);
			break;

		// ===== 매칭 리스트 =====
		case "/matching/list.ma": // 내 매칭 기록 목록 조회
			result = new MatchingResultListController().execute(request, response);
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