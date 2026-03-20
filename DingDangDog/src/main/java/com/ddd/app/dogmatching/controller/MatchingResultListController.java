package com.ddd.app.dogmatching.controller;

// ===== 멍! 매칭 리스트 ===== 
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogmatching.dao.MatchingResultDAO;
import com.ddd.app.dogmatching.dto.MatchingResultDTO;

public class MatchingResultListController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MatchingResultDAO dao = new MatchingResultDAO();

		// 객체
		Result result = new Result();
		HttpSession session = request.getSession();

		// ===== 로그인한 userNumber 세션에서 확인 =====
		int userNumber = (int) session.getAttribute("userNumber");

		// ===== 매칭 리스트 조회 =====
		List<MatchingResultDTO> myResults = dao.selectMyResults(userNumber);

		// ===== 데이터 저장 =====
		request.setAttribute("myResults", myResults);

		// ===== 리스트 페이지로 이동 =====
		result.setPath("/app/dogmatching/dogmatching_List.jsp");
		result.setRedirect(false);

		return result;
	}
}