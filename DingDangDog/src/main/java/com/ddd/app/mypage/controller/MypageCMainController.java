package com.ddd.app.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogmatching.dto.MatchingResultDTO;
import com.ddd.app.mypage.dao.MypageMainDAO;
import com.ddd.app.user.dto.UserDTO;

public class MypageCMainController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("=== MypageCMainController 실행 ===");

		HttpSession session = request.getSession();
		MypageMainDAO dao = new MypageMainDAO();
		Result result = new Result();

		// 1. 세션에서 로그인한 유저의 번호 가져오기
		Integer userNumber = (Integer) session.getAttribute("userNumber");

		// 로그인이 안 되어 있을 경우 처리
		if (userNumber == null) {
			result.setPath(request.getContextPath() + "/user/login.us");
			result.setRedirect(true);
			return result;
		}

		// DB에서 UserDTO 객체 가져오기
		UserDTO userDTO = dao.selectMyPageInfo(userNumber);
		// 매칭 결과 리스트 가져오기
		List<MatchingResultDTO> matchingList = dao.selectMyResults(userNumber);

		// JSP에서 사용할 이름 설정 (DTO의 필드명과 매칭됨)
		request.setAttribute("user", userDTO);
		request.setAttribute("matchingList", matchingList);

		result.setPath("/app/mypage/common/mypage_common.jsp");
		result.setRedirect(false);
		return result;
	}

}
