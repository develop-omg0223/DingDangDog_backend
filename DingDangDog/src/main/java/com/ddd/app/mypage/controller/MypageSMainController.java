package com.ddd.app.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dto.ArchiveListDTO;
import com.ddd.app.mypage.dao.MypageMainDAO;
import com.ddd.app.mypage.dto.MypageSInfoDTO;

public class MypageSMainController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MypageMainDAO dao = new MypageMainDAO();
		Result result = new Result();

		Integer userNumber = (Integer) session.getAttribute("userNumber");

		if (userNumber == null) {
			result.setPath(request.getContextPath() + "/member/login.me");
			result.setRedirect(true);
			return result;
		}

		// 1. 보호소 회원 정보 조회 (UserDTO 활용)
		MypageSInfoDTO userDTO = dao.selectMyPageSInfo(userNumber);

		// 2. 최근 등록한 멍! 카이브 조회 (DAO에 메서드 추가 필요)
		List<ArchiveListDTO> archiveList = dao.selectRecentArchives(userNumber);

		// 3. 데이터 바인딩
		request.setAttribute("user", userDTO);
		request.setAttribute("archiveList", archiveList);

		result.setPath("/app/mypage/shelter/mypage_shelter.jsp");
		result.setRedirect(false);

		return result;
	}

}
