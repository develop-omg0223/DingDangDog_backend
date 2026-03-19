package com.ddd.app.dogmatching.controller;

// ===== 멍! 매칭 데이터 저장 ===== 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogmatching.dao.MatchingResultDAO;
import com.ddd.app.dogmatching.dto.MatchingResultDTO;

public class MatchingResultOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 객체
		MatchingResultDAO dao = new MatchingResultDAO();
		MatchingResultDTO dto = new MatchingResultDTO();
		Result result = new Result();

		// ===== 로그인한 userNumber 세션에서 확인 =====
		int userNumber = (int) request.getSession().getAttribute("userNumber");

		// ===== userNumber이 입력한 데이터 =====
		dto.setUserNumber(userNumber);
		dto.setDogActivity(Integer.parseInt(request.getParameter("dogActivity")));
		dto.setDogSociality(Integer.parseInt(request.getParameter("dogSociality")));
		dto.setDogIndependence(Integer.parseInt(request.getParameter("dogIndependence")));
		dto.setDogBarking(Integer.parseInt(request.getParameter("dogBarking")));
		dto.setDogGrooming(Integer.parseInt(request.getParameter("dogGrooming")));

		// ===== 매칭 결과 5건 ↑ 삭제 후 저장 =====
		if (dao.countSavedResults(userNumber) >= 5) {
			dao.deleteOldestResult(userNumber);
		}

		// ===== 최종 데이터 저장 =====
		dao.insertResult(dto);

		// ===== 결과 화면 =====
		result.setPath(request.getContextPath() + "/matching/result.ma");
		result.setRedirect(true);
		return result;
	}
}