package com.ddd.app.mypage.controller;

// ===== 마이페이지 매칭 =====
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;

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

		// ===== 요청별 분기 처리 =====
		switch (target) {

		// ===== 설문 페이지 이동 =====
		case "/matching/test.matching":
			result = new Result();

			// ===== dogmatching.jsp로 이동 =====
			result.setPath("/app/dogmatching/dogmatching.jsp");
			result.setRedirect(false);
			break;

		// ===== MyPageDogMatchingOkController =====
		case "/matching/matchingOk.matching":
			// ===== 5건 제한 저장 =====
			result = new MyPageDogMatchingOkController().execute(request, response);
			break;

		// ===== 매칭 결과 상세 보기 =====
		case "/matching/result.matching":
			break;

		// ===== 매칭 리스트 보기 =====
		case "/matching/list.matching":
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



//protected void doProcess(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException, IOException {
//
//    request.setCharacterEncoding("UTF-8");
//    String target = request.getRequestURI().substring(request.getContextPath().length());
//    Result result = new Result();
//    MatchingResultDAO dao = new MatchingResultDAO(); // DAO 객체 생성
//
//    switch (target) {
//        // 1. 설문 페이지 이동
//        case "/matching/test.matching":
//            result.setPath("/app/dogmatching/dogmatching.jsp");
//            result.setRedirect(false);
//            break;
//
//        // 2. [통합] 설문 저장 + 알고리즘 계산 + 결과 보기
//        case "/matching/matchingOk.matching":
//            try {
//                HttpSession session = request.getSession();
//                Integer userNumber = (Integer) session.getAttribute("userNumber");
//
//                if (userNumber == null) {
//                    result.setPath(request.getContextPath() + "/user/login.me");
//                    result.setRedirect(true);
//                    break;
//                }
//
//                // DTO에 파라미터 담기 (OkController가 하던 일)
//                MatchingResultDTO dto = new MatchingResultDTO();
//                dto.setUserNumber(userNumber);
//                dto.setDogActivity(Integer.parseInt(request.getParameter("dogActivity")));
//                dto.setDogSociality(Integer.parseInt(request.getParameter("dogSociality")));
//                dto.setDogIndependence(Integer.parseInt(request.getParameter("dogIndependence")));
//                dto.setDogBarking(Integer.parseInt(request.getParameter("dogBarking")));
//                dto.setDogGrooming(Integer.parseInt(request.getParameter("dogGrooming")));
//
//                // 5건 제한 로직 & 저장
//                if (dao.countSavedResults(userNumber) >= 5) {
//                    dao.deleteOldestResult(userNumber);
//                }
//                dao.insertResult(dto);
//
//                // 결과 추천 리스트 가져오기
//                request.setAttribute("recommendedDogs", dao.selectTop8RecommendedDogs(userNumber));
//                
//                result.setPath("/app/dogmatching/dogmatching_result.jsp");
//                result.setRedirect(false); // 데이터를 담아가야 하므로 Forward
//            } catch (Exception e) {
//                e.printStackTrace();
//                result.setPath(request.getContextPath() + "/main.jsp");
//                result.setRedirect(true);
//            }
//            break;
//
//        // 3. 마이페이지 리스트에서 상세 보기 클릭 시
//        case "/matching/result.matching":
//            int resultNumber = Integer.parseInt(request.getParameter("resultNumber"));
//            request.setAttribute("recommendedDogs", dao.selectDogsByResultNumber(resultNumber));
//            
//            result.setPath("/app/dogmatching/dogmatching_result.jsp");
//            result.setRedirect(false);
//            break;
//    }
//
//    // 최종 이동
//    if (result != null && result.getPath() != null) {
//        if (result.isRedirect()) {
//            response.sendRedirect(result.getPath());
//        } else {
//            request.getRequestDispatcher(result.getPath()).forward(request, response);
//        }
//    }
//}









