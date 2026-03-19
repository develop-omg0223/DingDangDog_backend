package com.ddd.app.dogmatching.controller;

// ===== 멍! 매칭 결과 조회 ===== 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogmatching.dao.MatchingResultDAO;

public class MatchingResultController  implements Execute {
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 객체
		MatchingResultDAO dao = new MatchingResultDAO();
		Result result = new Result();

		// ===== 로그인한 userNumber 세션에서 확인 =====
		int userNumber = (int) request.getSession().getAttribute("userNumber");

		// ===== 추천 유기견 8마리 데이터 =====
		request.setAttribute("recommendedDogs", dao.selectTop8RecommendedDogs(userNumber));

		// ===== 결과 페이지 =====
		result.setPath("/app/dogmatching/dogmatching_result.jsp");
		result.setRedirect(false);

		return result;
	}
}